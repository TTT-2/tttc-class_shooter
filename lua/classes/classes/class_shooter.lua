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
    langs = {
        English = "Shooter"
    }
})
