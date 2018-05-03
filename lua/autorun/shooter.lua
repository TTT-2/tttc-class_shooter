AddCSLuaFile()

hook.Add("TTTCPreClassesInit", "InitClassShooter", function()
    AddCustomClass("SHOOTER", {
        --color = Color(),
        name = "shooter"
    })
end)

hook.Add("TTT2_FinishedClassesSync", "TTT2ClassShooterInit", function(ply, first)
	if CLIENT and first then -- just on client and first init !

		-- setup here is not necessary but if you want to access the role data, you need to start here
		-- setup basic translation !
		LANG.AddToLanguage("English", CLASSES.SHOOTER.name, "Shooter")
        
        -- just this language too
		LANG.AddToLanguage("Deutsch", CLASSES.SHOOTER.name, "Shooter")
    end
end)

if SERVER then
    function FillClips(ply, wep)
        if not wep:HasAmmo() or not wep.AutoSpawnable or (wep.Kind == WEAPON_EQUIP1 or wep.Kind == WEAPON_EQUIP2) then return end -- prevent most op weapons
        
        if wep:Clip1() < 255 then 
            wep:SetClip1(250) 
        end

        if wep:Clip2() < 255 then 
            wep:SetClip2(250) 
        end
        
        if wep:GetPrimaryAmmoType() == 10 or wep:GetPrimaryAmmoType() == 8 then
            ply:GiveAmmo(9 - ply:GetAmmoCount(wep:GetPrimaryAmmoType()), wep:GetPrimaryAmmoType(), true)
        elseif wep:GetSecondaryAmmoType() == 9 or wep:GetSecondaryAmmoType() == 2 then
            ply:GiveAmmo(9 - ply:GetAmmoCount(wep:GetSecondaryAmmoType()), wep:GetSecondaryAmmoType(), true)
        end
    end
    
    hook.Add("Tick", "TTT2ClassShooterTick", function()
        for _, ply in pairs(player.GetAll()) do
            if ply:Alive() and ply:GetActiveWeapon() and ply:HasCustomClass() and ply:GetCustomClass() == CLASSES.SHOOTER.index then
                FillClips(ply, ply:GetActiveWeapon())
            end
        end
    end)
end
