-- USS Independence CVL-22 - AA gun sounds (core DCS sounds only)
-- File name must match GT.Name ("uss_independence").
-- Turret numbers = gun weapon systems in uss_independence.lua order (Mk 51 directors carry no gun):
--   1..2   quad 40mm Bofors   -> automatic_gun_2A72 (heavy, slow-firing autocannon)
--   3..13  twin 40mm Bofors   -> automatic_gun_2A72
--   14..37 20mm Oerlikon      -> automatic_gun_25mm
dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")

USS_Independence_weapons = weapons:new()

for t = 1, 13 do
    USS_Independence_weapons:addTurret(t)
    USS_Independence_weapons:addLauncher(t, 1, automatic_gun_2A72)
end

for t = 14, 37 do
    USS_Independence_weapons:addTurret(t)
    USS_Independence_weapons:addLauncher(t, 1, automatic_gun_25mm)
end
