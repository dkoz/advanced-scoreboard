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
--]]

scoreboard = {} or scoreboard -- Do not edit this line.
scoreboard.config = {} -- Do not edit this line.

-- Configuration Start

-- Changes the title of your scoreboard.
scoreboard.config.title = "Advanced Scoreboard"
-- Changes the click sound of your scoreboard.
scoreboard.config.sound = "ui/buttonclick.wav"
-- Change between SAM or ULX Admin Mods
scoreboard.config.mode = "ulx"

-- Change the color scheme of your scoreboard.
scoreboard.config.mainbg = Color( 45, 45, 45, 255 )
scoreboard.config.borderbg = Color( 35, 35, 35, 255 )
scoreboard.config.titlebg = Color( 35, 35, 35, 255 )
scoreboard.config.trowbg = Color( 35, 35, 35, 255 )
scoreboard.config.playerbg = Color( 45, 45, 45, 255 )
scoreboard.config.cardbg = Color( 45, 45, 45, 255 )
scoreboard.config.listbg = Color( 35, 35, 35, 255 )

-- Change how the scoreboard sorts players. (group/team)
scoreboard.config.sorttype = "team"

-- Change the hierarchy of how the groups are sorted.
scoreboard.config.grouporder = {
	['user'] = 1,
	['operator'] = 2,
	['admin'] = 3,
	['superadmin'] = 4,
}

-- Change the rank configuration
scoreboard.config.groups = {
	['superadmin'] = { name = 'Owner', color = Color( 255, 255, 255 ) },
	['admin'] = { name = "Admin", color = Color( 255, 255, 255 ) },
	['moderator'] = { name = "Moderator", color = Color( 255, 255, 255 ) },
}