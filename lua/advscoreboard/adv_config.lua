--[[
   _____       .___                                     .___          
  /  _  \    __| _/__  _______    ____   ____  ____   __| _/          
 /  /_\  \  / __ |\  \/ /\__  \  /    \_/ ___\/ __ \ / __ |           
/    |    \/ /_/ | \   /  / __ \|   |  \  \__\  ___// /_/ |           
\____|__  /\____ |  \_/  (____  /___|  /\___  >___  >____ |           
        \/      \/            \/     \/     \/    \/     \/           
  _________                         ___.                          .___
 /   _____/ ____  ___________   ____\_ |__   _________ _______  __| _/
 \_____  \_/ ___\/  _ \_  __ \_/ __ \| __ \ /  _ \__  \\_  __ \/ __ | 
 /        \  \__(  <_> )  | \/\  ___/| \_\ (  <_> ) __ \|  | \/ /_/ | 
/_______  /\___  >____/|__|    \___  >___  /\____(____  /__|  \____ | 
        \/     \/                  \/    \/           \/           \/ 

	Author: KoZ
	Profile: http://steamcommunity.com/id/kozejin
	Github: https://github.com/dkoz
	Website: https://beskor.net
--]]

scoreboard = {} or scoreboard -- Do not edit this line.
scoreboard.config = {} -- Do not edit this line.

-- Configuration Start

-- Changes the title of your scoreboard.
scoreboard.config.title = "Advanced Scoreboard"
-- Changes the click sound of your scoreboard.
scoreboard.config.sound = "ui/buttonclick.wav"
-- Set to true if you don't want to disable fadnin.
-- This will force players fadmin_IsScoreboard to 0.
-- scoreboard.config.hidefadmin = true

-- Change the color scheme of your scoreboard.
scoreboard.config.mainbg = Color( 45, 45, 45, 255 )
scoreboard.config.borderbg = Color( 35, 35, 35, 255 )
scoreboard.config.titlebg = Color( 35, 35, 35, 255 )
scoreboard.config.trowbg = Color( 35, 35, 35, 255 )
scoreboard.config.playerbg = Color( 45, 45, 45, 255 )
scoreboard.config.cardbg = Color( 45, 45, 45, 255 )
scoreboard.config.listbg = Color( 35, 35, 35, 255 )

--[[
-- Old feature
scoreboard.config.groups = { -- Rank Configuration
	['superadmin'] = {name = 'S-Admin', color = Color( 199, 44, 44 )},
	['admin'] = {name = 'Admin', color = Color( 199, 44, 44 )},
	['moderator'] = {name = 'Mod', color = Color( 241, 196, 15 )},
	['supporter'] = {name = 'VIP', color = Color( 155, 89, 182 )},
	['regular'] = {name = 'Regular', color = Color( 155, 89, 182 )}
}
--]]