-- ============================================================================
-- IJN Zuiho (CVL) — Zuiho-Class Light Aircraft Carrier (1943-1944 AA Fit)
-- Integrated for [PTO'43] Modpack (Sneaky_Assets Weapon & Director Architecture)
--
-- 3D MODEL & COLLISION BINDINGS (ZUIHO_R_1_2_A.blend -> ijn_zuiho.lods):
--   - Flight deck top y = 11.91 m (model raised 1.0 m out of the water on 2026-11-20; every y below is +1), x = -108.07 to +72.02
--   - Arresting wires: POINT_TROS_01_01 .. POINT_TROS_06_02 (Arg 150 raise/lower, Args 400..405 vis)
--   - Radar: Arg 182 | Propellers: Args 280/281
--   - Weapons: CENTER_TOWER_01..27, POINT_GUN_01..27, Args 200..253
--   - Damage: 12 collision shells in ZUIHO_collision.edm (args 300..311)
-- ============================================================================

if not (GT_t and GT_t.WS_t and GT_t.WS_t.JP_127mm_Type89_Twin and GT_t.WS_t.JP_25mm_Type96_Triple) then
    local wp_base = current_mod_path and (current_mod_path .. "/database/Weapons/") or "database/Weapons/"
    dofile(wp_base .. "WeaponConstants.lua")
    dofile(wp_base .. "shells.lua")
    dofile(wp_base .. "guns.lua")
    dofile(wp_base .. "directors.lua")
end

GT = {}
GT_t.ws = 0

set_recursive_metatable(GT, GT_t.generic_ship)

-- ==============================================================================
-- 1. VISUALS & ANIMATIONS
-- ==============================================================================
GT.visual = {
    shape      = "ijn_zuiho",
    shape_dstr = "ijn_zuiho",
    fire_pos   = { 0, 7, 0 },
}

GT.animation_arguments.radar1_rotation = 182
GT.radar1_period = 4.0
GT.animation_arguments.water_propeller = 280
GT.animation_arguments.arresting_wires = {400, 401, 402, 403, 404, 405}
GT.animation_arguments.flight_deck_fences = 150

-- Funnel smoke (starboard curved funnel, mouth at x=-11.2 / y=7.4 / z=+11.9 in ship coordinates).
-- Position measured from the funnel geometry in ZUIHO_R_1_2_A.blend (Superstructure_Main).
GT.exhaust = {
    [1] = { size = 1.0, pos = { -11.2, 7.4, 11.9 } },   -- halved from 2.0 (2026-11-25)
}

-- ==============================================================================
-- 2. SHIP DYNAMICS & FLIGHT DECK
-- ==============================================================================
GT.life              = 4200
GT.Rate              = 3500
GT.mass              = 1.42e+007
GT.max_velocity      = 14.40            -- 28.0 knots
GT.race_velocity     = 13.89            -- 27.0 knots
GT.economy_velocity  = 9.26             -- 18.0 knots
GT.economy_distance  = 1.445e+007       -- 7,800 nmi
GT.race_distance     = 4.5e+006

GT.shipLength        = 199.9
GT.Length            = 199.9
GT.Width             = 34.0
GT.Height            = 23.1
GT.X_nose            = 88.9
GT.X_tail            = -111.0
GT.Tail_Width        = 16.0

GT.Gamma_max         = 0.35
GT.Om                = 0.05
GT.speedup           = 0.12
GT.R_min             = 420.0
GT.distFindObstacles = 800.0

-- Deck & Landing Point (touchdown aim point on wire 3, painted deck centerline)
GT.DeckLevel         = 11.91
GT.Landing_Point     = { -75.60, 11.96, 0.00 }
GT.LSOPosition       = { -105.0, 12.2, -13.0, 0.0, 0.0 }

-- Arresting gears (6 wires, POINT_TROS_01..06) are defined in Scripts/ijn_zuiho_RunwaysAndRoutes.lua
GT.TACAN             = false
GT.ICLS              = false
GT.LRLS              = false

GT.Plane_Num_        = 30
GT.Helicopter_Num_   = 0
GT.airWeaponDist     = 14800
GT.airFindDist       = 35000
GT.DetectionRange    = GT.airFindDist
GT.ThreatRange       = GT.airWeaponDist

GT.driverViewConnectorName = { "DRIVER_POINT", offset = { 0.0, 0.0, 0.0 } }
GT.driverCockpit           = "DriverCockpit/DriverCockpitWithIR"

-- ==============================================================================
-- 3. DAMAGE MODEL (12 Watertight Collision Shells from ZUIHO_collision.edm)
-- ==============================================================================
GT.DM = {
    -- Hull
    { area_name = "HULL_BOW_PORT",    area_arg = 300, area_life = 350, armour = {width = 0.025}, area_fire = { pos = {  62.0,  3.5, -5.0 }, size = 1.0 } },
    { area_name = "HULL_BOW_STB",     area_arg = 301, area_life = 350, armour = {width = 0.025}, area_fire = { pos = {  62.0,  3.5,  5.0 }, size = 1.0 } },
    { area_name = "HULL_CENTER_PORT", area_arg = 302, area_life = 600, armour = {width = 0.050}, area_fire = { pos = {   0.0,  3.5, -8.0 }, size = 1.4 } },
    { area_name = "HULL_CENTER_STB",  area_arg = 303, area_life = 600, armour = {width = 0.050}, area_fire = { pos = {   0.0,  3.5,  8.0 }, size = 1.4 } },
    { area_name = "HULL_STERN_PORT",  area_arg = 304, area_life = 350, armour = {width = 0.025}, area_fire = { pos = { -70.0,  3.5, -6.0 }, size = 1.0 } },
    { area_name = "HULL_STERN_STB",   area_arg = 305, area_life = 350, armour = {width = 0.025}, area_fire = { pos = { -70.0,  3.5,  6.0 }, size = 1.0 } },
    -- Flight Deck & Hangar
    { area_name = "DECK_BOW_PORT",    area_arg = 306, area_life = 280, armour = {width = 0.020}, area_fire = { pos = {  50.0, 11.9, -4.5 }, size = 1.0 } },
    { area_name = "DECK_BOW_STB",     area_arg = 307, area_life = 280, armour = {width = 0.020}, area_fire = { pos = {  50.0, 11.9,  4.0 }, size = 1.0 } },
    { area_name = "DECK_CENTER_PORT", area_arg = 308, area_life = 320, armour = {width = 0.020}, area_fire = { pos = {   0.0, 11.9, -5.5 }, size = 1.2 } },
    { area_name = "DECK_CENTER_STB",  area_arg = 309, area_life = 320, armour = {width = 0.020}, area_fire = { pos = {   0.0, 11.9,  5.0 }, size = 1.2 } },
    { area_name = "DECK_STERN_PORT",  area_arg = 310, area_life = 280, armour = {width = 0.020}, area_fire = { pos = { -65.0, 11.9, -5.5 }, size = 1.0 } },
    { area_name = "DECK_STERN_STB",   area_arg = 311, area_life = 280, armour = {width = 0.020}, area_fire = { pos = { -65.0, 11.9,  5.0 }, size = 1.0 } },
}

-- ==============================================================================
-- 4. WEAPON STATIONS & FIRE CONTROL DIRECTORS
-- ==============================================================================
GT.WS = {}
GT.WS.maxTargetDetectionRange = 35000
GT.WS.radar_type              = 103
GT.WS.searchRadarMaxElevation = math.rad(60)
GT.WS.searchRadarFrequencies  = {{50.0e6, 54.0e6}, {2.0e9, 2.2e9}}

local ws

-- Starboard & Port Type 94 AA Fire Control Directors
ws = GT_t.inc_ws()
local ws_dir_stbd = ws
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_DCT_Type94_AA)
GT.WS[ws].pos    = { 20.0, 13.0, 11.0 }
GT.WS[ws].area   = "DECK_CENTER_STB"
GT.WS[ws].angles = { { math.rad(180), math.rad(-180), math.rad(-10), math.rad(85) } }

ws = GT_t.inc_ws()
local ws_dir_port = ws
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_DCT_Type94_AA)
GT.WS[ws].pos    = { 20.0, 13.0, -11.0 }
GT.WS[ws].area   = "DECK_CENTER_PORT"
GT.WS[ws].angles = { { math.rad(180), math.rad(-180), math.rad(-10), math.rad(85) } }

local aa_trackers_stbd = {
    {{"self", ws_dir_stbd}},
    {{"self", ws_dir_port}},
    {{"none"}},
}

local aa_trackers_port = {
    {{"self", ws_dir_port}},
    {{"self", ws_dir_stbd}},
    {{"none"}},
}

-- 4x Twin 127mm/40 Type 89 DP
local type89_mounts = {
    {area = "DECK_CENTER_STB",  pos = {  10.320, 8.290,  12.790}, arg1 = 200, arg2 = 201, refY = -90.0, sectors = {{ -10, -170}}, conns = {"POINT_GUN_01_1", "POINT_GUN_01_2"}},
    {area = "DECK_CENTER_PORT", pos = {  10.653, 8.290, -13.280}, arg1 = 202, arg2 = 203, refY =  90.0, sectors = {{ 170,   10}}, conns = {"POINT_GUN_02_1", "POINT_GUN_02_2"}},
    {area = "DECK_STERN_STB",   pos = { -74.152, 7.900,  13.250}, arg1 = 204, arg2 = 205, refY = -90.0, sectors = {{ -10, -170}}, conns = {"POINT_GUN_03_1", "POINT_GUN_03_2"}},
    {area = "DECK_STERN_PORT",  pos = { -74.428, 7.890, -13.400}, arg1 = 206, arg2 = 207, refY =  90.0, sectors = {{ 170,   10}}, conns = {"POINT_GUN_04_1", "POINT_GUN_04_2"}},
}

-- 14x Triple 25mm/60 Type 96
local type96_triple_mounts = {
    {area = "HULL_BOW_PORT",    pos = {  71.470, 5.830,  -2.600}, arg1 = 208, arg2 = 209, refY =   0.0, sectors = {{  85,  -85}},               conns = {"POINT_GUN_05_1", "POINT_GUN_05_2", "POINT_GUN_05_3"}},
    {area = "HULL_BOW_STB",     pos = {  70.880, 5.800,   2.430}, arg1 = 210, arg2 = 211, refY =   0.0, sectors = {{  85,  -85}},               conns = {"POINT_GUN_06_1", "POINT_GUN_06_2", "POINT_GUN_06_3"}},
    {area = "DECK_CENTER_STB",  pos = {  20.500, 7.970,  10.800}, arg1 = 212, arg2 = 213, refY = -90.0, sectors = {{ -10, -170}},               conns = {"POINT_GUN_07_1", "POINT_GUN_07_2", "POINT_GUN_07_3"}},
    {area = "DECK_CENTER_PORT", pos = {  20.500, 7.970, -11.600}, arg1 = 214, arg2 = 215, refY =  90.0, sectors = {{ 170,   10}},               conns = {"POINT_GUN_08_1", "POINT_GUN_08_2", "POINT_GUN_08_3"}},
    {area = "DECK_CENTER_STB",  pos = { -21.000, 9.130,  11.500}, arg1 = 216, arg2 = 217, refY = -90.0, sectors = {{ -10, -170}},               conns = {"POINT_GUN_09_1", "POINT_GUN_09_2", "POINT_GUN_09_3"}},
    {area = "DECK_CENTER_PORT", pos = { -29.150, 9.130, -12.910}, arg1 = 218, arg2 = 219, refY =  90.0, sectors = {{ 170,   10}},               conns = {"POINT_GUN_10_1", "POINT_GUN_10_2", "POINT_GUN_10_3"}},
    {area = "DECK_CENTER_STB",  pos = { -34.800, 9.130,  11.500}, arg1 = 220, arg2 = 221, refY = -90.0, sectors = {{ -10, -170}},               conns = {"POINT_GUN_11_1", "POINT_GUN_11_2", "POINT_GUN_11_3"}},
    {area = "DECK_STERN_PORT",  pos = { -36.771, 9.130, -12.910}, arg1 = 222, arg2 = 223, refY =  90.0, sectors = {{ 170,   10}},               conns = {"POINT_GUN_12_1", "POINT_GUN_12_2", "POINT_GUN_12_3"}},
    {area = "DECK_STERN_STB",   pos = { -40.482, 9.130,  11.540}, arg1 = 224, arg2 = 225, refY = -90.0, sectors = {{ -10, -170}},               conns = {"POINT_GUN_13_1", "POINT_GUN_13_2", "POINT_GUN_13_3"}},
    {area = "DECK_STERN_PORT",  pos = { -42.700, 9.130, -12.910}, arg1 = 226, arg2 = 227, refY =  90.0, sectors = {{ 170,   10}},               conns = {"POINT_GUN_14_1", "POINT_GUN_14_2", "POINT_GUN_14_3"}},
    {area = "DECK_STERN_STB",   pos = { -52.281, 9.130,  11.500}, arg1 = 228, arg2 = 229, refY = -90.0, sectors = {{ -10, -170}},               conns = {"POINT_GUN_15_1", "POINT_GUN_15_2", "POINT_GUN_15_3"}},
    {area = "DECK_STERN_STB",   pos = { -58.100, 9.130,  11.500}, arg1 = 230, arg2 = 231, refY = -90.0, sectors = {{ -10, -170}},               conns = {"POINT_GUN_16_1", "POINT_GUN_16_2", "POINT_GUN_16_3"}},
    {area = "DECK_STERN_STB",   pos = { -66.500, 9.130,  11.500}, arg1 = 232, arg2 = 233, refY = -90.0, sectors = {{ -10, -170}},               conns = {"POINT_GUN_17_1", "POINT_GUN_17_2", "POINT_GUN_17_3"}},
    {area = "HULL_STERN_PORT",  pos = {-105.050, 4.970,  -0.080}, arg1 = 234, arg2 = 235, refY = 180.0, sectors = {{ 180,   95}, {-95, -180}}, conns = {"POINT_GUN_18_1", "POINT_GUN_18_2", "POINT_GUN_18_3"}},
}

-- 9x Single 25mm/60 Type 96
local type96_single_mounts = {
    {area = "HULL_BOW_PORT",    pos = {  82.000, 6.390,   0.000}, arg1 = 236, arg2 = 237, refY =   0.0, sectors = {{  95,  -95}},               conns = {"POINT_GUN_19_1"}},
    {area = "HULL_BOW_STB",     pos = {  77.000, 6.110,   0.000}, arg1 = 238, arg2 = 239, refY =   0.0, sectors = {{  95,  -95}},               conns = {"POINT_GUN_20_1"}},
    {area = "DECK_STERN_STB",   pos = { -87.274, 10.597,  11.352}, arg1 = 240, arg2 = 241, refY = -90.0, sectors = {{ -10, -180}},               conns = {"POINT_GUN_21_1"}},
    {area = "DECK_STERN_PORT",  pos = { -87.274, 10.597, -12.379}, arg1 = 242, arg2 = 243, refY =  90.0, sectors = {{ 180,   10}},               conns = {"POINT_GUN_22_1"}},
    {area = "DECK_STERN_STB",   pos = { -91.443, 10.597,  11.109}, arg1 = 244, arg2 = 245, refY = -90.0, sectors = {{ -10, -180}},               conns = {"POINT_GUN_23_1"}},
    {area = "DECK_STERN_PORT",  pos = { -91.443, 10.597, -12.379}, arg1 = 246, arg2 = 247, refY =  90.0, sectors = {{ 180,   10}},               conns = {"POINT_GUN_24_1"}},
    {area = "HULL_STERN_STB",   pos = {-102.000, 4.970,   2.200}, arg1 = 248, arg2 = 249, refY = 180.0, sectors = {{ 180,   95}, {-95, -180}}, conns = {"POINT_GUN_25_1"}},
    {area = "HULL_STERN_PORT",  pos = {-102.000, 4.970,  -2.200}, arg1 = 250, arg2 = 251, refY = 180.0, sectors = {{ 180,   95}, {-95, -180}}, conns = {"POINT_GUN_26_1"}},
    {area = "HULL_STERN_STB",   pos = {-108.600, 4.970,   1.600}, arg1 = 252, arg2 = 253, refY = 180.0, sectors = {{ 180,   95}, {-95, -180}}, conns = {"POINT_GUN_27_1"}},
}

local function shallow_copy_tbl(src)
    local dst = {}
    for k, v in pairs(src) do
        if type(v) == "table" then
            dst[k] = shallow_copy_tbl(v)
        else
            dst[k] = v
        end
    end
    return dst
end

-- EDM rig (ZUIHO_R_1_3, 2026-11-25):
--   traverse arg 0 = bow, +1 = +180 deg (CCW, port); elevation arg 0 = horizontal, +1 = +90 deg
--   recoil arg = 320 + gun index (POINT_GUN_<nn>_k), 321..347
local RECOIL_ARG_BASE = 320

local function add_mounts(list, proto, el_min, el_max)
    for _, m in ipairs(list) do
        ws = GT_t.inc_ws()
        GT.WS[ws] = {}
        set_recursive_metatable(GT.WS[ws], proto)
        GT.WS[ws].area              = m.area
        GT.WS[ws].pos               = m.pos
        GT.WS[ws].drawArgument1     = m.arg1
        GT.WS[ws].drawArgument2     = m.arg2
        GT.WS[ws].reference_angle_Y = math.rad(m.refY)
        GT.WS[ws].angles            = {}
        for _, sec in ipairs(m.sectors) do
            table.insert(GT.WS[ws].angles, { math.rad(sec[1]), math.rad(sec[2]), math.rad(el_min), math.rad(el_max) })
        end
        -- Inherit the launcher from the template (do NOT copy it): the template's LN[1].sensor is an empty
        -- table whose data comes from a metatable (GT_t.WSN_t[...]); a pairs() copy dropped it, leaving the
        -- guns with no sensor, so they never fired (fixed 2026-11-25).
        GT.WS[ws].LN = { [1] = {} }
        set_recursive_metatable(GT.WS[ws].LN[1], proto.LN[1])
        -- if m.trackers then
        --     GT.WS[ws].LN[1].depends_on_unit = m.trackers
        -- end
        -- Shells leave from the muzzle connectors; each barrel recoils (EDM ZUIHO_R_1_3)
        GT.WS[ws].LN[1].connectorFire = true
        GT.WS[ws].LN[1].BR = {}
        for b, cname in ipairs(m.conns) do
            local gun_n = tonumber(cname:match("^POINT_GUN_(%d+)_"))
            GT.WS[ws].LN[1].BR[b] = {
                connector_name = cname,
                recoilArgument = RECOIL_ARG_BASE + gun_n,
                recoilTime     = (gun_n <= 4) and 0.5 or 0.1,
            }
        end
    end
end

add_mounts(type89_mounts,        GT_t.WS_t.JP_127mm_Type89_Twin,   -8, 90)
add_mounts(type96_triple_mounts, GT_t.WS_t.JP_25mm_Type96_Triple, -10, 85)
add_mounts(type96_single_mounts, GT_t.WS_t.JP_25mm_Type96_Single, -10, 85)

-- ==============================================================================
-- 5. CLASSIFICATION, SENSORS & RUNWAYS
-- ==============================================================================
GT.Name             = "ijn_zuiho"
GT.DisplayName      = _("[PTO43] IJN Zuiho (CVL)")
GT.DisplayNameShort = _("Zuiho")

GT.Sensors = {
    OPTIC = { "long-range naval optics", "long-range air defence optics" },
    RADAR = { "albatros search radar" },
}

GT.sensor = {
    max_range_finding_target = 35000,
    min_range_finding_target = 0,
    max_alt_finding_target   = 12000,
    min_alt_finding_target   = 0,
    height                   = 15.5,
    pos                      = { 20.0, 15.5, 0.0 },
}

GT.Singleton   = "no"
GT.mapclasskey = "P0091000065"

GT.attribute = {
    wsType_Navy, wsType_Ship, wsType_AirCarrier, WSTYPE_PLACEHOLDER,
    "Aircraft Carriers",
    "Arresting Gear",
    "catapult",
    "ski_jump",
    "Armed Air Defence",
    "RADAR_BAND1_FOR_ARM",
    "RADAR_BAND2_FOR_ARM",
    "DetectionByAWACS",
}

GT.Categories = {
    { name = "AircraftCarrier" },
    { name = "AircraftCarrier With Catapult" },
    { name = "AircraftCarrier With Tramplin" },
    { name = "Armed Ship" },
    { name = "AircraftCarrier With Arresting Gear" },
}

GT.tags = { "Carrier" }

GT.shape_table_data = {
    {
        file        = GT.visual.shape,
        username    = GT.Name,
        desrt       = GT.visual.shape_dstr,
        classname   = "lLandShip",
        positioning = "BYNORMAL",
    },
    {
        name  = GT.visual.shape_dstr,
        file  = GT.visual.shape_dstr,
    },
}

dofile(current_mod_path .. "/Scripts/ijn_zuiho_RunwaysAndRoutes.lua")

return GT
