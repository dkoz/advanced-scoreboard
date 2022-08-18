function ProfileCard( v )
	local w, h = ScrW() / 2, ScrH() / 1.5
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