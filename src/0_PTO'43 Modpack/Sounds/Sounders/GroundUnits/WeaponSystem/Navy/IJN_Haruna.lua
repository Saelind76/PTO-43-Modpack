-- IJN Haruna - gun sounds (core DCS sounds only). File name must match GT.Name ("IJN_Haruna").
-- Turret numbers = gun weapon systems in IJN_Haruna.lua order (the two Type 94 directors carry no gun):
--   1..4    356mm/45 twin main turrets  -> howitzer_2A64 (heaviest core cannon sound)
--   5..18   152mm/50 casemates          -> howitzer_2A64
--   19..24  127mm/40 Type 89 twin       -> AK100 (naval DP gun)
--   25..54  25mm Type 96 triple         -> automatic_gun_25mm
--   55..70  25mm Type 96 twin           -> automatic_gun_25mm
dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")

IJN_Haruna_weapons = weapons:new()

for t = 1, 18 do
    IJN_Haruna_weapons:addTurret(t)
    IJN_Haruna_weapons:addLauncher(t, 1, howitzer_2A64)
end

for t = 19, 24 do
    IJN_Haruna_weapons:addTurret(t)
    IJN_Haruna_weapons:addLauncher(t, 1, AK100)
end

for t = 25, 70 do
    IJN_Haruna_weapons:addTurret(t)
    IJN_Haruna_weapons:addLauncher(t, 1, automatic_gun_25mm)
end
