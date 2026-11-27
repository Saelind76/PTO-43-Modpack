-- ==============================================================================
-- IJN AIRCRAFT CARRIER ZUIKAKU (PTO '43 MODPACK)  -- v2 rectificado
-- ==============================================================================

local DeckLevel = 14.14   -- altura unica de cubierta (medida en el modelo)

-- Shells declared cleanly in database/Weapons/IJN_community_ammo.lua
-- ------------------------------------------------------------------------------
-- 2. SHIP HULL & CORE ATTRIBUTES
-- ------------------------------------------------------------------------------

GT = {}
GT_t.ws = 0
set_recursive_metatable(GT, GT_t.generic_ship)

GT.Name = "Zuikaku_CV"
GT.DisplayName = _("[PTO43] Zuikaku CV")
GT.DisplayNameShort = _("Zuik.")
GT.Singleton = "yes"
GT.life = 5600                   -- el loader lo recalcula (32.5 kt -> 5122)
GT.ship_class = "CV"
GT.category = "AircraftCarrier"
GT.mapclasskey = "P0091000065"

GT.visual = {
    shape = "Zuikaku_CV",
    shape_dstr = "",
}

-- Definicion de malla sin entradas vacias que rompan db_units.lua
GT.shape_table_data = {
    {
        file        = GT.visual.shape,
        username    = GT.Name,
        desrt       = GT.visual.shape_dstr,
        classname   = "lLandShip",   -- VERIFICAR: el loader usa lLandVehicle
        positioning = "BYNORMAL",
    },
}

GT.attribute = {
    wsType_Navy, wsType_Ship, wsType_AirCarrier, WSTYPE_PLACEHOLDER,
    "Aircraft Carriers",
    "Arresting Gear",
	"ski_jump",
    "RADAR_BAND1_FOR_ARM",
    "RADAR_BAND2_FOR_ARM",
    "NO_SAM",
}

GT.Categories = {
    { name = "AircraftCarrier" },
    { name = "Armed Ship" },
}

GT.tags = { "Carrier" }
GT.Countries = { "Japan" }

-- ==============================================================================
-- 4. DAMAGE MODEL (Historical compartmentalized ship sections)
-- Total Survivability: 5600 HP (Heavy Fleet Carrier Tier parity)
-- Fire particle emitters (area_fire.pos) restricted to the flight deck level 
-- (Y = 14.2m), exposed bow/stern, and the command island.
-- ==============================================================================

GT.DM = {
    -- --------------------------------------------------------------------------
    -- 1. HULL SECTIONS (3,920 HP / 70% OF SHIP TOTAL)
    -- --------------------------------------------------------------------------
    -- Bow (1,120 HP) - Fires exposed on the forward deck
    { area_name = "HULL_BOW_PORT",    area_arg = 71, area_life = 560, area_fire = { pos = { 100.0, 14.2, -6.0}, size = 2.0} },
    { area_name = "HULL_BOW_STB",     area_arg = 72, area_life = 560, area_fire = { pos = { 100.0, 14.2,  6.0}, size = 2.0} },

    -- Center (1,680 HP) - Fires restricted to deck surface (Y = 14.2)
    { area_name = "HULL_CENTER_PORT", area_arg = 73, area_life = 840, area_fire = { pos = {   0.0, 14.2, -8.0}, size = 2.5} },
    { area_name = "HULL_CENTER_STB",  area_arg = 74, area_life = 840, area_fire = { pos = {   0.0, 14.2,  8.0}, size = 2.5} },

    -- Stern (1,120 HP) - Fires exposed on the aft deck
    { area_name = "HULL_STERN_PORT",  area_arg = 75, area_life = 560, area_fire = { pos = {-100.0, 14.2, -6.0}, size = 2.0} },
    { area_name = "HULL_STERN_STB",   area_arg = 76, area_life = 560, area_fire = { pos = {-100.0, 14.2,  6.0}, size = 2.0} },

    -- --------------------------------------------------------------------------
    -- 2. FLIGHT DECK SECTIONS (1,344 HP / 24% OF SHIP TOTAL)
    -- Vulnerable to dive bombers / HE fragmentation
    -- --------------------------------------------------------------------------
    -- Forward Deck
    { area_name = "DECK_BOW_PORT",    area_arg = 77, area_life = 196, area_fire = { pos = {  80.0, 14.2, -8.0}, size = 1.8} },
    { area_name = "DECK_BOW_STB",     area_arg = 78, area_life = 196, area_fire = { pos = {  80.0, 14.2,  8.0}, size = 1.8} },

    -- Center Deck
    { area_name = "DECK_CENTER_PORT", area_arg = 79, area_life = 280, area_fire = { pos = { -15.0, 14.2,-10.0}, size = 2.5} },
    { area_name = "DECK_CENTER_STB",  area_arg = 80, area_life = 280, area_fire = { pos = { -15.0, 14.2, 10.0}, size = 2.5} },

    -- Aft Deck
    { area_name = "DECK_STERN_PORT",  area_arg = 81, area_life = 196, area_fire = { pos = { -80.0, 14.2, -8.0}, size = 1.8} },
    { area_name = "DECK_STERN_STB",   area_arg = 82, area_life = 196, area_fire = { pos = { -80.0, 14.2,  8.0}, size = 1.8} },

    -- --------------------------------------------------------------------------
    -- 3. ISLAND & SUPERSTRUCTURE (336 HP / 6% OF SHIP TOTAL)
    -- --------------------------------------------------------------------------
    -- Island structure located on the starboard beam
    { area_name = "COMMAND_ISLE",     area_arg = 83, area_life = 336, area_fire = { pos = {  15.0, 22.0, 15.0}, size = 2.0} },
}

GT.mass = 3.25e+007              -- ~32,500 t carga completa
GT.max_velocity = 15.6           -- 30.3 kn
GT.race_velocity = 14.9          -- 29 kn
GT.economy_velocity = 9.3        -- 18 kn
GT.economy_distance = 1.33e+007  -- 7,200 nm
GT.race_distance = 3.7e+006      -- 2,000 nm
GT.Length = 257.5
GT.shipLength = 257.5
GT.Width = 38.68                 -- VERIFICAR contra Dimensions Y en Blender (parece alto)
GT.Height = 39.25
GT.DeckLevel = DeckLevel
GT.X_nose = 122.0                -- medido a ojo en la planta; verificar con el bounding box
GT.X_tail = -135.4               -- idem (largo total del modelo 257.36)
GT.Tail_Width = 20
GT.R_min = 901.25
GT.Om = 0.0175
GT.speedup = 0.0350
GT.Gamma_max = 0.30
GT.distFindObstacles = 412.0
GT.RCS = 1500000
GT.TACAN = false
GT.numParking = 9                -- VERIFICAR: copiar el criterio de un Lua que ya funcione
GT.Plane_Num_ = 72
GT.Helicopter_Num_ = 0

-- SENSORS
GT.airWeaponDist = 5000
GT.airFindDist = 30000
GT.DetectionRange = GT.airFindDist
GT.ThreatRange = GT.airWeaponDist
GT.Rate = 5000

GT.Sensors = {
    OPTIC = { "long-range naval optics" },
    RADAR = { "IJN Type 13" },
}

GT.sensor = {
    max_range_finding_target = GT.airFindDist,
    min_range_finding_target = 0,
    max_alt_finding_target   = 8000,
    min_alt_finding_target   = 0,
    pos = { 0.0, 22.0, 0.0 },
}

GT.animation_arguments = {}
GT.animation_arguments.arresting_wires = {101, 102, 103, 104, 105, 106}

-- Altura de los cables relativa a la cubierta (antes 14.40 con cubierta 14.14 = +0.26)
local WIRE_Y = DeckLevel + 0.26
GT.ArrestingGears = {
    { Left = { pos = {-74.13, WIRE_Y, -11.64} }, Right = { pos = {-74.13, WIRE_Y,  9.74} } },
    { Left = { pos = {-63.79, WIRE_Y, -11.65} }, Right = { pos = {-63.79, WIRE_Y,  9.95} } },
    { Left = { pos = {-51.97, WIRE_Y, -11.59} }, Right = { pos = {-51.97, WIRE_Y, 10.23} } },
    { Left = { pos = {-40.29, WIRE_Y, -11.68} }, Right = { pos = {-40.29, WIRE_Y, 10.41} } },
    { Left = { pos = {-28.66, WIRE_Y, -11.70} }, Right = { pos = {-28.66, WIRE_Y, 10.77} } },
    { Left = { pos = { -3.63, WIRE_Y, -11.70} }, Right = { pos = { -3.63, WIRE_Y, 10.62} } },
}
GT.ArrestingGears.ArrestingGearsNumber = #GT.ArrestingGears

GT.exhaust = {
    [1] = { size = 0.5, pos = { 5.797, 10.982, 18.044} },
    [2] = { size = 0.5, pos = {-5.752, 10.982, 18.044} },
}

-- LSO: altura relativa a la cubierta (antes 14.6 = +0.46)
GT.LSOView = { cockpit = "empty", position = { offset = {-83.5, DeckLevel + 0.46, -14.6, -179.5, 5.0} } }
GT.OLS = { Type = GT_t.OLS_TYPE.Luna, MeatBallArg = 100 }
GT.Landing_Point = {-52.0, DeckLevel + 0.05, 0.0}

-- ------------------------------------------------------------------------------
-- 3. WEAPON TEMPLATES
-- ------------------------------------------------------------------------------

GT.WS = {}
GT.WS.maxTargetDetectionRange = 30000
GT.WS.radar_type = 104
GT.WS.searchRadarMaxElevation = math.rad(50)

-- Triple 25mm Type 96
GT_t.WS_t.Zuikaku_Mgun_25mm = { name = "25mm Machine gun", display_name = _("25mm Type 96") }
GT_t.WS_t.Zuikaku_Mgun_25mm.omegaY = math.rad(13)
GT_t.WS_t.Zuikaku_Mgun_25mm.omegaZ = math.rad(9)
GT_t.WS_t.Zuikaku_Mgun_25mm.angles = {{math.rad(130), math.rad(-130), math.rad(-5.5), math.rad(85)}}
GT_t.WS_t.Zuikaku_Mgun_25mm.pidY = {p = 50.0, i = 0.0, d = 6.0, inn = 120}
GT_t.WS_t.Zuikaku_Mgun_25mm.pidZ = {p = 30.0, i = 0.0, d = 6.0, inn = 120}
GT_t.WS_t.Zuikaku_Mgun_25mm.LN = {}
GT_t.WS_t.Zuikaku_Mgun_25mm.LN[1] = {}
GT_t.WS_t.Zuikaku_Mgun_25mm.LN[1].distanceMax = 2500
GT_t.WS_t.Zuikaku_Mgun_25mm.LN[1].distanceMin = 100
GT_t.WS_t.Zuikaku_Mgun_25mm.LN[1].max_trg_alt = 2000
GT_t.WS_t.Zuikaku_Mgun_25mm.LN[1].type = 3
GT_t.WS_t.Zuikaku_Mgun_25mm.LN[1].automaticLoader = false
GT_t.WS_t.Zuikaku_Mgun_25mm.LN[1].sensor = {
    deviation_error_azimuth      = 0.00943,
    deviation_error_elevation    = 0.00943,
    deviation_error_speed_sensor = 0.00038,
    deviation_error_stability    = 0.00600,
    deviation_error_distance     = 0.00038,
}
GT_t.WS_t.Zuikaku_Mgun_25mm.LN[1].PL = {}
GT_t.WS_t.Zuikaku_Mgun_25mm.LN[1].PL[1] = {}
GT_t.WS_t.Zuikaku_Mgun_25mm.LN[1].PL[1].portionAmmoCapacity = 15
GT_t.WS_t.Zuikaku_Mgun_25mm.LN[1].PL[1].createMuzzleFlashEffect = true
GT_t.WS_t.Zuikaku_Mgun_25mm.LN[1].PL[1].ammo_capacity = 3000
GT_t.WS_t.Zuikaku_Mgun_25mm.LN[1].PL[1].reload_time = 5.0
GT_t.WS_t.Zuikaku_Mgun_25mm.LN[1].PL[1].portion_reload_time = 5.0
GT_t.WS_t.Zuikaku_Mgun_25mm.LN[1].PL[1].shot_delay = 0.15
GT_t.WS_t.Zuikaku_Mgun_25mm.LN[1].PL[1].shell_name = {"25mm_AA_JAP_ball", "25mm_AA_JAP_Yellow2", "25mm_AA_JAP_ball", "25mm_AA_JAP_ball"}
GT_t.WS_t.Zuikaku_Mgun_25mm.LN[1].BR = {
    {pos = {0.8, 0.0,  0.15}},
    {pos = {0.8, 0.0,  0.00}},
    {pos = {0.8, 0.0, -0.15}},
}

-- Twin 127mm Type 89 DP
-- Cambios: elevacion hasta 88 deg, pidY/pidZ, distanceMax, reactionTime 5 s,
-- cadencia ~14 disparos/min, municion por tanda y fogonazo.
GT_t.WS_t.ship_Type89 = { name = "Type 89 127mm DP" }
GT_t.WS_t.ship_Type89.angles = {{math.rad(135), math.rad(-135), math.rad(-10), math.rad(88)}}
GT_t.WS_t.ship_Type89.omegaY = 0.6
GT_t.WS_t.ship_Type89.omegaZ = 0.6
GT_t.WS_t.ship_Type89.pidY = {p = 50.0, i = 0.0, d = 6.0, inn = 120}
GT_t.WS_t.ship_Type89.pidZ = {p = 30.0, i = 0.0, d = 6.0, inn = 120}
GT_t.WS_t.ship_Type89.reference_angle_Z = 0
GT_t.WS_t.ship_Type89.LN = {}
GT_t.WS_t.ship_Type89.LN[1] = {}
GT_t.WS_t.ship_Type89.LN[1].type = 3
GT_t.WS_t.ship_Type89.LN[1].distanceMin = 50
GT_t.WS_t.ship_Type89.LN[1].distanceMax = 7000
GT_t.WS_t.ship_Type89.LN[1].max_trg_alt = 7500
GT_t.WS_t.ship_Type89.LN[1].reactionTime = 5
GT_t.WS_t.ship_Type89.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.ship_Type89.LN[1].sensor, GT_t.WSN_t[3])
GT_t.WS_t.ship_Type89.LN[1].PL = {}
GT_t.WS_t.ship_Type89.LN[1].PL[1] = {}
GT_t.WS_t.ship_Type89.LN[1].PL[1].ammo_capacity = 240
GT_t.WS_t.ship_Type89.LN[1].PL[1].portionAmmoCapacity = 20
GT_t.WS_t.ship_Type89.LN[1].PL[1].createMuzzleFlashEffect = true
GT_t.WS_t.ship_Type89.LN[1].PL[1].shell_name = {"IJN_127mm_Type89_AA_T12", "IJN_127mm_Type89_AA_T8", "IJN_127mm_Type89_AA_T5"}   -- AA time-fuze belt (Weapons/IJN_AA_fuze_belt.lua)
GT_t.WS_t.ship_Type89.LN[1].PL[1].shot_delay = 60 / 14
GT_t.WS_t.ship_Type89.LN[1].PL[1].reload_time = 20.0
GT_t.WS_t.ship_Type89.LN[1].PL[1].portion_reload_time = 10.0
GT_t.WS_t.ship_Type89.LN[1].automaticLoader = false
GT_t.WS_t.ship_Type89.LN[1].BR = { {pos = {8, 0, 0.1}}, {pos = {8, 0, -0.1}} }

-- ------------------------------------------------------------------------------
-- 4. WEAPON MOUNTS (25mm Type 96 Triple Mounts)
-- ------------------------------------------------------------------------------

-- Forward (F)
for i = 1, 3 do
    local ws = GT_t.inc_ws()
    GT.WS[ws] = {}
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Zuikaku_Mgun_25mm)
    GT.WS[ws].center = "CENTER_MGUN_F_" .. i
    GT.WS[ws].angles = {{math.rad(100), math.rad(-100), math.rad(-10), math.rad(80)}}
    GT.WS[ws].drawArgument1 = 18 + (i * 2)
    GT.WS[ws].drawArgument2 = 19 + (i * 2)
    GT.WS[ws].LN[1].BR = {
        { connector_name = "POINT_MGUN_F_" .. i .. "1" },
        { connector_name = "POINT_MGUN_F_" .. i .. "2" },
        { connector_name = "POINT_MGUN_F_" .. i .. "3" }
    }
end

-- Aft / Stern (T)
for i = 1, 3 do
    local ws = GT_t.inc_ws()
    GT.WS[ws] = {}
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Zuikaku_Mgun_25mm)
    GT.WS[ws].board = 2
    GT.WS[ws].center = "CENTER_MGUN_T_" .. i
    GT.WS[ws].angles = {{math.rad(100), math.rad(-100), math.rad(-10), math.rad(80)}}
    GT.WS[ws].drawArgument1 = 24 + (i * 2)
    GT.WS[ws].drawArgument2 = 25 + (i * 2)
    GT.WS[ws].LN[1].BR = {
        { connector_name = "POINT_MGUN_T_" .. i .. "1" },
        { connector_name = "POINT_MGUN_T_" .. i .. "2" },
        { connector_name = "POINT_MGUN_T_" .. i .. "3" }
    }
end

-- Port (L)
for i = 1, 6 do
    local ws = GT_t.inc_ws()
    GT.WS[ws] = {}
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Zuikaku_Mgun_25mm)
    GT.WS[ws].board = 3
    GT.WS[ws].center = "CENTER_MGUN_L_" .. i
    GT.WS[ws].angles = {{math.rad(80), math.rad(-80), math.rad(-10), math.rad(80)}}
    GT.WS[ws].drawArgument1 = 30 + (i * 2)
    GT.WS[ws].drawArgument2 = 31 + (i * 2)
    GT.WS[ws].LN[1].BR = {
        { connector_name = "POINT_MGUN_L_" .. i .. "1" },
        { connector_name = "POINT_MGUN_L_" .. i .. "2" },
        { connector_name = "POINT_MGUN_L_" .. i .. "3" }
    }
end

-- Starboard (R)
for i = 1, 6 do
    local ws = GT_t.inc_ws()
    GT.WS[ws] = {}
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Zuikaku_Mgun_25mm)
    GT.WS[ws].board = 4
    GT.WS[ws].center = "CENTER_MGUN_R_" .. i
    GT.WS[ws].angles = {{math.rad(80), math.rad(-80), math.rad(-10), math.rad(80)}}
    GT.WS[ws].drawArgument1 = 42 + (i * 2)
    GT.WS[ws].drawArgument2 = 43 + (i * 2)
    GT.WS[ws].LN[1].BR = {
        { connector_name = "POINT_MGUN_R_" .. i .. "1" },
        { connector_name = "POINT_MGUN_R_" .. i .. "2" },
        { connector_name = "POINT_MGUN_R_" .. i .. "3" }
    }
end

-- ------------------------------------------------------------------------------
-- 5. WEAPON MOUNTS (127mm DP Twin Mounts)
-- ------------------------------------------------------------------------------

-- Port DP Mounts
local port_flak_args = { {56, 57, 110}, {58, 59, 111}, {70, 71, 112}, {72, 73, 113} }
for i, args in ipairs(port_flak_args) do
    local ws = GT_t.inc_ws()
    GT.WS[ws] = {}
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Type89)
    GT.WS[ws].board = 3
    GT.WS[ws].center = "CENTER_FLAK_L_" .. i
    GT.WS[ws].drawArgument1 = args[1]
    GT.WS[ws].drawArgument2 = args[2]
    GT.WS[ws].LN[1].fireAnimationArgument = args[3]
    GT.WS[ws].LN[1].BR = {
        { connector_name = "POINT_FLAK_L_" .. i .. "1" },
        { connector_name = "POINT_FLAK_L_" .. i .. "2" },
    }
end

-- Starboard DP Mounts
local stbd_flak_args = { {74, 75, 114}, {76, 77, 115}, {78, 79, 116}, {80, 81, 117} }
for i, args in ipairs(stbd_flak_args) do
    local ws = GT_t.inc_ws()
    GT.WS[ws] = {}
    set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Type89)
    GT.WS[ws].board = 4
    GT.WS[ws].center = "CENTER_FLAK_R_" .. i
    GT.WS[ws].drawArgument1 = args[1]
    GT.WS[ws].drawArgument2 = args[2]
    GT.WS[ws].LN[1].fireAnimationArgument = args[3]
    GT.WS[ws].LN[1].BR = {
        { connector_name = "POINT_FLAK_R_" .. i .. "1" },
        { connector_name = "POINT_FLAK_R_" .. i .. "2" },
    }
end

-- ------------------------------------------------------------------------------
-- 6. RUNWAYS
-- ------------------------------------------------------------------------------
dofile(current_mod_path .. "/Scripts/ZUIKAKURunwaysAndRoutes.lua")

add_surface_unit(GT) 
