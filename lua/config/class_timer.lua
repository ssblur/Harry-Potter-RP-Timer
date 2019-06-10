local CONFIG = {}

CONFIG.BackgroundColor = Color(0,0,0,150)			-- The Background color of the class timer HUD.
CONFIG.BorderColor = Color(135, 30, 47, 255)		-- The Border color of the class timer HUD.
CONFIG.TextColor = Color(255,255,255,255)			-- The text color of the class timer HUD.
CONFIG.Classes = {
	{
		name = "Potions",							-- The name of the class, will appear at the top-left of the HUD's Box
		room = "8C",								-- The room the class is in, will appear at the top-right of the HUD's Box
		duration = 5								-- The duration of the class, in seconds.
	},
	{
		name = "Witchcraft",						-- The name of the class, will appear at the top-left of the HUD's Box
		room = "1A",								-- The room the class is in, will appear at the top-right of the HUD's Box
		duration = 5								-- The duration of the class, in seconds.
	}
}

class_timer_config = CONFIG