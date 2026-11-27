-- ============================================================================
-- USS Baltimore CA-68 (PTO'43) - rebuilt 2026-11-25
-- Original file: _archive/Cruisers_weapons_pre_2026-11-25/Baltimore/ca_68_baltimore.lua
--
-- Model: Shapes/ca_68_baltimore.edm exported 2026-11-25 from
--   3D MODELS/.../USS Baltimore CA-68/Baltimore-CA68_R2_rig.blend (copy of Baltimore-CA68.blend):
--   all 39 mounts rekeyed to the DCS convention (traverse arg 0 = bow, +1 = +180 deg port;
--   elevation +1 = +90 deg, keys from -18 deg) and the leftover untextured parts moved to
--   CA68_Weapons_Masts. The old EDM (2021) was static: no animated guns, no connectors, and it
--   asked for textures that are no longer shipped.
-- Args: 8in 13..18, 5in 19..30, 40mm quads 31..54, 20mm 55..90, directors 7..12, SK radar 1,
--   propellers 95, rudder 96.
-- ============================================================================
GT = {}
GT_t.ws = 0
set_recursive_metatable(GT, GT_t.generic_ship)

GT.visual = {}
GT.visual.shape      = "ca_68_baltimore"
GT.visual.shape_dstr = "ca_68_baltimore_Sunk"

GT.animation_arguments = {
    radar1_rotation  = 1,
    radar2_rotation  = -1,
    radar3_rotation  = -1,
    water_propeller  = 95,
    flag_animation   = -1,
}
GT.radar1_period = 4

-- 205 m x 21.6 m, 14,500 t standard / 17,000 t full, 33 kn
GT.life             = 8000
GT.mass             = 1.7e+007
GT.max_velocity     = 17.0
GT.race_velocity    = 17.0
GT.economy_velocity = 7.7
GT.economy_distance = 2.0e+007
GT.race_distance    = 4.6e+006
GT.shipLength       = 205
GT.Width            = 21.6
GT.Height           = 42
GT.Length           = 205
GT.DeckLevel        = 7.2
GT.X_nose           = 109.8
GT.X_tail           = -97.8
GT.Tail_Width       = 11
GT.Gamma_max        = 0.35
GT.Om               = 0.05
GT.speedup          = 0.1
GT.R_min            = 450
GT.distFindObstacles = 650

GT.exhaust = {
    [1] = { size = 0.5, pos = {  9.9, 25.1, 0.0 } },
    [2] = { size = 0.5, pos = { -9.8, 24.1, 0.0 } },
}

-- damage areas: shell names of the (unchanged) collision model ca_68_baltimore_Collision.edm
GT.DM = {
    { area_name = "Scafo_Prua_Dx",      area_arg = 76, area_life = 90,  area_fire = { pos = { 45.0, 4.0,  3.0 }, size = 1.5 } },
    { area_name = "Scafo_Prua_Sx",      area_arg = 73, area_life = 90,  area_fire = { pos = { 30.0, 4.0, -3.0 }, size = 1.5 } },
    { area_name = "Scafo_Poppa_Dx",     area_arg = 72, area_life = 80,  area_fire = { pos = { -20.0, 2.0,  3.0 }, size = 1.5 } },
    { area_name = "Scafo_Poppa_Sx",     area_arg = 75, area_life = 80,  area_fire = { pos = { -10.0, 2.0, -3.0 }, size = 1.5 } },
    { area_name = "Strutture_Poppa",    area_arg = 82, area_life = 100, area_fire = { pos = { -35.0, 12.0, 0.0 }, size = 1.5 } },
    { area_name = "Sala_Comando",       area_arg = 83, area_life = 100, area_fire = { pos = { 30.0, 12.0, 0.0 }, size = 1.5 } },
    { area_name = "Torre_380_Anton",    area_arg = 96, area_life = 80,  area_fire = { pos = { 35.0, 5.0, 0.0 }, size = 1.5 } },
    { area_name = "Ponte Poppa",        area_arg = 85, area_life = 80,  area_fire = { pos = { -45.0, 3.0, 0.0 }, size = 1.5 } },
    { area_name = "Fletcher_Distrutta", area_arg = 77, area_life = 80,  area_fire = { pos = { 5.0, 12.0, 0.0 }, size = 2.5 } },
}

-- ---------------- weapons (Weapons/USN_cruiser_weapons.lua) ----------------
GT.WS = {}
GT.WS.maxTargetDetectionRange = 45000
GT.WS.radar_type              = 102
GT.WS.searchRadarMaxElevation = math.rad(60)
GT.WS.searchRadarFrequencies  = { { 50.0e6, 54.0e6 }, { 2.0e9, 2.2e9 } }

local A = USN_ARCS
local function area(x) if x > 30 then return "Torre_380_Anton" elseif x > 0 then return "Sala_Comando" elseif x > -40 then return "Strutture_Poppa" else return "Ponte Poppa" end end
local function add(list, proto)
    for _, m in ipairs(list) do m.area = area(m.pos[1]) end
    USN_add_mounts(GT, list, proto)
end

-- 3 x triple 8"/55 (muzzle connectors POINT_GUN_0n_1..3 follow the barrels)
add({
    { pos = {  67.1,  9.6, 0.0 }, az = 13, el = 14, arcs = A.fwd(-5, 41), refY =   0, barrels = 3, spacing = 1.8, length = 9, conn = "POINT_GUN_01_%d" },
    { pos = {  53.6, 12.5, 0.0 }, az = 15, el = 16, arcs = A.fwd(-5, 41), refY =   0, barrels = 3, spacing = 1.8, length = 9, conn = "POINT_GUN_02_%d" },
    { pos = { -53.1,  9.6, 0.0 }, az = 17, el = 18, arcs = A.aft(-5, 41), refY = 180, barrels = 3, spacing = 1.8, length = 9, conn = "POINT_GUN_03_%d" },
}, GT_t.WS_t.USN_CA_8in55_Triple)

-- 6 x twin 5"/38 DP
add({
    { pos = {  38.9, 13.0,  0.0 }, az = 19, el = 20, arcs = A.fwd(-15, 85),  refY =   0, barrels = 2, spacing = 2.1, length = 4, conn = "POINT_GUN_SEC_01_%d" },
    { pos = {  26.6, 11.7,  7.2 }, az = 21, el = 22, arcs = A.stbd(-15, 85), refY = -90, barrels = 2, spacing = 2.1, length = 4, conn = "POINT_GUN_SEC_02_%d" },
    { pos = {  26.6, 11.7, -7.2 }, az = 23, el = 24, arcs = A.port(-15, 85), refY =  90, barrels = 2, spacing = 2.1, length = 4, conn = "POINT_GUN_SEC_03_%d" },
    { pos = { -23.9, 11.7,  8.0 }, az = 25, el = 26, arcs = A.stbd(-15, 85), refY = -90, barrels = 2, spacing = 2.1, length = 4, conn = "POINT_GUN_SEC_04_%d" },
    { pos = { -23.9, 11.7, -7.9 }, az = 27, el = 28, arcs = A.port(-15, 85), refY =  90, barrels = 2, spacing = 2.1, length = 4, conn = "POINT_GUN_SEC_05_%d" },
    { pos = { -38.1, 11.8,  0.0 }, az = 29, el = 30, arcs = A.aft(-15, 85),  refY = 180, barrels = 2, spacing = 2.1, length = 4, conn = "POINT_GUN_SEC_06_%d" },
}, GT_t.WS_t.USN_5in38_Twin)

-- 12 x quad 40mm (args 31..54)
local q40 = {
    { {  81.9,  8.1,  0.0 }, A.fwd(-10, 88),  0 },
    { {  45.1,  7.5,  6.3 }, A.stbd(-10, 88), -90 }, { {  45.1,  7.5, -6.3 }, A.port(-10, 88), 90 },
    { {  13.8, 12.4,  8.1 }, A.stbd(-10, 88), -90 }, { {  13.8, 12.4, -8.0 }, A.port(-10, 88), 90 },
    { {   0.8, 12.4,  7.3 }, A.stbd(-10, 88), -90 }, { {   0.8, 12.4, -7.2 }, A.port(-10, 88), 90 },
    { { -11.2, 12.4,  8.1 }, A.stbd(-10, 88), -90 }, { { -11.2, 12.4, -8.0 }, A.port(-10, 88), 90 },
    { { -32.4,  7.5,  7.5 }, A.stbd(-10, 88), -90 }, { { -32.4,  7.5, -7.4 }, A.port(-10, 88), 90 },
    { { -95.3,  9.3, -1.4 }, A.aft(-10, 88), 180 },
}
local l = {}
for i, q in ipairs(q40) do
    l[i] = { pos = q[1], az = 29 + 2 * i, el = 30 + 2 * i, arcs = q[2], refY = q[3], barrels = 4, spacing = 0.4, length = 2.5,
             conn = string.format("POINT_GUN_BOFORS_%02d", i) .. "_%d" }
end
add(l, GT_t.WS_t.USN_40mm_Quad)

-- 18 x single 20mm (args 55..90): odd = starboard, even = port; 1-2 on the bow
local o20 = { { 102.9, 10.0 }, { 42.1, 9.5 }, { 35.6, 9.5 }, { 33.9, 9.5 }, { 8.2, 10.1 }, { -5.2, 10.1 }, { -16.7, 14.2 }, { -24.7, 14.2 }, { -60.1, 7.8 } }
local oz  = { 1.9, 1.9, 6.0, 6.4, 9.8, 10.1, 4.2, 3.4, 8.8 }
l = {}
for p = 1, 9 do
    for s = 0, 1 do
        local i = 2 * p - 1 + s
        local stb = (s == 0)
        l[#l + 1] = { pos = { o20[p][1], o20[p][2], stb and oz[p] or -oz[p] }, az = 53 + 2 * i, el = 54 + 2 * i,
                      arcs = (p == 1) and A.fwd(-10, 85) or (stb and A.stbd(-10, 85) or A.port(-10, 85)),
                      refY = (p == 1) and 0 or (stb and -90 or 90), barrels = 1, length = 1.5,
                      conn = string.format("POINT_GUN_OERLIKON_%02d", i) }
    end
end
add(l, GT_t.WS_t.USN_20mm_Single)

-- ---------------- identity & sensors ----------------
GT.Name             = "ca_68_baltimore"
GT.DisplayName      = _("[PTO43] USS Baltimore CA-68")
GT.DisplayNameShort = _("CA-68")
GT.Rate             = 7000

GT.sensor = {}
set_recursive_metatable(GT.sensor, GT_t.SN_visual)
GT.sensor.height = 32.0
GT.sensor.max_range_finding_target = 32000

GT.airWeaponDist  = 14000
GT.airFindDist    = 32000
GT.DetectionRange = GT.airFindDist
GT.ThreatRange    = GT.airWeaponDist

GT.Sensors = {
    OPTIC = { "long-range naval optics", "long-range air defence optics" },
    RADAR = { "ticonderoga search radar" },
}
GT.Singleton   = "no"
GT.mapclasskey = "P0091000067"
GT.attribute = { wsType_Navy, wsType_Ship, wsType_ArmedShip, wsType_GenericLightArmoredShip,
                 "Cruisers", "Armed Air Defence", "RADAR_BAND1_FOR_ARM", "DetectionByAWACS" }
GT.Categories = { { name = "Armed Ship" } }
add_surface_unit(GT)
