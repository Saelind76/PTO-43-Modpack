-- IJN Zuiho - gun sounds (core DCS sounds only). File name must match GT.Name ("ijn_zuiho").
-- Turret numbers = gun weapon systems in ijn_zuiho.lua order (Type 94 directors carry no gun):
--   1..4   127mm/40 Type 89 twin   -> AK100 (naval DP gun)
--   5..18  25mm Type 96 triple     -> automatic_gun_25mm
--   19..27 25mm Type 96 single     -> automatic_gun_25mm
dofile("Tools.lua")
dofile("GroundUnits/WeaponSystem/Tools/weapons.lua")
dofile("GroundUnits/WeaponSystem/Tools/CannonSounds.lua")
dofile("GroundUnits/WeaponSystem/Tools/AutoGunSounds.lua")

IJN_Zuiho_weapons = weapons:new()

for t = 1, 4 do
    IJN_Zuiho_weapons:addTurret(t)
    IJN_Zuiho_weapons:addLauncher(t, 1, AK100)
end

for t = 5, 27 do
    IJN_Zuiho_weapons:addTurret(t)
    IJN_Zuiho_weapons:addLauncher(t, 1, automatic_gun_25mm)
end
