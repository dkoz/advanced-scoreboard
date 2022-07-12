if SERVER then
	AddCSLuaFile("advscoreboard/adv_config.lua")
	AddCSLuaFile("advscoreboard/client/adv_commands.lua")
	AddCSLuaFile("advscoreboard/client/adv_scoreboard.lua")
	include("advscoreboard/adv_config.lua")
end

if CLIENT then
	include("advscoreboard/adv_config.lua")
	include("advscoreboard/client/adv_commands.lua")
	include("advscoreboard/client/adv_scoreboard.lua")
end