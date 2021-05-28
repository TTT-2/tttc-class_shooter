CLASS.AddClass("SHOOTER", {
	color = Color(225, 0, 75, 255),
	passiveItems = {
		"item_ttt_infinishoot"
	},
	time = 8,
	cooldown = 60,
	avoidWeaponReset = true,
	OnAbilityActivate = function(ply)
		if SERVER then
			ply:GiveArmor(60)
		end
	end,
	OnAbilityDeactivate = function(ply)
		if SERVER then
			ply:RemoveArmor(60)
		end
	end,
	lang = {
		name = {
			en = "Shooter",
			ru = "Стрелок"
		},
		desc = {
			en = "The Shooter has infinite ammo for all common weapons that aren't special. Additionally he can receive 60 armor points for 8 seconds once every minute.",
			ru = "Стрелок имеет бесконечные боеприпасы для всего обычного оружия, которое особенных. Дополнительно он может получать 60 очков брони каждые 8 секунд каждую минуту."
		}
	}
})
