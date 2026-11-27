-- ============================================================================
-- Cleveland-class light cruiser - common definition (PTO'43, rebuilt 2026-11-26).
-- Used by cleveland_class.lua (USS Cleveland CL-55) and uss_montpelier.lua (CL-57).
--
-- 2026-11-26: both ships now share ONE shape ("uss_cleveland_class", the rebuilt
-- Hawkeye-derived model) and ONE arg scheme, rigged directly from the real mount
-- positions in that .blend. Only the livery differs between the two ships now.
-- Previous per-ship arg numbers (water_propeller 8/65, radar1_rotation 2/11, main
-- turret args 38/39.../0/1...) are gone; see _backup_2026-11-26/ for the old files.
--
-- Gun rig convention (unchanged from the old model, confirmed in Weapons/USN_cruiser_weapons.lua):
-- traverse arg 0 = bow (rest), arg 1 = +180 deg; elevation arg 0 = horizontal (rest), arg 1 = +90 deg.
--
-- 2026-11-26: nav_lights (4 bulbs: masthead/port/starboard/stern, EMISSIVE_ARG on each,
-- red/green/white bano textures) and flight_deck_fences (SideFence split into Port/
-- Starboard, each folds 15 deg outboard - the object spans multiple deck levels, so a
-- big fold looked wrong) are now rigged in the .blend. flag_animation and
-- catapult_shuttles are NOT (still just placeholder args so the table doesn't error).
--
-- AA fit differs from the old file on purpose: the new model has 4 single 40mm Bofors
-- mounts (not 6 quad + 9 twin) and 13 single 20mm Oerlikon mounts. The Oerlikons are
-- rigged in the .blend (train arg 200-212, elevation 220-232) but NOT wired into
-- GT.WS below (decorative only, no fire control) - add() them with USN_20mm_Single
-- and their real positions if that's wanted later.
-- ============================================================================
function CLEVELAND_build(o)
    GT = {}
    GT_t.ws = 0
    set_recursive_metatable(GT, GT_t.generic_ship)

    GT.visual = {}
    GT.visual.shape      = o.shape
    GT.visual.shape_dstr = "uss_cleveland_Sunk"

    GT.animation_arguments = {
        nav_lights = 300, flag_animation = 301, flight_deck_fences = 302,   -- not rigged yet, see note above
        water_propeller = 100,
        radar1_rotation = 110, radar2_rotation = 112, radar3_rotation = 113,
    }
    GT.radar1_period = 3
    GT.radar2_period = 3

    -- Hull: 186 m x 20.2 m, 11,700 t standard / 14,100 t full, 32.5 kn
    GT.life             = 6000
    GT.mass             = 1.41e+007
    GT.max_velocity     = 16.7
    GT.race_velocity    = 16.7
    GT.economy_velocity = 7.7
    GT.economy_distance = 2.0e+007
    GT.race_distance    = 4.6e+006
    GT.shipLength       = 186
    GT.Width            = 20.2
    GT.Height           = 38
    GT.Length           = 186
    GT.DeckLevel        = 7.2
    GT.X_nose           = 92.3
    GT.X_tail           = -93.8
    GT.Tail_Width       = 11
    GT.Gamma_max        = 0.35
    GT.Om               = 0.05
    GT.speedup          = 0.1
    GT.R_min            = 400
    GT.distFindObstacles = 600

    GT.exhaust = {
        [1] = { size = 0.6, pos = { 0.333, 27.364, 0.0 } },
    }
    GT.Landing_Point = o.landing
    GT.animation_arguments.catapult_shuttles = { 303, 304, 305, 306 }   -- not rigged yet, see note above

    -- Damage zones: stays lua-only for now (hull not split, no DAMAGE_ARG wired to the
    -- model). Fire/smoke column size cut down 2026-11-26 (was 1.5/2.5, too much smoke).
    GT.DM = {
        { area_name = "Scafo_Prua_Dx",    area_arg = 76, area_life = 70, area_fire = { pos = { 45.0, 4.0,  3.0 }, size = 0.6 } },
        { area_name = "Scafo_Prua_Sx",    area_arg = 73, area_life = 70, area_fire = { pos = { 30.0, 4.0, -3.0 }, size = 0.6 } },
        { area_name = "Scafo_Poppa_Dx",   area_arg = 72, area_life = 60, area_fire = { pos = { -20.0, 2.0,  3.0 }, size = 0.6 } },
        { area_name = "Scafo_Poppa_Sx",   area_arg = 75, area_life = 60, area_fire = { pos = { -10.0, 2.0, -3.0 }, size = 0.6 } },
        { area_name = "Strutture_Poppa",  area_arg = 82, area_life = 80, area_fire = { pos = { -35.0, 12.0, 0.0 }, size = 0.6 } },
        { area_name = "Sala_Comando",     area_arg = 83, area_life = 80, area_fire = { pos = { 30.0, 12.0, 0.0 }, size = 0.6 } },
        { area_name = "Torre_380_Anton",  area_arg = 96, area_life = 60, area_fire = { pos = { 35.0, 5.0, 0.0 }, size = 0.6 } },
        { area_name = "Ponte Poppa",      area_arg = 85, area_life = 60, area_fire = { pos = { -45.0, 3.0, 0.0 }, size = 0.6 } },
        { area_name = "Fletcher_Distrutta", area_arg = 77, area_life = 60, area_fire = { pos = { 5.0, 12.0, 0.0 }, size = 1.0 } },
    }

    -- ---------------- weapons ----------------
    GT.WS = {}
    GT.WS.maxTargetDetectionRange = 40000
    GT.WS.radar_type              = 102
    GT.WS.searchRadarMaxElevation = math.rad(60)
    GT.WS.searchRadarFrequencies  = { { 50.0e6, 54.0e6 }, { 2.0e9, 2.2e9 } }

    local A = USN_ARCS
    local function area(x) if x > 30 then return "Torre_380_Anton" elseif x > 0 then return "Sala_Comando" elseif x > -40 then return "Strutture_Poppa" else return "Ponte Poppa" end end
    local function add(list, proto)
        for _, m in ipairs(list) do m.area = m.area or area(m.pos[1]) end
        USN_add_mounts(GT, list, proto)
    end

    -- 4 x triple 6"/47 (real positions/args from the Hawkeye model, 2026-11-26).
    -- recoil_arg 423-426 and the POINT_GUN_152_<mount>_<barrel> connectors are rigged
    -- in the .blend (barrel slide 0=in battery / 1=full recoil, 0.5 m).
    add({
        { pos = {  58.5, 7.7,  0.0 }, az = 280, el = 284, arcs = A.fwd(-5, 60), refY =   0, barrels = 3, spacing = 1.4, length = 8,
          conn = "POINT_GUN_152_1_%d", recoil_arg = 423, recoil_time = 0.6 },
        { pos = {  46.2, 9.7,  0.0 }, az = 281, el = 285, arcs = A.fwd(-5, 60), refY =   0, barrels = 3, spacing = 1.4, length = 8,
          conn = "POINT_GUN_152_2_%d", recoil_arg = 424, recoil_time = 0.6 },
        { pos = { -44.5, 9.7,  0.0 }, az = 282, el = 286, arcs = A.aft(-5, 60), refY = 180, barrels = 3, spacing = 1.4, length = 8,
          conn = "POINT_GUN_152_3_%d", recoil_arg = 425, recoil_time = 0.6 },
        { pos = { -55.3, 7.7,  0.0 }, az = 283, el = 287, arcs = A.aft(-5, 60), refY = 180, barrels = 3, spacing = 1.4, length = 8,
          conn = "POINT_GUN_152_4_%d", recoil_arg = 426, recoil_time = 0.6 },
    }, GT_t.WS_t.USN_CL_6in47_Triple)

    -- 6 x twin 5"/38 DP (real positions/args from the Hawkeye model, 2026-11-26).
    -- recoil_arg 417-422 and the POINT_GUN_127_<mount>_<barrel> connectors are rigged
    -- in the .blend (barrel slide 0=in battery / 1=full recoil, 0.3 m).
    add({
        { pos = {  32.6, 9.0,  -0.0 }, az = 260, el = 270, arcs = A.fwd(-15, 85),  refY =   0, barrels = 2, spacing = 1.0, length = 5,
          conn = "POINT_GUN_127_1_%d", recoil_arg = 417, recoil_time = 0.4 },
        { pos = {  19.4, 9.0,  -6.6 }, az = 261, el = 271, arcs = A.port(-15, 85), refY =  90, barrels = 2, spacing = 1.0, length = 5,
          conn = "POINT_GUN_127_2_%d", recoil_arg = 418, recoil_time = 0.4 },
        { pos = {  19.4, 9.0,   6.6 }, az = 265, el = 275, arcs = A.stbd(-15, 85), refY = -90, barrels = 2, spacing = 1.0, length = 5,
          conn = "POINT_GUN_127_6_%d", recoil_arg = 422, recoil_time = 0.4 },
        { pos = { -15.6, 9.0,  -7.2 }, az = 262, el = 272, arcs = A.port(-15, 85), refY =  90, barrels = 2, spacing = 1.0, length = 5,
          conn = "POINT_GUN_127_3_%d", recoil_arg = 419, recoil_time = 0.4 },
        { pos = { -15.6, 9.0,   7.2 }, az = 264, el = 274, arcs = A.stbd(-15, 85), refY = -90, barrels = 2, spacing = 1.0, length = 5,
          conn = "POINT_GUN_127_5_%d", recoil_arg = 421, recoil_time = 0.4 },
        { pos = { -30.4, 10.0,  0.0 }, az = 263, el = 273, arcs = A.aft(-15, 85),  refY = 180, barrels = 2, spacing = 1.0, length = 5,
          conn = "POINT_GUN_127_4_%d", recoil_arg = 420, recoil_time = 0.4 },
    }, GT_t.WS_t.USN_5in38_Twin)

    -- 4 x single 40mm Bofors (the model's real AA fit; reuses the twin mount's rate-
    -- of-fire/ammo template with barrels=1, since there is no single-mount template).
    -- recoil_arg 413-416 and the POINT_GUN_40_<mount>_1 connectors are rigged in the
    -- .blend (barrel slide 0=in battery / 1=full recoil, 0.18 m).
    add({
        { pos = {  19.5, 16.0, -4.0 }, az = 240, el = 250, arcs = A.port(-10, 88), refY =  90, barrels = 1, spacing = 0.3, length = 2.5,
          conn = "POINT_GUN_40_1_%d", recoil_arg = 413, recoil_time = 0.3 },
        { pos = {  19.5, 16.0,  4.0 }, az = 241, el = 251, arcs = A.stbd(-10, 88), refY = -90, barrels = 1, spacing = 0.3, length = 2.5,
          conn = "POINT_GUN_40_2_%d", recoil_arg = 414, recoil_time = 0.3 },
        { pos = { -15.9, 13.8, -3.8 }, az = 242, el = 252, arcs = A.port(-10, 88), refY =  90, barrels = 1, spacing = 0.3, length = 2.5,
          conn = "POINT_GUN_40_3_%d", recoil_arg = 415, recoil_time = 0.3 },
        { pos = { -15.9, 13.8,  3.8 }, az = 243, el = 253, arcs = A.stbd(-10, 88), refY = -90, barrels = 1, spacing = 0.3, length = 2.5,
          conn = "POINT_GUN_40_4_%d", recoil_arg = 416, recoil_time = 0.3 },
    }, GT_t.WS_t.USN_40mm_Twin)

    -- 13 x single 20mm Oerlikon: decorative only (per the earlier decision), not added
    -- to GT.WS, so they have no fire control. Train/elevation args 200-212/220-232 and
    -- recoil args 400-412 (connectors POINT_GUN_20_<mount>_1) are rigged in the .blend
    -- if someone wants to wire them with USN_20mm_Single later.

    -- ---------------- identity & sensors ----------------
    GT.Name             = o.name
    GT.DisplayName      = _(o.display)
    GT.DisplayNameShort = _(o.short)
    GT.Rate             = 6000

    GT.sensor = {}
    set_recursive_metatable(GT.sensor, GT_t.SN_visual)
    GT.sensor.height = 30.0
    GT.sensor.max_range_finding_target = 30000

    GT.airWeaponDist  = 14000
    GT.airFindDist    = 30000
    GT.DetectionRange = GT.airFindDist
    GT.ThreatRange    = GT.airWeaponDist

    GT.Sensors = {
        OPTIC = { "long-range naval optics", "long-range air defence optics" },
        RADAR = { "ticonderoga search radar" },
    }
    GT.Singleton   = "no"
    GT.mapclasskey = "P0091000067"
    GT.attribute = { wsType_Navy, wsType_Ship, wsType_ArmedShip, wsType_GenericLightArmoredShip,
                     "Cruisers", "Aircraft Carriers",   -- kept from the original: lets the catapult floatplanes use the ship
                     "Armed Air Defence", "RADAR_BAND1_FOR_ARM", "DetectionByAWACS" }
    GT.Categories = { { name = "Armed Ship" } }
    add_surface_unit(GT)
end
