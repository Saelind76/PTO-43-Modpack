--See doc for 3rd party attributions and license information.
-- Ported from Community PTO Pack (Pikey). Values formerly computed by the Community
-- db_units_ships.lua helper (life, handling, shape table) are baked in below.
-- Weapon templates (5"/38 Mk 28, 40 mm Bofors Mk 1) came from the Community
-- Weapons_templates.lua; they are defined locally here and fire [PTO'43] ammo.

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)

GT.visual = {}
GT.visual.shape = "Cimarron_Oiler"
GT.visual.shape_dstr = "Cimarron_Oiler_sunk"
GT.Name = "Cimarron_Oiler"
GT.DisplayName = _("[PTO43] T2 Cimarron Oiler")
GT.DisplayNameShort = _("T2")
GT.Singleton   ="no";
GT.mapclasskey		= "P0091000039"; --map icon for ship symbol
GT.attribute = {wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericLightArmoredShip,
                    "Cruisers",
                    "RADAR_BAND1_FOR_ARM",
                    "DetectionByAWACS",
				};
GT.Categories = {{name = "Armed Ship"},};
GT.tags         = {"Support"};
GT.animation_arguments.radar2_rotation = 2 --the little ring type antennae
GT.radar2_period = 1
GT.animation_arguments.luna_lights = -1
GT.animation_arguments.water_propeller = 65
GT.ship_class = "Civil"
GT.life = 988
GT.Rate = 988
GT.mass              = 2.43e+007      -- kg (~24,300 t full load)
GT.max_velocity      = 8.8            -- m/s ~ 17 kt
GT.race_velocity     = 7.7            -- m/s ~ 15 kt
GT.economy_velocity  = 5.7            -- m/s ~ 11 kt
GT.economy_distance  = 2.4e+007       -- m ~ 13,000 nmi @ 11 kt
GT.race_distance     = 1.5e+007       -- m ~ 8,000 nmi @ 15 kt
GT.Length = 154
GT.shipLength = 154
GT.Width = 20.65
GT.Height = 25.6
GT.DeckLevel = 7.2
GT.X_nose = 83.0
GT.X_tail = -71.3
GT.Tail_Width = 20.65
GT.R_min = 539.0;
GT.Om = 0.0292;
GT.speedup = 0.0584;
GT.Gamma_max = 0.30;
GT.distFindObstacles = 246.4;
GT.exhaust =
{
	[1] = { size = 0.90 , pos = {-53 , 19.3, 0.0 } },
}

GT.shape_table_data = {
    {
        file        = GT.visual.shape,
        username    = GT.Name,
        desrt       = GT.visual.shape_dstr,
        classname   = "lLandShip",
        positioning = "BYNORMAL",
    },
    {
        name = GT.visual.shape_dstr,
        file = GT.visual.shape_dstr,
    },
}

--SENSORS
GT.airWeaponDist = 1000
GT.airFindDist = 1500
GT.DetectionRange = GT.airFindDist
GT.ThreatRange = GT.airWeaponDist
GT.sensor = {
	max_range_finding_target = GT.airFindDist,
	min_range_finding_target = 0,
	max_alt_finding_target   = 5000,
	min_alt_finding_target   = 0,
	pos = {  0.0, 15.0, 0.0 },
}
GT.Sensors = {  OPTIC = {"long-range naval optics", }, };

GT.DM = {
    { area_name = "BOW", 					area_arg = 74,	area_life = 100, area_fire = { pos = {37.0,  6.0, 0}, size = 0.2}},
    { area_name = "MIDSHIPS", 				area_arg = 75,	area_life = 100, area_fire = { pos = {9, 3.6, 0}, size = 0.1}},
	{ area_name = "STERN",          		area_arg = 77,	area_life = 60,  area_fire = { pos = {-25, 6.0, 0.0}, size = 0.2}},
	{ area_name = "Strutture_Poppa",        area_arg = 82,	area_life = 200, area_fire = { pos = {-49.0, 6.0, 0.0}, size = 0.4}},
	{ area_name = "Sala_Comando",	        area_arg = 83,	area_life = 150, area_fire = { pos = {21.4, 6.0, 0.0}, size = 0.3}},
	{ area_name = "Torre_380_Anton",	    area_arg = 83,	area_life = 150, area_fire = { pos = {62, 6.0, 0.0}, size = 0.3}},
}

--ANGLES
local rearwardMainGun = {
  { math.rad(180),  math.rad(45),  math.rad(-5), math.rad(43) },   -- port-rear
  { math.rad(-45),  math.rad(-180), math.rad(-5), math.rad(43) }  -- starboard-rear
}
local portAA          = {{math.rad(180), math.rad(0),    math.rad(-8), math.rad(85)}}
local stbdAA          = {{math.rad(0),   math.rad(-180), math.rad(-8), math.rad(85)}}
local facePort    = math.rad(90)
local faceStbd    = math.rad(-90)
local faceAft     = math.rad(180)

---------------------------------------------------------------------
-- Local weapon templates (from Community Weapons_templates.lua)
---------------------------------------------------------------------
-- 40 mm Bofors Mk 1 single
local WS_Cimarron_Bofors = {name = "40 mm Bofors Mk 1"}
WS_Cimarron_Bofors.angles = {
    {math.rad(180), math.rad(-180), math.rad(-5), math.rad(90)},
};
WS_Cimarron_Bofors.omegaY = math.rad(60)
WS_Cimarron_Bofors.omegaZ = math.rad(40)
WS_Cimarron_Bofors.pidY = {p=300, i = 0.05, d = 10.0, inn = 1000};
WS_Cimarron_Bofors.pidZ = {p=300, i = 0.05, d = 10.0, inn = 1000};
WS_Cimarron_Bofors.LN = {}
WS_Cimarron_Bofors.LN[1] = {}
WS_Cimarron_Bofors.LN[1].type = 3
WS_Cimarron_Bofors.LN[1].distanceMin = 10
WS_Cimarron_Bofors.LN[1].distanceMax = 3160
WS_Cimarron_Bofors.LN[1].max_trg_alt = 2800
WS_Cimarron_Bofors.LN[1].reactionTime = 1.8
WS_Cimarron_Bofors.LN[1].sensor = {}
set_recursive_metatable(WS_Cimarron_Bofors.LN[1].sensor, GT_t.WSN_t[3])
WS_Cimarron_Bofors.LN[1].PL = {}
WS_Cimarron_Bofors.LN[1].PL[1] = {}
WS_Cimarron_Bofors.LN[1].PL[1].ammo_capacity = 400;
WS_Cimarron_Bofors.LN[1].PL[1].shell_display_name = "40mm HE";
WS_Cimarron_Bofors.LN[1].PL[1].shell_name = {"PTO_40mm_Bofors_HE"};
WS_Cimarron_Bofors.LN[1].PL[1].shot_delay = 60/120
WS_Cimarron_Bofors.LN[1].PL[1].reload_time = 1000000;
WS_Cimarron_Bofors.LN[1].BR = { {pos = {3.478, 0, 0}} }

-- 5-Inch/38 Mark 28 Mod 2 (single barrel on the Cimarron)
local WS_Cimarron_5in = {name = "5-Inch/38 Mark 28 Mod2"}
WS_Cimarron_5in.angles = {{math.rad(110), math.rad(-110), math.rad(-5), math.rad(90)}}
WS_Cimarron_5in.omegaY = math.rad(25)
WS_Cimarron_5in.omegaZ = math.rad(15)
WS_Cimarron_5in.reference_angle_Z = 0
WS_Cimarron_5in.LN = {}
WS_Cimarron_5in.LN[1] = {}
WS_Cimarron_5in.LN[1].type = 3
WS_Cimarron_5in.LN[1].distanceMin = 50
WS_Cimarron_5in.LN[1].distanceMax = 12500
WS_Cimarron_5in.LN[1].max_trg_alt = 11300
WS_Cimarron_5in.LN[1].reactionTime = 3
WS_Cimarron_5in.LN[1].sensor = {
    deviation_error_azimuth      = 0.00943,
    deviation_error_elevation    = 0.00943,
    deviation_error_speed_sensor = 0.00038,
    deviation_error_stability    = 0.00600,
    deviation_error_distance     = 0.00038,
}
set_recursive_metatable(WS_Cimarron_5in.LN[1].sensor, GT_t.WSN_t[3])
WS_Cimarron_5in.LN[1].PL = {}
WS_Cimarron_5in.LN[1].PL[1] = {}
WS_Cimarron_5in.LN[1].PL[1].ammo_capacity = 900
WS_Cimarron_5in.LN[1].PL[1].portionAmmoCapacity = 900
WS_Cimarron_5in.LN[1].PL[1].shell_display_name = "127mm AAC";
WS_Cimarron_5in.LN[1].PL[1].shell_name = {"127_Mk49_AAC"};
WS_Cimarron_5in.LN[1].PL[1].shot_delay = 4
WS_Cimarron_5in.LN[1].automaticLoader = false;
WS_Cimarron_5in.LN[1].reload_time = 240 * 20
WS_Cimarron_5in.LN[1].BR = { {pos = {8, 0, 0.0}} }

---------------------------------------------------------------------
--Mounts
---------------------------------------------------------------------
GT.WS = {}
local ws
GT.WS.maxTargetDetectionRange = 15000
GT.WS.radar_type = 102  -- optical only really, but leave as nonzero so AI can aim

--BOFORS 1 (port)
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], WS_Cimarron_Bofors )
GT.WS[ws].area = 'Torre_380_Anton'
GT.WS[ws].center = 'CENTER_TOWER_01'
GT.WS[ws].drawArgument1 = 1
GT.WS[ws].drawArgument2 = 2
GT.WS[ws].angles = portAA
GT.WS[ws].reference_angle_Y = facePort
GT.WS[ws].LN[1].BR =
{{	connector_name = 'POINT_GUN_01', recoilTime = 1,},}

--BOFORS 2 (starboard)
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], WS_Cimarron_Bofors )
GT.WS[ws].area = 'Torre_380_Anton'
GT.WS[ws].center = 'CENTER_TOWER_02'
GT.WS[ws].drawArgument1 = 3
GT.WS[ws].drawArgument2 = 4
GT.WS[ws].angles = stbdAA
GT.WS[ws].reference_angle_Y = faceStbd
GT.WS[ws].LN[1].BR =
{{	connector_name = 'POINT_GUN_02', recoilTime = 1,},}

-- Mount 05: aft 5"/38 DP single
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], WS_Cimarron_5in )
GT.WS[ws].area = 'Strutture_Poppa'
GT.WS[ws].center = 'CENTER_TOWER_05'
GT.WS[ws].drawArgument1 = 19
GT.WS[ws].drawArgument2 = 20
GT.WS[ws].angles = rearwardMainGun
GT.WS[ws].reference_angle_Y = faceAft
GT.WS[ws].LN[1].BR =
{
	{
		connector_name = 'POINT_GUN_05',
		recoilTime = 1,
	},
}

return GT
