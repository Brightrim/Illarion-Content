--[[
Illarion Server

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU Affero General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option) any
later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
details.

You should have received a copy of the GNU Affero General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
]]

local price = 5000 -- fifty silver

local common = require("base.common")
local money = require("base.money")

local parchmentSelectionStatus = {}

local M = {}


local function spawnParchment(user, text, signature, descriptionEn, descriptionDe)

    local theDataTable = {["writtenText"] = text, ["signatureText"]  = signature, ["descriptionEn"] = descriptionEn, ["descriptionDe"] = descriptionDe}

    local itemCreated = user:createItem(Item.parchment, 1, 999, theDataTable)

    local notCreated = 1

    if itemCreated == notCreated then
        world:createItemFromId(Item.parchment, 1, user.pos, true, 999, theDataTable)
    end
end

function M.sendStoredMessages(recipient)
    local foundStoredMessages, numberOfMessages = ScriptVars:find(recipient.id.."storedMessages")

    if not foundStoredMessages then
        return
    end

    local parchments = "parchments"

    if tonumber(numberOfMessages) == 1 then
        parchments = "parchment"
    end

    recipient:inform("Ein Bote bringt dir "..numberOfMessages.." Nachrichten und verschwindet wieder, so schnell er gekommen ist.", "A messenger comes up to you, delivering "..numberOfMessages.." "..parchments.." before scurrying off.")

    for i = 1, tonumber(numberOfMessages) do
        local foundText, text = ScriptVars:find(recipient.id.."storedMessageText"..i)
        local foundSignature, signature = ScriptVars:find(recipient.id.."storedMessageSignature"..i)
        local foundDescriptionEn, descriptionEn = ScriptVars:find(recipient.id.."storedMessageDescriptionEn"..i)
        local foundDescriptionDe, descriptionDe = ScriptVars:find(recipient.id.."storedMessageDescriptionDe"..i)

        if foundText and foundSignature and foundDescriptionEn and foundDescriptionDe then
            spawnParchment(recipient, text, signature, descriptionEn, descriptionDe)
        end
    end

    ScriptVars:set(recipient.id.."storedMessages", "0")
end

local function tooManyMessages(recipient)

    local foundStoredMessages, numberOfMessages = ScriptVars:find(recipient.id.."storedMessages")

    if not foundStoredMessages then
        return false
    end

    if tonumber(numberOfMessages) >= 21 then --Seven people can send the messaging cap of 3 letters each
        return true
    end

    return false

end

local function alreadySentTooManyMessages(user, recipient)

    local foundStoredMessages, numberOfMessages = ScriptVars:find(recipient.."storedMessages")

    if not foundStoredMessages then
        return false
    end

    local messageCount = 0
    numberOfMessages = tonumber(numberOfMessages)

    for i = 1, numberOfMessages do
        local foundSender, sender = ScriptVars:find(recipient.."sender"..i)
        if foundSender then
            if sender == user.id then
                messageCount = messageCount + 1
            end
        end
    end

    if messageCount >= 3 then
        user:inform("Du hast diesem Empfänger schon drei Nachrichten geschickt. Lass ihn doch erstmal lesen, was du geschrieben hast.", "You've already sent that person three messages. Please wait for them to receive those before trying to send more.")
        return true
    end

    return false
end



local function isRecipientCharacterOnline(recipient)
    local onlineChars = world:getPlayersOnline()

    for _, char in pairs(onlineChars) do
        if char.id == recipient then
            M.sendStoredMessages(char)
        end
    end

end

local function storeMessageInDatabase(user, writtenText, signatureText, descriptionDe, descriptionEn, recipient)

    local foundStoredMessages, numberOfAlreadyStoredMessages = ScriptVars:find(recipient.."storedMessages")

    if not foundStoredMessages then
        numberOfAlreadyStoredMessages = 0
    end

    local messageNumber = tonumber(numberOfAlreadyStoredMessages) + 1

    ScriptVars:set(recipient.."storedMessages", tostring(messageNumber))
    ScriptVars:set(recipient.."storedMessageText"..messageNumber, writtenText)
    ScriptVars:set(recipient.."storedMessageSignature"..messageNumber, signatureText)
    ScriptVars:set(recipient.."storedMessageDescriptionEn"..messageNumber, descriptionEn)
    ScriptVars:set(recipient.."storedMessageDescriptionDe"..messageNumber, descriptionDe)
    ScriptVars:set(recipient.."sender"..messageNumber, user.id)
    ScriptVars:save()

    isRecipientCharacterOnline(recipient)

end

local function isParchmentStillViable(user, signatureText, writtenText)

    for i = 1, 6 do
        local possibleParchment = user:getItemAt(Character["belt_pos_"..i])

        if possibleParchment.id == Item.parchment then
            local selectedParchmentText = possibleParchment:getData("writtenText")
            local selectedParchmentSignature = possibleParchment:getData("signatureText")

            if selectedParchmentText == writtenText and selectedParchmentSignature == signatureText then
                return possibleParchment
            end
        end
    end

    user:inform("Die Schriftrolle muss sich in deinem Gürtel befinden.", "The selected parchment must be in your belt.")

    return false

end

local function payMoney(user, writtenText, signatureText, descriptionDe, descriptionEn, recipient)

    local hasMoney = money.CharHasMoney(user, price)

    if not hasMoney then
        user:inform("Das kannst du dir nicht leisten.", "You can't afford that.")
        return
    end

    if tooManyMessages(user, recipient) or alreadySentTooManyMessages(user, recipient) then
        return
    end

    money.TakeMoneyFromChar(user, price)

    local parchment = isParchmentStillViable(user, signatureText, writtenText)

    if not parchment then
        return
    end

    world:erase(parchment, 1)

    storeMessageInDatabase(user, writtenText, signatureText, descriptionDe, descriptionEn, recipient)

    user:inform("Du zahlst "..(price/100).." Silberstücke und ein Bote macht sich mit deiner Nachricht auf den Weg.", "Having paid the "..(price/100).." silver fee, a messenger is dispatched with your letter.")
end

function M.getParchmentSelectionStatus(user)
    if not parchmentSelectionStatus[user.id] then
        return false
    end

    if parchmentSelectionStatus[user.id].position ~= user.pos then
        return -- user moved
    end

    return parchmentSelectionStatus[user.id].status
end

local function writeRecipientName(user, writtenText, signatureText, descriptionDe, descriptionEn)

    local callback = function(dialog)
        if not dialog:getSuccess() then
            return
        end

        local input = dialog:getInput()

        local recipientExists, recipientId = world:getPlayerIdByName(input)

        if not recipientExists then
            user:inform("Unbekannter Adressat.", "No recipient by that name exists.")
            return
        end

        payMoney(user, writtenText, signatureText, descriptionDe, descriptionEn, recipientId)
    end

    local dialog = InputDialog(common.GetNLS(user, "Empfänger", "Enter Recipient"), common.GetNLS(user, "An wen soll der Bote die Nachricht liefern?", "The messenger needs the name of the intended recipient."), false, 255, callback)

    if not isParchmentStillViable(user, signatureText, writtenText) then
        return
    end

    user:requestInputDialog(dialog)
end

function M.verifyParchment(user, parchment)
    local writtenText = parchment:getData("writtenText")
    local signatureText = parchment:getData("signatureText")
    local descriptionDe = parchment:getData("descriptionDe")
    local descriptionEn = parchment:getData("descriptionEn")

    parchmentSelectionStatus[user.id].status = false

    if writtenText ~= "" and signatureText ~= "" then
        writeRecipientName(user, writtenText, signatureText, descriptionDe, descriptionEn)
    else
        user:inform("Der Bote weist deine Nachricht zurück. Sie muss beschriftet und signiert sein.", "The messenger won't accept this parchment. It has to be both written and signed using a quill.")
    end

end

function M.messengerRequested(user)

    user:inform("Wähle die Schriftrolle, die du verschicken möchtest, mit einem Doppelklick. Nur beschriebene und unterzeichnete Schriftrollen können verschickt werden. Diese Dienstleistung kostet "..(price/100).." Silberstücke.", "Select the parchment you wish to send by double clicking it. It must be a written and signed parchment for it to be sent. Do also bear in mind that it costs "..(price/100).." silver coins to send a message using this service.")

    if not parchmentSelectionStatus[user.id] then
        parchmentSelectionStatus[user.id] = {}
    end

    parchmentSelectionStatus[user.id].status = true
    parchmentSelectionStatus[user.id].position = user.pos
    --select a parchment you wish to send or message about having no parchments to send
    --activate a top level variable that makes it so the next parchment you double click is selected instead of its usual purpose
    -- if the parchment does not contain a message and signature, decline it
    -- reset the top level variable if the character moves from the spot

end

return M
