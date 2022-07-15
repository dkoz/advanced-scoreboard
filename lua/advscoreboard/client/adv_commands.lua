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

function ULXMenu( ply )
	local menu = DermaMenu()
	local icon
	menu:AddOption( "Menu", function() end ):SetIcon( "icon16/world.png" )
	menu:AddSpacer()

	local usermenu, icon = menu:AddSubMenu( "User" )
	icon:SetIcon( "icon16/user.png" )
	usermenu:AddOption( "Copy Name", function() SetClipboardText( ply:Nick() ) end )
	usermenu:AddOption( "Copy SteamID", function() SetClipboardText( ply:SteamID() ) end )
	usermenu:AddOption( "Copy SteamName", function() SetClipboardText( ply:SteamName() ) end )
	
	if LocalPlayer():IsAdmin() or LocalPlayer():IsSuperAdmin() then
		menu:AddSpacer()
		menu:AddOption( "Kick", function()
			local kickframe = vgui.Create( "DFrame" )
			kickframe:SetSize( 220, 85 )
			kickframe:SetTitle( "Kick Player: " .. ply:Nick() )
			kickframe:ShowCloseButton( false )
			kickframe:Center()
			kickframe.Paint = function()
				draw.RoundedBox( 0, 0, 0, kickframe:GetWide(), kickframe:GetTall(), Color( 35, 35, 35, 220 ) )
			end
			kickframe:MakePopup()
			
			local kickinput = vgui.Create( "DTextEntry", kickframe )
			kickinput:SetPos( 10, 30 )
			kickinput:SetSize( 200, 20 )
			kickinput:SetValue( "" )
			kickinput:RequestFocus()
			
			local kicksubmit = vgui.Create( "DButton", kickframe )
			kicksubmit:SetPos( 10, 55 )
			kicksubmit:SetText( "Accept" )
			kicksubmit:SetSize( 75, 20 )
			kicksubmit.DoClick = function()
				RunConsoleCommand( "ulx", "kick", ply:Nick(), kickinput:GetValue() )
				kickframe:Remove()
			end
			
			local kickclose = vgui.Create( "DButton", kickframe )
			kickclose:SetPos( kickframe:GetWide() - 85, 55 )
			kickclose:SetText( "Cancel" )
			kickclose:SetSize( 75, 20 )
			kickclose.DoClick = function()
				kickframe:Remove()
			end
		end ):SetIcon( "icon16/delete.png" )
		menu:AddOption( "Slay", function() RunConsoleCommand( "ulx", "slay", ply:Nick() ) end ):SetIcon( "icon16/cross.png" )
		menu:AddOption( "Ban", function()
			local banframe = vgui.Create( "DFrame" )
			banframe:SetSize( 220, 85 )
			banframe:SetTitle( "Ban Player: " .. ply:Nick() )
			banframe:ShowCloseButton( false )
			banframe:Center()
			banframe.Paint = function()
				draw.RoundedBox( 0, 0, 0, banframe:GetWide(), banframe:GetTall(), Color( 35, 35, 35, 220 ) )
			end
			banframe:MakePopup()
			
			local baninput = vgui.Create( "DTextEntry", banframe )
			baninput:SetPos( 10, 30 )
			baninput:SetSize( 150, 20 )
			baninput:SetValue( "" )
			baninput:RequestFocus()
			
			local bantime = vgui.Create( "DTextEntry", banframe )
			bantime:SetPos( banframe:GetWide() - 55, 30 )
			bantime:SetSize( 45, 20 )
			bantime:SetValue( "1" )
			
			local bansubmit = vgui.Create( "DButton", banframe )
			bansubmit:SetPos( 10, 55 )
			bansubmit:SetText( "Accept" )
			bansubmit:SetSize( 75, 20 )
			bansubmit.DoClick = function()
				RunConsoleCommand( "ulx", "ban", ply:Nick(), bantime:GetValue(), baninput:GetValue() )
				banframe:Remove()
			end
			
			local banclose = vgui.Create( "DButton", banframe )
			banclose:SetPos( banframe:GetWide() - 85, 55 )
			banclose:SetText( "Cancel" )
			banclose:SetSize( 75, 20 )
			banclose.DoClick = function()
				banframe:Remove()
			end
		end ):SetIcon( "icon16/delete.png" )
		menu:AddSpacer()
		
		local jailmenu, icon = menu:AddSubMenu( "Jail" )
		icon:SetIcon( "icon16/tux.png" )
		jailmenu:AddOption( "Jail", function() RunConsoleCommand( "ulx", "jail", ply:Nick() ) end )
		jailmenu:AddOption( "Unjail", function() RunConsoleCommand( "ulx", "unjail", ply:Nick() ) end )
		
		local mutemenu, icon = menu:AddSubMenu( "Mute" )
		icon:SetIcon( "icon16/sound.png" )
		mutemenu:AddOption( "Mute", function() RunConsoleCommand( "ulx", "mute", ply:Nick() ) end )
		mutemenu:AddOption( "Unmute", function() RunConsoleCommand( "ulx", "unmute", ply:Nick() ) end )
		
		local teleportmenu, icon = menu:AddSubMenu( "Teleport" )
		icon:SetIcon( "icon16/arrow_right.png" )
		teleportmenu:AddOption( "Goto", function() RunConsoleCommand( "ulx", "goto", ply:Nick() ) end )
		teleportmenu:AddOption( "Bring", function() RunConsoleCommand( "ulx", "bring", ply:Nick() ) end )
	end
	menu:Open()
end