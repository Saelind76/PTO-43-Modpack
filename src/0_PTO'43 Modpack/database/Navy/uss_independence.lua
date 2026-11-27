-- ==============================================================================
-- USS Independence CVL-22 (Independence-class light carrier, PTO '43, Nov-1943 fit)
-- Model: Cleveland hull (Thomas Beerens) rebuilt as CVL-22 from the BuShips booklet (Cowpens CVL-25) BY SAELIND76
-- ==============================================================================
-- Verified EDM Bindings (Shapes/uss_independence.edm):
--   Propellers:          Arg 8
--   Search Radars:       Arg 2 (Radar_SK_Rot), Arg 3 (Radar_Top_Rot), Arg 13 (Radar_Dish_Rot)
--   Flight Deck Fences:  Arg 150
--   Arresting Wires:     Args 400..408 (connectors POINT_TROS_01_01 .. POINT_TROS_09_02)
--   11x Twin 40mm AA:    Args 52/53 .. 72/73   (CENTER_MGUN_1..11,  POINT_MGUN_1..11_1..2)
--   2x Quad 40mm AA:     Args 74/75 .. 76/77   (CENTER_MGUN_12..13, POINT_MGUN_12..13_1..4)
--   24x 20mm Oerlikon:   Args 78/79 .. 124/125 (CENTER_MGUN_14..37, POINT_MGUN_14..37_1)
--   Gun recoil:          Args 160..196 (159 + MGUN index)
--   Traverse arg 0 = bow for every mount (EDM F19, 2026-11-25)
--   9x Mk 51 Directors:  Args 126/127 .. 142/143 (CENTER_MK51_1..9)
-- ==============================================================================

GT = {}
GT_t.ws = 0

set_recursive_metatable(GT, GT_t.generic_ship)

-- ==============================================================================
-- 1. VISUALS & ANIMATION ARGUMENTS
-- ==============================================================================
GT.visual = {}
GT.visual.shape = "uss_independence"            -- Shapes/uss_independence.lods -> uss_independence.edm
GT.visual.shape_dstr = ""                       -- dynamic sinking physics

GT.animation_arguments.water_propeller    = 8
GT.animation_arguments.radar1_rotation    = 2   -- SK air search radar
GT.animation_arguments.radar2_rotation    = 3   -- Masthead search radar
GT.animation_arguments.radar3_rotation    = 13  -- Island dish radar
GT.animation_arguments.arresting_wires    = {400, 401, 402, 403, 404, 405, 406, 407, 408}
GT.animation_arguments.flight_deck_fences = 150

GT.radar1_period = 12.0
GT.radar2_period = 8.0
GT.radar3_period = 6.0

GT.encyclopediaAnimation = {
    args = {
        -- Slight combat elevation pose (~18 deg = 0.20) for 40mm & 20mm batteries
        [53] = 0.20, [55] = 0.20, [57] = 0.20, [59] = 0.20, [61] = 0.20, [63] = 0.20,
        [65] = 0.20, [67] = 0.20, [69] = 0.20, [71] = 0.20, [73] = 0.20,
        [75] = 0.22, [77] = 0.22,
        [79] = 0.18, [81] = 0.18, [83] = 0.18, [85] = 0.18, [87] = 0.18, [89] = 0.18,
        [91] = 0.18, [93] = 0.18, [95] = 0.18, [97] = 0.18, [99] = 0.18, [101] = 0.18,
        [103] = 0.18, [105] = 0.18, [107] = 0.18, [109] = 0.18, [111] = 0.18, [113] = 0.18,
        [115] = 0.18, [117] = 0.18, [119] = 0.18, [121] = 0.18, [123] = 0.18, [125] = 0.18,
    }
}

-- ==============================================================================
-- 2. SHIP DYNAMICS & FLIGHT DECK
-- ==============================================================================
GT.life = 3000
GT.Rate = 3000.000000
GT.mass = 1.499e+007
GT.max_velocity = 16.26            -- 31.6 kn
GT.race_velocity = 15.43           -- 30 kn
GT.economy_velocity = 7.72         -- 15 kn
GT.economy_distance = 2.41e+007    -- 13,000 nm at 15 kn
GT.race_distance = 5.0e+006

GT.shipLength = 187.6
GT.Width = 33.3
GT.Height = 41.5                   -- keel to mast top
GT.Length = 187.6
GT.X_nose = 92.9
GT.X_tail = -94.7
GT.Tail_Width = 22.0

-- four starboard funnels (tops at y 18.6, outboard end z ~17.4); smoke cut to ~43% on 2026-11-25 (was 0.035/0.015)
GT.exhaust =
{
    [1] = { size = 0.015, pos = {-14.2, 18.6, 17.0} },
    [2] = { size = 0.007, pos = { -6.9, 18.6, 17.0} },
    [3] = { size = 0.015, pos = { 11.7, 18.6, 17.0} },
    [4] = { size = 0.007, pos = { 19.0, 18.6, 17.0} },
}

GT.Gamma_max = 0.35
GT.Om = 0.05
GT.speedup = 0.12
GT.R_min = 400.0
GT.distFindObstacles = 800.0

-- Deck and landing point (aim point at wire 2; AI floats fwd to catch ~wire 6)
GT.DeckLevel = 13.87
GT.Landing_Point = {-76.20, 13.92, 0.0}            -- wire 2 (mid-point of GT.RunWays[1])
GT.LSOPosition = {-90.7, 14.2, -12.6, 0.0, 0.0}    -- LSO platform, port quarter

-- WWII ship: no TACAN / ICLS / optical landing system
GT.TACAN = false
GT.ICLS = false
GT.LRLS = false

GT.Plane_Num_ = 33
GT.Helicopter_Num_ = 0
GT.airWeaponDist = 5000
GT.airFindDist = 35000

GT.driverViewConnectorName = {"DRIVER_POINT", offset = {0.0, 0.0, 0.0}}
GT.driverCockpit = "DriverCockpit/DriverCockpitWithIR"

-- ==============================================================================
-- 3. DAMAGE MODEL (matches Independence_collision.edm shell names)
-- ==============================================================================
GT.DM = {
    -- hull (1,800 HP)
    { area_name = "HULL_BOW_PORT",    area_arg = 200, area_life = 250, area_fire = { pos = { 60.0,  4.0, -8.0}, size = 1.0}},
    { area_name = "HULL_BOW_STB",     area_arg = 201, area_life = 250, area_fire = { pos = { 60.0,  4.0,  8.0}, size = 1.0}},
    { area_name = "HULL_CENTER_PORT", area_arg = 202, area_life = 400, area_fire = { pos = {  0.0,  4.0, -9.0}, size = 1.2}},
    { area_name = "HULL_CENTER_STB",  area_arg = 203, area_life = 400, area_fire = { pos = {  0.0,  4.0,  9.0}, size = 1.2}},
    { area_name = "HULL_STERN_PORT",  area_arg = 204, area_life = 250, area_fire = { pos = {-65.0,  4.0, -8.0}, size = 1.0}},
    { area_name = "HULL_STERN_STB",   area_arg = 205, area_life = 250, area_fire = { pos = {-65.0,  4.0,  8.0}, size = 1.0}},
    -- flight deck and hangar (900 HP, split PORT / STB)
    { area_name = "DECK_BOW_PORT",    area_arg = 206, area_life = 150, area_fire = { pos = { 50.0, 13.9, -5.5}, size = 0.9}},
    { area_name = "DECK_BOW_STB",     area_arg = 207, area_life = 150, area_fire = { pos = { 50.0, 13.9,  5.5}, size = 0.9}},
    { area_name = "DECK_CENTER_PORT", area_arg = 208, area_life = 150, area_fire = { pos = {  0.0, 13.9, -5.5}, size = 1.0}},
    { area_name = "DECK_CENTER_STB",  area_arg = 209, area_life = 150, area_fire = { pos = {  0.0, 13.9,  5.5}, size = 1.0}},
    { area_name = "DECK_STERN_PORT",  area_arg = 210, area_life = 150, area_fire = { pos = {-60.0, 13.9, -5.5}, size = 0.9}},
    { area_name = "DECK_STERN_STB",   area_arg = 211, area_life = 150, area_fire = { pos = {-60.0, 13.9,  5.5}, size = 0.9}},
    -- island (300 HP)
    { area_name = "COMMAND_ISLE",     area_arg = 212, area_life = 300, area_fire = { pos = { 27.0, 17.0, 13.5}, size = 0.8}},
}

-- ==============================================================================
-- 4. WEAPON SYSTEMS (9x Mk 51 Directors + 2x Quad 40mm + 11x Twin 40mm + 24x 20mm)
-- ==============================================================================
GT.WS = {}
GT.WS.maxTargetDetectionRange = 35000
GT.WS.radar_type              = 103
GT.WS.searchRadarMaxElevation = math.rad(60)
GT.WS.searchRadarFrequencies  = {{195.0e6, 215.0e6}, {2.9e9, 3.1e9}}

local ws

-- ------------------------------------------------------------------------------
-- 4.1 Mk 51 Gun Fire Control Directors (ws 1..9, Args 126..143)
-- Defined first so Bofors mounts (ws 10..22) can subscribe via depends_on_unit.
-- ------------------------------------------------------------------------------
local mk51_defs = {
    -- Starboard sponsons (rest heading -90 deg starboard)
    { area = "HULL_STERN_STB",  center = "CENTER_MK51_1", az = 126, el = 127, refY = -90, arcs = {{math.rad(-5),  math.rad(-175), math.rad(-10), math.rad(88)}} }, -- Mk51_01 (-75.25, +12.27)
    { area = "HULL_CENTER_STB", center = "CENTER_MK51_2", az = 128, el = 129, refY = -90, arcs = {{math.rad(-5),  math.rad(-175), math.rad(-10), math.rad(88)}} }, -- Mk51_02 (-37.25, +12.27)
    { area = "HULL_BOW_STB",    center = "CENTER_MK51_3", az = 130, el = 131, refY = -90, arcs = {{math.rad(-5),  math.rad(-175), math.rad(-10), math.rad(88)}} }, -- Mk51_03 ( 43.35, +11.74) moved 2026-11-25 out of Twin40_05 sweep
    { area = "HULL_BOW_STB",    center = "CENTER_MK51_4", az = 132, el = 133, refY = -90, arcs = {{math.rad(-5),  math.rad(-175), math.rad(-10), math.rad(88)}} }, -- Mk51_04 ( 52.25, +11.26) moved 2026-11-25 out of Twin40_06 sweep
    -- Port sponsons (rest heading +90 deg port)
    { area = "HULL_STERN_PORT",  center = "CENTER_MK51_5", az = 134, el = 135, refY =  90, arcs = {{math.rad(175), math.rad(5),    math.rad(-10), math.rad(88)}} }, -- Mk51_05 (-75.25, -12.27)
    { area = "HULL_CENTER_PORT", center = "CENTER_MK51_6", az = 136, el = 137, refY =  90, arcs = {{math.rad(175), math.rad(5),    math.rad(-10), math.rad(88)}} }, -- Mk51_06 (-37.25, -12.27)
    { area = "HULL_CENTER_PORT", center = "CENTER_MK51_7", az = 138, el = 139, refY =  90, arcs = {{math.rad(175), math.rad(5),    math.rad(-10), math.rad(88)}} }, -- Mk51_07 (  3.15, -12.27)
    { area = "HULL_BOW_PORT",    center = "CENTER_MK51_8", az = 140, el = 141, refY =  90, arcs = {{math.rad(175), math.rad(5),    math.rad(-10), math.rad(88)}} }, -- Mk51_08 ( 42.35, -12.24)
    { area = "HULL_BOW_PORT",    center = "CENTER_MK51_9", az = 142, el = 143, refY =  90, arcs = {{math.rad(175), math.rad(5),    math.rad(-10), math.rad(88)}} }, -- Mk51_09 ( 51.25, -11.76)
}

local mk51_ws = {}
for i, d in ipairs(mk51_defs) do
    GT.encyclopediaAnimation.args[d.az] = d.refY / 180   -- show parked heading
    ws = GT_t.inc_ws()
    mk51_ws[i] = ws
    GT.WS[ws] = {
        name              = "Mk 51 Gun Director",
        area              = d.area,
        center            = d.center,
        drawArgument1     = d.az,
        drawArgument2     = d.el,
        omegaY            = math.rad(65),
        omegaZ            = math.rad(65),
        pidY              = {p = 100, i = 0.05, d = 12, inn = 50},
        pidZ              = {p = 100, i = 0.05, d = 12, inn = 50},
        reference_angle_Y = math.rad(d.refY),
        reference_angle_Z = 0,
        angles            = d.arcs,
        moveable          = true,
        LN = {
            [1] = {
                type                            = 102,
                frequencyRange                  = {0.5e9, 0.58e9},
                distanceMin                     = 10,
                distanceMax                     = 10000,
                reactionTime                    = 1.0,
                reflection_limit                = 0.05,
                ECM_K                           = 0.5,
                min_trg_alt                     = 5,
                max_trg_alt                     = 6000,
                max_number_of_missiles_channels = 4,
                beamWidth                       = math.rad(90),
            }
        }
    }
end

-- ------------------------------------------------------------------------------
-- 4.2 AA Gun Prototype Builder (creates independent LN & BR tables per mount)
--
-- EDM rig (F19, 2026-11-25):
--   * Traverse arg: 0 = bow, +1 = +180 deg (port, CCW), -1 = -180 deg (stbd).
--     DCS writes the absolute ship-relative azimuth, reference_angle_Y is only
--     the parking direction.  (F18 had arg 0 = parking direction -> meshes were
--     drawn 90/180 deg off while the shells flew correctly.)
--   * Elevation arg: 0 = horizontal, +1 = +90 deg.
--   * Recoil arg per mount = 159 + MGUN index (args 160..196); 0 = in battery,
--     1 = full recoil (Bofors 0.18 m, Oerlikon 0.06 m).
--   * One muzzle connector per barrel: POINT_MGUN_<n>_<k>, parented to the
--     recoiling barrel.
-- ------------------------------------------------------------------------------
local function make_aa_proto(name, ln_type, rof_per_min, ammo, shells, range_max, alt_max, reaction, omega_deg)
    local w = {
        name              = name,
        type              = ln_type,
        omegaY            = math.rad(omega_deg),
        omegaZ            = math.rad(omega_deg),
        pidY              = GT_t.AAA_PIDY or {p = 100, i = 0.05, d = 9.0, inn = 50},
        pidZ              = GT_t.AAA_PIDZ or {p = 100, i = 0.05, d = 9.0, inn = 50},
        reference_angle_Z = 0,
        moveable          = true,
        LN = {
            [1] = {
                type             = ln_type,
                distanceMin      = 10,
                distanceMax      = range_max,
                max_trg_alt      = alt_max,
                min_trg_alt      = -5,
                reactionTime     = reaction,
                reflection_limit = 0.22,
                connectorFire    = true,
                beamWidth        = math.rad(90),
                sensor           = {},
                PL = {
                    [1] = {
                        ammo_capacity       = ammo,
                        portionAmmoCapacity = ammo,
                        shell_name          = shells,
                        shot_delay          = 60 / rof_per_min,
                        reload_time         = 15.0,
                        switch_on_delay     = 0.5,
                    }
                },
            }
        }
    }
    set_recursive_metatable(w.LN[1].sensor, GT_t.WSN_t[3])
    return w
end

-- Rates are combined per mount (barrels fire in turn):
-- Quad 40mm = 4 x 120 rpm, Twin 40mm = 2 x 120 rpm, Oerlikon 20mm = 450 rpm
GT_t.WS_t.cvl22_bofors_quad = make_aa_proto("40 mm Bofors Mk 2 quad", 3,  480, 4000, {"CVL22_40mm_HE"},                   5000, 4000, 1.2, 35)
GT_t.WS_t.cvl22_bofors_twin = make_aa_proto("40 mm Bofors Mk 1 twin", 3,  240, 2400, {"CVL22_40mm_HE"},                   5000, 4000, 1.2, 40)
-- Oerlikon LN type 3 (AAA) like the M3 Essex: type 10 never engaged aircraft (0 shots in test 2026-11-25)
GT_t.WS_t.cvl22_oerlikon    = make_aa_proto("20 mm Oerlikon Mk 4",    3,  450, 1800, {"CVL22_20mm_HE", "CVL22_20mm_AP"},  2500, 2000, 0.8, 65)

-- Traverse arcs: ship-relative, MAX -> MIN (CCW positive: 90 = port, -90 = stbd, 180 = stern)
-- Elevation: MIN -> MAX
local stbd_bofors_arcs = { {math.rad(-5),  math.rad(-175), math.rad(-10), math.rad(88)} }
local port_bofors_arcs = { {math.rad(175), math.rad(5),    math.rad(-10), math.rad(88)} }
local stbd_oer_arcs    = { {math.rad(-5),  math.rad(-175), math.rad(-10), math.rad(85)} }
local port_oer_arcs    = { {math.rad(175), math.rad(5),    math.rad(-10), math.rad(85)} }

-- 2x Quad 40mm Bofors (Quad40_01..02 -> MGUN 12..13, Args 74..77, recoil 171..172)
local quad_40 = {
    -- Quad40_01: Bow centerline (84.19, 10.90, 0.00), parks at 0 deg (bow), +-135 deg
    { mgun = 12, barrels = 4, area = "HULL_BOW_PORT",   center = "CENTER_MGUN_12", az = 74, el = 75, refY = 0,
      arcs = { {math.rad(135), math.rad(-135), math.rad(-10), math.rad(88)} },
      dirs = { mk51_ws[4], mk51_ws[9] } },
    -- Quad40_02: Stern centerline (-94.79, 8.99, 0.00), parks at 180 deg, covers stern +-135 deg (split at 180)
    { mgun = 13, barrels = 4, area = "HULL_STERN_PORT", center = "CENTER_MGUN_13", az = 76, el = 77, refY = 180,
      arcs = { {math.rad(180), math.rad(45),  math.rad(-10), math.rad(88)},
               {math.rad(-45), math.rad(-180), math.rad(-10), math.rad(88)} },
      dirs = { mk51_ws[1], mk51_ws[5] } },
}

-- 11x Twin 40mm Bofors (Twin40_01..11 -> MGUN 1..11, Args 52..73, recoil 160..170)
local twin_40 = {
    -- Twin40_01: Port bow aft (41.20, 13.40, -14.34), parks +90 deg (port)
    { mgun = 1,  barrels = 2, area = "HULL_BOW_PORT",    center = "CENTER_MGUN_1",  az = 52, el = 53, refY =  90, arcs = port_bofors_arcs, dirs = { mk51_ws[8] } },
    -- Twin40_02: Stern starboard (-92.79, 11.62, +5.18), parks 180 deg; stern + starboard quarter
    { mgun = 2,  barrels = 2, area = "HULL_STERN_STB",   center = "CENTER_MGUN_2",  az = 54, el = 55, refY = 180,
      arcs = { {math.rad(180), math.rad(150), math.rad(-10), math.rad(88)},
               {math.rad(-30), math.rad(-180), math.rad(-10), math.rad(88)} },
      dirs = { mk51_ws[1] } },
    -- Twin40_03: Starboard aft (-76.40, 13.38, +14.31), parks -90 deg (stbd)
    { mgun = 3,  barrels = 2, area = "HULL_STERN_STB",   center = "CENTER_MGUN_3",  az = 56, el = 57, refY = -90, arcs = stbd_bofors_arcs, dirs = { mk51_ws[1] } },
    -- Twin40_04: Starboard mid (-38.40, 13.38, +14.31)
    { mgun = 4,  barrels = 2, area = "HULL_CENTER_STB",  center = "CENTER_MGUN_4",  az = 58, el = 59, refY = -90, arcs = stbd_bofors_arcs, dirs = { mk51_ws[2] } },
    -- Twin40_05: Starboard bow aft (41.20, 13.38, +13.39)
    { mgun = 5,  barrels = 2, area = "HULL_BOW_STB",     center = "CENTER_MGUN_5",  az = 60, el = 61, refY = -90, arcs = stbd_bofors_arcs, dirs = { mk51_ws[3] } },
    -- Twin40_06: Starboard bow fwd (50.10, 13.38, +12.91)
    { mgun = 6,  barrels = 2, area = "HULL_BOW_STB",     center = "CENTER_MGUN_6",  az = 62, el = 63, refY = -90, arcs = stbd_bofors_arcs, dirs = { mk51_ws[4] } },
    -- Twin40_07: Stern port (-92.79, 11.62, -4.99), parks 180 deg; stern + port quarter
    { mgun = 7,  barrels = 2, area = "HULL_STERN_PORT",  center = "CENTER_MGUN_7",  az = 64, el = 65, refY = 180,
      arcs = { {math.rad(180), math.rad(30),   math.rad(-10), math.rad(88)},
               {math.rad(-150), math.rad(-180), math.rad(-10), math.rad(88)} },
      dirs = { mk51_ws[5] } },
    -- Twin40_08: Port aft (-76.40, 13.38, -14.11), parks +90 deg (port)
    { mgun = 8,  barrels = 2, area = "HULL_STERN_PORT",  center = "CENTER_MGUN_8",  az = 66, el = 67, refY =  90, arcs = port_bofors_arcs, dirs = { mk51_ws[5] } },
    -- Twin40_09: Port mid aft (-38.40, 13.38, -14.21)
    { mgun = 9,  barrels = 2, area = "HULL_CENTER_PORT", center = "CENTER_MGUN_9",  az = 68, el = 69, refY =  90, arcs = port_bofors_arcs, dirs = { mk51_ws[6] } },
    -- Twin40_10: Port mid (2.00, 13.38, -14.31)
    { mgun = 10, barrels = 2, area = "HULL_CENTER_PORT", center = "CENTER_MGUN_10", az = 70, el = 71, refY =  90, arcs = port_bofors_arcs, dirs = { mk51_ws[7] } },
    -- Twin40_11: Port bow fwd (50.10, 13.38, -13.61)
    { mgun = 11, barrels = 2, area = "HULL_BOW_PORT",    center = "CENTER_MGUN_11", az = 72, el = 73, refY =  90, arcs = port_bofors_arcs, dirs = { mk51_ws[9] } },
}

-- 24x 20mm Oerlikon (Oer20_01..24 -> MGUN 14..37, Args 78..125, recoil 173..196)
-- Local gunners: no director dependency.
local oerlikon_20 = {
    -- Oer20_01..08: Starboard sponsons (park -90 deg)
    { mgun = 14, area = "HULL_BOW_STB",     center = "CENTER_MGUN_14", az =  78, el =  79, refY = -90, arcs = stbd_oer_arcs }, -- ( 58.40, +11.65)
    { mgun = 15, area = "HULL_STERN_STB",   center = "CENTER_MGUN_15", az =  80, el =  81, refY = -90, arcs = stbd_oer_arcs }, -- (-67.30, +13.16)
    { mgun = 16, area = "HULL_STERN_STB",   center = "CENTER_MGUN_16", az =  82, el =  83, refY = -90, arcs = stbd_oer_arcs }, -- (-55.56, +13.37)
    { mgun = 17, area = "HULL_STERN_STB",   center = "CENTER_MGUN_17", az =  84, el =  85, refY = -90, arcs = stbd_oer_arcs }, -- (-51.64, +13.37)
    { mgun = 18, area = "HULL_CENTER_STB",  center = "CENTER_MGUN_18", az =  86, el =  87, refY = -90, arcs = stbd_oer_arcs }, -- (-28.70, +13.17)
    { mgun = 19, area = "HULL_CENTER_STB",  center = "CENTER_MGUN_19", az =  88, el =  89, refY = -90, arcs = stbd_oer_arcs }, -- (-23.40, +13.27)
    { mgun = 20, area = "HULL_CENTER_STB",  center = "CENTER_MGUN_20", az =  90, el =  91, refY = -90, arcs = stbd_oer_arcs }, -- ( -2.06, +13.07)
    { mgun = 21, area = "HULL_CENTER_STB",  center = "CENTER_MGUN_21", az =  92, el =  93, refY = -90, arcs = stbd_oer_arcs }, -- (  1.86, +13.07)
    -- Oer20_09: Bow starboard (76.15, 11.18, +2.95), parks 0 deg; from 60 (port bow) round to -150 (stbd quarter)
    { mgun = 22, area = "HULL_BOW_STB",     center = "CENTER_MGUN_22", az =  94, el =  95, refY =   0,
      arcs = { {math.rad(60), math.rad(-150), math.rad(-10), math.rad(85)} } },
    -- Oer20_10..23: Port sponsons (park +90 deg)
    { mgun = 23, area = "HULL_STERN_PORT",  center = "CENTER_MGUN_23", az =  96, el =  97, refY =  90, arcs = port_oer_arcs }, -- (-86.28, -12.96)
    { mgun = 24, area = "HULL_STERN_PORT",  center = "CENTER_MGUN_24", az =  98, el =  99, refY =  90, arcs = port_oer_arcs }, -- (-81.52, -12.96)
    { mgun = 25, area = "HULL_STERN_PORT",  center = "CENTER_MGUN_25", az = 100, el = 101, refY =  90, arcs = port_oer_arcs }, -- (-67.30, -13.07)
    { mgun = 26, area = "HULL_STERN_PORT",  center = "CENTER_MGUN_26", az = 102, el = 103, refY =  90, arcs = port_oer_arcs }, -- (-55.56, -13.07)
    { mgun = 27, area = "HULL_STERN_PORT",  center = "CENTER_MGUN_27", az = 104, el = 105, refY =  90, arcs = port_oer_arcs }, -- (-51.64, -13.07)
    { mgun = 28, area = "HULL_CENTER_PORT", center = "CENTER_MGUN_28", az = 106, el = 107, refY =  90, arcs = port_oer_arcs }, -- (-28.70, -12.96)
    { mgun = 29, area = "HULL_CENTER_PORT", center = "CENTER_MGUN_29", az = 108, el = 109, refY =  90, arcs = port_oer_arcs }, -- (-20.10, -13.57)
    { mgun = 30, area = "HULL_CENTER_PORT", center = "CENTER_MGUN_30", az = 110, el = 111, refY =  90, arcs = port_oer_arcs }, -- ( -8.97, -13.17)
    { mgun = 31, area = "HULL_CENTER_PORT", center = "CENTER_MGUN_31", az = 112, el = 113, refY =  90, arcs = port_oer_arcs }, -- ( -3.82, -13.17)
    { mgun = 32, area = "HULL_CENTER_PORT", center = "CENTER_MGUN_32", az = 114, el = 115, refY =  90, arcs = port_oer_arcs }, -- ( 10.50, -13.37)
    { mgun = 33, area = "HULL_CENTER_PORT", center = "CENTER_MGUN_33", az = 116, el = 117, refY =  90, arcs = port_oer_arcs }, -- ( 22.30, -13.87)
    { mgun = 34, area = "HULL_CENTER_PORT", center = "CENTER_MGUN_34", az = 118, el = 119, refY =  90, arcs = port_oer_arcs }, -- ( 28.30, -13.87)
    { mgun = 35, area = "HULL_BOW_PORT",    center = "CENTER_MGUN_35", az = 120, el = 121, refY =  90, arcs = port_oer_arcs }, -- ( 34.30, -13.87)
    { mgun = 36, area = "HULL_BOW_PORT",    center = "CENTER_MGUN_36", az = 122, el = 123, refY =  90, arcs = port_oer_arcs }, -- ( 58.30, -11.62)
    -- Oer20_24: Bow port (76.15, 11.18, -2.85), parks 0 deg; from 150 (port quarter) round to -60 (stbd bow)
    { mgun = 37, area = "HULL_BOW_PORT",    center = "CENTER_MGUN_37", az = 124, el = 125, refY =   0,
      arcs = { {math.rad(150), math.rad(-60), math.rad(-10), math.rad(85)} } },
}

local RECOIL_ARG_BASE = 159   -- recoil arg = 159 + MGUN index

local function add_mounts(list, proto, recoil_time)
    for _, m in ipairs(list) do
        ws = GT_t.inc_ws()
        GT.WS[ws] = {}
        set_recursive_metatable(GT.WS[ws], proto)
        GT.WS[ws].area              = m.area
        GT.WS[ws].center            = m.center
        GT.WS[ws].drawArgument1     = m.az
        GT.WS[ws].drawArgument2     = m.el
        GT.WS[ws].angles            = m.arcs
        GT.WS[ws].reference_angle_Y = math.rad(m.refY)
        GT.encyclopediaAnimation.args[m.az] = m.refY / 180   -- show parked heading

        -- Independent LN & BR tables per mount (prevents metatable aliasing!)
        GT.WS[ws].LN = { [1] = {} }
        set_recursive_metatable(GT.WS[ws].LN[1], proto.LN[1])
        local br = {}
        for k = 1, (m.barrels or 1) do
            br[k] = {
                connector_name = string.format("POINT_MGUN_%d_%d", m.mgun, k),
                recoilArgument = RECOIL_ARG_BASE + m.mgun,
                recoilTime     = recoil_time,
            }
        end
        GT.WS[ws].LN[1].BR = br

        if m.dirs then
            local trackers = {}
            for _, dir_ws in ipairs(m.dirs) do
                table.insert(trackers, {{"self", dir_ws}})
            end
            table.insert(trackers, {{"none"}})
            GT.WS[ws].LN[1].depends_on_unit = trackers
        end
    end
end

-- Order matters for the sounder (Sounds/Sounders/GroundUnits/WeaponSystem/Navy/uss_independence.lua):
-- gun turrets 1..2 = quad 40mm, 3..13 = twin 40mm, 14..37 = Oerlikon (directors carry no sound)
add_mounts(quad_40,     GT_t.WS_t.cvl22_bofors_quad, 0.25)
add_mounts(twin_40,     GT_t.WS_t.cvl22_bofors_twin, 0.25)
add_mounts(oerlikon_20, GT_t.WS_t.cvl22_oerlikon,    0.10)

-- ==============================================================================
-- 5. CLASSIFICATION & SENSORS
-- ==============================================================================
GT.Name = "uss_independence"
GT.DisplayName = _("[PTO43] CVL-22 USS Independence")
GT.DisplayNameShort = _("CVL-22")

GT.Sensors = {
    OPTIC = {"long-range naval optics", "long-range air defence optics"},
    RADAR = {"carrier search radar"},
}

GT.sensor = {}
set_recursive_metatable(GT.sensor, GT_t.SN_visual)
GT.sensor.height = 30.0
GT.sensor.max_range_finding_target = 35000

GT.DetectionRange = GT.airFindDist
GT.ThreatRange = GT.airWeaponDist
GT.Singleton = "no"
GT.mapclasskey = "P0091000065"

-- same carrier attributes as the other PTO'43 carriers (free deck take-off for WWII aircraft)
GT.attribute = {
    wsType_Navy, wsType_Ship, wsType_AirCarrier, WSTYPE_PLACEHOLDER,
    "Aircraft Carriers",
    "Arresting Gear",
    "catapult",
    "ski_jump",
}

GT.Categories = {
    {name = "AircraftCarrier"},
    {name = "AircraftCarrier With Catapult"},
    {name = "AircraftCarrier With Tramplin"},
    {name = "Armed Ship"},
    {name = "AircraftCarrier With Arresting Gear"},
}

GT.tags = { "Carrier" }
GT.Countries = {"USA"}

GT.shape_table_data =
{
    {
        file        = GT.visual.shape,
        username    = GT.Name,
        desrt       = GT.visual.shape_dstr,
        classname   = "lLandShip",
        positioning = "BYNORMAL",
    },
}

dofile(current_mod_path .. "/Scripts/uss_independence_RunwaysAndRoutes.lua")

add_surface_unit(GT)
