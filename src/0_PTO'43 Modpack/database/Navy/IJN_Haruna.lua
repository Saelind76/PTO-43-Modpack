-- ============================================================================
-- IJN Haruna (1944) — Kongo-Class Fast Battleship (Imperial Japanese Navy)
-- ============================================================================


GT = {}
GT_t.ws = 0
set_recursive_metatable(GT, GT_t.generic_ship)

GT.visual = {
    shape      = "HARUNA",
    shape_dstr = "",
    fire_pos   = { 0, 8, 0 },
}

GT.life               = 42000
GT.mass               = 3.66e+007
GT.max_velocity       = 15.6   -- ~30.3 knots
GT.race_velocity      = 15.6
GT.economy_velocity   = 9.26   -- ~18 knots
GT.propeller_omega_max = 320.0
GT.economy_distance   = 1.85e+007
GT.race_distance      = 5.5e+006

GT.shipLength         = 222.0
GT.Length             = 221.8
GT.Width              = 31.0
GT.Height             = 48.8
GT.DeckLevel          = 7.5
GT.draft              = 9.0
GT.X_nose             = 110.8
GT.X_tail             = -111.0
GT.Tail_Width         = 10.4

GT.Gamma_max          = 0.25
GT.Om                 = 0.025
GT.speedup            = 0.09
GT.R_min              = 650.0
GT.distFindObstacles  = 900.0
GT.RCS                = 85000
GT.IR_emission_coeff  = 1.2

GT.propellor_arg      = 8
GT.propellor_speed    = 3.0
GT.rudder_arg         = -1

GT.animation_arguments = {
    water_propeller = 8,
    rudder          = -1,
    nav_lights      = -1,
    radar1_rotation = 11,
    radar2_rotation = -1,
    radar3_rotation = -1,
}
GT.radar1_period = 4.0

GT.exhaust = {
    [1] = { size = 0.72, pos = {  8.85, 24.08, -0.01 } },   -- halved from 1.45 (2026-11-25)
    [2] = { size = 0.72, pos = { -6.13, 24.00,  0.00 } },
}

GT.airWeaponDist = 14800
GT.airFindDist   = 45000
GT.DetectionRange = GT.airFindDist
GT.ThreatRange    = GT.airWeaponDist
GT.Singleton      = "no"

GT.sensor = {
    max_range_finding_target = 45000,
    min_range_finding_target = 0,
    max_alt_finding_target   = 14000,
    min_alt_finding_target   = 0,
    height                   = 42.0,
    pos                      = { 30.0, 42.0, 0.0 },
}
GT.Sensors = {
    OPTIC = { "long-range naval optics", "long-range air defence optics" },
    RADAR = { "albatros search radar" },
}
GT.mapclasskey = "P0091000067"
GT.attribute = { wsType_Navy, wsType_Ship, wsType_ArmedShip, WSTYPE_PLACEHOLDER, "Cruisers", "Armed Air Defence", "RADAR_BAND1_FOR_ARM", "RADAR_BAND2_FOR_ARM", "DetectionByAWACS" }
GT.Categories = { { name = "Armed Ship" } }
GT.tags = { "Battleship" }

-- Damage Model (20 Watertight Collision Shells from Haruna_collision.edm)
GT.DM = {
    { area_name = "HULL_BOW_STARBOARD",  area_arg = -1, area_life = 1400, armour = {width = 0.080}, area_fire = { pos = {  75.0, 2.0,  4.0 }, size = 1.8 } },
    { area_name = "HULL_BOW_PORT",       area_arg = -1, area_life = 1400, armour = {width = 0.080}, area_fire = { pos = {  75.0, 2.0, -4.0 }, size = 1.8 } },
    { area_name = "HULL_MID_STARBOARD",  area_arg = -1, area_life = 2800, armour = {width = 0.203}, area_fire = { pos = {   0.0, 2.5,  8.0 }, size = 2.2 } },
    { area_name = "HULL_MID_PORT",       area_arg = -1, area_life = 2800, armour = {width = 0.203}, area_fire = { pos = {   0.0, 2.5, -8.0 }, size = 2.2 } },
    { area_name = "HULL_AFT_STARBOARD",  area_arg = -1, area_life = 1400, armour = {width = 0.080}, area_fire = { pos = { -75.0, 2.0,  4.0 }, size = 1.8 } },
    { area_name = "HULL_AFT_PORT",       area_arg = -1, area_life = 1400, armour = {width = 0.080}, area_fire = { pos = { -75.0, 2.0, -4.0 }, size = 1.8 } },
    { area_name = "COMMAND",             area_arg = -1, area_life = 1100, armour = {width = 0.150}, area_fire = { pos = {  30.0, 15.0, 0.0 }, size = 1.6 } },
    { area_name = "SUPERSTR_1",          area_arg = -1, area_life = 700,  armour = {width = 0.040}, area_fire = { pos = {  30.0, 30.0, 0.0 }, size = 1.4 } },
    { area_name = "CHIMNEY",             area_arg = -1, area_life = 600,  armour = {width = 0.030}, area_fire = { pos = {   2.0, 18.0, 0.0 }, size = 1.8 } },
    { area_name = "SUPERSTR_2",          area_arg = -1, area_life = 600,  armour = {width = 0.035}, area_fire = { pos = { -12.0, 11.0, 0.0 }, size = 1.4 } },
    { area_name = "SUPERSTR_3",          area_arg = -1, area_life = 600,  armour = {width = 0.035}, area_fire = { pos = {   0.0, 11.0, 0.0 }, size = 1.4 } },
    { area_name = "CATAPULT_DECK",       area_arg = -1, area_life = 350,  armour = {width = 0.020}, area_fire = { pos = { -44.0,  6.5, 0.0 }, size = 1.2 } },
    { area_name = "TURRET_1",            area_arg = -1, area_life = 950,  armour = {width = 0.229}, area_fire = { pos = {  63.4,  9.5, 0.0 }, size = 1.4 } },
    { area_name = "TURRET_2",            area_arg = -1, area_life = 950,  armour = {width = 0.229}, area_fire = { pos = {  50.5, 12.2, 0.0 }, size = 1.4 } },
    { area_name = "TURRET_3",            area_arg = -1, area_life = 950,  armour = {width = 0.229}, area_fire = { pos = { -27.9, 10.5, 0.0 }, size = 1.4 } },
    { area_name = "TURRET_4",            area_arg = -1, area_life = 950,  armour = {width = 0.229}, area_fire = { pos = { -68.4,  7.5, 0.0 }, size = 1.4 } },
    { area_name = "SEC_GUN_PORT_FWD",      area_arg = -1, area_life = 400, armour = {width = 0.040}, area_fire = { pos = {  12.0, 8.0, -9.5 }, size = 1.0 } },
    { area_name = "SEC_GUN_STARBOARD_FWD", area_arg = -1, area_life = 400, armour = {width = 0.040}, area_fire = { pos = {  12.0, 8.0,  9.5 }, size = 1.0 } },
    { area_name = "SEC_GUN_PORT_AFT",      area_arg = -1, area_life = 400, armour = {width = 0.040}, area_fire = { pos = { -22.0, 8.0, -9.5 }, size = 1.0 } },
    { area_name = "SEC_GUN_STARBOARD_AFT", area_arg = -1, area_life = 400, armour = {width = 0.040}, area_fire = { pos = { -22.0, 8.0,  9.5 }, size = 1.0 } },
}

GT.WS = {}
GT.WS.maxTargetDetectionRange = 45000
GT.WS.radar_type              = 103
GT.WS.searchRadarMaxElevation = math.rad(60)
GT.WS.searchRadarFrequencies  = {{50.0e6, 54.0e6}, {2.0e9, 2.2e9}}
local ws

-- Directors
ws = GT_t.inc_ws(); local ws_dir_main = ws
GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_DCT_Type94_Main)
GT.WS[ws].pos = { 30.0, 42.0, 0.0 }; GT.WS[ws].area = "SUPERSTR_1"; GT.WS[ws].drawArgument1 = 12; GT.WS[ws].moveable = true; GT.WS[ws].reference_angle_Y = 0
GT.WS[ws].angles = { { math.rad(180), math.rad(-180), math.rad(-10), math.rad(85) } }

ws = GT_t.inc_ws(); local ws_dir_aa = ws
GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_DCT_Type94_AA)
GT.WS[ws].pos = { -15.0, 18.0, 0.0 }; GT.WS[ws].area = "SUPERSTR_2"
GT.WS[ws].angles = { { math.rad(180), math.rad(-180), math.rad(-10), math.rad(85) } }

local main_trackers = { {{"self", ws_dir_main}}, {{"self", ws_dir_aa}}, {{"none"}} }
local aa_trackers   = { {{"self", ws_dir_aa}},   {{"self", ws_dir_main}}, {{"none"}} }

-- 4x Twin 356mm/45 Type 41 Main Turrets
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_356mm_Type41_Twin)
GT.WS[ws].pos = { 60.098, 7.771, 0.008 }; GT.WS[ws].area = "TURRET_1"; GT.WS[ws].drawArgument1 = 13; GT.WS[ws].drawArgument2 = 14; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(145), math.rad(-145), math.rad(-5), math.rad(43) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_356mm_Type41_Twin.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_356_1_L" }, { connector_name = "POINT_GUN_356_1_R" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_356mm_Type41_Twin)
GT.WS[ws].pos = { 47.155, 10.579, 0.007 }; GT.WS[ws].area = "TURRET_2"; GT.WS[ws].drawArgument1 = 15; GT.WS[ws].drawArgument2 = 16; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(145), math.rad(-145), math.rad(-5), math.rad(43) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_356mm_Type41_Twin.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_356_2_L" }, { connector_name = "POINT_GUN_356_2_R" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_356mm_Type41_Twin)
GT.WS[ws].pos = { -24.561, 8.899, 0.007 }; GT.WS[ws].area = "TURRET_3"; GT.WS[ws].drawArgument1 = 17; GT.WS[ws].drawArgument2 = 18; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(180); GT.WS[ws].angles = { { math.rad(180), math.rad(35), math.rad(-5), math.rad(43) }, { math.rad(-35), math.rad(-180), math.rad(-5), math.rad(43) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_356mm_Type41_Twin.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_356_3_L" }, { connector_name = "POINT_GUN_356_3_R" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_356mm_Type41_Twin)
GT.WS[ws].pos = { -65.046, 5.818, 0.134 }; GT.WS[ws].area = "TURRET_4"; GT.WS[ws].drawArgument1 = 19; GT.WS[ws].drawArgument2 = 20; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(180); GT.WS[ws].angles = { { math.rad(180), math.rad(35), math.rad(-5), math.rad(43) }, { math.rad(-35), math.rad(-180), math.rad(-5), math.rad(43) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_356mm_Type41_Twin.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_356_4_L" }, { connector_name = "POINT_GUN_356_4_R" } }

-- 14x 152mm/50 Type 41 Secondary Casemates
-- (this header line was "/50 Type 41 ..." without "--": Lua syntax error, the whole ship failed to load)
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_152mm_Type41_Single)
GT.WS[ws].pos = { 48.080, 5.447, 10.456 }; GT.WS[ws].area = "SEC_GUN_STARBOARD_FWD"; GT.WS[ws].drawArgument1 = 33; GT.WS[ws].drawArgument2 = 34; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(-35); GT.WS[ws].angles = { { math.rad(-35), math.rad(-145), math.rad(-5), math.rad(25) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_152mm_Type41_Single.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_152_01_Port" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_152mm_Type41_Single)
GT.WS[ws].pos = { 48.080, 5.447, -10.456 }; GT.WS[ws].area = "SEC_GUN_PORT_FWD"; GT.WS[ws].drawArgument1 = 35; GT.WS[ws].drawArgument2 = 36; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(35); GT.WS[ws].angles = { { math.rad(145), math.rad(35), math.rad(-5), math.rad(25) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_152mm_Type41_Single.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_152_02_Starboard" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_152mm_Type41_Single)
GT.WS[ws].pos = { 35.552, 5.447, 11.783 }; GT.WS[ws].area = "SEC_GUN_STARBOARD_FWD"; GT.WS[ws].drawArgument1 = 37; GT.WS[ws].drawArgument2 = 38; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(-60); GT.WS[ws].angles = { { math.rad(-35), math.rad(-145), math.rad(-5), math.rad(25) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_152mm_Type41_Single.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_152_03_Port" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_152mm_Type41_Single)
GT.WS[ws].pos = { 35.552, 5.447, -11.783 }; GT.WS[ws].area = "SEC_GUN_PORT_FWD"; GT.WS[ws].drawArgument1 = 39; GT.WS[ws].drawArgument2 = 40; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(60); GT.WS[ws].angles = { { math.rad(145), math.rad(35), math.rad(-5), math.rad(25) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_152mm_Type41_Single.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_152_04_Starboard" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_152mm_Type41_Single)
GT.WS[ws].pos = { 20.110, 5.447, 12.337 }; GT.WS[ws].area = "SEC_GUN_STARBOARD_FWD"; GT.WS[ws].drawArgument1 = 41; GT.WS[ws].drawArgument2 = 42; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(-60); GT.WS[ws].angles = { { math.rad(-35), math.rad(-145), math.rad(-5), math.rad(25) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_152mm_Type41_Single.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_152_05_Port" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_152mm_Type41_Single)
GT.WS[ws].pos = { 20.110, 5.447, -12.337 }; GT.WS[ws].area = "SEC_GUN_PORT_FWD"; GT.WS[ws].drawArgument1 = 43; GT.WS[ws].drawArgument2 = 44; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(60); GT.WS[ws].angles = { { math.rad(145), math.rad(35), math.rad(-5), math.rad(25) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_152mm_Type41_Single.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_152_06_Starboard" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_152mm_Type41_Single)
GT.WS[ws].pos = { 4.957, 5.447, 12.509 }; GT.WS[ws].area = "SEC_GUN_STARBOARD_FWD"; GT.WS[ws].drawArgument1 = 45; GT.WS[ws].drawArgument2 = 46; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(-120); GT.WS[ws].angles = { { math.rad(-35), math.rad(-145), math.rad(-5), math.rad(25) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_152mm_Type41_Single.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_152_07_Port" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_152mm_Type41_Single)
GT.WS[ws].pos = { 4.957, 5.447, -12.509 }; GT.WS[ws].area = "SEC_GUN_PORT_FWD"; GT.WS[ws].drawArgument1 = 47; GT.WS[ws].drawArgument2 = 48; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(120); GT.WS[ws].angles = { { math.rad(145), math.rad(35), math.rad(-5), math.rad(25) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_152mm_Type41_Single.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_152_08_Starboard" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_152mm_Type41_Single)
GT.WS[ws].pos = { -8.401, 5.447, 12.509 }; GT.WS[ws].area = "SEC_GUN_STARBOARD_AFT"; GT.WS[ws].drawArgument1 = 49; GT.WS[ws].drawArgument2 = 50; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(-120); GT.WS[ws].angles = { { math.rad(-35), math.rad(-145), math.rad(-5), math.rad(25) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_152mm_Type41_Single.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_152_09_Port" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_152mm_Type41_Single)
GT.WS[ws].pos = { -8.401, 5.447, -12.509 }; GT.WS[ws].area = "SEC_GUN_PORT_AFT"; GT.WS[ws].drawArgument1 = 51; GT.WS[ws].drawArgument2 = 52; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(120); GT.WS[ws].angles = { { math.rad(145), math.rad(35), math.rad(-5), math.rad(25) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_152mm_Type41_Single.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_152_10_Starboard" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_152mm_Type41_Single)
GT.WS[ws].pos = { -22.124, 5.447, 11.632 }; GT.WS[ws].area = "SEC_GUN_STARBOARD_AFT"; GT.WS[ws].drawArgument1 = 53; GT.WS[ws].drawArgument2 = 54; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(-145); GT.WS[ws].angles = { { math.rad(-35), math.rad(-145), math.rad(-5), math.rad(25) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_152mm_Type41_Single.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_152_11_Port" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_152mm_Type41_Single)
GT.WS[ws].pos = { -22.124, 5.447, -11.632 }; GT.WS[ws].area = "SEC_GUN_PORT_AFT"; GT.WS[ws].drawArgument1 = 55; GT.WS[ws].drawArgument2 = 56; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(145); GT.WS[ws].angles = { { math.rad(145), math.rad(35), math.rad(-5), math.rad(25) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_152mm_Type41_Single.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_152_12_Starboard" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_152mm_Type41_Single)
GT.WS[ws].pos = { -31.236, 5.447, 9.758 }; GT.WS[ws].area = "SEC_GUN_STARBOARD_AFT"; GT.WS[ws].drawArgument1 = 57; GT.WS[ws].drawArgument2 = 58; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(-145); GT.WS[ws].angles = { { math.rad(-35), math.rad(-145), math.rad(-5), math.rad(25) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_152mm_Type41_Single.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_152_13_Port" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_152mm_Type41_Single)
GT.WS[ws].pos = { -31.236, 5.447, -9.758 }; GT.WS[ws].area = "SEC_GUN_PORT_AFT"; GT.WS[ws].drawArgument1 = 59; GT.WS[ws].drawArgument2 = 60; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(145); GT.WS[ws].angles = { { math.rad(145), math.rad(35), math.rad(-5), math.rad(25) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_152mm_Type41_Single.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = main_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_152_14_Starboard" } }

-- 6x Twin 127mm/40 Type 89 Heavy AA
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_127mm_Type89_Twin)
GT.WS[ws].pos = { 26.470, 8.810, 10.420 }; GT.WS[ws].area = "SEC_GUN_STARBOARD_FWD"; GT.WS[ws].drawArgument1 = 21; GT.WS[ws].drawArgument2 = 22; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-15), math.rad(-165), math.rad(-8), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_127mm_Type89_Twin.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = aa_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_127_01_Fwd_Port_L" }, { connector_name = "POINT_GUN_127_01_Fwd_Port_R" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_127mm_Type89_Twin)
GT.WS[ws].pos = { 26.470, 8.810, -10.420 }; GT.WS[ws].area = "SEC_GUN_PORT_FWD"; GT.WS[ws].drawArgument1 = 23; GT.WS[ws].drawArgument2 = 24; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(165), math.rad(15), math.rad(-8), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_127mm_Type89_Twin.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = aa_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_127_02_Fwd_Starboard_L" }, { connector_name = "POINT_GUN_127_02_Fwd_Starboard_R" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_127mm_Type89_Twin)
GT.WS[ws].pos = { 12.020, 8.810, 11.920 }; GT.WS[ws].area = "SEC_GUN_STARBOARD_FWD"; GT.WS[ws].drawArgument1 = 25; GT.WS[ws].drawArgument2 = 26; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-15), math.rad(-165), math.rad(-8), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_127mm_Type89_Twin.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = aa_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_127_03_Mid_Port_L" }, { connector_name = "POINT_GUN_127_03_Mid_Port_R" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_127mm_Type89_Twin)
GT.WS[ws].pos = { 12.020, 8.810, -11.920 }; GT.WS[ws].area = "SEC_GUN_PORT_FWD"; GT.WS[ws].drawArgument1 = 27; GT.WS[ws].drawArgument2 = 28; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(165), math.rad(15), math.rad(-8), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_127mm_Type89_Twin.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = aa_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_127_04_Mid_Starboard_L" }, { connector_name = "POINT_GUN_127_04_Mid_Starboard_R" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_127mm_Type89_Twin)
GT.WS[ws].pos = { 1.550, 11.310, 6.200 }; GT.WS[ws].area = "SEC_GUN_STARBOARD_FWD"; GT.WS[ws].drawArgument1 = 29; GT.WS[ws].drawArgument2 = 30; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-15), math.rad(-165), math.rad(-8), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_127mm_Type89_Twin.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = aa_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_127_05_Aft_Port_L" }, { connector_name = "POINT_GUN_127_05_Aft_Port_R" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_127mm_Type89_Twin)
GT.WS[ws].pos = { 1.550, 11.310, -6.210 }; GT.WS[ws].area = "SEC_GUN_PORT_FWD"; GT.WS[ws].drawArgument1 = 31; GT.WS[ws].drawArgument2 = 32; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(165), math.rad(15), math.rad(-8), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_127mm_Type89_Twin.LN[1])
-- GT.WS[ws].LN[1].depends_on_unit = aa_trackers
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_127_06_Aft_Starboard_L" }, { connector_name = "POINT_GUN_127_06_Aft_Starboard_R" } }

-- 25mm Type 96 Light AA (Triple & Twin)
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { 45.302, 13.830, 1.857 }; GT.WS[ws].area = "COMMAND"; GT.WS[ws].drawArgument1 = 77; GT.WS[ws].drawArgument2 = 123; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(45), math.rad(-155), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_01_1" }, { connector_name = "POINT_GUN_25_TRIPLE_01_2" }, { connector_name = "POINT_GUN_25_TRIPLE_01_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { 45.302, 13.830, -1.843 }; GT.WS[ws].area = "COMMAND"; GT.WS[ws].drawArgument1 = 78; GT.WS[ws].drawArgument2 = 124; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(155), math.rad(-45), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_02_1" }, { connector_name = "POINT_GUN_25_TRIPLE_02_2" }, { connector_name = "POINT_GUN_25_TRIPLE_02_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { 41.645, 16.058, 1.810 }; GT.WS[ws].area = "COMMAND"; GT.WS[ws].drawArgument1 = 79; GT.WS[ws].drawArgument2 = 125; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(45), math.rad(-155), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_03_1" }, { connector_name = "POINT_GUN_25_TRIPLE_03_2" }, { connector_name = "POINT_GUN_25_TRIPLE_03_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { 41.645, 16.058, -1.814 }; GT.WS[ws].area = "COMMAND"; GT.WS[ws].drawArgument1 = 80; GT.WS[ws].drawArgument2 = 126; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(155), math.rad(-45), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_04_1" }, { connector_name = "POINT_GUN_25_TRIPLE_04_2" }, { connector_name = "POINT_GUN_25_TRIPLE_04_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { 40.257, 10.062, 6.264 }; GT.WS[ws].area = "COMMAND"; GT.WS[ws].drawArgument1 = 81; GT.WS[ws].drawArgument2 = 127; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_05_1" }, { connector_name = "POINT_GUN_25_TRIPLE_05_2" }, { connector_name = "POINT_GUN_25_TRIPLE_05_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { 40.257, 10.062, -6.268 }; GT.WS[ws].area = "COMMAND"; GT.WS[ws].drawArgument1 = 82; GT.WS[ws].drawArgument2 = 128; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_06_1" }, { connector_name = "POINT_GUN_25_TRIPLE_06_2" }, { connector_name = "POINT_GUN_25_TRIPLE_06_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { 35.264, 13.260, 3.679 }; GT.WS[ws].area = "COMMAND"; GT.WS[ws].drawArgument1 = 83; GT.WS[ws].drawArgument2 = 129; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_07_1" }, { connector_name = "POINT_GUN_25_TRIPLE_07_2" }, { connector_name = "POINT_GUN_25_TRIPLE_07_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { 35.264, 13.260, -3.683 }; GT.WS[ws].area = "COMMAND"; GT.WS[ws].drawArgument1 = 84; GT.WS[ws].drawArgument2 = 130; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_08_1" }, { connector_name = "POINT_GUN_25_TRIPLE_08_2" }, { connector_name = "POINT_GUN_25_TRIPLE_08_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { 34.261, 10.062, 7.963 }; GT.WS[ws].area = "COMMAND"; GT.WS[ws].drawArgument1 = 85; GT.WS[ws].drawArgument2 = 131; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_09_1" }, { connector_name = "POINT_GUN_25_TRIPLE_09_2" }, { connector_name = "POINT_GUN_25_TRIPLE_09_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { 34.261, 10.062, -7.967 }; GT.WS[ws].area = "COMMAND"; GT.WS[ws].drawArgument1 = 86; GT.WS[ws].drawArgument2 = 132; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_10_1" }, { connector_name = "POINT_GUN_25_TRIPLE_10_2" }, { connector_name = "POINT_GUN_25_TRIPLE_10_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { 29.904, 13.260, 4.068 }; GT.WS[ws].area = "COMMAND"; GT.WS[ws].drawArgument1 = 87; GT.WS[ws].drawArgument2 = 133; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_11_1" }, { connector_name = "POINT_GUN_25_TRIPLE_11_2" }, { connector_name = "POINT_GUN_25_TRIPLE_11_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { 29.904, 13.183, -4.072 }; GT.WS[ws].area = "COMMAND"; GT.WS[ws].drawArgument1 = 88; GT.WS[ws].drawArgument2 = 134; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_12_1" }, { connector_name = "POINT_GUN_25_TRIPLE_12_2" }, { connector_name = "POINT_GUN_25_TRIPLE_12_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { 13.765, 20.605, 2.395 }; GT.WS[ws].area = "CHIMNEY"; GT.WS[ws].drawArgument1 = 89; GT.WS[ws].drawArgument2 = 135; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(45), math.rad(-155), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_13_1" }, { connector_name = "POINT_GUN_25_TRIPLE_13_2" }, { connector_name = "POINT_GUN_25_TRIPLE_13_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { 13.765, 20.605, -2.402 }; GT.WS[ws].area = "CHIMNEY"; GT.WS[ws].drawArgument1 = 90; GT.WS[ws].drawArgument2 = 136; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(155), math.rad(-45), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_14_1" }, { connector_name = "POINT_GUN_25_TRIPLE_14_2" }, { connector_name = "POINT_GUN_25_TRIPLE_14_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { 12.013, 15.009, 3.968 }; GT.WS[ws].area = "CHIMNEY"; GT.WS[ws].drawArgument1 = 91; GT.WS[ws].drawArgument2 = 137; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_15_1" }, { connector_name = "POINT_GUN_25_TRIPLE_15_2" }, { connector_name = "POINT_GUN_25_TRIPLE_15_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { 12.013, 15.009, -3.975 }; GT.WS[ws].area = "CHIMNEY"; GT.WS[ws].drawArgument1 = 92; GT.WS[ws].drawArgument2 = 138; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_16_1" }, { connector_name = "POINT_GUN_25_TRIPLE_16_2" }, { connector_name = "POINT_GUN_25_TRIPLE_16_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { -1.674, 19.106, 3.812 }; GT.WS[ws].area = "SUPERSTR_3"; GT.WS[ws].drawArgument1 = 93; GT.WS[ws].drawArgument2 = 139; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_17_1" }, { connector_name = "POINT_GUN_25_TRIPLE_17_2" }, { connector_name = "POINT_GUN_25_TRIPLE_17_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { -1.674, 19.106, -3.817 }; GT.WS[ws].area = "SUPERSTR_3"; GT.WS[ws].drawArgument1 = 94; GT.WS[ws].drawArgument2 = 140; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_18_1" }, { connector_name = "POINT_GUN_25_TRIPLE_18_2" }, { connector_name = "POINT_GUN_25_TRIPLE_18_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { -8.841, 9.012, 3.813 }; GT.WS[ws].area = "SUPERSTR_2"; GT.WS[ws].drawArgument1 = 95; GT.WS[ws].drawArgument2 = 141; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_19_1" }, { connector_name = "POINT_GUN_25_TRIPLE_19_2" }, { connector_name = "POINT_GUN_25_TRIPLE_19_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { -8.841, 9.012, -3.826 }; GT.WS[ws].area = "SUPERSTR_2"; GT.WS[ws].drawArgument1 = 96; GT.WS[ws].drawArgument2 = 142; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_20_1" }, { connector_name = "POINT_GUN_25_TRIPLE_20_2" }, { connector_name = "POINT_GUN_25_TRIPLE_20_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { -12.052, 18.407, 4.949 }; GT.WS[ws].area = "SUPERSTR_2"; GT.WS[ws].drawArgument1 = 97; GT.WS[ws].drawArgument2 = 143; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_21_1" }, { connector_name = "POINT_GUN_25_TRIPLE_21_2" }, { connector_name = "POINT_GUN_25_TRIPLE_21_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { -12.052, 18.407, -4.957 }; GT.WS[ws].area = "SUPERSTR_2"; GT.WS[ws].drawArgument1 = 98; GT.WS[ws].drawArgument2 = 144; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_22_1" }, { connector_name = "POINT_GUN_25_TRIPLE_22_2" }, { connector_name = "POINT_GUN_25_TRIPLE_22_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { -14.966, 16.040, 4.459 }; GT.WS[ws].area = "SUPERSTR_2"; GT.WS[ws].drawArgument1 = 99; GT.WS[ws].drawArgument2 = 145; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_23_1" }, { connector_name = "POINT_GUN_25_TRIPLE_23_2" }, { connector_name = "POINT_GUN_25_TRIPLE_23_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { -14.966, 16.040, -4.466 }; GT.WS[ws].area = "SUPERSTR_2"; GT.WS[ws].drawArgument1 = 100; GT.WS[ws].drawArgument2 = 146; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_24_1" }, { connector_name = "POINT_GUN_25_TRIPLE_24_2" }, { connector_name = "POINT_GUN_25_TRIPLE_24_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { -18.157, 16.040, 2.985 }; GT.WS[ws].area = "SUPERSTR_2"; GT.WS[ws].drawArgument1 = 101; GT.WS[ws].drawArgument2 = 147; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_25_1" }, { connector_name = "POINT_GUN_25_TRIPLE_25_2" }, { connector_name = "POINT_GUN_25_TRIPLE_25_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { -18.157, 16.040, -2.993 }; GT.WS[ws].area = "SUPERSTR_2"; GT.WS[ws].drawArgument1 = 102; GT.WS[ws].drawArgument2 = 148; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_26_1" }, { connector_name = "POINT_GUN_25_TRIPLE_26_2" }, { connector_name = "POINT_GUN_25_TRIPLE_26_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { -22.190, 12.149, 1.857 }; GT.WS[ws].area = "SUPERSTR_2"; GT.WS[ws].drawArgument1 = 103; GT.WS[ws].drawArgument2 = 149; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(45), math.rad(-155), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_27_1" }, { connector_name = "POINT_GUN_25_TRIPLE_27_2" }, { connector_name = "POINT_GUN_25_TRIPLE_27_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { -22.190, 12.149, -1.843 }; GT.WS[ws].area = "SUPERSTR_2"; GT.WS[ws].drawArgument1 = 104; GT.WS[ws].drawArgument2 = 150; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(155), math.rad(-45), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_28_1" }, { connector_name = "POINT_GUN_25_TRIPLE_28_2" }, { connector_name = "POINT_GUN_25_TRIPLE_28_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { -62.674, 9.068, 1.984 }; GT.WS[ws].area = "CATAPULT_DECK"; GT.WS[ws].drawArgument1 = 105; GT.WS[ws].drawArgument2 = 151; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(45), math.rad(-155), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_29_1" }, { connector_name = "POINT_GUN_25_TRIPLE_29_2" }, { connector_name = "POINT_GUN_25_TRIPLE_29_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Triple)
GT.WS[ws].pos = { -62.674, 9.068, -1.716 }; GT.WS[ws].area = "CATAPULT_DECK"; GT.WS[ws].drawArgument1 = 106; GT.WS[ws].drawArgument2 = 152; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(155), math.rad(-45), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Triple.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TRIPLE_30_1" }, { connector_name = "POINT_GUN_25_TRIPLE_30_2" }, { connector_name = "POINT_GUN_25_TRIPLE_30_3" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Twin)
GT.WS[ws].pos = { 41.793, 6.314, 10.093 }; GT.WS[ws].area = "HULL_BOW_STARBOARD"; GT.WS[ws].drawArgument1 = 61; GT.WS[ws].drawArgument2 = 107; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Twin.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TWIN_01" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Twin)
GT.WS[ws].pos = { 41.793, 6.314, -10.093 }; GT.WS[ws].area = "HULL_BOW_PORT"; GT.WS[ws].drawArgument1 = 62; GT.WS[ws].drawArgument2 = 108; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Twin.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TWIN_02" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Twin)
GT.WS[ws].pos = { 21.497, 25.902, -0.002 }; GT.WS[ws].area = "SUPERSTR_1"; GT.WS[ws].drawArgument1 = 63; GT.WS[ws].drawArgument2 = 109; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(130), math.rad(-130), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Twin.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TWIN_03" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Twin)
GT.WS[ws].pos = { 1.517, 11.611, 2.470 }; GT.WS[ws].area = "SUPERSTR_3"; GT.WS[ws].drawArgument1 = 64; GT.WS[ws].drawArgument2 = 110; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Twin.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TWIN_04" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Twin)
GT.WS[ws].pos = { 1.517, 11.611, -2.477 }; GT.WS[ws].area = "SUPERSTR_3"; GT.WS[ws].drawArgument1 = 65; GT.WS[ws].drawArgument2 = 111; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Twin.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TWIN_05" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Twin)
GT.WS[ws].pos = { -2.692, 6.314, 10.166 }; GT.WS[ws].area = "HULL_MID_STARBOARD"; GT.WS[ws].drawArgument1 = 66; GT.WS[ws].drawArgument2 = 112; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Twin.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TWIN_06" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Twin)
GT.WS[ws].pos = { -2.692, 6.314, -10.166 }; GT.WS[ws].area = "HULL_MID_PORT"; GT.WS[ws].drawArgument1 = 67; GT.WS[ws].drawArgument2 = 113; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Twin.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TWIN_07" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Twin)
GT.WS[ws].pos = { -14.685, 6.314, 10.166 }; GT.WS[ws].area = "HULL_MID_STARBOARD"; GT.WS[ws].drawArgument1 = 68; GT.WS[ws].drawArgument2 = 114; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Twin.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TWIN_08" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Twin)
GT.WS[ws].pos = { -14.685, 6.314, -10.166 }; GT.WS[ws].area = "HULL_MID_PORT"; GT.WS[ws].drawArgument1 = 69; GT.WS[ws].drawArgument2 = 115; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Twin.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TWIN_09" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Twin)
GT.WS[ws].pos = { -18.804, 6.314, 6.516 }; GT.WS[ws].area = "HULL_MID_STARBOARD"; GT.WS[ws].drawArgument1 = 70; GT.WS[ws].drawArgument2 = 116; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Twin.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TWIN_10" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Twin)
GT.WS[ws].pos = { -54.691, 3.829, 9.218 }; GT.WS[ws].area = "HULL_AFT_STARBOARD"; GT.WS[ws].drawArgument1 = 71; GT.WS[ws].drawArgument2 = 117; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Twin.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TWIN_11" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Twin)
GT.WS[ws].pos = { -54.691, 3.829, -9.218 }; GT.WS[ws].area = "HULL_AFT_PORT"; GT.WS[ws].drawArgument1 = 72; GT.WS[ws].drawArgument2 = 118; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Twin.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TWIN_12" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Twin)
GT.WS[ws].pos = { -58.660, 3.829, 8.821 }; GT.WS[ws].area = "HULL_AFT_STARBOARD"; GT.WS[ws].drawArgument1 = 73; GT.WS[ws].drawArgument2 = 119; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Twin.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TWIN_13" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Twin)
GT.WS[ws].pos = { -58.660, 3.829, -8.821 }; GT.WS[ws].area = "HULL_AFT_PORT"; GT.WS[ws].drawArgument1 = 74; GT.WS[ws].drawArgument2 = 120; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Twin.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TWIN_14" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Twin)
GT.WS[ws].pos = { -63.088, 3.856, 8.165 }; GT.WS[ws].area = "HULL_AFT_STARBOARD"; GT.WS[ws].drawArgument1 = 75; GT.WS[ws].drawArgument2 = 121; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(-10), math.rad(-170), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Twin.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TWIN_15" } }
ws = GT_t.inc_ws(); GT.WS[ws] = {}; set_recursive_metatable(GT.WS[ws], GT_t.WS_t.JP_25mm_Type96_Twin)
GT.WS[ws].pos = { -63.088, 3.856, -8.165 }; GT.WS[ws].area = "HULL_AFT_PORT"; GT.WS[ws].drawArgument1 = 76; GT.WS[ws].drawArgument2 = 122; GT.WS[ws].reference_angle_Z = 0; GT.WS[ws].reference_angle_Y = math.rad(0); GT.WS[ws].angles = { { math.rad(170), math.rad(10), math.rad(-10), math.rad(85) } }
GT.WS[ws].LN = { [1] = {} }; set_recursive_metatable(GT.WS[ws].LN[1], GT_t.WS_t.JP_25mm_Type96_Twin.LN[1])
GT.WS[ws].LN[1].BR = { { connector_name = "POINT_GUN_25_TWIN_16" } }


-- ---------------------------------------------------------------------------
-- Gun rig (HARUNA_V1.5 EDM, 2026-11-25): traverse arg 0 = bow (+1 = +180 toward port),
-- elevation arg 0 = horizontal (+1 = +90). Shells leave from the muzzle connectors and each
-- barrel recoils on arg 160 + gun index (gun index = order of gun mounts above, directors excluded):
--   161-164 356mm, 165-178 152mm, 179-184 127mm, 185-214 25mm triple, 215-230 25mm twin
-- Set here per mount (not in Weapons/guns.lua: the JP_* templates are globals shared with other mods).
-- ---------------------------------------------------------------------------
local RECOIL_ARG_BASE = 160
local RECOIL_TIME = { JP_356mm_Type41_Twin = 1.2, JP_152mm_Type41_Single = 0.6, JP_127mm_Type89_Twin = 0.5,
                      JP_25mm_Type96_Triple = 0.1, JP_25mm_Type96_Twin = 0.1 }
local gun_n = 0
for i = 1, #GT.WS do
    local w = GT.WS[i]
    local ln = w.LN and w.LN[1]
    if ln and ln.BR then   -- (no rawget: DCS's sandbox doesn't expose it; templates carry no BR, so this is guns only)
        gun_n = gun_n + 1
        ln.connectorFire = true
        for _, br in ipairs(ln.BR) do
            br.recoilArgument = RECOIL_ARG_BASE + gun_n
            br.recoilTime = RECOIL_TIME[w.name] or 0.2
        end
    end
end

GT.Name          = "IJN_Haruna"
GT.DisplayName   = _("[PTO43] IJN Battleship Haruna (1944)")
GT.DisplayNameShort = _("Haruna")
GT.Rate          = 5500
GT.Countries     = { "Japan", "Combined Joint Task Forces Red", "Combined Joint Task Forces Blue" }

GT.shape_table_data = {
    {
        file        = GT.visual.shape,
        username    = GT.Name,
        desrt       = GT.visual.shape_dstr,
        classname   = "lLandShip",
        positioning = "BYNORMAL",
    },
}

add_surface_unit(GT)
return GT
