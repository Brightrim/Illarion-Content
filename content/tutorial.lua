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
local factions = require("base.factions")

local M = {}

--These lists contain all texts of the tutorial.

local tutorialInformDE = {}
local tutorialInformEN = {}
local tutorialTextDE = {}
local tutorialTextEN = {}
local tutorialTalkDE = {}
local tutorialTalkEN = {}

--Texts for informs

tutorialInformDE["brewery"] = "Umgeben von gestapelten F�ssern, sind die Zutaten f�r den n�chsten Ansatz chaotisch �ber die Tische verteilt. Der verf�hrerische Duft von Verg�renem dringt in den Gasthof ein, w�hrend durch fein gewebte Stoffe goldener Met rinnt, um die n�chste Flasche zu f�llen."
tutorialInformEN["brewery"] = "Surrounded by stacked barrels, ingredients chaotically scattered over tables await the next brew. The tantilising aroma of fermentation drifts into the inn, as golden mead strains through finely woven cloth to fill the next bottle."

tutorialInformDE["campfire"] ="Die W�rme eines knisterndes Feuers ist einladend und mit den alten darum gelegten Baumst�mmen bietet sich eine einfache Gelegenheit zum Rasten und eine Pause einzulegen. Funken der leuchtenden Glut fallen auf den zersto�enen Boden, abgetreten von den vielen Reisenden, die sich Geschichten erz�hlen, w�hrend sie sich hier eine Weile ausruhen."
tutorialInformEN["campfire"] = "Old logs drawn around the inviting warmth of a crackling fire offer a simple place for respite. Sparks from the glowing embers fall to the scuffed ground, worn bare by many a traveller sharing tales as they rest a while."

tutorialInformDE["depot"] = "An prominenter Stelle im Gasthaus zur Hanfschlinge befindet sich eine reich verzierte goldene Truhe, schimmerend vor Energie. Sie scheint bemerkenswerte Tiefen in sich zu beherbergen."
tutorialInformEN["depot"] = "A highly embellished golden chest sits prominently in the Hemp Necktie Inn, shimmering with energy and seemingly harbouring remarkable depths."

tutorialInformDE["entrance"] = "Von den abgewetzten Bodendielen steigt ein kr�ftiger Hauch von gesoffenem Ale auf, gemildert von treibenden Aromen von Braten und exotischen Gew�rzen. Der gesch�ftige Barkeeper bedient Reisende und H�ndler, die an reichlich rustikalen Tischen eine Pause einlegen, schroff."
tutorialInformEN["entrance"] = "A strong whiff of sloshed ale rises from scuffed boards, tempered by drifting aromas of roasting meat and exotic spices. The bustling barkeep gruffly serves travellers and merchants taking respite at abundant rustic tables."

tutorialInformDE["glyph"] = "�ber einer funkelnden Br�cke hinweg liegt eine mystische Insel, die von einem schimmernden Nebel umgeben ist. Energie wirbelt mit farbigen Lichtblitzen um einen komplizierten Ritualort, der in glitzernden Fels gehauen ist."
tutorialInformEN["glyph"] = "Across a sparkling bridge lies a mystical islet, shrouded in a shimmering mist. Energy swirls with bursts of coloured light around an intricate ritual site carved into glittering rock."

tutorialInformDE["harbour"] = "Wie sich Passagiere rund um das verzierte Pult versammeln werden M�nzen getauscht bevor das Einschiffen auf die wartende F�hre beginnt. Auf dem Pult liegt eine vergilbte und oft gebrauchte Schriftrolle, welche in eleganter Schrift eine Reihe von Zielorten auflistet."
tutorialInformEN["harbour"] = "Coins are exchanged as passengers gather around an ornate podium before boarding the waiting ferry. A neatly scribed, albeit somewhat discoloured and well-used pell sits on the podium listing a number of destinations."

tutorialInformDE["henry"] = "Am Ende des Piers steht ein Mann mit wachsamen Augen und schreibt unerm�dlich in sein ledergebundenes Buch. Zu seinen freundlichen Gr��en und Ratschl�gen f�r Neuank�mmlinge erteilt er ungeduldigen Kaufleuten oder ungest�men Seeleuten auch strenge Verweise."
tutorialInformEN["henry"] = "A sharp-eyed man at the end of the pier diligently writes in a leather-bound journal. Between offering friendly greetings and advice to newcomers, he issues stern repremands to impatient merchants or unruly sailors."

tutorialInformDE["market"] = "Schwer beladene Karren werden vom Hafen her gezogen aber auch hingebracht, und ganz lautstark dr�ngen sich die H�ndler an den Markts�nden um Angebote feil zu bieten und um Preise zu Feilschen. Das ein oder andere Gesch�ft wird aber auch fern von den Blick der vielen im Abseits geschlossen, unauff�llig und nur leise gefl�stert."
tutorialInformEN["market"] = "Heavily laden carts are hauled back and forth from the harbour as raucous merchants bustle around market stalls, shouting out offers and haggling over prices, oblivious to other negotiations being concluded inconspicuously through hushed whispers."

tutorialInformDE["nimbur"] = "Ein beleibter Zwerg mit einem Becher in der Hand probiert vergn�gt sein neuestes Gebr�u. Erfreut genug um einen kleinen Schluck zu teilen, k�nnen aber die H�nde, welche nach seinem geheimen Rezepten trachten, einen ordentlichen Hieb auf die Kn�chel mit dem oft gebrauchten L�ffel erwarten."
tutorialInformEN["nimbur"] = "A rotund dwarf with mug in hand gleefully samples his latest brew. Pleased enough to share a tipple, any hands straying to his secret recipes can expect a sharp rap across the knuckles from his well used spoon."

tutorialInformDE["orchard"] = "Ein kleiner Baumhain auf der Landzunge bietet schattige Ruhe vor dem gesch�ftigen Hafen. Das Rascheln zwischen den Bl�ttern l�sst jedoch darauf schlie�en, dass die reichlich vorhandenen Fr�chte dieses Obstgartens auch andere Besucher angezogen haben k�nnten."
tutorialInformEN["orchard"] = "A small grove of trees planted on the headland provides shady tranquility from the bustling harbour. Rustling amongt the leaves, however, suggests the abundant fruit of this orchard might also have attracted other visitors."

tutorialInformDE["orchard rat"] = "Eine kleine braune Ratte verl�sst einen angenagten Apfel und springt vom Baum, bei�t und kratzt dich."
tutorialInformEN["orchard rat"] = "A small brown rat abandons a partially gnawed apple and jumps from the tree, biting and clawing at you."

tutorialInformDE["pathway"] = "Abgenutztes und mit Gras �berwachsenes Kopfsteinpflaster f�hrt vom gesch�ftigen Pier zwischen einem ruhigen Obstgarten und einem knisternden Lagerfeuern entlang. Dahinter erreicht der Weg zu einem ge�ffenten Anbau eines hoch aufragenden Geb�udes."
tutorialInformEN["pathway"] = "Worn cobbles with edges overgrown by grass lead from the bustling pier, cut between a tranquil orchard and crackling campfire. Beyond the pathway leads to an open front annex of a towering building."

tutorialInformDE["teleporter"] = "Vor Energie geladen knistert die Luft rundum das mit Marmor verzierte Pult. Darauf liegt eine vergilbte und oft benutzte Schriftrolle, auf der sehr ordentlich niedergeschrieben eine Reihe von Zielorten angegeben sind."
tutorialInformEN["teleporter"] = "The air crackles with energy around an ornate marble podium. A neatly scribed, albeit somewhat discoloured and well-used pell sits on the podium listing a number of destinations."

tutorialInformDE["temple"] = "Hinter der Taverne, umgeben von verwachsenen Weinreben, die �ppige Trauben tragen und von F�ssern des besten Jahrgangs gest�tzt werden, besteht kein Zweifel, dass der dortige Altar Adron dient. Vom charismatischen Adligen bis zum betrunkenen Bettler repr�sentieren die flankierenden Statuen die Dichotomie von Adron."
tutorialInformEN["temple"] = "Behind the tavern, set amongst tangled vines bearing bountiful bunches of grapes and backed by kegs of the finest vintage, there is little doubt the altar serves Adron. From charismatic noble to drunken beggar, the flanking statues represent the dichotomy of Adron."

tutorialInformDE["viola"] = "Eine aufgeweckte und flei�ige Halblingsdame f�ngt eifrig jeden, der verloren aussieht, mit fr�hlicher Begr��ung ab. Aus einem verwitterten Koffer voller Pergamente verteilt sie Fahrkarten und f�hrt Neuank�mmlinge zu wartenden F�hren."
tutorialInformEN["viola"] = "A bright and industrious halfling eagerly intercepts any who look lost with cheerful greetings. With a weathered trunk overflowing with parchments, she hands out tickets and ushers newcomers towards waiting ferries."

tutorialInformDE["wilderness"] = "Beim �berqueren der Br�cke bleiben L�rm und Trubel des Hafenmarktes zur�ck und ein einfacher Weg f�hrt in die Wildnis."
tutorialInformEN["wilderness"] = "Crossing the bridge, the noise and commotion of the harbour market is left behind and a simple path cuts into the wilderness beyond."

tutorialInformDE["hitpoints"] = "[Tutorial] Dein Charakter ist verletzt. Der rote Balken zeigt dir die Trefferpunkte deines Charakters. Eine Rast wird die Gesundheit deines Charakters verbessern."
tutorialInformEN["hitpoints"] = "[Tutorial] Your character is hurt. The red bar indicates the hitpoints of your character. A rest is recommended to restore health."

tutorialInformDE["foodlevel"] = "[Tutorial] Dein Charakter wird hungrig. Der gelbe Balken zeigt dir die Ausdauer deines Charakters. Du solltest etwas essen, z.B. Fr�chte."
tutorialInformEN["foodlevel"] = "[Tutorial] Your character is getting hungry. The yellow bar indicates the stamina level of your character. You better eat something, for example fruits."

tutorialInformDE["monsters"] = "[Tutorial] Ein Monster! Du kannst es mit einem Rechtsklick angreifen. Um in den Nahkampf zu gehen, bewege dich zu dem Monster."
tutorialInformEN["monsters"] = "[Tutorial] A monster! You can attack it with a right click. For engaging in melee, move close to it."

tutorialInformDE["first encounter"] = "[Tutorial] Du bemerkst eine Gestalt in der Ferne, die ihren Gesch�ften nachgeht. Da du erst vor kurzem angekommen bist �berrascht es nicht, dass du du die Person auch beim N�herkommen nicht erkennen wirst."
tutorialInformEN["first encounter"] = "[Tutorial] You notice a figure in the distance going about their business. Having only recently arrive it can come as no surprise you do not recognise them as the two of you draw closer."

tutorialInformDE["end"] = "[Tutorial] Es werden keine weiteren Tutorialnachrichten angezeigt."
tutorialInformEN["end"] = "[Tutorial] No further tutorial messages will be shown."

tutorialInformDE["Have a break"] = "[Tutorial] Das Anlegen von Ausr�stung im Kampf f�hrt zu einer kurzen Unterbrechung."
tutorialInformEN["Have a break"] = "[Tutorial] Putting on equipment in combat leads to a short interruption."

tutorialInformDE["postSkip"] = "Die Ankunft eines Schiffes bringt eine Menge Bewegung mit sich, sowie die Passagiere von Bord gehen und auch die Ladung an Land gebracht werden muss. Rufe ert�nen von S�den her, dort wo am Pier andere Schiffe festgemacht haben um ihre Waren aufzunehmen."
tutorialInformEN["postSkip"] = "The new arrival of a ship brings a frenzy of activity as passengers disembark and cargo is hauled ashore. Shouts rise from the south where other vessels are boarded and goods loaded from bustling piers."

tutorialInformDE["barrel"] = "W�hrend du die Zutaten in dem riesigen Fass umr�hrst, erf�llt ein Hauch g�render �pfel deine Nase."
tutorialInformEN["barrel"] = "As you stir ingredients in the immense barrel a waft of fermenting apples fills your nostrils."

tutorialInformDE["lights"] = "[Quest 'Tutorial I' beendet] Du kannst nun die Tutorial-Quests fortsetzen, indem du zu Nimbur Goldbrew gehst, um etwas �ber das Sammeln, Handwerken und K�mpfen zu lernen."
tutorialInformEN["lights"] = "[Quest 'Tutorial I' end] You can continue the tutorial quests with Nimbur Goldbrew to learn about gathering, crafting and fighting."

tutorialInformDE["lightsStart"] = "[Quest 'Tutorial I'] Doppelklicke die Fackel um sie zu entz�nden. Die Fackel wird eine Zeit lang brennen und sobald sie ausgebrannt ist, verschwindet sie aus deinem Inventar."
tutorialInformEN["lightsStart"] = "[Quest 'Tutorial I'] To light the torch double click on it. The torch will burn for a while and once it has burnt out, it will disappear from your inventory."

--Texts for dialogues

--Quest 336: Brewery
tutorialTextDE["brewery"] = "Handwerk ben�tigt die Verwendung eines daf�r vorgesehenen Handwerkzeugs mit einem speziellen statischen Werkzeug. Die statischen Werkzeuge k�nnen ganz einfach in den beiden Reichen gefunden werden, welche sich auf das entsprechende Handwerk spezialisiert haben. Jedes Handwerk hat ein Men�, in dem alle Produkte, welche du derzeit herstellen kannst, in verschiedenen Kategorien aufgef�hrt sind. Wenn du ein Produkt im Men� durch Anklicken markierst, siehst du ein Bild des Produkts und der zur Herstellung erforderlichen Zutaten sowie die Produktionszeit. Mit zunehmender handwerklicher Fertigkeit werden dem Men� komplexere Produkte hinzugef�gt."
tutorialTextEN["brewery"] = "Crafting depends on use of a dedicated hand tool with specialist static tools. Static tools are easiest found in the two realms specialising in the relevant craft. Each craft has a menu in which all the products you are currently able to make are listed under various categories. If you highlight a product in the menu by clicking on it you will see a picture of the product and the ingredients required to make the item, along with a production time. As your skill in a craft increases, more complex products will be added to the menu."

--Quest 332: Roleplaying
tutorialTextDE["campfire"] = "Den Charakteren, denen du in Illarion begegnen wirst, haben alle ihre eigene Pers�nlichkeit mit St�rken und Schw�chen, die von ihrer Vergangenheit gepr�gt und von pers�nlichen Zielen angetrieben werden. Interagiere mit ihnen und entdecke ihre Geschichten, w�hrend du deine eigenen erschaffst. Gemeinsam schreibt ihr die Zukunft von Illarion. Wenn du dich mit anderen an einem Lagerfeuer versammelst, um Geschichten �ber epische Abenteuer zu erz�hlen oder einfach nur den neuesten Klatsch zu erfahren, wirst du Teil ihrer Geschichte, genauso wie sie deine beeinflussen. Egal, ob eure Charaktere in Zukunft zu Freunden oder Feinden werden, kooperatives Rollenspiel sorgt daf�r, dass wir miteinander und nicht gegeneinander spielen."
tutorialTextEN["campfire"] = "The characters that you will encounter in Illarion all have their own personality with strengths and flaws, shaped by their past and driven by personal goals. Interact with them and discover their stories as you create your own, together you will write the future of Illarion. As you gather around a campfire to share tales of epic adventures or simply catch up on the latest gossip you become part of their story, just as they influence yours. Whether your characters become friends or foe in the future, cooperative roleplay ensures we play with each other, not against each other."

--Quest 345: Depot
tutorialTextDE["depot"] = "Hier im neutralen Gasthaus zur Hanfschlinge und auch in jeder Stadt findest du ein System mit mehreren Depots zur Aufbewahrung von Besitzt�mern. Mit einem Doppelklick kannst du auf das Depot zugreifen und Gegenst�nde in die Slots hinein- und herausziehen. Jedes Reich hat sein eigenes Lagersystem. Nur die Depots auf dem Markt am Gasthaus zur Hanfschlinge Zugang zu gelagerten Besitzt�mern au�erhalb der St�dte bieten."
tutorialTextEN["depot"] = "Here at the neutral Hemp Necktie Inn, and throughout each of the towns, you will find a system of several depots for storing possessions. Access the depot by double clicking it and drag items in and out of the slots. Each realm has their own storage system with only the depots in the market at the Hemp Necktie Inn giving access to stored possessions outside the towns."

--Quest 337: Quests
tutorialTextDE["entrance"] = "Unz�hlige Wege kreuzen sich am Gasthof zur Hanfschlinge, da Reisende, H�ndler, Abenteurer und Gesetzlose alle einen Grund f�r einen Besuch haben. Die Taverne und die Umgebung bieten Gelegenheit, andere Charaktere zu treffen und das Leben au�erhalb der Reiche zu erleben. Dieses neutrale Territorium ist frei von den Zw�ngen der Reichsbeamten und ihrer Gesetze, aber es fehlt auch der Schutz und die Vorteile, die die St�dte bieten k�nnen. W�hrend einige Gesetzlose aus dem Reich verbannt werden k�nnen, k�nnen alle den Gasthof zur Hanfschlinge betreten.\n\nViele Quests beginnen in und um diese Taverne. Achte auf geplante GM- oder Spieler-Quests im Illarion Launcher und auf der Website. Zahlreiche statische Quests in ganz Illarion k�nnen durch Sprechen mit NPCs ausgel�st werden. Nach dem Start kannst du das Questlog f�r diese finden, indem du 'Q' dr�ckst oder auf das Schriftrollen-Symbol in der unteren rechten Ecke des Fensters klickst."
tutorialTextEN["entrance"] = "Countless paths cross at the Hemp Necktie Inn as travellers, traders, adventurers, and outlaws all have reason to visit. The tavern and surrounds give opportunity to meet other characters and experience life outside the realms. This neutral territory is free of the constraint of realm officials and their laws, but also lacks the same protection and benefits the towns may offer. Whilst some outlaws may be banished from the realms, all are free to enter the Hemp Necktie Inn.\n\nMany quests start in and around the Hemp Necktie Inn. Look out for planned GM or playere quests on the Illarion Launcher and the website. Numerous static quests throughout Illarion can be triggered by speaking to NPCs. Once started, the quest log for these can be found by pressing 'Q' or clicking on the scroll icon in the bottom right corner of the window."

--Quest 346: Glyph forging
tutorialTextDE["glyph"] = "Magie ist eine mysteri�se Begabung. Da die alten Wege des Arkanen f�r viele verloren sind, suchen jene mit Talent nach einem neuen Verst�ndnis zu der alten Kunst des Glyphenschmiedens. Das rituelle Schmieden von Glyphen in Schmuck nutzt die magische Kraft, die jeder beschw�ren kann. Wenn du Gl�ck hast, findest du m�glicherweise einige der magischen Scherben, die sich zu diesen kostbaren Glyphen verbinden lassen."
tutorialTextEN["glyph"] = "Magic is a mysterious calling. With the old ways of the arcane lost to many, those of talent seek a new understanding of the ancient art of glyph forging. Ritualistic forging of glyphs into jewellery harnesses magical power that can be invoked by anyone. If you are fortunate you may find some of the magical shards which combine to form these precious glyphs."

--Quest 339: Ferries
tutorialTextDE["harbour"] = "F�hren bedienen die H�fen in ganz Illarion, einschlie�lich der drei Reiche, aber sei dir im Klaren, dass sich diese au�erhalb der St�dte befinden. Sie sind ein g�nstiges Transportmittel f�r Gruppen, mit einer Geb�hr von zehn Silber f�r die gesamte Gesellschaft. Der zahlende Charakter w�hlt das Ziel aus und alle berechtigten Reisenden innerhalb von f�nf Feldern um das Pult haben die M�glichkeit an der Reise teilzunehmen.\n\nWenn das deine erste Fahrt vom Hafen ist, kannst du die F�hre kostenlos in das Reich deiner Wahl nehmen. Die Stra�en von den H�fen k�nnen manchmal gef�hrlich sein, aber da du neu in diesem Land sind, wirst du sicher in die Stadt deiner Wahl gelangen. Falls du noch nicht mit ihr gesprochen hast, Viola Baywillow kannt dir weitere Informationen �ber die drei Reiche von Illarion geben. Bist du einem Reich beigetreten, kannst du die Entscheidung jederzeit �berdenken und die Zugeh�rigkeit zu einem sp�teren Zeitpunkt auch �ndern oder sogar ein Gesetzloser werden."
tutorialTextEN["harbour"] = "Ferries serve harbours throughout Illarion, including the three realms, but be aware these are situated outside the main towns. They are a cheap means of transportation for groups with a fee of ten silver covering the whole party. The paying character selects the destination and all eligible travellers within five tiles of the podium will be given the option to join the voyage.\n\nIf this is your first journey from the harbour you can catch a ferry to the realm of your choice for free. The roads from the harbours can sometimes be perilous, but as you are new to these lands you will be granted safe passage to the town of your choosing. If you haven't already spoken to her, Viola Baywillow can provide you with more information about the three realms of Illarion. When you join a realm you can always change allegiance at a later date, or even become an outlaw."

--Quest 356: NPCs
tutorialTextDE["henry"] = "In Illarion wirst du vielen Nicht-Spieler-Charakteren (NPCs) begegnen, die Funktionen wie Quests, Dienste und Handel unterst�tzen. Wenn du mit dem Mauszeiger �ber einen Charakter f�hrst, siehst du dessen Namen und Gesundheitszustand. Die Namen von NPCs und Spieler-Charakteren sind gelb, w�hrend Monsternamen rot sind.\n\nUm mit dem Mann zu sprechen, aktivierst du ggf. die Chat-Box, indem du darauf klickst oder die 'Enter'-Taste verwendest. Gib 'Hallo' ein, um ihn zu begr��en und dr�ck 'Enter'. Alternativ kannst du auf einen beliebigen NPC doppelklicken, um grundlegende Gespr�chsoptionen zu aktivieren. Alle NPCs reagieren auf bestimmte Schl�sselw�rter, wenn du innerhalb von zwei Feldern bei ihnen stehst. Wenn du bei der Kommunikation mir einem NPC nicht weiterkommst, kannst du um 'Hilfe' fragen und erh�ltst eine Liste von empfohlenen Befehlseingaben.\n\nBefolge den Rat von Henry Cunnigan um zu lernen wie du dich ausr�sten und wie du Gegenst�nde benutzen kannst. Wenn du unsicher sein solltest, was du f�r eine Quest als n�chstes tun musst, kannst du das Questprotokoll benutzen, indem du 'Q' dr�ckst oder auf das Schriftrollen-Symbol in der unteren rechten Ecke des Fensters klickst."
tutorialTextEN["henry"] = "Throughout Illarion you will encounter many non-player characters (NPCs) which support functions such as quests, services, and trade. If you hover your mouse pointer over a character you will see their name and health status. NPC and player character names are yellow, while monster names are red.\n\nTo speak to the man, activate the chat box if necessary by clicking on it or by using the 'Return' key, type 'Hello' to greet him, and hit 'Return'. Alternatively you can double click on any NPC to activate basic talk options. All NPCs react to certain keywords if you are standing within two tiles. If you get stuck trying to communicate with an NPC, asking for 'help' will provide you with a list of recommended commands.\n\nFollow Henry Cunnigan's advice to learn how to equip and use items. If you are ever unsure what you need to do next for a quest, you can find the quest log by pressing 'Q' or clicking on the scroll icon in the bottom right corner of the window."

--Quest 341: Market
tutorialTextDE["market"] = "Auf dem Markt bieten sich an den St�nden zwischen Hafen und Taverne reichlich M�glichkeiten zum Handel. Neben Angeboten f�r den t�glichen Bedarf findest du hier aber auch verschiedene G�ter und Dienstleistungen, die in den Reichen sonst nicht so einfach verf�gbar sind.\n\nDer Zugriff auf die Men�s zum Handel erfolgt durch Ansprechen des jeweilgen NPC unter Nutzung der Schl�sselworte 'Handel', 'Kaufen' oder 'Verkaufen'. Solche Schl�sselw�rter sollten in S�tzen verwendet werden, die der Rolle deines Charakters entsprechen. Durch Doppel-Klick auf einen NPC kannst du auch Basis-Optionen f�r ein Gespr�ch nutzen, die f�r eine angemessene Charakterdarstellung aber nur sehr begrenzt sind.\n\nGegenst�nde k�nnen zu einem Zehntel ihres Wertes in dem Reich mit Prim�ren Handwerk verkauft werden, was durch die Goldm�nze im Handelsmen� angezeigt wird. Nur zu einem Zwanzigstel ihres Wertes lassen sie sich im Reich mit im sekund�rem Handwerk verkaufen, was durch die Silberm�nze im Handelsmen� angezeigt wird. Wenn gleich du hier nicht die besten Preise f�r den Verkauf von Waren an NPC-H�ndler erhalten wirst, findest du m�glicherweise andere M�glichkeiten mit Spielern zu Handeln, die einen weitaus h�heren Preis bieten."
tutorialTextEN["market"] = "The market offers bountiful trading opportunities with stalls extending from the harbour to the tavern forecourt. Whilst some basic provisions can acquired, you will also find other goods and services on offer that are less readily available in the realms. \n\nRelevant trade menus can be accessed by speaking to an NPC and using a keyword such as 'trade', 'buy', or 'sell'. Such keywords should be used in a sentence in a manner appropriate for your character when speak to a trader to enhance immersion. You can also double click on any NPC to activate basic talk options but remember this will limit portrayal of characterisation.\n\nItems can be sold at a tenth of their value in the primary crafting realm, indicated by the gold coin in the trading menu. They can only be sold at a twentieth of their value in the secondary crafting realm, indicated by the silver coin in the trading menu. Although you will not get the best prices for selling goods to NPC traders here, you may find other trading opportunities with players that offer far greater value."

--Quest 357: Crafting
tutorialTextDE["nimbur"] = "Illarion hat ein komplexes Handwerkssystem, das auf dem Sammeln und Veredeln von Rohstoffen basiert, welche bei der Herstellung zahlreicher Gegenst�nde verwendet werden, die in verschiedenen Skill basierten Handwerken zugeordnet sind. Jedes Reich ist auf verschiedene Handwerke ausgerichtet, was bedeutet, dass alle daf�r notwendigen Werkzeuge zur Verf�gung stehen, Ressourcen reichlich vorhanden sind und der Warenhandel zu h�heren Preisen erfolgt.\n\nBefolge die Ratschl�ge von Nimbur Goldbrew, um zu lernen, wie du Ressourcen sammeln und Gegenst�nde herstellen kannst. Vielleicht findest du auch noch heraus, wie du dein erstes Monster t�test!"
tutorialTextEN["nimbur"] = "Illarion has a complex crafting system based on gathering and refining raw materials which are used in the production of numerous items distributed across distinct skill-based crafts. Each realm has their speciality crafts, meaning all necessary tools are available for use, resources are more abundant, and goods trade at higher prices.\n\nFollow Nimbur Goldbrew's advice to learn how to gather resources and craft items. You may even find out how to kill your first monster!"

--Quest 353: Gathering
tutorialTextDE["orchard"] = "Das Sammeln von Ressourcen erfordert normalerweise ein spezielles Handwerkzeug, aber Obst kann ohne Hilfe gepfl�ckt werden. Du kannst �pfel sammeln, indem du vor einem Apfelbaum stehst und auf diesen doppelklickst. Das Ressourcenangebot ist begrenzt und sobald eine Quelle ersch�pft ist, braucht sie Zeit, um sich wieder aufzuf�llen. Wenn der von dir ausgew�hlte Baum nicht gen�gend �pfel enth�lt oder du ein paar gegessen hast, versuch es mit einem anderen Baum. Wenn du ein Lebensmittel verwendest, wird es verbraucht, um den gelben Balken in der unteren rechten Ecke des Fensters aufzuf�llen.\n\nBleib immer wachsam, da deine Aktionen manchmal Ereignisse ausl�sen k�nnen. Solltest du beim Obstpfl�cken einige der einheimischen Wildtiere st�ren, k�nntest du angegriffen werden."
tutorialTextEN["orchard"] = "Gathering resources usually requires a designated hand tool but fruit can be picked unaided. You can collect apples by standing in front of an apple tree and double clicking on it. Resource supply is limited and once exhausted a source takes time to replenish. If the tree you have selected lacks sufficient apples or you eat some, try another tree. Using a food item consumes it to replenish the yellow bar in the bottom right corner of the window.\n\nBe sure to stay alert as your actions can sometimes trigger events. Should you disturb some of the local wildlife as you are picking fruit, you could be attacked."

--Quest 354: Fighting
tutorialTextDE["orchard rat"] = "Um anzugreifen, klickst du mit der rechten Maustaste auf das Monster oder dr�cke die Taste 'F', um das n�chste Monster anzugreifen. Ein roter Ring markiert jedes Monster oder jeden Charakter, mit dem du dich im Kampf befindest. Sobald ein Monster get�tet wurde, k�nnen fallengelassene Gegenst�nde gesammelt werden. Dazu kannst du die Taste 'P' dr�cken oder die Gegenst�nde mit der Maus in einen Inventarplatz ziehen. Deine Gesundheit wird durch den roten Balken in der unteren rechten Ecke des Fensters angezeigt. Wenn dein Charakter get�tet wird, k�nnen drei Gegenst�nde aus deiner Tasche fallen, die Gegenst�nde die du an dir tr�gst oder am G�rtel sind aber nicht gef�hrdet."
tutorialTextEN["orchard rat"] = "To attack, right click on the monster or press 'F' to attack the nearest monster. A red ring highlights any monster or character you are engaged in battle with. Once a monster has been killed items dropped can be collected by pressing 'P' or dragging them into an inventory slot using the mouse. Health is indicated by the red bar in the bottom right corner of the window. If your character is killed, three items may drop from your bag, but those worn or on the belt are not at risk."

--Quest 355: Informs
tutorialTextDE["pathway"] = "Achte neben der Kommunikation mit anderen Charakteren auch auf andere Dinge, die dein Charakter auf seiner Reise erlebt. Informationen k�nnen einen Hinweis auf die Umgebung geben, die dein Charakter betritt, und es kann daher erwartet werden, dass sie das Verhalten deines Charakters beeinflussen.\n\nRollenspiel ist der Kern von Illarion. Tauche ein und passe das Verhalten deines Charakters an die Welt um ihn herum und alles, was ihn beeinflusst, an. Unabh�ngig von den technischen M�glichkeiten und ihrer Grenzen, musst du dir die Auswirkungen auf deinen Charakter vorstellen, sowohl emotional als auch k�rperlich. K�mpfe bergen Risiken, Monster k�nnen be�ngstigend sein, Arbeit ist erm�dend, NPCs k�nnen Spitzel sein und der Tod wird nie angenehm sein."
tutorialTextEN["pathway"] = "As well as communicating with other characters, be sure to note other things your character experiences on their journey. Informs can give an indication of the environment your character enters and can therefore be expected to influence the behaviour of your character.\n\nRoleplaying is the very core of Illarion. Immerse yourself, adapting the behaviour of your character to the world around them and all that influences it. Regardless of engine limits and technical possibilities, imagine the impact on your character both emotionally and physically. Fights carry risk, monsters can be scary, work is tiring, NPCs can be snitches, and death is never going to be pleasant."

--Quest 348: Teleporter
tutorialTextDE["teleporter"] = "Hier im neutralen Gasthof zur Hanfschlinge, sowie vor dem Eingang zu jeder Stadt, gibt es einen Teleporter. Mit einem Doppelklick auf das Pult kannst du es zu verwenden und f�r den Preis von f�nf Silberm�nzen kannst du in ein anderes Reich reisen. Portalb�cher k�nnen f�r zehn Silber gekauft werden, um dich von einer beliebigen Stelle auf der Karte zu einem bestimmten Teleporter zu bringen.  Auf dem Vorplatz der Taverne verkauft Lobely Portalb�cher an seinem Stand."
tutorialTextEN["teleporter"] = "Here at the neutral Hemp Necktie Inn, as well as outside the entrance to each of the towns, there is a teleporter. Double click on the podium to use it and for five silver you will be able to travel to another realm. Portal books can also be bought for ten silver to use anywhere on the map to transport you to a designated teleporter. Lobely sells portal books from his stall in the tavern forecourt."

--Quest 344: Religion
tutorialTextDE["temple"] = "Im t�glichen Leben in Illarion sind die J�ngeren G�tter vorherrschend, wobei jedes Reich drei Schutzgottheiten hat, denen jeweils ein von einem Priester bedienten Tempel geweiht ist. Weitere Tempel und Schreine k�nnen im ganzen Land gefunden werden. Als Gott der Feste und des Weins wird Adron in der Regel unter Tavernenbesitzern und ihren fr�hlichen Nachtschw�rmern oder verzweifelten Betrunkenen gleicherma�en gefeiert."
tutorialTextEN["temple"] = "The Younger Gods dominate daily life in Illarion with each realm having three patron deities, each with a dedicated temple served by a priest. Other temples and shrines can be found throughout the lands. As the god of festivities and wine, Adron is typically celebrated amongst tavern owners and their jovial revellers or desperate drunks alike."

--Quest 338: Realms
tutorialTextDE["viola"] = "Sprich mit Viola Baywillow, um mehr �ber die drei Reiche von Illarion zu erfahren. Sie kann Informationen �ber die Anf�hrer, Schutzg�tter, Motive, Handwerke und Landschaften der Reiche Auskunft geben, um dir bei der Entscheidung zu helfen, welches Reich am besten zu deinem Charakter passt. Denke jedoch daran, dass Illarion eine dynamische Welt ist und Aspekte wie Gesetze und Politik sich durch den Einfluss von Spielercharakteren schnell �ndern k�nnen. Mach dir keine Sorgen, wenn du feststellst, dass dein neues Zuhause nicht deinen W�nschen entspricht. Du kannst deine Zugeh�rigkeit zu einem sp�teren Zeitpunkt wieder �ndern oder sogar ein Gesetzloser werden, indem du mit einem Notar dar�ber sprichst.\n\nWenn du dich f�r Cadomyr, Galmair oder Runewick entschieden hast, folge der Stra�e nach Westen zum Hafen und nimm eine F�hre in das Reich deiner Wahl. Diese erste Fahrt ist kostenlos und du erh�lst sichere Fahrt ins Stadtzentrum, wo dir das Tutorial weiterhin hilft, dich in deinem neuen Zuhause zurechtzufinden. Wenn du dich noch nicht bereit f�hlst, eine Wahl zu treffen, kannst du auch Troll's Haven und alles, was es zu bieten hat, erkunden."
tutorialTextEN["viola"] = "Talk to Viola Baywillow to learn more of the three realms of Illarion. She can provide information on the leaders, patron gods, motives, crafts, and landscapes of the realms to help you decide which might best suit your character. Remember though, Illarion is a dynamic world and aspects such as laws and politics can rapidly change through the influence of player characters. Don't worry if you find your new home isn't to your liking, you can always change allegiance at a later date, or even become an outlaw by speaking to the Notary.\n\nOnce you have decided to join Cadomyr, Galmair, or Runewick, follow the road west to the harbour and catch a ferry to the realm of your choice. This first journey is free and you will be granted safe passage to the centre of town where the tutorial will continue to help you find your way around your new home. If you do not feel ready to make this choice just yet you are free to explore Troll's Haven and all it has to offer."

--Quest 347: Wilderness
tutorialTextDE["wilderness"] = "In Illarion gibt es vieles zu entdecken. Doch solltest du nicht alleine reisen, da in diesem Land auch viele gef�hrliche Monster leben. Auf deinen Reisen solltest du vorsichtig sein, ganz besonders, wenn du H�hlen oder Dungeons betreten m�chtest. Die Karte in der oberen rechten Ecke hilft dir zwar bis zu einem gewissen Grad beim Navigieren, aber behalte trotzdem immer auch deine Umgebung im Auge. Schaut dir die Wegweiser genauer an und frage andere Charaktere.\n\nWenn du das Tutorial noch nicht abgeschlossen hast, empfehlen wir dir, umzukehren und damit fortzufahren, bevor du dich weiter wagst. F�r jemanden der hier neu ist bieten die Reiche einen sicheren Ort. Dort kannst du dich etablieren, bevor du weiteres erkundest. Um dir bei der Wahl deiner neuen Heimat zu helfen, kann dir Viola Baywillow zu den drei verschiedenen Reichen einige Informationen geben."
tutorialTextEN["wilderness"] = "There is much to explore in Illarion but you may not want to travel alone as many hostile monsters also inhabit these lands. Take care on your travels and be especially careful when entering caves or dungeons. The map in the top right corner will help you navigate to some degree but be sure to take in your surroundings, check sign posts, and ask other characters.\n\nIf you haven't yet finished the tutorial, we recommend you turn back and continue with that before venturing further. For someone new to these lands the realms offer a much safer place to become established before exploring too far. Viola Baywillow can provide you with more information about the three realms to help you choose a new home."

--Quest 329: First encounter
tutorialTextDE["first encounter"] = "Vielleicht m�chtest du dich einem anderen Charakter vorstellen oder anderen durch dein Rollenspiel eine Aktion vermitteln. Zus�tzlich zu normalen Sprechen kann dein Charakter auch schreien oder fl�stern indem du dem Text #s bzw. #w voranstellst. Mit #me rufst ein Emote auf, mit dem du das Erscheinungsbild deines Charakters vermitteln oder eine Handlung deines Charakters beschreiben kannst. Mit #o werden Nachrichten au�erhalb deiner Charakterrolle verwendet. Diese sollten jedoch auf ein Minimum beschr�nkt bleiben, um die Spielatmosph�re nicht zu st�ren. Wenn sich dein Charakter innerhalb von zwei Feldern einem anderen vorgestellt hat, kannst du #i verwenden, damit der andere den Namen deines Charakters sich merken und dich in Zukunft wieder erkennen kann."
tutorialTextEN["first encounter"] = "You may want to introduce yourself to another character, or perhaps convey some other action through your role play. In addition to talking normally, your character can shout by prefixing your text with #s or whisper (within two tiles) by prefixing with #w. #me invokes an emote, allowing you to convey the appearance or describe an action of your character. #o is used for out of character messages, but these should be kept to a minimum to avoid breaking the immersion. Once you have introduced your character to another within two tiles, #i  can be used to display your character's name so they will recognise you in future."

--Quest 340: Crafting menu
tutorialTextDE["barrel"] = "Da du erst anfangen hast, wirst du wahrscheinlich nur leicht alkoholhaltige Getr�nke auf deiner Braukarte haben. �ffne die Kategorie 'Leichter Alkohol', indem du auf den vorangestellten Pfeil klickst und auf 'Ciderflasche' klickst, um sie auszuw�hlen. In diesem Fall wird nur eine Flasche Apfelcider ben�tigt, aber du kannst die Anzahl der zu produzierenden Artikel mit den Schaltfl�chen '-' und '+' anpassen. Starte die Produktion, indem du auf die Schaltfl�che 'Herstellen' klickst. Ein Fortschrittsbalken zeigt an, wie lange es bis zum Abschluss der Produktion dauert, und deine fertige Flasche Apfelcider erscheint nach Beendigung in deiner Tasche."
tutorialTextEN["barrel"] = "As you are only starting out, you will likely only have soft liquors listed on your brewing menu. Open the 'Soft Liquors' category by clicking the prefixing arrow head and click 'Bottle of Cider' to select it. In this instance only one bottle of cider is required, but you can adjust the number of items to be produced using the '-' and '+' buttons. Start production by clicking the 'Produce' button. A progress bar will indicate how long until production is complete and your finished bottle of cider will appear in your bag once complete."

tutorialTextDE["skipYes"] = "Du hast dich entschieden, das Tutorial zu �berspringen. Wenn du bereit bist, kannst du ein Boot vom Haupthafen zum Reich deiner Wahl nehmen. Die Stra�en von den H�fen k�nnen manchmal gef�hrlich sein, aber da du neu in diesem Land bist, kannst du sicher in die Stadt deiner Wahl gelangen. Viola Baywillow kann dir bei Bedarf weitere Informationen �ber die drei Reiche von Illarion geben. Bist du einem Reich beigetreten, kannst du die Entscheidung jederzeit �berdenken und die Zugeh�rigkeit zu einem sp�teren Zeitpunkt auch �ndern oder sogar ein Gesetzloser werden."
tutorialTextEN["skipYes"] = "You have decided to skip the tutorial. When you are ready you can catch a boat from the main harbour to the realm of your choice. The roads from the harbours can sometimes be perilous, but as you are new to these lands you will be granted safe passage to the town of your choosing. Viola Baywillow can provide you with more information about the three realms of Illarion should you need it. If you join a realm you can always reconsider and change allegiance at a later date, or even become an outlaw."

--Quest 325: Moving
tutorialTextDE["skipNo"] = "Nun hast du das Schiff verlassen und kannst deine ersten Schritte auf dem Pier gehen. Zum Laufen, klickst du mit der linken Maustaste auf ein Feld auf dem Pier. Alternativ kannst du auch den Ziffernblock verwenden, die Pfeil-Tasten oder auch die Tasten W, A, S, und D. Zum schnelleren Rennen dr�ckst du die 'Strg'-Taste oder klickst mit der Maus auf das Stiefel-Feld in der unteren rechten Ecke der Bildchirmanzeige.\n\nF�r eine �bersicht aller Befehle dr�ck 'F1'. Antworten auf die meist gestellten Fragen (FAQ) kannst du auf unserer Internetseite www.illarion.org finden. Weitere Hilfe erh�lst du in unserem Discord Chat auf https://discord.gg/yj3htPN oder in unserem Forum."
tutorialTextEN["skipNo"] = "As you disembark the ship, you can take your first steps onto the pier. To move, click a tile on the pier with the left mouse button. Alternatively you can walk using the Num pad, arrow keys, or WASD. Pressing the 'CTRL' key or clicking on the boots icon in the bottom right corner of the window makes your character run.\n\nTo see an overview of all commands, press 'F1'. Answers to many frequently asked questions (FAQs) can be found on our website at www.illarion.org and you are encouraged to seek help on our Discord chat at https://discord.gg/yj3htPN or on the forum."

tutorialTextDE["skip"] = "Neuen Spielern empfehlen wir zu Beginn das Tutorial. Es hilft die grundlegende Steuerung des Spiels kennenzulernen und bietet auch einige Hintergrundinformationen f�r die ersten Entscheidungen, die den Weg Deines Charakters bestimmen werden."

tutorialTextEN["skip"] = "We recommend new players complete the tutorial to help guide their first steps, teaching the basic controls of the game and providing some background lore to help make those first decisions that determine your character's path."

tutorialTextDE["welcome"] = "Eine anstrengende Reise neigt sich dem Ende und neue, aufregende Abenteuer warten im Land Illarion. Alle Charaktere, denen du hier im Laufe der Zeit begegnest, sind lebende und atmende Gesch�pfe dieser mysteri�sen Welt.Ob du als edler Ritter ruhmreiche Abenteuer bestehst, das Leben eines flei�igen Handwerkers f�hrst, ein Verm�gen als Kaufmann verdienst, als charismatischer Priester Gefallen findest, mit Zauberei zu verbl�ffen weist oder dein Schicksal als hinterh�ltiger Dieb besiegeln wirst, es werden deine Taten sein, welche die Zukunft von Illarion pr�gen werden.\n\nBald schon wirst du eine Wahl zu treffen haben, welche vermutlich die wichtigste in deinem Leben sein wird. Wirst du zu Ruhm und Ehre Cadomyr anschlie�en, zu Wohlstand und Reichtum nach Galmair gehen oder wirst du der Weisheit und Magie von Runewick folgen?"
tutorialTextEN["welcome"] = "As an arduous voyage draws to a close, a new and exciting adventure in the land of Illarion beckons. All of the characters that you will encounter during your time here are living, breathing inhabitants of this mysterious world. Whether you experience glorious adventures as a noble knight, live the life of a hardworking craftsman, earn your fortune as an acquisitive merchant, gain favour as a charismatic priest, mystify with your sorcery, or seal your fate as a devious thief, it is your deeds that shape Illarion's future. \n\nSoon you will be faced with a choice, perhaps the most important of your entire life. Will you be drawn to the honour and glory of Cadomyr, the prosperity and wealth of Galmair, or the wisdom and magic of Runewick?"

tutorialTextDE["NewbieTextCadomyr"] = "Herzlichen Gl�ckwunsch, du hast das Tutorial erfolgreich abgeschlossen. Du hast dich dazu entschlossen, Cadomyr beizutreten, dem Reich von Ruhm und Ehre. Beachte bitte, dass von nun an jeder, dem du begegnest, erwarten wird, dass du in deiner Rolle bleibst - sei also ein nobler Ritter, ein unterw�rfiger Diener oder ein edler Diplomat."
tutorialTextEN["NewbieTextCadomyr"] = "Congratulations, you have completed the tutorial. You have chosen to join Cadomyr, the realm of honour and glory. Please note that from this point on everyone that you encounter will expect you to stay 'in character', by remaining true to your chosen role - be it a proud knight, a humble servant or a noble diplomat."

tutorialTextDE["NewbieTaskTextCadomyr"] = "Als Neuling hat man es nicht leicht. Man kennt die Gegend und die Leute nicht; und die Leute kennen dich nicht. Dein erstes Ziel sollte es sein, andere Spielercharaktere zu finden. Spielercharaktere lassen sich leicht von NPCs unterscheiden. NPCs bewegen sich nicht und reagieren sofort auf das Schl�sselwort 'Hilfe' mit einer Liste von Befehlen. Einige NPCs vergeben quests, diese haben ein '!' �ber ihrem Kopf. Erkunde auch die Stadt Cadomyr. Interessante Orte sind mit einem roten Symbol auf deiner Karte gekennzeichnet. Dein Questlog (Q) enth�lt weitere Informationen."
tutorialTextEN["NewbieTaskTextCadomyr"] = "Being new in town isn't easy. You don't know the area or the people, and neither do they know you. Your first objective will be to find other player characters to interact with. You'll easily tell apart player characters from NPCs as the latter do not move and respond immediatly on the keyword 'help' with a list of commands. Some NPCs issue quests, those have a '!' above their head. Also, explore the city of Cadomyr. Interesting places are marked on your map with a red symbol. For further information, see your quest log (Q)."

tutorialTextDE["NewbieTextRunewick"] = "Herzlichen Gl�ckwunsch, du hast das Tutorial erfolgreich abgeschlossen. Du hast dich dazu entschlossen, Runewick beizutreten, dem Reich der Weisheit und der Magie. Beachte bitte, dass von nun an jeder, dem du begegnest, erwarten wird, dass du in deiner Rolle bleibst - sei also ein geheimnisvoller Magier, ein weiser Gelehrter oder ein friedliebender Waldl�ufer."
tutorialTextEN["NewbieTextRunewick"] = "Congratulations, you have completed the tutorial. You have chosen to join Runewick, the realm of wisdom and magic. Please note that from this point on everyone that you encounter will expect you to stay 'in character', by remaining true to your chosen role - be it a mysterious mage, a wise scholar or a peaceful ranger."

tutorialTextDE["NewbieTaskTextRunewick"] = "Als Neuling hat man es nicht leicht. Man kennt die Gegend und die Leute nicht; und die Leute kennen dich nicht. Dein erstes Ziel sollte es sein, andere Spielercharaktere zu finden. Spielercharaktere lassen sich leicht von NPCs unterscheiden. NPCs bewegen sich nicht und reagieren sofort auf das Schl�sselwort 'Hilfe' mit einer Liste von Befehlen. Einige NPCs vergeben quests, diese haben ein '!' �ber ihrem Kopf. Erkunde auch die Stadt Runewick. Interessante Orte sind mit einem roten Symbol auf deiner Karte gekennzeichnet. Dein Questlog (Q) enth�lt weitere Informationen."
tutorialTextEN["NewbieTaskTextRunewick"] = "Being new in town isn't easy. You don't know the area or the people, and neither do they know you. Your first objective will be to find other player characters to interact with. You'll easily tell apart player characters from NPCs as the latter do not move and respond immediatly on the keyword 'help' with a list of commands. Some NPCs issue quests, those have a '!' above their head. Also, explore the city of Runewick. Interesting places are marked on your map with a red symbol. For further information, see your quest log (Q)."

tutorialTextDE["NewbieTextGalmair"] = "Herzlichen Gl�ckwunsch, du hast das Tutorial erfolgreich abgeschlossen. Du hast dich dazu entschlossen, Galmair beizutreten, dem Reich des aufstrebenden Wohlstands. Beachte bitte, dass von nun an jeder, dem du begegnest, erwarten wird, dass du in deiner Rolle bleibst - sei also ein flei�iger Handwerker, ein durchtriebener Gauner oder ein reicher H�ndler."
tutorialTextEN["NewbieTextGalmair"] = "Congratulations, you have completed the tutorial. You have chosen to join Galmair, the realm of prosperity and wealth. Please note that from this point on everyone that you encounter will expect you to stay 'in character', by remaining true to your chosen role - be it a sturdy craftsman, a shady thug or a wealthy merchant."

tutorialTextDE["NewbieTaskTextGalmair"] = "Als Neuling hat man es nicht leicht. Man kennt die Gegend und die Leute nicht; und die Leute kennen dich nicht. Dein erstes Ziel sollte es sein, andere Spielercharaktere zu finden. Spielercharaktere lassen sich leicht von NPCs unterscheiden. NPCs bewegen sich nicht und reagieren sofort auf das Schl�sselwort 'Hilfe' mit einer Liste von Befehlen. Einige NPCs vergeben quests, diese haben ein '!' �ber ihrem Kopf. Erkunde auch die Stadt Galmair. Interessante Orte sind mit einem roten Symbol auf deiner Karte gekennzeichnet. Dein Questlog (Q) enth�lt weitere Informationen."
tutorialTextEN["NewbieTaskTextGalmair"] = "Being new in town isn't easy. You don't know the area or the people, and neither do they know you. Your first objective will be to find other player characters to interact with. You'll easily tell apart player characters from NPCs as the latter do not move and respond immediatly on the keyword 'help' with a list of commands. Some NPCs issue quests, those have a '!' above their head. Also, explore the city of Galmair. Interesting places are marked on your map with a red symbol. For further information, see your quest log (Q)."

--Quest 320: Explorer stone
tutorialTextDE["explorer"] = "Auf das gesamte Spiel verteilt, kannst du Markierungssteine finden. Wenn du diese Steine doppelt anklickst und somit sammelst, bekommst du Punkte. Wenn du eine bestimmte Anzahl von Punkten gesammelt hast, bekommst du eine Belohnung.\n\n Versuche es einmal und klicke doppelt auf den Markierungsstein."
tutorialTextEN["explorer"] = "Throughout the game you can find marker stones. If you double click a stone, and therefore collect it, you will get points for it. When you collect a specific number of stones you will get a reward.\n\n Try it now and double click the marker stone."

--NPC texts outside .npc files

tutorialTalkDE["lights"] = "Du solltest jetzt sicher deinen Weg fortsetzen k�nnen, also trennen sich unsere Wege hier. Folge dem Pfad nach S�den und stelle dich dem Zwerg Nimbur Goldbrew vor. Er braut die feinsten Getr�nke f�r die Taverne zur Hanfschlinge und wird dir sicherlich mehr �ber das Leben in Illarion erz�hlen k�nnen."
tutorialTalkEN["lights"] = "You should safely be able to see your way around now, so this is where we part company. Take the path south and introduce yourself to the dwarf Nimbur Goldbrew. He brews the finest beverages for the Hemp Necktie Inn and is sure to tell you a bit about life in Illarion."

tutorialTalkDE["lightsStart"] = "Das Licht der Fackel kann deinen Weg erleuchten. Man kann niemals vorsichtig genug sein, weil gef�hrliche Kreaturen in den Schatten lauern, also pass auf, dass du immer eine Lichtquelle bei dir tr�gst, wenn die Nacht anbricht oder wenn du eine der zahlreichen H�hlen oder Tunnel in Illarion erkundest. Solltest du mehr Fackeln brauchen, sprich mit Hook Gowan hier auf dem Markt von Trollshaven oder such einen Schreiner auf."
tutorialTalkEN["lightsStart"] = "A simple strike of a torch can light your path. You can never be too careful as dangerous creatures can lurk in the shadows, so make sure you have a source of light whenever darkness falls or you explore one of the many caves or dungeons scattered across Illarion. Should you need more torches, speak to Hook Gowan in the market here at Troll's Haven, or seek out a carpenter."

--General functions

function M.getTutorialInformDE(location)
    return tutorialInformDE[location] or false
end

function M.getTutorialInformEN(location)
    return tutorialInformEN[location] or false
end

function M.getTutorialTextDE(location)
    return tutorialTextDE[location] or false
end

function M.getTutorialTextEN(location)
    return tutorialTextEN[location] or false
end

function M.getTutorialTalkDE(location)
    return tutorialTalkDE[location] or false
end

function M.getTutorialTalkEN(location)
    return tutorialTalkEN[location] or false
end

function M.tutorialDialog(Character,questID,location)
    if Character:getQuestProgress(325) == 1 and Character:getQuestProgress(questID) == 0 then --Accepted tutorial messages, didn't visit the triggerfield yet
        Character:setQuestProgress(questID, 1) --remember that the triggerfield was visited
        local callbackNewbie = function(informNewbie)
            local informDE = M.getTutorialInformDE(location)
            local informEN = M.getTutorialInformEN(location)
            if informDE and informEN then
                Character:inform(informDE,informEN)
            end
        end --end callback
        local textDE = M.getTutorialTextDE(location)
        local textEN = M.getTutorialTextEN(location)
        local dialogText = common.GetNLS(Character,textDE,textEN)
        local dialogNewbie = MessageDialog("Tutorial", dialogText, callbackNewbie)
        Character:requestMessageDialog(dialogNewbie)
    end
end

--Faction selection dialog at bookrest
function M.NewbieSelectionBookrest(Character)

    local callback = function(dialog)
        if dialog:getSuccess() then
            if dialog:getSelectedIndex() == 0 then
                M.NewbieWarp(Character,"Cadomyr")
            elseif dialog:getSelectedIndex() == 1 then
                M.NewbieWarp(Character,"Runewick")
            elseif dialog:getSelectedIndex() == 2 then
                M.NewbieWarp(Character,"Galmair")
            end
        end
    end

    local dialogText = common.GetNLS(Character,"Welchem Reich m�chtest du beitreten? Du kannst deine Entscheidung jederzeit beim Notar der Stadt revidieren. Du kannst auch jederzeit zu diesem Ort zur�ckkehren. Das Tutorial wird mit einer Einf�hrungsqueste weitergehen, bei der du deine neue Heimat n�her kennenlernen wirst.","Which realm would you like to join? You can change your decision anytime at the town's notary office. You can also return to this place anytime. The tutorial will continue with a quest to explore the realm.")
    local dialog = SelectionDialog("Tutorial", dialogText, callback)
    dialog:setCloseOnMove()
    dialog:addOption(2701,common.GetNLS(Character,"Cadomyr","Cadomyr"))
    dialog:addOption(105,common.GetNLS(Character,"Runewick","Runewick"))
    dialog:addOption(61,common.GetNLS(Character,"Galmair","Galmair"))
    Character:requestSelectionDialog(dialog)

end

--Faction selection
function M.NewbieWarp(Character,destinationString)

    if destinationString ~= "Cadomyr" and destinationString ~= "Runewick" and destinationString ~= "Galmair" then
        Character:inform("[Fehler] Ung�ltige Fraktion.","[Error] Invalid faction.")
        return
    end

    local destination = {}
    destination["Cadomyr"] = position(126,596,0)
    destination["Runewick"] = position(931,818,0)
    destination["Galmair"] = position(367,258,0)

    local factionID = {}
    factionID["Cadomyr"] = 1
    factionID["Runewick"] = 2
    factionID["Galmair"] = 3

    -- Build the dialogs
    local callbackNewbie = function(dialogNewbie)
        local callbackNewbieTask = function(dialogNewbieTask) end
        local dialogNewbieTaskTitle = common.GetNLS(Character, "Einf�hrung", "Introduction")
        local dialogNewbieTaskText = common.GetNLS(Character, M.getTutorialTextDE("NewbieTaskText"..destinationString), M.getTutorialTextEN("NewbieTaskText"..destinationString))
        local dialogNewbieTask = MessageDialog(dialogNewbieTaskTitle, dialogNewbieTaskText, callbackNewbieTask)
        Character:requestMessageDialog(dialogNewbieTask)
    end
    local dialogNewbieText = common.GetNLS(Character, M.getTutorialTextDE("NewbieText"..destinationString), M.getTutorialTextEN("NewbieText"..destinationString))
    local dialogNewbie = MessageDialog("Tutorial", dialogNewbieText, callbackNewbie)

    -- We send a message box
    Character:requestMessageDialog(dialogNewbie); --sending the dialog box to tell that the tutorial is finished
                                                      --the callback of this box contains the dialog box telling to visit special places

    --Warping the character
    world:gfx(41,Character.pos)
    world:makeSound(13,Character.pos)
    Character:warp(destination[destinationString])
    world:makeSound(13,Character.pos)
    world:gfx(41,Character.pos)
    Character.movepoints = Character.movepoints-20

    -- We start the introduction LTE
    local found = Character.effects:find(37)
    if not found then
        Character.effects:addEffect(LongTimeEffect(37, 10))
        Character:setQuestProgress(46,1) --start the quest
    end

    -- We tell other players about our new players
    local playerlist = world:getPlayersOnline();

    for i = 1, #(playerlist) do
        local FactionStuff = factions.getFaction(playerlist[i])
        if FactionStuff.tid == factionID[destinationString] then --Other faction members are alerted
            common.InformNLS(playerlist[i],"[New player] Ein neuer Spieler ist gerade deinem Reich beigetreten.","[New player] A new player has just joined your realm.");
        end
    end

    -- We make the new player a faction member
    Character:setQuestProgress(199,factionID[destinationString]);
    factions.setRankpoints(Character,0);
    Character:setQuestProgress(323,1) --Remember player has chosen a faction.
end

return M
