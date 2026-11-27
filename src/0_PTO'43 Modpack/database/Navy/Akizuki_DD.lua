--See doc for 3rd party attributions and license information.
GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)
GT.visual = {}
GT.visual.shape 	 = "Akizuki_DD"
GT.visual.shape_dstr = ""
GT.Name 			= "Akizuki_DD"
GT.DisplayName 		= _("[PTO43] IJN Akizuki DD")
GT.DisplayNameShort = _("Aki.")
GT.tags           ={"Destroyer",};	
GT.Singleton  	  ="no";
GT.mapclasskey		= "P0091000068"; --map icon for DD symbol
GT.attribute = {
    wsType_Navy,
    wsType_Ship,
    wsType_ArmedShip,
    wsType_GenericLightArmoredShip,

    "Cruisers",              	 -- 
    "RADAR_BAND1_FOR_SEARCH",    -- enables long-range air/surface search radars
    "RADAR_BAND2_FOR_ARM",       -- enables fire-control and tracking radars
    "DetectionByAWACS",          -- allows AI radar contact sharing
    "Armed ships",               -- ensures targeting AI logic is active
    "RADAR_EMITTER",             -- makes the unit detectable by RWR/passive sensors
};
GT.Countries = {"Japan"}
GT.Categories = {
					{name = "Armed Ship"},
				};
GT.animation_arguments.radar1_rotation = 11;
GT.radar1_period = 3;
GT.ship_class = "DD"
GT.life = 1428
GT.Rate = 1428
GT.mass = 4.00e+006              -- kg (~4,000 t full load)
GT.max_velocity = 16.9;
GT.race_velocity = 16.9;
GT.economy_velocity = 16.9;
GT.economy_distance = 9.3312e+007;
GT.race_distance = 30.778e+006;
GT.Length = 134.2;
GT.shipLength = 134.2;
GT.Width = 11.6;
GT.Height = 12;
GT.DeckLevel = 2.9;
GT.X_nose = 65.0	-- 
GT.X_tail = -67.029	-- 
GT.Tail_Width = 10	-- 
GT.R_min = 469.7;
GT.Om = 0.0335;
GT.speedup = 0.0671;
GT.Gamma_max = 0.30;
GT.distFindObstacles = 214.7;
GT.animation_arguments.water_propeller = -1;
GT.exhaust = {[1] = { size = 0.5 , pos = {7.0, 11.0, 0.0} },}

GT.shape_table_data = {
    {
        file        = GT.visual.shape,
        username    = GT.Name,
        desrt       = GT.visual.shape_dstr,
        classname   = "lLandShip",
        positioning = "BYNORMAL",
    },
}

--SENSORS
GT.airWeaponDist = 5000
GT.airFindDist = 30000
GT.DetectionRange = GT.airFindDist
GT.ThreatRange = GT.airWeaponDist

GT.Sensors = {  OPTIC = {"long-range naval optics",},
                RADAR = {"IJN Type 22 Surface", "IJN Type 13" }
            };
GT.sensor = {
    max_range_finding_target = GT.airFindDist,  -- 150km from GT.airFindDist default
    min_range_finding_target = 0,
    max_alt_finding_target   = 8000,
    min_alt_finding_target   = 0,
    pos = {  0.0, 11.0, 0.0 },      -- approx mast height above deck
}

--ANGLE HELPERS

local forwardMainGun = {{math.rad(160), math.rad(-160), math.rad(-5), math.rad(85)}}
local rearwardMainGun = {
  { math.rad(180),  math.rad(45),  math.rad(-5), math.rad(85) },   -- port-rear
  { math.rad(-45),  math.rad(-180), math.rad(-5), math.rad(85) }  -- starboard-rear
}
local portAA          = {{math.rad(180), math.rad(0),    math.rad(-8), math.rad(85)}}
local stbdAA          = {{math.rad(0),   math.rad(-180), math.rad(-8), math.rad(85)}}
local rearwardAA = {
  { math.rad(180),  math.rad(90),  math.rad(-5), math.rad(85) }, -- port-rear
  { math.rad(-90),  math.rad(-180), math.rad(-5), math.rad(85) } -- starboard-rear
}
local forwardAA       = {{math.rad(-90), math.rad(90),   math.rad(-8), math.rad(85)}}
local faceForward = 0
local facePort    = math.rad(90)
local faceStbd    = math.rad(-90)
local faceAft     = math.rad(180)

--WEAPONS
GT.WS = {}
GT.WS.maxTargetDetectionRange = 25000;
GT.WS.radar_type = 104
GT.WS.searchRadarMaxElevation = math.rad(50);

--100mm Main gun
GT_t.WS_t.Flak_100mm = {}
GT_t.WS_t.Flak_100mm.omegaY = math.rad(10);	
GT_t.WS_t.Flak_100mm.omegaZ = math.rad(16);
GT_t.WS_t.Flak_100mm.pidY = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.Flak_100mm.pidZ = {p=300, i = 0.05, d = 10.0, inn = 1000};	
GT_t.WS_t.Flak_100mm.angles = {
                    {math.rad(150), math.rad(-150), math.rad(-10), math.rad(90)},
                    };
GT_t.WS_t.Flak_100mm.reference_angle_Z = math.rad(5)
GT_t.WS_t.Flak_100mm.LN = {}
GT_t.WS_t.Flak_100mm.LN[1] = {}
GT_t.WS_t.Flak_100mm.LN[1].type = 3   -- was 6; 3 = proven AA launcher type (engages aircraft)
GT_t.WS_t.Flak_100mm.LN[1].distanceMin = 10
GT_t.WS_t.Flak_100mm.LN[1].distanceMax = 14000
GT_t.WS_t.Flak_100mm.LN[1].max_trg_alt = 11000
GT_t.WS_t.Flak_100mm.LN[1].reactionTime = 2.0
GT_t.WS_t.Flak_100mm.LN[1].sensor = {
    deviation_error_azimuth      = 0.00943,
    deviation_error_elevation    = 0.00943,
    deviation_error_speed_sensor = 0.00038,
    deviation_error_stability    = 0.00600,
    deviation_error_distance     = 0.00038,
}
GT_t.WS_t.Flak_100mm.LN[1].PL = {}
GT_t.WS_t.Flak_100mm.LN[1].PL[1] = {
							shell_name = {"IJN_100mm_Type98_AA_T12", "IJN_100mm_Type98_AA_T8", "IJN_100mm_Type98_AA_T5"},   -- AA time-fuze belt (Weapons/IJN_AA_fuze_belt.lua)
							automaticLoader = false,
							shot_delay = 4,
							ammo_capacity = 200,
							portionAmmoCapacity = 200
						}
-- weapon template: Mgun_25mm (defined in database/Navy/ship_weapons_templates.lua)
-- NOTE: Mgun_25mm instances use ammo_capacity=9000 (canonical: 3000)

--100mm 203mm main gun


-----------------------
--100mm main gun-
-----------------------

ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Flak_100mm)
GT.WS[ws].board = 1;
GT.WS[ws].center = 'CENTER_10CM_1'
GT.WS[ws].angles = forwardMainGun
GT.WS[ws].drawArgument1 = 74
GT.WS[ws].drawArgument2 = 75
GT.WS[ws].LN[1].fireAnimationArgument = 110;
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_10CM_11'},
	{connector_name = 'POINT_10CM_12'},
};


ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Flak_100mm)
GT.WS[ws].board = 1;
GT.WS[ws].center = 'CENTER_10CM_2'
GT.WS[ws].angles = forwardMainGun
GT.WS[ws].drawArgument1 = 76
GT.WS[ws].drawArgument2 = 77
GT.WS[ws].LN[1].fireAnimationArgument = 111;
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_10CM_21'},
	{connector_name = 'POINT_10CM_22'},
};


ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Flak_100mm)
GT.WS[ws].board = 2;
GT.WS[ws].center = 'CENTER_10CM_3'
GT.WS[ws].angles = rearwardMainGun
GT.WS[ws].reference_angle_Y = faceAft
GT.WS[ws].drawArgument1 = 78
GT.WS[ws].drawArgument2 = 79
GT.WS[ws].LN[1].fireAnimationArgument = 112;
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_10CM_31'},
	{connector_name = 'POINT_10CM_32'},
};


ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Flak_100mm)
GT.WS[ws].board = 2;
GT.WS[ws].center = 'CENTER_10CM_4'
GT.WS[ws].angles = rearwardMainGun
GT.WS[ws].reference_angle_Y = faceAft
GT.WS[ws].drawArgument1 = 80
GT.WS[ws].drawArgument2 = 81
GT.WS[ws].LN[1].fireAnimationArgument = 113;
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_10CM_41'},
	{connector_name = 'POINT_10CM_42'},
};

--25mm type96
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 3;
GT.WS[ws].center = 'CENTER_MGUN_L_1'
GT.WS[ws].angles = {{math.rad(80), math.rad(-80), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 20
GT.WS[ws].drawArgument2 = 21
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUN_L_11'},
	{connector_name = 'POINT_MGUN_L_12'},
	{connector_name = 'POINT_MGUN_L_13'}
};
GT.WS[ws].LN[1].PL[1].ammo_capacity = 400;
GT.WS[ws].LN[1].PL[1].portionAmmoCapacity = 400;



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 3;
GT.WS[ws].center = 'CENTER_MGUN_L_2'
GT.WS[ws].angles = {{math.rad(180), math.rad(-90), math.rad(-10), math.rad(80)},
					{math.rad(-135), math.rad(-180), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 22
GT.WS[ws].drawArgument2 = 23
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUN_L_21'},
	{connector_name = 'POINT_MGUN_L_22'},
	{connector_name = 'POINT_MGUN_L_23'}
};
GT.WS[ws].LN[1].PL[1].ammo_capacity = 400;
GT.WS[ws].LN[1].PL[1].portionAmmoCapacity = 400;



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 4;
GT.WS[ws].center = 'CENTER_MGUN_R_1'
GT.WS[ws].angles = {{math.rad(80), math.rad(-80), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 24
GT.WS[ws].drawArgument2 = 25
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUN_R_11'},
	{connector_name = 'POINT_MGUN_R_12'},
	{connector_name = 'POINT_MGUN_R_13'}
};
GT.WS[ws].LN[1].PL[1].ammo_capacity = 400;
GT.WS[ws].LN[1].PL[1].portionAmmoCapacity = 400;



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 4;
GT.WS[ws].center = 'CENTER_MGUN_R_2'
GT.WS[ws].angles = {{math.rad(90), math.rad(-180), math.rad(-10), math.rad(80)},
					{math.rad(180), math.rad(135), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 26
GT.WS[ws].drawArgument2 = 27
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUN_R_21'},
	{connector_name = 'POINT_MGUN_R_22'},
	{connector_name = 'POINT_MGUN_R_23'}
};
GT.WS[ws].LN[1].PL[1].ammo_capacity = 400;
GT.WS[ws].LN[1].PL[1].portionAmmoCapacity = 400;



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 2;
GT.WS[ws].center = 'CENTER_MGUN_C_1'
GT.WS[ws].angles = {{math.rad(180), math.rad(-180), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 28
GT.WS[ws].drawArgument2 = 29
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUN_C_11'},
	{connector_name = 'POINT_MGUN_C_12'},
	{connector_name = 'POINT_MGUN_C_13'}
};
GT.WS[ws].LN[1].PL[1].ammo_capacity = 800;
GT.WS[ws].LN[1].PL[1].portionAmmoCapacity = 800;



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 3;
GT.WS[ws].center = 'CENTER_MGUNSINGLE_L_1'
GT.WS[ws].angles = {{math.rad(90), math.rad(-90), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 30
GT.WS[ws].drawArgument2 = 31
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUNSINGLE_L_1'},
};



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 3;
GT.WS[ws].center = 'CENTER_MGUNSINGLE_L_2'
GT.WS[ws].angles = {{math.rad(90), math.rad(-90), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 32
GT.WS[ws].drawArgument2 = 33
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUNSINGLE_L_2'},
};



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 3;
GT.WS[ws].center = 'CENTER_MGUNSINGLE_L_3'
GT.WS[ws].angles = {{math.rad(90), math.rad(-90), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 34
GT.WS[ws].drawArgument2 = 35
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUNSINGLE_L_3'},
};



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 3;
GT.WS[ws].center = 'CENTER_MGUNSINGLE_L_4'
GT.WS[ws].angles = {{math.rad(90), math.rad(-90), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 36
GT.WS[ws].drawArgument2 = 37
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUNSINGLE_L_4'},
};



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 3;
GT.WS[ws].center = 'CENTER_MGUNSINGLE_L_5'
GT.WS[ws].angles = {{math.rad(90), math.rad(-90), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 38
GT.WS[ws].drawArgument2 = 39
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUNSINGLE_L_5'},
};



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 3;
GT.WS[ws].center = 'CENTER_MGUNSINGLE_L_6'
GT.WS[ws].angles = {{math.rad(90), math.rad(-90), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 40
GT.WS[ws].drawArgument2 = 41
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUNSINGLE_L_6'},
};



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 3;
GT.WS[ws].center = 'CENTER_MGUNSINGLE_L_7'
GT.WS[ws].angles = {{math.rad(90), math.rad(-90), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 42
GT.WS[ws].drawArgument2 = 43
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUNSINGLE_L_7'},
};



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 3;
GT.WS[ws].center = 'CENTER_MGUNSINGLE_L_8'
GT.WS[ws].angles = {{math.rad(90), math.rad(-90), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 44
GT.WS[ws].drawArgument2 = 45
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUNSINGLE_L_8'},
};



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 3;
GT.WS[ws].center = 'CENTER_MGUNSINGLE_L_9'
GT.WS[ws].angles = {{math.rad(90), math.rad(-90), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 46
GT.WS[ws].drawArgument2 = 47
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUNSINGLE_L_9'},
};



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 4;
GT.WS[ws].center = 'CENTER_MGUNSINGLE_R_1'
GT.WS[ws].angles = {{math.rad(90), math.rad(-90), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 48
GT.WS[ws].drawArgument2 = 49
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUNSINGLE_R_1'},
};



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 4;
GT.WS[ws].center = 'CENTER_MGUNSINGLE_R_2'
GT.WS[ws].drawArgument1 = 50
GT.WS[ws].drawArgument2 = 51
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUNSINGLE_R_2'},
};



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 4;
GT.WS[ws].center = 'CENTER_MGUNSINGLE_R_3'
GT.WS[ws].angles = {{math.rad(90), math.rad(-90), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 52
GT.WS[ws].drawArgument2 = 53
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUNSINGLE_R_3'},
};



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 4;
GT.WS[ws].center = 'CENTER_MGUNSINGLE_R_4'
GT.WS[ws].angles = {{math.rad(90), math.rad(-90), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 54
GT.WS[ws].drawArgument2 = 55
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUNSINGLE_R_4'},
};



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 4;
GT.WS[ws].center = 'CENTER_MGUNSINGLE_R_5'
GT.WS[ws].angles = {{math.rad(90), math.rad(-90), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 56
GT.WS[ws].drawArgument2 = 57
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUNSINGLE_R_5'},
};



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 4;
GT.WS[ws].center = 'CENTER_MGUNSINGLE_R_6'
GT.WS[ws].angles = {{math.rad(90), math.rad(-90), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 58
GT.WS[ws].drawArgument2 = 59
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUNSINGLE_R_6'},
};



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 4;
GT.WS[ws].center = 'CENTER_MGUNSINGLE_R_7'
GT.WS[ws].angles = {{math.rad(90), math.rad(-90), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 70
GT.WS[ws].drawArgument2 = 71
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUNSINGLE_R_7'},
};



ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.Mgun_25mm)
GT.WS[ws].LN[1].PL[1].ammo_capacity = 9000
GT.WS[ws].board = 4;
GT.WS[ws].center = 'CENTER_MGUNSINGLE_R_8'
GT.WS[ws].angles = {{math.rad(90), math.rad(-90), math.rad(-10), math.rad(80)}};
GT.WS[ws].drawArgument1 = 72
GT.WS[ws].drawArgument2 = 73
GT.WS[ws].LN[1].BR = {
	{connector_name = 'POINT_MGUNSINGLE_R_8'},
};

	
return GT