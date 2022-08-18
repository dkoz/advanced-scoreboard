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

surface.CreateFont( "scoreboard_logo", {
	font = "default",
	size = 30,
	weight = 700,
	shadow = true,
	antialias = true
})

surface.CreateFont( "scoreboard_text", {
	font = "default",
	size = 16,
	weight = 700,
	antialias = true
})

surface.CreateFont( "scoreboard_profile", {
	font = "default",
	size = 12,
	weight = 700,
	antialias = true
})

-- Disables FAdmin Scoreboard
hook.Add("InitPostEntity", "InitFadminRemove", function()
    hook.Remove("ScoreboardShow", "FAdmin_scoreboard")
    hook.Remove("ScoreboardHide", "FAdmin_scoreboard")
end) 

local function ScoreboardShow()
	gui.EnableScreenClicker( true )

	local w, h = ScrW() / 2, ScrH() / 1.5
	framemain = vgui.Create( "DPanel" )
	framemain:SetSize( w, h )
	framemain:Center()
	framemain.Paint = function()
		draw.RoundedBox( 0, 0, 0, w, h, scoreboard.config.mainbg )
		surface.SetDrawColor( scoreboard.config.borderbg )
		surface.DrawOutlinedRect( 0, 0, w, h )
	end
	
	local framelogo = vgui.Create( "DPanel", framemain )
	framelogo:SetPos( 5, 5 )
	framelogo:SetSize( w, 100 )
	framelogo.Paint = function()
		surface.SetFont( "scoreboard_logo" )
		local logo = scoreboard.config.title
		local logosize = surface.GetTextSize( logo )
		draw.RoundedBox( 0, 0, 0, logosize + 35, 55, scoreboard.config.titlebg )
		draw.SimpleText( logo, "scoreboard_logo", 15, 12.5, Color( 255, 255, 255 ) )
		draw.SimpleText( #player.GetAll() .. "/" .. GetConVarString( "maxplayers" ) .. " Players", "scoreboard_text", framelogo:GetWide() - 20, 30, Color( 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM )
		draw.SimpleText( tostring( os.date() ), "scoreboard_text", framelogo:GetWide() - 20, 12.5, Color( 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM )
	end
	
	local frametrow = vgui.Create( "DPanel", framemain )
	frametrow:SetPos( 5, h / 7 )
	frametrow:SetSize( w + 10, 30 )
	frametrow.Paint = function()
		draw.RoundedBox( 0, 0, 0, frametrow:GetWide() - 20, frametrow:GetTall(), scoreboard.config.trowbg )
		draw.SimpleText( "Name", "scoreboard_text", 40, 6, Color( 255, 255, 255 ) )
		draw.SimpleText( "Job", "scoreboard_text", frametrow:GetWide() / 2, 22, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
		draw.SimpleText( "Ping", "scoreboard_text", frametrow:GetWide() / 1.1, 22, Color( 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM )
	end
	
	local framelist = vgui.Create( "DPanelList", framemain )
	framelist:SetPos( 5, h / 5.2 )
	framelist:SetSize( w + 10, h - ScrH() / 7.6 )
	framelist:SetSpacing( 2 )
	framelist:EnableVerticalScrollbar( true )
	framelist:EnableHorizontal( true )
	framelist.Paint = function()
		draw.RoundedBox( 0, 0, 0, framelist:GetWide() - 20, framelist:GetTall(), scoreboard.config.listbg )
	end
	
	local function framegroup( v, c )
        if not c then
            if scoreboard.config.groups[ v ] then
                return scoreboard.config.groups[ v ].name
            else
                return 'User'
            end
        else
            if scoreboard.config.groups[ v ] then
                return scoreboard.config.groups[ v ].color
            else
                return Color( 255, 255, 255 )
            end
        end
    end
	
	for k, v in pairs( player.GetAll() ) do
		if not IsValid( v ) then continue end
		
		local framerow = vgui.Create( "DButton", framelist )
		framerow:SetSize( framelist:GetWide(), 30 )
		framerow:SetText( "" )
		framerow.Paint = function()
			if not IsValid( v ) then 
				framerow:Remove()
				infoframe:Remove()
				return
			end
			draw.RoundedBox( 0, 0, 0, framerow:GetWide() - 20, framerow:GetTall(), team.GetColor( v:Team() ) )
			draw.RoundedBox( 0, 0, 0, framerow:GetWide() - 20, framerow:GetTall() / 2, Color( 255, 255, 255, 25 ) )
			draw.SimpleText( v:Nick(), "scoreboard_text", 40, 6, Color(255, 255, 255) )
			draw.SimpleText( team.GetName( v:Team() ), "scoreboard_text", framerow:GetWide() / 2, 22, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM )
			draw.SimpleText( v:Ping(), "scoreboard_text", framerow:GetWide() / 1.1, 22, Color( 255, 255, 255 ), TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM )
		end
		framerow.DoClick = function()
			if IsValid( infoframe ) then infoframe:Remove() end
			surface.PlaySound( scoreboard.config.sound )
			infoframe = vgui.Create( "DPanel" )
			infoframe:SetSize( 250, 150 )
			infoframe:SetPos( w / 9, h - ScrH() / 2 )
			infoframe.Paint = function()
				draw.RoundedBox( 0, 0, 0, infoframe:GetWide(), infoframe:GetTall(), scoreboard.config.cardbg )
				surface.SetDrawColor( scoreboard.config.borderbg )
				surface.DrawOutlinedRect( 0, 0, infoframe:GetWide(), infoframe:GetTall() )
			end
			infoframe:MakePopup()
			
			local info = vgui.Create( "DPanel", infoframe )
			info:SetSize( infoframe:GetWide(), infoframe:GetTall() )
			info.Paint = function()
				if not IsValid( v ) then return end
				draw.SimpleText( "RP Name: " .. v:Nick(), "scoreboard_profile", 75, 5, Color( 255, 255, 255 ) )
				draw.SimpleText( "Steam Name: " .. v:SteamName(), "scoreboard_profile", 75, 20, Color( 255, 255, 255 ) )
				draw.SimpleText( "SteamID: " .. v:SteamID(), "scoreboard_profile", 75, 35, Color( 255, 255, 255 ) )
				draw.SimpleText( "Group: " .. v:GetUserGroup(), "scoreboard_profile", 75, 50, Color( 255, 255, 255) )
				draw.SimpleText( "Job: " .. team.GetName( v:Team() ), "scoreboard_profile", 5, 75, Color( 255, 255, 255 ) )
				draw.SimpleText( "Salary: " .. ( v.DarkRPVars.salary or 0 ), "scoreboard_profile", 5, 90, Color( 255, 255, 255 ) )
				if LocalPlayer():IsAdmin() then
					draw.SimpleText( "Wallet: " .. v.DarkRPVars.money or 0, "scoreboard_profile", 5, 105, Color( 255, 255, 255 ) )
					draw.SimpleText( "Props: " .. v:GetCount( "props" ), "scoreboard_profile", 5, 120, Color( 255, 255, 255 ) )
				end
			end
			
			local avy = vgui.Create( "AvatarImage", infoframe )
			avy:SetSize( 64, 64 )
			avy:SetPos( 5, 5 )
			avy:SetPlayer( v, 24 )
			
			local avybutton = vgui.Create( "DButton", infoframe )
			avybutton:SetSize( 64, 64 )
			avybutton:SetPos( 5, 5 )
			avybutton:SetText( "" )
			avybutton.Paint = function() end
			avybutton.DoClick = function()
				if not IsValid( v ) then return end
				surface.PlaySound( scoreboard.config.sound )
				v:ShowProfile()
			end
		end
		framerow.DoRightClick = function()
			surface.PlaySound( scoreboard.config.sound )
			if IsValid( v ) then
				ULXMenu( v )
			end
		end

		local avatar = vgui.Create( "AvatarImage", framerow )
		avatar:SetSize( 24, 24 )
		avatar:SetPos( 5, 3 )
		avatar:SetPlayer( v, 24 )
		
		local avatarbutton = vgui.Create( "DButton", framerow )
		avatarbutton:SetSize( 24, 24 )
		avatarbutton:SetText( "" )
		avatarbutton:SetPos( 5, 3 )
		avatarbutton.Paint = function() end
		avatarbutton.DoClick = function()
			if not IsValid(v) then return end
			surface.PlaySound( scoreboard.config.sound )
			v:ShowProfile()
		end
		
		local muteplayer = vgui.Create( "DImageButton", framerow )
		muteplayer:SetPos( framerow:GetWide() / 1.07, 6 )
		muteplayer:SetSize( 16, 16 )
		muteplayer:SetColor( Color( 255, 255, 255 ) )
		muteplayer:SetImage( v:IsMuted() and "icon16/sound_mute.png" or "icon16/sound.png" )
		muteplayer.DoClick = function()
			if !v:IsMuted() then v:SetMuted( true ) else v:SetMuted( false ) end
			surface.PlaySound( scoreboard.config.sound )
			muteplayer:SetImage( v:IsMuted() and 'icon16/sound_mute.png' or 'icon16/sound.png' )
		end
		
		framelist:AddItem( framerow )
	end
end

local function ScoreboardHide()
	if IsValid( framemain ) then framemain:Remove() end
	if IsValid( infoframe ) then infoframe:Remove() end
	gui.EnableScreenClicker( false )
end

hook.Add( 'ScoreboardShow', 'AdvScoreboadShow', function()
	ScoreboardShow()
	return true
end )

hook.Add( 'ScoreboardHide', 'AdvScoreboadHide', function()
	ScoreboardHide()
	return true
end )
