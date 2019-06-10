AddCSLuaFile()
AddCSLuaFile("config/class_timer.lua")
include("config/class_timer.lua")

class_timer = class_timer or {}
class_timer.current = 1
class_timer.time = class_timer_config.Classes[1].duration

local function next()
	return ((class_timer.current or 1)%(#class_timer_config.Classes)) + 1
end

local function time_remaining()
	return class_timer.time
end

if CLIENT then
	hook.Add("HUDPaint", "ClassTimerHUD", function()
		surface.SetDrawColor(class_timer_config.BackgroundColor)
		surface.DrawRect((ScrW()/2)-200, ScrH()-80, 400, 80)

		surface.SetDrawColor(class_timer_config.BorderColor)
		surface.DrawOutlinedRect( (ScrW()/2)-202, ScrH()-82, 404, 84 )
		surface.DrawOutlinedRect( (ScrW()/2)-201, ScrH()-81, 402, 82 )

		draw.SimpleText( class_timer_config.Classes[class_timer.current or 1].name, "Trebuchet24", (ScrW()/2)-195, ScrH()-75, class_timer_config.TextColor, TEXT_ALIGN_LEFT)
		draw.SimpleText( "Room: "..class_timer_config.Classes[class_timer.current or 1].room, "Trebuchet24", (ScrW()/2)+195, ScrH()-75, class_timer_config.TextColor, TEXT_ALIGN_RIGHT)
		draw.SimpleText( "Next Class: "..class_timer_config.Classes[next()].name.." in "..class_timer_config.Classes[next()].room, "Trebuchet24", (ScrW()/2)-195, ScrH()-30, class_timer_config.TextColor, TEXT_ALIGN_LEFT)
		draw.SimpleText( time_remaining(), "Trebuchet24", (ScrW()/2)+195, ScrH()-30, class_timer_config.TextColor, TEXT_ALIGN_RIGHT)
	end)

	timer.Create("ClassTimer", 1, 0, function()
		class_timer.time = class_timer.time - 1
		if class_timer.time<=0 then
			class_timer.time = class_timer_config.Classes[next()].duration
			class_timer.current = next()
		end
	end)
end