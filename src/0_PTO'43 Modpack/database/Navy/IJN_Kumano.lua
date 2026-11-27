-- ============================================================================
-- IJN Mogami / Kumano — Mogami-Class Heavy Cruiser (Imperial Japanese Navy)
-- Full DCS World Naval Unit Definition (Sneaky_Assets / Kriegsmarine & RN Architecture)
--
-- 3D MODEL & COLLISION BINDINGS (Verified from IJN_Kumano.edm & IJN_Kumano_collision.edm):
--   - Visual Shape:    IJN_Kumano.lods -> IJN_Kumano.edm
--   - Collision Shape: IJN_Kumano_collision.edm (22 watertight collision shells)
--   - Rudders:         Arg 1 (Twin rudders)
--   - Propellers:      Arg 2 (Quad screws)
--   - Main Battery:    5x Twin 203mm/50 Type 3 No. 2 (Args 13-22; POINT_GUN_203_1..5_L/R)
--   - Heavy DP/AA:     4x Twin 127mm/40 Type 89 (Args 23-30; POINT_GUN_127_1..4_L/R)
--   - Light AA:        6x Twin 25mm/60 Type 96 (Args 31-42; POINT_GUN_25_1..6_L/R)
--   - Torpedo Battery: 4x Quad 610mm Type 92 (Args 43-46; POINT_TORPEDO_1..4_1..4)
-- ============================================================================

-- Ensure Common Naval Weapon Database is Loaded (Standalone Fallback)
if not (GT_t and GT_t.WS_t and GT_t.WS_t.JP_203mm_Type3_Twin and GT_t.WS_t.JP_610mm_Type92_Torp_Quad) then
    local wp_base = current_mod_path and (current_mod_path .. "/database/Weapons/") or "database/Weapons/"
    dofile(wp_base .. "WeaponConstants.lua")
    dofile(wp_base .. "shells.lua")
    dofile(wp_base .. "torpedoes.lua")
    dofile(wp_base .. "guns.lua")
    dofile(wp_base .. "directors.lua")
end

GT = {}
GT_t.ws = 0

set_recursive_metatable(GT, GT_t.generic_ship)

-- ============================================================================
-- 1. VISUAL & PHYSICAL CHARACTERISTICS
-- ============================================================================
GT.visual = {
    shape      = "IJN_Kumano.lods",
    shape_dstr = "", -- Dynamic sinking physics (buoyancy capsize/sink)
    fire_pos   = { 0, 5, 0 },
}

GT.life              = 12500            -- Armored citadel & anti-torpedo bulges
GT.mass              = 1.5057e+007      -- 15,057 metric tons full load displacement
GT.max_velocity      = 18.0             -- 35.0 knots maximum flank speed (m/s)
GT.race_velocity     = 18.0
GT.economy_velocity  = 7.2              -- 14.0 knots cruising speed (m/s)
GT.propeller_omega_max = 350.0
GT.economy_distance  = 1.39e+007        -- ~7,500 nautical miles range
GT.race_distance     = 3.7e+006

-- Exact 3D Model Dimensions (meters, verified from IJN_Kumano.blend)
GT.shipLength        = 201.1
GT.Length            = 200.6
GT.Width             = 21.2
GT.Height            = 35.6
GT.DeckLevel         = 6.7
GT.draft             = 6.0

GT.X_nose            = 100.2
GT.X_tail            = -100.4
GT.Tail_Width        = 11.0

GT.Gamma_max         = 0.35             -- Cruiser turning heel limit
GT.Om                = 0.035
GT.speedup           = 0.14
GT.R_min             = 450.0            -- Tactical turning radius (m)
GT.distFindObstacles = 700.0
GT.RCS               = 36000
GT.IR_emission_coeff = 1.0

-- Propulsion & Rudder Animation Arguments (IJN_Kumano.edm)
GT.propellor_arg   = 2
GT.propellor_speed = 3.5
GT.rudder_arg      = 1

GT.animation_arguments = {
    water_propeller = 2,
    rudder          = 1,
    nav_lights      = -1,
    radar1_rotation = -1,
    radar2_rotation = -1,
    radar3_rotation = -1,
}

-- Posed combat display for DCS Encyclopedia 3D viewer
GT.encyclopediaAnimation = {
    args = {
        -- Main 203mm Turrets (Fwd trained starboard +30 deg, Aft trained starboard-aft)
        [13] = -0.16, [14] = 0.18,
        [15] = -0.16, [16] = 0.22,
        [17] = -0.16, [18] = 0.16,
        [19] = -0.65, [20] = 0.18,
        [21] = -0.65, [22] = 0.16,
        -- Heavy DP 127mm Mounts (trained broadside & elevated)
        [23] = -0.50, [24] = 0.25,
        [25] = -0.50, [26] = 0.25,
        [27] =  0.50, [28] = 0.25,
        [29] =  0.50, [30] = 0.25,
        -- Light AA 25mm Mounts
        [31] = -0.25, [32] = 0.20,
        [33] =  0.25, [34] = 0.20,
        [35] = -0.50, [36] = 0.20,
        [37] = -0.50, [38] = 0.20,
        [39] =  0.50, [40] = 0.20,
        [41] =  0.50, [42] = 0.20,
        -- 610mm Quadruple Torpedo Mounts (trained broadside)
        [43] = -0.50, [44] = -0.50,
        [45] =  0.50, [46] =  0.50,
    }
}

-- Funnel Smokestack Exhaust (Top of CHIMNEY)
GT.exhaust = {
    [1] = { size = 1.25, pos = { 6.05, 18.70, 0.0 } },
}

-- ============================================================================
-- 2. SENSORS & CLASSIFICATION
-- ============================================================================
GT.airWeaponDist = 14800
GT.airFindDist   = 35000

GT.DetectionRange = GT.airFindDist
GT.ThreatRange    = GT.airWeaponDist
GT.Singleton      = "no"

GT.sensor = {
    max_range_finding_target = 35000,
    min_range_finding_target = 0,
    max_alt_finding_target   = 12000,
    min_alt_finding_target   = 0,
    height                   = 22.0,
    pos                      = { 25.35, 22.0, 0.0 },
}

GT.Sensors = {
    OPTIC = { "long-range naval optics", "long-range air defence optics" },
    RADAR = { "albatros search radar" },
}

GT.mapclasskey = "P0091000067"
GT.attribute = {
    wsType_Navy,
    wsType_Ship,
    wsType_ArmedShip,
    WSTYPE_PLACEHOLDER,
    "Cruisers",
    "Armed Air Defence",
    "RADAR_BAND1_FOR_ARM",
    "RADAR_BAND2_FOR_ARM",
    "DetectionByAWACS",
}
GT.Categories = {
    { name = "Armed Ship" },
}
GT.tags = {
    "Cruiser",
}
-- Leave GT.Countries unrestricted so the ship works for Japan & CJTF coalitions
-- GT.Countries = {"Japan"}

-- ============================================================================
-- 3. DAMAGE MODEL (22 Watertight Collision Shells from IJN_Kumano_collision.edm)
-- ============================================================================
GT.DM = {
    -- Hull Sections
    { area_name = "HULL_BOW_STARBOARD",  area_arg = 70, area_life = 450, armour = {width = 0.030}, area_fire = { pos = {  67.85,  0.46,  3.97 }, size = 1.4 } },
    { area_name = "HULL_BOW_PORT",       area_arg = 71, area_life = 450, armour = {width = 0.030}, area_fire = { pos = {  67.85,  0.46, -3.97 }, size = 1.4 } },
    { area_name = "HULL_MID_STARBOARD",  area_arg = 72, area_life = 700, armour = {width = 0.100}, area_fire = { pos = {   0.50,  0.35,  4.81 }, size = 1.8 } },
    { area_name = "HULL_MID_PORT",       area_arg = 73, area_life = 700, armour = {width = 0.100}, area_fire = { pos = {   0.50,  0.35, -4.81 }, size = 1.8 } },
    { area_name = "HULL_AFT_STARBOARD",  area_arg = 74, area_life = 450, armour = {width = 0.030}, area_fire = { pos = { -67.40,  0.34,  4.62 }, size = 1.4 } },
    { area_name = "HULL_AFT_PORT",       area_arg = 75, area_life = 450, armour = {width = 0.030}, area_fire = { pos = { -67.40,  0.34, -4.62 }, size = 1.4 } },

    -- Superstructure, Bridge, Funnel & Catapults
    { area_name = "COMMAND",             area_arg = 80, area_life = 300, armour = {width = 0.050}, area_fire = { pos = {  25.35, 13.70,  0.00 }, size = 1.5 } },
    { area_name = "SUPERSTR_1",          area_arg = 81, area_life = 280, armour = {width = 0.025}, area_fire = { pos = { -23.30, 20.40,  0.00 }, size = 1.5 } },
    { area_name = "SUPERSTR_2",          area_arg = 82, area_life = 300, armour = {width = 0.025}, area_fire = { pos = {   2.20,  7.70,  0.00 }, size = 1.5 } },
    { area_name = "SUPERSTR_3",          area_arg = 83, area_life = 250, armour = {width = 0.025}, area_fire = { pos = {  17.05, 17.80,  0.00 }, size = 1.2 } },
    { area_name = "CHIMNEY",             area_arg = 84, area_life = 220, armour = {width = 0.020}, area_fire = { pos = {   6.05, 12.55,  0.00 }, size = 1.6 } },
    { area_name = "CATAPULT_PORT",       area_arg = 85, area_life = 120, armour = {width = 0.010}, area_fire = { pos = { -25.20,  8.38, -9.15 }, size = 0.8 } },
    { area_name = "CATAPULT_STARBOARD",  area_arg = 86, area_life = 120, armour = {width = 0.010}, area_fire = { pos = { -25.20,  8.38,  9.15 }, size = 0.8 } },

    -- Main 203mm Turrets
    { area_name = "TURRET_1",            area_arg = 91, area_life = 280, armour = {width = 0.025}, area_fire = { pos = {  67.84,  6.67,  0.00 }, size = 1.2 } },
    { area_name = "TURRET_2",            area_arg = 92, area_life = 280, armour = {width = 0.025}, area_fire = { pos = {  53.70,  6.58,  0.00 }, size = 1.2 } },
    { area_name = "TURRET_3",            area_arg = 93, area_life = 280, armour = {width = 0.025}, area_fire = { pos = {  44.60,  9.35,  0.00 }, size = 1.2 } },
    { area_name = "TURRET_4",            area_arg = 94, area_life = 280, armour = {width = 0.025}, area_fire = { pos = { -51.36,  9.35,  0.00 }, size = 1.2 } },
    { area_name = "TURRET_5",            area_arg = 95, area_life = 280, armour = {width = 0.025}, area_fire = { pos = { -61.94,  6.69,  0.00 }, size = 1.2 } },

    -- Secondary 127mm DP Mounts
    { area_name = "SEC_GUN_1",           area_arg = 96, area_life = 140, armour = {width = 0.015}, area_fire = { pos = {   8.03,  8.55,  9.54 }, size = 0.8 } },
    { area_name = "SEC_GUN_2",           area_arg = 97, area_life = 140, armour = {width = 0.015}, area_fire = { pos = {  -5.61,  8.55,  9.54 }, size = 0.8 } },
    { area_name = "SEC_GUN_3",           area_arg = 98, area_life = 140, armour = {width = 0.015}, area_fire = { pos = {  -5.57,  8.55, -9.54 }, size = 0.8 } },
    { area_name = "SEC_GUN_4",           area_arg = 99, area_life = 140, armour = {width = 0.015}, area_fire = { pos = {   8.08,  8.55, -9.54 }, size = 0.8 } },
}

-- ============================================================================
-- 4. WEAPON STATIONS & FIRE CONTROL DIRECTOR NETWORK
-- ============================================================================
GT.WS = {}
GT.WS.maxTargetDetectionRange = 35000
GT.WS.radar_type              = 103
GT.WS.searchRadarMaxElevation = math.rad(60)
GT.WS.searchRadarFrequencies  = {{50.0e6, 54.0e6}, {2.0e9, 2.2e9}}

local ws

-- ----------------------------------------------------------------------------
-- 4.1 Fire Control Directors (Type 94 Main & AA Directors)
-- ----------------------------------------------------------------------------

-- Forward Main Battery Director (Bridge Top)
ws = GT_t.inc_ws()
local ws_dir_main = ws
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_DCT_Type94_Main)
GT.WS[ws].pos    = { 25.35, 20.00, 0.0 }
GT.WS[ws].area   = "COMMAND"
GT.WS[ws].angles = { { math.rad(180), math.rad(-180), math.rad(-10), math.rad(85) } }

-- Aft Secondary / High-Angle AA Director (Aft Superstructure)
ws = GT_t.inc_ws()
local ws_dir_aa = ws
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_DCT_Type94_AA)
GT.WS[ws].pos    = { -23.30, 21.00, 0.0 }
GT.WS[ws].area   = "SUPERSTR_1"
GT.WS[ws].angles = { { math.rad(180), math.rad(-180), math.rad(-10), math.rad(85) } }

-- Director Failover Chains (fallback to local optics if directors are knocked out)
local main_trackers = {
    {{"self", ws_dir_main}},
    {{"self", ws_dir_aa}},
    {{"none"}},
}

local aa_trackers = {
    {{"self", ws_dir_aa}},
    {{"self", ws_dir_main}},
    {{"none"}},
}

local torp_trackers = {
    {{"self", ws_dir_main}},
    {{"none"}},
}

-- ----------------------------------------------------------------------------
-- 4.2 Main Battery: 5x Twin 203mm/50 Type 3 Turrets (Args 13-22)
-- ----------------------------------------------------------------------------
local main_turrets = {
    {
        pos  = { 66.3745, 5.4527, 0.0 },
        area = "TURRET_1",
        az   = 13, el = 14,
        ref  = math.rad(0),
        arcs = { { math.rad(145), math.rad(-145), math.rad(-5), math.rad(55) } },
        conn = "POINT_GUN_203_1",
    },
    {
        pos  = { 52.2038, 5.4527, 0.0 },
        area = "TURRET_2",
        az   = 15, el = 16,
        ref  = math.rad(0),
        arcs = { { math.rad(150), math.rad(-150), math.rad(-5), math.rad(55) } },
        conn = "POINT_GUN_203_2",
    },
    {
        pos  = { 43.1095, 8.1092, 0.0 },
        area = "TURRET_3",
        az   = 17, el = 18,
        ref  = math.rad(0),
        arcs = { { math.rad(145), math.rad(-145), math.rad(-5), math.rad(55) } },
        conn = "POINT_GUN_203_3",
    },
    {
        pos  = { -49.2294, 8.1092, 0.0 },
        area = "TURRET_4",
        az   = 19, el = 20,
        ref  = math.rad(180),
        arcs = {
            { math.rad(180), math.rad(35),   math.rad(-5), math.rad(55) },
            { math.rad(-35), math.rad(-180), math.rad(-5), math.rad(55) },
        },
        conn = "POINT_GUN_203_4",
    },
    {
        pos  = { -59.8036, 5.4527, 0.0 },
        area = "TURRET_5",
        az   = 21, el = 22,
        ref  = math.rad(180),
        arcs = {
            { math.rad(180), math.rad(35),   math.rad(-5), math.rad(55) },
            { math.rad(-35), math.rad(-180), math.rad(-5), math.rad(55) },
        },
        conn = "POINT_GUN_203_5",
    },
}

for _, cfg in ipairs(main_turrets) do
    ws = GT_t.inc_ws()
    GT.WS[ws] = {}
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_203mm_Type3_Twin)
    GT.WS[ws].pos               = cfg.pos
    GT.WS[ws].area              = cfg.area
    GT.WS[ws].drawArgument1     = cfg.az
    GT.WS[ws].drawArgument2     = cfg.el
    GT.WS[ws].reference_angle_Y = cfg.ref
    GT.WS[ws].angles            = cfg.arcs
    GT.WS[ws].LN                = { [1] = {} }
    set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_203mm_Type3_Twin.LN[1])
    -- GT.WS[ws].LN[1].depends_on_unit = main_trackers
    GT.WS[ws].LN[1].BR = {
        { connector_name = cfg.conn .. "_L" },
        { connector_name = cfg.conn .. "_R" },
    }
end

-- ----------------------------------------------------------------------------
-- 4.3 Heavy Dual-Purpose Battery: 4x Twin 127mm/40 Type 89 (Args 23-30)
-- ----------------------------------------------------------------------------
local sec_mounts = {
    -- Mount 1: Starboard Forward
    {
        pos  = { 8.0555, 6.7706, 8.6913 },
        area = "SEC_GUN_1",
        az   = 23, el = 24,
        ref  = math.rad(-90),
        arc  = { math.rad(-10), math.rad(-170), math.rad(-8), math.rad(90) },
        conn = "POINT_GUN_127_1",
    },
    -- Mount 2: Starboard Aft
    {
        pos  = { -5.5909, 6.7706, 8.6913 },
        area = "SEC_GUN_2",
        az   = 25, el = 26,
        ref  = math.rad(-90),
        arc  = { math.rad(-10), math.rad(-170), math.rad(-8), math.rad(90) },
        conn = "POINT_GUN_127_2",
    },
    -- Mount 3: Port Aft
    {
        pos  = { -5.5909, 6.7706, -8.6913 },
        area = "SEC_GUN_3",
        az   = 27, el = 28,
        ref  = math.rad(90),
        arc  = { math.rad(170), math.rad(10), math.rad(-8), math.rad(90) },
        conn = "POINT_GUN_127_3",
    },
    -- Mount 4: Port Forward
    {
        pos  = { 8.0555, 6.7706, -8.6913 },
        area = "SEC_GUN_4",
        az   = 29, el = 30,
        ref  = math.rad(90),
        arc  = { math.rad(170), math.rad(10), math.rad(-8), math.rad(90) },
        conn = "POINT_GUN_127_4",
    },
}

for _, cfg in ipairs(sec_mounts) do
    ws = GT_t.inc_ws()
    GT.WS[ws] = {}
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_127mm_Type89_Twin)
    GT.WS[ws].pos               = cfg.pos
    GT.WS[ws].area              = cfg.area
    GT.WS[ws].drawArgument1     = cfg.az
    GT.WS[ws].drawArgument2     = cfg.el
    GT.WS[ws].reference_angle_Y = cfg.ref
    GT.WS[ws].angles            = { cfg.arc }
    GT.WS[ws].LN                = { [1] = {} }
    set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_127mm_Type89_Twin.LN[1])
    -- GT.WS[ws].LN[1].depends_on_unit = aa_trackers
    GT.WS[ws].LN[1].BR = {
        { connector_name = cfg.conn .. "_L" },
        { connector_name = cfg.conn .. "_R" },
    }
end

-- ----------------------------------------------------------------------------
-- 4.4 Light AA Battery: 6x Twin 25mm/60 Type 96 Mounts (Args 31-42)
-- ----------------------------------------------------------------------------
local aa25_mounts = {
    -- Mount 1: Starboard Bridge Platform
    {
        pos  = { 30.7502, 11.2412, 1.8741 },
        area = "COMMAND",
        az   = 31, el = 32,
        ref  = math.rad(0),
        arc  = { math.rad(45), math.rad(-155), math.rad(-10), math.rad(85) },
        conn = "POINT_GUN_25_1",
    },
    -- Mount 2: Port Bridge Platform
    {
        pos  = { 30.7502, 11.2412, -1.8741 },
        area = "COMMAND",
        az   = 33, el = 34,
        ref  = math.rad(0),
        arc  = { math.rad(155), math.rad(-45), math.rad(-10), math.rad(85) },
        conn = "POINT_GUN_25_2",
    },
    -- Mount 3: Starboard Midships Forward
    {
        pos  = { 2.9902, 10.1778, 4.6831 },
        area = "SUPERSTR_2",
        az   = 35, el = 36,
        ref  = math.rad(-90),
        arc  = { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) },
        conn = "POINT_GUN_25_3",
    },
    -- Mount 4: Starboard Midships Aft
    {
        pos  = { -5.5253, 10.1778, 4.2331 },
        area = "SUPERSTR_2",
        az   = 37, el = 38,
        ref  = math.rad(-90),
        arc  = { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) },
        conn = "POINT_GUN_25_4",
    },
    -- Mount 5: Port Midships Aft
    {
        pos  = { -5.5253, 10.1778, -4.2331 },
        area = "SUPERSTR_2",
        az   = 39, el = 40,
        ref  = math.rad(90),
        arc  = { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) },
        conn = "POINT_GUN_25_5",
    },
    -- Mount 6: Port Midships Forward
    {
        pos  = { 2.9902, 10.1778, -4.6831 },
        area = "SUPERSTR_2",
        az   = 41, el = 42,
        ref  = math.rad(90),
        arc  = { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) },
        conn = "POINT_GUN_25_6",
    },
}

for _, cfg in ipairs(aa25_mounts) do
    ws = GT_t.inc_ws()
    GT.WS[ws] = {}
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Twin)
    GT.WS[ws].pos               = cfg.pos
    GT.WS[ws].area              = cfg.area
    GT.WS[ws].drawArgument1     = cfg.az
    GT.WS[ws].drawArgument2     = cfg.el
    GT.WS[ws].reference_angle_Y = cfg.ref
    GT.WS[ws].angles            = { cfg.arc }
    GT.WS[ws].LN                = { [1] = {} }
    set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Twin.LN[1])
    GT.WS[ws].LN[1].BR = {
        { connector_name = cfg.conn .. "_L" },
        { connector_name = cfg.conn .. "_R" },
    }
end

-- ----------------------------------------------------------------------------
-- 4.5 Torpedo Battery: 4x Quadruple 610mm Type 92 Torpedo Mounts (Args 43-46)
-- ----------------------------------------------------------------------------
local torp_mounts = {
    -- Mount 1: Starboard Forward
    {
        pos  = { -12.5508, 4.4717, 6.9379 },
        area = "HULL_MID_STARBOARD",
        az   = 43,
        ref  = math.rad(-90),
        arc  = { math.rad(-35), math.rad(-145), math.rad(-5), math.rad(25) },
        conn = "POINT_TORPEDO_1",
    },
    -- Mount 2: Starboard Aft
    {
        pos  = { -32.4110, 4.4717, 6.9379 },
        area = "HULL_MID_STARBOARD",
        az   = 44,
        ref  = math.rad(-90),
        arc  = { math.rad(-35), math.rad(-145), math.rad(-5), math.rad(25) },
        conn = "POINT_TORPEDO_2",
    },
    -- Mount 3: Port Aft
    {
        pos  = { -32.4110, 4.4717, -6.9378 },
        area = "HULL_MID_PORT",
        az   = 45,
        ref  = math.rad(90),
        arc  = { math.rad(145), math.rad(35), math.rad(-5), math.rad(25) },
        conn = "POINT_TORPEDO_3",
    },
    -- Mount 4: Port Forward
    {
        pos  = { -12.5508, 4.4717, -6.9378 },
        area = "HULL_MID_PORT",
        az   = 46,
        ref  = math.rad(90),
        arc  = { math.rad(145), math.rad(35), math.rad(-5), math.rad(25) },
        conn = "POINT_TORPEDO_4",
    },
}

local ENABLE_TORPEDOES = false -- Set true to re-enable 4x Quad 610mm Type 92 torpedo mounts
if ENABLE_TORPEDOES then
    for _, tm in ipairs(torp_mounts) do
        ws = GT_t.inc_ws()
        GT.WS[ws] = {}
        set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_610mm_Type92_Torp_Quad)
        GT.WS[ws].pos               = tm.pos
        GT.WS[ws].area              = tm.area
        GT.WS[ws].drawArgument1     = tm.az
        GT.WS[ws].drawArgument2     = -1
        GT.WS[ws].reference_angle_Y = tm.ref
        GT.WS[ws].angles            = { tm.arc }
        GT.WS[ws].LN                = { [1] = {} }
        set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_610mm_Type92_Torp_Quad.LN[1])
        GT.WS[ws].LN[1].BR = {
            { connector_name = tm.conn .. "_1" },
            { connector_name = tm.conn .. "_2" },
            { connector_name = tm.conn .. "_3" },
            { connector_name = tm.conn .. "_4" },
        }
    end
end

-- ============================================================================
-- 5. UNIT IDENTIFICATION & SHAPE TABLE REGISTRATION
-- ============================================================================
GT.Name             = "IJN_Kumano"
GT.DisplayName      = _("[PTO43] IJN Cruiser Kumano (CA)")
GT.DisplayNameShort = _("Kumano")
GT.Rate             = 4000

GT.shape_table_data = {
    {
        file        = GT.visual.shape,
        name        = GT.visual.shape,
        username    = GT.Name,
        desrt       = GT.visual.shape_dstr,
        classname   = "lLandShip",
        positioning = "BYNORMAL",
    },
}

return GT
