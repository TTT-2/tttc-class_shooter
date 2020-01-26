CLASS.AddClass("SHOOTER", {
	color = Color(225, 0, 75, 255),
	passiveItems = {
		"item_ttt_infinishoot"
	},
	time = 8,
	cooldown = 60,
	avoidWeaponReset = true,
	onActivate = function(ply)
		if SERVER then
			ply:GiveArmor(60)
		end
	end,
	onDeactivate = function(ply)
		if SERVER then
			ply:RemoveArmor(60)
		end
	end,
	lang = {
		name = {
			English = "Shooter"
		},
		desc = {
			English = "The Shooter has infinite ammo for all common weapons that aren't special. Additionally he can receive 60 armor points for 8 seconds once every minute."
		}
	}
})
