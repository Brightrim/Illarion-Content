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

-- shoal in water ( 1170 )

-- additional tool: fishingrod ( 72 )

local common = require("base.common")
local craft = require("base.craft")
local gathering = require("craft.base.gathering")

local M = {}

function M.StartGathering(User, SourceItem, ltstate)

    local fishing = gathering.GatheringCraft:new{LeadSkill = Character.fishing, LearnLimit = 100}; -- id_72_fishingrod
    fishing:AddRandomPureElement(gathering.prob_extremely_rarely); -- Any pure element
    fishing:AddRandomMagicGem(1, gathering.prob_extremely_rarely); -- Any latent magical gem
    fishing:SetShard(gathering.prob_rarely,"In den Eingeweiden des Fischens findest du einen Splitter eines magischen Artefaktes.", "You find a shard of a magical artifact in the entrails of the fish."); -- Any shard
    fishing:AddRandomItem(51,1,333,{},gathering.prob_extremely_rarely,"Ein Eimer verf�ngt sich in deiner Angelschnur. Den hat hier wohl jemand verloren.","As you tighten your line you feel a heavy resistance. With a careful approach you are able to pull a bucket ashore."); --Bucket
    fishing:AddRandomItem(92,1,333,{},gathering.prob_occasionally,"Du ziehst eine glitzernde �llampe aus dem Wasser. Wo die wohl herkommt...?","You pull a sparkling oil lamp out of the water. Where did that come from?"); --Oil lamp
    fishing:AddRandomItem(53,1,333,{},gathering.prob_frequently,"Ein alter, durchl�cherter Lederstiefel h�ngt am Haken.","As you angle back and forth for fish you feel a snag. Instead of a fish, however, a pair of old perforated boots tied together hangs from your hook!"); --Leather boots
    fishing:SetTreasureMap(gathering.prob_rarely,"Statt eines Fisches hast du eine Karte am Haken h�ngen.","Narg�n's favour has finally found you for there is a treasure map on your hook instead of a fish!");
    fishing:AddMonster(101,gathering.prob_rarely,"Ein heftiger Ruck rei�t dir fast die Angel aus der Hand. Noch w�hrend du dich wunderst teilt sich das Wasser vor dir und eine glitschige Wasserleiche steigt aus den Wellen empor.","A heavy force pulls on your fishing line momentarily before it releases. Then without warning the water before you erupts as putrified mummy vaults toward you.",4,7);
    fishing:AddInterruptMessage("Ein schwarzer Fleck huscht durch das Wasser. Etwas erschrocken weichst du zur�ck.", "You notice a large black dot in the water, you decide not to disturb it.");
    fishing:AddInterruptMessage("Der Boden unter dir rutscht leicht weg, sodass du gerade noch das Gleichgewicht halten kannst.", "Some stones slip away from the bank, disturbing all the fish.");
    fishing:AddInterruptMessage("Dein Blick verliert sich f�r kurze Zeit in deinem Spiegelbild und du bist abgelenkt.", "You take a while to admire that good-looking person staring at you from your reflection.");
    fishing:AddInterruptMessage("Der K�der h�ngt nicht mehr am Haken. Leicht ver�rgert befestigst du einen neuen.", "A clever fish stole the bait from you, you affix fresh bait to the hook.");
    -- TODO translate
    -- fishing:AddInterruptMessage("Du weidest deinen bisherigen Fang aus.");

    common.ResetInterruption( User, ltstate )
    if ( ltstate == Action.abort ) then -- work interrupted
        User:talk(Character.say, "#me unterbricht "..common.GetGenderText(User, "seine", "ihre").." Arbeit.", "#me interrupts "..common.GetGenderText(User, "his", "her").." work.")
        return
    end

    if not common.CheckItem( User, SourceItem ) then -- security check
        return
    end

    -- additional tool item is needed
    if (User:countItemAt("all",72)==0) then
        common.HighInformNLS( User,
        "Du brauchst eine Angel um zu fischen.",
        "You need a fishing rod for catching fish." )
        return
    end
    local toolItem = User:getItemAt(5)
    if ( toolItem.id ~= 72 ) then
        toolItem = User:getItemAt(6)
        if ( toolItem.id ~= 72 ) then
            common.HighInformNLS( User,
            "Du musst die Angel in der Hand haben!",
            "You have to hold the fishing rod in your hand!" )
            return
        end
    end

    if not common.FitForWork( User ) then -- check minimal food points
        return
    end

    common.TurnTo( User, SourceItem.pos ) -- turn if necessary

    -- check the amount
    local MaxAmount = 20
    local changeItem = false
    local amountStr = SourceItem:getData("amount")
    local amount = 0
    if ( amountStr ~= "" ) then
        amount = tonumber(amountStr)
    elseif ( SourceItem.wear == 255 ) then
        amount = MaxAmount
    end

    if ( ltstate == Action.none ) then -- currently not working -> let's go
        fishing.SavedWorkTime[User.id] = fishing:GenWorkTime(User,toolItem)
        User:startAction( fishing.SavedWorkTime[User.id], 0, 0, 0, 0)
        User:talk(Character.say, "#me beginnt zu fischen.", "#me starts to fish.")
        return
    end

    if fishing:FindRandomItem(User) then
        return
    end

    -- since we're here, we're working

    User:learn( fishing.LeadSkill, fishing.SavedWorkTime[User.id], fishing.LearnLimit)
    local fished = 1 -- set the amount of items that are produced
    local fishID = 0
    local chance = math.random(1,100)
    if chance <= 30 then
        fishID = 355 -- salmon
    elseif chance <= 75 then
        fishID =73 -- trout
    elseif chance <= 99 then
        fishID = 1209 -- horse mackerel
    else
        fishID = 1210 -- rose fish
    end

    -- GFX + Sound for a splash
    world:gfx(11,SourceItem.pos)
    world:makeSound(9,SourceItem.pos)

    amount = amount - 1
    SourceItem:setData("amount",amount)
    world:changeItem(SourceItem)

    local created = common.CreateItem(User, fishID, fished, 333, nil) -- create the new produced items
    if created then -- character can still carry something
        if amount > 0 then  -- there are still items we can work on
            fishing.SavedWorkTime[User.id] = fishing:GenWorkTime(User,toolItem)
            User:changeSource(SourceItem)
            User:startAction( fishing.SavedWorkTime[User.id], 0, 0, 0, 0)
        end
    end
    if amount == 0 then
        SourceItem:setData("amount","")
        SourceItem.id = 1244
        SourceItem.wear = 4
        world:changeItem(SourceItem)
        User:inform("Du scheinst hier alles leergefischt zu haben.",
                    "You seem to have caught all the fish here.",Character.highPriority)
        return
    end

    if craft.ToolBreaks( User, toolItem, fishing:GenWorkTime(User,toolItem) ) then -- damage and possibly break the tool
        common.HighInformNLS(User,
        "Deine alte Angel zerbricht.",
        "Your old fishing rod breaks.")
        return
    end
end

return M
