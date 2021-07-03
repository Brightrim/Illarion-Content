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

local M = {}

function M.MoveToField(Character)
    if Character:getQuestProgress(325) == 1 and Character:getQuestProgress(341) == 0 then --Accepted tutorial messages, didn't visit the triggerfield yet
        Character:setQuestProgress(341, 1) --remember that the triggerfield was visited
        local callbackNewbie = function(informNewbie)
            Character:inform("Schwer beladene Karren werden vom Hafen her gezogen aber auch hingebracht, und ganz lautstark dr�ngen sich die H�ndler an den Markts�nden um Angebote feil zu bieten und um Preise zu Feilschen. Das ein oder andere Gesch�ft wird aber auch fern von den Blick der vielen im Abseits geschlossen, unauff�llig und nur leise gefl�stert.","Heavily laden carts are hauled back and forth from the harbour as raucous merchants bustle around market stalls, shouting out offers and haggling over prices, oblivious to other negotiations being concluded inconspicuously through hushed whispers.")
        end --end callback
        local dialogText = common.GetNLS(Character,
            "Auf dem Markt bieten sich an den St�nden zwischen Hafen und Taverne reichlich M�glichkeiten zum Handel. Neben Angeboten f�r den t�glichen Bedarf findest du hier aber auch verschiedene G�ter und Dienstleistungen, die in den Reichen sonst nicht so einfach verf�gbar sind.\n\nDer Zugriff auf die Men�s zum Handel erfolgt durch Ansprechen des jeweilgen NPC unter Nutzung der Schl�sselworte 'Handel', 'Kaufen' oder 'Verkaufen'. Solche Schl�sselw�rter sollten in S�tzen verwendet werden, die der Rolle deines Charakters entsprechen. Durch Doppel-Klick auf einen NPC kannst du auch Basis-Optionen f�r ein Gespr�ch nutzen, die f�r eine angemessene Charakterdarstellung aber nur sehr begrenzt sind.\n\nGegenst�nde k�nnen zu einem Zehntel ihres Wertes in dem Reich mit Prim�ren Handwerk verkauft werden, was durch die Goldm�nze im Handelsmen� angezeigt wird. Nur zu einem Zwanzigstel ihres Wertes lassen sie sich im Reich mit im sekund�rem Handwerk verkaufen, was durch die Silberm�nze im Handelsmen� angezeigt wird. Wenn gleich du hier nicht die besten Preise f�r den Verkauf von Waren an NPC-H�ndler erhalten wirst, findest du m�glicherweise andere M�glichkeiten mit Spielern zu Handeln, die einen weitaus h�heren Preis bieten.",
            "The market offers bountiful trading opportunities with stalls extending from the harbour to the tavern forecourt. Whilst some basic provisions can acquired, you will also find other goods and services on offer that are less readily available in the realms. \n\nRelevant trade menus can be accessed by speaking to an NPC and using a keyword such as 'trade', 'buy', or 'sell'. Such keywords should be used in a sentence in a manner appropriate for your character when speak to a trader to enhance immersion. You can also double click on any NPC to activate basic talk options but remember this will limit portrayal of characterisation.\n\nItems can be sold at a tenth of their value in the primary crafting realm, indicated by the gold coin in the trading menu. They can only be sold at a twentieth of their value in the secondary crafting realm, indicated by the silver coin in the trading menu. Although you will not get the best prices for selling goods to NPC traders here, you may find other trading opportunities with players that offer far greater value.")
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        Character:requestMessageDialog(dialogNewbie)
    end
end

return M
