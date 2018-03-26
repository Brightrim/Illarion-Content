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

local common = require("base.common")
local gathering = require("craft.base.gathering")

local M = {}

function M.StartGathering(User, SourceItem, ltstate)

    local honeygathering = gathering.GatheringCraft:new{LeadSkill = Character.husbandry, LearnLimit = 100}; -- id_1005_beehive
    honeygathering:AddRandomPureElement(gathering.prob_extremely_rarely); -- Any pure element
    honeygathering:AddRandomMagicGem(1, gathering.prob_extremely_rarely); -- Any latent magical gem
    honeygathering:SetShard(gathering.prob_rarely,"Im Honig findest du einen Splitter eines magischen Artefaktes.", "You find a shard of a magical artifact in the honey comb."); -- Any shard
    honeygathering:AddRandomItem(2744,1,333,{},gathering.prob_extremely_rarely,"Ein Imkerkollege scheint hier seine Pfeife vergessen zu haben. Du nimmst sie an dich.","A beekeeper colleague must have forgotten his pipe for smoking out the bees. You take it with you."); --Pipe
    honeygathering:AddRandomItem(151,1,333,{},gathering.prob_occasionally,"Die Bienen haben offensichtlich Vorr�te angelegt. Sogar eine ganze Erdbeere haben sie in ihren Stock geschleppt.","As you carefully pull honey from the hive you notice a sticky strawberry in your grasp!"); --Strawberry
    honeygathering:AddRandomItem(431,1,333,{},gathering.prob_frequently,"An deinen H�nden bleibt klebriger Wachs h�ngen.","Your hands get stuck in sticky wax.", 0); --Wax
    honeygathering:SetTreasureMap(gathering.prob_rarely,"Oh! Jemand hat eine Schatzkarte in diesem Bienenstock versteckt. Was f�r eine �berraschung!","Oh! Someone has hidden a treasure map in this hive. What a surprise!");
    honeygathering:AddMonster(271,gathering.prob_rarely,"Eine �ber deine Handlungen etwas erboste Wespe scheint sich dazu entschlossen zu haben, deinen Handlungen ein Ende zu setzten.","A wasp, unamused by your deeds, decides to attack!",4,7);
    honeygathering:AddInterruptMessage("Du wirst von etwas in dem Bienenstock gestochen. Was das wohl wahr?", "You feel a sting as you try to work.");
    honeygathering:AddInterruptMessage("Du wischst dir den Schwei� von der Stirn.", "You wipe sweat off your forehead.");
    honeygathering:AddInterruptMessage("Du wirfst kurz einen Blick in den Bienenkorb um nach einer besseren Stelle f�r Honigwaben zu suchen.", "You decide to search deeper for honeycombs.");
    honeygathering:AddInterruptMessage("Du greifst direkt in eine Stelle mit Honig und ziehst die Hand zur�ck. Nun bleibt dir wohl nichts anderes �brig als dir die Finger abzulecken.", "You decide to take a short break to lick off honey from your hands");
    honeygathering:AddInterruptMessage("Eine aufdringliche Wespe schwirrt um deinen Kopf herum. Du schl�gst mit der Hand danach und versuchst sie zu vertreiben.", "A curious wasp buzzes around your head and you try to scare it away.");

    common.ResetInterruption( User, ltstate );
    if ( ltstate == Action.abort ) then -- work interrupted
        User:talk(Character.say, "#me unterbricht "..common.GetGenderText(User, "seine", "ihre").." Arbeit.", "#me interrupts "..common.GetGenderText(User, "his", "her").." work.")
        return
    end

    if not common.CheckItem( User, SourceItem ) then -- security check
        return
    end

    if not common.FitForWork( User ) then -- check minimal food points
        return
    end

    common.TurnTo( User, SourceItem.pos ); -- turn if necessary

    -- check the amount
    local MaxAmount = 10
    local changeItem = false;
    local amountStr = SourceItem:getData("amount");
    local amount = 0;
    if ( amountStr ~= "" ) then
        amount = tonumber(amountStr);
    elseif ( SourceItem.wear == 255 ) then
        -- first time that a (static!) herb item is harvested
        amount = MaxAmount;
        SourceItem:setData("amount","" .. MaxAmount);
        changeItem = true;
    end
    if ( amount < 0 ) then
        -- this should never happen...
        User:inform("[ERROR] Negative amount " .. amount .. " for item id " .. SourceItem.id .. " at (" .. SourceItem.pos.x .. "," .. SourceItem.pos.y .. "," .. SourceItem.pos.z .. "). Please inform a developer.");
        return;
    end
    if ( amount <= 1 ) then
        -- check for regrow even at amount==1, so a continuous working is guaranteed
        -- only non farming items regrow
        local serverTime = world:getTime("unix");
        for i=1,MaxAmount do
            local t = SourceItem:getData("next_regrow_" .. i);
            if ( t ~= "" and tonumber(t) <= serverTime ) then
                -- regrow
                amount = amount + 1;
                SourceItem:setData("next_regrow_" .. i, "");
                changeItem = true;
            end
        end
        if ( amount == 0 ) then
            -- not regrown...
            common.HighInformNLS( User,
            "Dieser Bienenstock ist leer. Gib den Bienen einige Zeit neuen Honig zu machen.",
            "This beehive is empty. Give the bees some time to make new honey." );
            if ( changeItem ) then
                world:changeItem(SourceItem);
            end
            return;
        elseif ( amount > MaxAmount ) then
            -- this should never happen
            User:inform("[ERROR] Too high amount " .. amount .. " for item id " .. SourceItem.id .. " at (" .. SourceItem.pos.x .. "," .. SourceItem.pos.y .. "," .. SourceItem.pos.z .. "). Please inform a developer.");
            if ( changeItem ) then
                world:changeItem(SourceItem);
            end
            return;
        else
            SourceItem:setData("amount", "" .. amount);
            changeItem = true;
        end
    end

    if ( ltstate == Action.none ) then -- currently not working -> let's go
        honeygathering.SavedWorkTime[User.id] = honeygathering:GenWorkTime(User,nil);
        User:startAction( honeygathering.SavedWorkTime[User.id], 0, 0, 0, 0);
        User:talk(Character.say, "#me beginnt Honigwaben zu sammeln.", "#me starts to collect honeycombs.")
        return
    end

    -- since we're here, we're working

    if honeygathering:FindRandomItem(User) then
        return
    end
    amount = amount - 1
    -- update the amount
    SourceItem:setData("amount", "" .. amount);
    changeItem = true;
    -- and update the next regrow
    local regrowOk = false;
    for i=1,MaxAmount do
        local t = SourceItem:getData("next_regrow_" .. i);
        -- look for a free slot
        if ( t == "") then
            -- set the next regrow time according to season and grow factor
            local season = math.ceil(world:getTime("month")/4);
            SourceItem:setData("next_regrow_" .. i, "" .. world:getTime("unix") + 300)
            regrowOk = true;
            changeItem = true;
            break;
        end
    end
    if ( not regrowOk ) then
        -- there was no free slot, this should never happen
        User:inform("[ERROR] There was no regrow slot for item id " .. SourceItem.id .. " at (" .. SourceItem.pos.x .. "," .. SourceItem.pos.y .. "," .. SourceItem.pos.z .. "). Please inform a developer.");
        if ( changeItem ) then
            world:changeItem(SourceItem);
        end
        return;
    end

    if ( changeItem ) then
        world:changeItem(SourceItem);
    end

    -- since we're here, everything should be alright
    User:learn( honeygathering.LeadSkill, honeygathering.SavedWorkTime[User.id], honeygathering.LearnLimit);
    local created = common.CreateItem(User, 2529, 1, 333, nil) -- create the new produced items
    if created then -- character can still carry something
        if amount > 0 then  -- there are still items we can work on
            honeygathering.SavedWorkTime[User.id] = honeygathering:GenWorkTime(User,nil);
            User:changeSource(SourceItem)
            User:startAction( honeygathering.SavedWorkTime[User.id], 0, 0, 0, 0);
        else -- no items left
            -- only inform for non farming items. Farming items with amount==0 should already be erased.
            common.HighInformNLS(User,
            "Dieser Bienenstock ist leer. Gib den Bienen einige Zeit neuen Honig zu machen.",
            "This beehive is empty. Give the bees some time to make new honey." );
        end
    end
end

return M
