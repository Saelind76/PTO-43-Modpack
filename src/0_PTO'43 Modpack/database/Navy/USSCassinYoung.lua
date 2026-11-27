-- ==============================================================================
-- MOD for DCS WORLD 
-- WWII Ship Fletcher Class Destroyer  by Markindel 
-- [PTO '43] USS Cassin Young Refactor (DD-793)
-- Historical 1943 Loadout: 5x 5-inch/38, 40mm Bofors, 20mm Oerlikon
-- ==============================================================================

GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)

-- ==============================================================================
-- 1. VISUALS & SHAPES
-- ==============================================================================
GT.visual = {}
GT.visual.shape = "USSCassinYoung"
GT.visual.shape_dstr = "USS_Cassin_Young_Sunk.edm"

-- ==============================================================================
-- 2. ANIMATION ARGUMENTS & RADAR
-- ==============================================================================
GT.animation_arguments.radar1_rotation = 11; -- Main radar rotation
GT.radar1_period = 3;
GT.animation_arguments.radar2_rotation = -1; 
GT.animation_arguments.radar3_rotation = -1; 
GT.animation_arguments.luna_lights = -1;

-- ==============================================================================
-- 3. SHIP PROPERTIES & DYNAMICS (Historical Fletcher-Class)
-- ==============================================================================
GT.life = 1000 -- Increased from 450 to survive standard bombing
GT.mass = 2.50e+006 -- [kg] Historical full load displacement (2,500 tons)

-- Speeds [m/s]
GT.max_velocity = 18.0 -- [m/s] ~35 knots historical max speed
GT.race_velocity = 18.0 -- [m/s] Combat speed
GT.economy_velocity = 7.72 -- [m/s] ~15 knots cruise speed

-- Distances [m]
GT.economy_distance = 1.20e+007 -- [m] ~6500 nautical miles at 15 knots
GT.race_distance = 2.50e+006 

-- Dimensions [m]
GT.shipLength = 114.76 -- [m] Historical length overall
GT.Width = 12.1 -- [m] Historical beam
GT.Height = 21.5 -- [m] Mast height
GT.Length = 114.76 
GT.DeckLevel = 5.5
GT.draft = 5.3 -- [m] Historical draft
GT.X_nose = 54.5000
GT.X_tail = -56.000
GT.Tail_Width = 11
GT.Gamma_max = 0.35
GT.Om = 0.05
GT.speedup = 0.0814062
GT.R_min = 208.4
GT.distFindObstacles = 350.6

GT.exhaust = 
{
	[1] = { size = 0.75 , pos = {8.0 , 14.0, 1.0 } },
}

-- ==============================================================================
-- 4. DAMAGE MODEL (Hitpoints & Fire Locations)
-- Warning: Internal area_names kept as original Italian to match .edm collisions
-- ==============================================================================
GT.DM = {
    -- HULL (Reinforced to 150. Immune to .50 cal, requires bombs)
	{ area_name = "Scafo_Prua_Dx",		area_arg = 76,	area_life = 150, area_fire = { pos = {45.0, 4.0, 3.0}, size = 1.5}},    
	{ area_name = "Scafo_Prua_Sx", 		area_arg = 73,	area_life = 150, area_fire = { pos = {30.0, 4.0,- 3.0}, size = 1.5}},	
	{ area_name = "Scafo_Poppa_Dx", 	area_arg = 72,	area_life = 150, area_fire = { pos = {-20.0, 2.0, 3.0}, size = 1.5}},   
    { area_name = "Scafo_Poppa_Sx", 	area_arg = 75,	area_life = 150, area_fire = { pos = {-10.0, 2.0, -3.0}, size = 1.5}},  
    
    -- SUPERSTRUCTURE (Vulnerable to fighter strafing / rockets)
	{ area_name = "Strutture_Poppa",    area_arg = 82,	area_life = 80, area_fire = { pos = {-35.0, 12.0, 0.0}, size = 1.5}},  
	{ area_name = "Sala_Comando",	    area_arg = 83,	area_life = 80, area_fire = { pos = {30.0, 12.0, 0.0}, size = 1.5}},   
    
    -- MAIN TURRETS (Name kept as original to avoid DCS errors)
	{ area_name = "Torre_380_Anton",	area_arg = 96,	area_life = 120, area_fire = { pos = {35.0, 5.0, 0.0}, size =  1.5}},   
    
    -- DECKS
    { area_name = "Ponte Poppa",		area_arg = 85,	area_life = 120, area_fire = { pos = {-45.0, 3.0, 0.0}, size = 1.5}},   
    
    -- DESTROYED STATE
	{ area_name = "Fletcher_Distrutta", area_arg = 77,	area_life = 60, area_fire = { pos = {5.0, 12.0, 0.0}, size = 2.5}},    
}

-- ==============================================================================
-- 5. WEAPON SYSTEM TEMPLATES (Historical PTO '43 Loadout)
-- ==============================================================================

-- ------------------------------------------------------------------------------
-- 20mm Oerlikon (Light AA)
-- Historical RoF: 450 rpm | Max Elevation: 90 degrees
-- ------------------------------------------------------------------------------
GT_t.WS_t.ship_oerlikon_20 = {name = "20mm Oerlikon"};
GT_t.WS_t.ship_oerlikon_20.angles = { {math.rad(180), math.rad(-180), math.rad(-15), math.rad(90)} };
GT_t.WS_t.ship_oerlikon_20.omegaY = math.rad(115) 
GT_t.WS_t.ship_oerlikon_20.omegaZ = math.rad(116) 
GT_t.WS_t.ship_oerlikon_20.pidY = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_oerlikon_20.pidZ = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_oerlikon_20.reference_angle_Z = 0
GT_t.WS_t.ship_oerlikon_20.LN = {}
GT_t.WS_t.ship_oerlikon_20.LN[1] = {}
GT_t.WS_t.ship_oerlikon_20.LN[1].type = 3
GT_t.WS_t.ship_oerlikon_20.LN[1].distanceMin = 10
GT_t.WS_t.ship_oerlikon_20.LN[1].distanceMax = 2000 
GT_t.WS_t.ship_oerlikon_20.LN[1].max_trg_alt = 1500
GT_t.WS_t.ship_oerlikon_20.LN[1].reactionTime = 1.8
GT_t.WS_t.ship_oerlikon_20.LN[1].beamWidth = math.rad(1);
GT_t.WS_t.ship_oerlikon_20.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.ship_oerlikon_20.LN[1].sensor, GT_t.WSN_t[3])
GT_t.WS_t.ship_oerlikon_20.LN[1].PL = {}
GT_t.WS_t.ship_oerlikon_20.LN[1].PL[1] = {}
GT_t.WS_t.ship_oerlikon_20.LN[1].PL[1].ammo_capacity = 1550;
GT_t.WS_t.ship_oerlikon_20.LN[1].PL[1].shell_name = {"PTO_20mm_Oerlikon_HE"}; 
GT_t.WS_t.ship_oerlikon_20.LN[1].PL[1].shot_delay = 60/450 
GT_t.WS_t.ship_oerlikon_20.LN[1].automaticLoader = false;
GT_t.WS_t.ship_oerlikon_20.LN[1].PL[1].reload_time = 1000000; 
GT_t.WS_t.ship_oerlikon_20.LN[1].BR = { {pos = {3.478, 0, 0} }, }

-- ------------------------------------------------------------------------------
-- 40mm Bofors (Medium AA)
-- Historical RoF: 120 rpm | Max Elevation: 90 degrees
-- ------------------------------------------------------------------------------
GT_t.WS_t.ship_Bofors_40 = {name = "40mm Bofors"};
GT_t.WS_t.ship_Bofors_40.angles = { {math.rad(180), math.rad(-180), math.rad(-10), math.rad(90)} };
GT_t.WS_t.ship_Bofors_40.omegaY = math.rad(115) 
GT_t.WS_t.ship_Bofors_40.omegaZ = math.rad(116) 
GT_t.WS_t.ship_Bofors_40.pidY = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_Bofors_40.pidZ = {p=300, i = 0.05, d = 10.0, inn = 1000};
GT_t.WS_t.ship_Bofors_40.reference_angle_Z = 0
GT_t.WS_t.ship_Bofors_40.LN = {}
GT_t.WS_t.ship_Bofors_40.LN[1] = {}
GT_t.WS_t.ship_Bofors_40.LN[1].type = 3
GT_t.WS_t.ship_Bofors_40.LN[1].distanceMin = 10
GT_t.WS_t.ship_Bofors_40.LN[1].distanceMax = 7160 
GT_t.WS_t.ship_Bofors_40.LN[1].max_trg_alt = 3800
GT_t.WS_t.ship_Bofors_40.LN[1].reactionTime = 1.8
GT_t.WS_t.ship_Bofors_40.LN[1].beamWidth = math.rad(1);
GT_t.WS_t.ship_Bofors_40.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.ship_Bofors_40.LN[1].sensor, GT_t.WSN_t[3])
GT_t.WS_t.ship_Bofors_40.LN[1].PL = {}
GT_t.WS_t.ship_Bofors_40.LN[1].PL[1] = {}
GT_t.WS_t.ship_Bofors_40.LN[1].PL[1].ammo_capacity = 800;
GT_t.WS_t.ship_Bofors_40.LN[1].PL[1].shell_name = {"PTO_40mm_Bofors_HE"};
GT_t.WS_t.ship_Bofors_40.LN[1].PL[1].shot_delay = 60/120 
GT_t.WS_t.ship_Bofors_40.LN[1].automaticLoader = false;
GT_t.WS_t.ship_Bofors_40.LN[1].PL[1].reload_time = 1000000; 
GT_t.WS_t.ship_Bofors_40.LN[1].BR = { {pos = {3.478, 0, 0} }, }

-- ------------------------------------------------------------------------------
-- 5-Inch/38 Mark 30 Single Mount (Main Battery / Heavy AA)
-- Historical RoF: 15 rpm | Max Elevation: 85 degrees
-- ------------------------------------------------------------------------------
GT_t.WS_t.ship_127_38_single = {name = "5-Inch/38 Mark 30"}
GT_t.WS_t.ship_127_38_single.angles = { {math.rad(150), math.rad(-150), math.rad(-15), math.rad(85)} };
GT_t.WS_t.ship_127_38_single.omegaY = 0.6
GT_t.WS_t.ship_127_38_single.omegaZ = 0.6
GT_t.WS_t.ship_127_38_single.reference_angle_Z = 0
GT_t.WS_t.ship_127_38_single.LN = {}
GT_t.WS_t.ship_127_38_single.LN[1] = {}
GT_t.WS_t.ship_127_38_single.LN[1].type = 11
GT_t.WS_t.ship_127_38_single.LN[1].xc = 3
GT_t.WS_t.ship_127_38_single.LN[1].distanceMin = 50
GT_t.WS_t.ship_127_38_single.LN[1].distanceMax = 16000
GT_t.WS_t.ship_127_38_single.LN[1].max_trg_alt = 11800
GT_t.WS_t.ship_127_38_single.LN[1].reactionTime = 3
GT_t.WS_t.ship_127_38_single.LN[1].sensor = {}
set_recursive_metatable(GT_t.WS_t.ship_127_38_single.LN[1].sensor, GT_t.WSN_t[10])
GT_t.WS_t.ship_127_38_single.LN[1].PL = {}
GT_t.WS_t.ship_127_38_single.LN[1].PL[1] = {}
GT_t.WS_t.ship_127_38_single.LN[1].PL[1].ammo_capacity = 350 
GT_t.WS_t.ship_127_38_single.LN[1].PL[1].shell_name = {"127_Mk49_AAC"}; 
GT_t.WS_t.ship_127_38_single.LN[1].PL[1].shot_delay = 4 -- 15 RPM
GT_t.WS_t.ship_127_38_single.LN[1].automaticLoader = false;
GT_t.WS_t.ship_127_38_single.LN[1].PL[1].reload_time = 240 * 20
GT_t.WS_t.ship_127_38_single.LN[1].BR = { {pos = {8, 0, 0.0} } } -- Single barrel

-- ==============================================================================
-- 6. WEAPON SYSTEM DECLARATIONS (Mounting weapons to the ship)
-- ==============================================================================
GT.WS = {}
local ws;
GT.WS.maxTargetDetectionRange = 50000;
GT.WS.radar_type = 102

-- ------------------------------------------------------------------------------
-- 40mm Bofors Twin Mounts (Replacing Italian Breda 37mm)
-- ------------------------------------------------------------------------------
-- Port Bow Bofors
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Bofors_40 )
GT.WS[ws].area = 'Sala_Comando'
GT.WS[ws].center = 'CENTER_TOWER_06'
GT.WS[ws].drawArgument1 = 49
GT.WS[ws].drawArgument2 = 50
GT.WS[ws].angles[1][1] = math.rad(150);
GT.WS[ws].angles[1][2] = math.rad(-10);
GT.WS[ws].reference_angle_Y = math.rad(35); 
GT.WS[ws].LN[1].BR[1].recoilArgument = 127;
GT.WS[ws].LN[1].fireAnimationArgument = -90;
GT.WS[ws].LN[1].BR[1].recoilTime = 1;
GT.WS[ws].LN[1].BR = { { connector_name = 'POINT_MGUN_1_1', recoilArgument = 127 }, { connector_name = 'POINT_MGUN_1_2', recoilArgument = 127 } }

-- Starboard Bow Bofors
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Bofors_40 )
GT.WS[ws].area = 'Sala_Comando'
GT.WS[ws].center = 'CENTER_TOWER_07'
GT.WS[ws].drawArgument1 = 51
GT.WS[ws].drawArgument2 = 52
GT.WS[ws].angles[1][1] = math.rad(-10);
GT.WS[ws].angles[1][2] = math.rad(-150);
GT.WS[ws].reference_angle_Y = math.rad(-35); 
GT.WS[ws].LN[1].BR[1].recoilArgument = 128;
GT.WS[ws].LN[1].fireAnimationArgument = -90;
GT.WS[ws].LN[1].BR[1].recoilTime = 1;
GT.WS[ws].LN[1].BR = { { connector_name = 'POINT_MGUN_2_1', recoilArgument = 128 }, { connector_name = 'POINT_MGUN_2_2', recoilArgument = 128 } }

-- Center Bofors
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Bofors_40 )
GT.WS[ws].area = 'Sala_Comando'
GT.WS[ws].center = 'CENTER_TOWER_08'
GT.WS[ws].drawArgument1 = 53
GT.WS[ws].drawArgument2 = 54
GT.WS[ws].reference_angle_Y = math.rad(180);
GT.WS[ws].angles[1][1] = math.rad(-10);
GT.WS[ws].angles[1][2] = math.rad(10);
GT.WS[ws].LN[1].BR[1].recoilArgument = 129;
GT.WS[ws].LN[1].fireAnimationArgument = -90;
GT.WS[ws].LN[1].BR[1].recoilTime = 1;
GT.WS[ws].LN[1].BR = { { connector_name = 'POINT_MGUN_3_1', recoilArgument = 129 }, { connector_name = 'POINT_MGUN_3_2', recoilArgument = 129 } }

-- Port Aft Bofors
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Bofors_40 )
GT.WS[ws].area = 'Sala_Comando'
GT.WS[ws].center = 'CENTER_TOWER_15'
GT.WS[ws].drawArgument1 = 67
GT.WS[ws].drawArgument2 = 68
GT.WS[ws].angles[1][1] = math.rad(150);
GT.WS[ws].angles[1][2] = math.rad(-10);
GT.WS[ws].reference_angle_Y = math.rad(90); 
GT.WS[ws].LN[1].BR[1].recoilArgument = 136;
GT.WS[ws].LN[1].fireAnimationArgument = -90;  
GT.WS[ws].LN[1].BR[1].recoilTime = 1;
GT.WS[ws].LN[1].BR = { { connector_name = 'POINT_MGUN_4_1', recoilArgument = 136 }, { connector_name = 'POINT_MGUN_4_2', recoilArgument = 136 } }

-- Starboard Aft Bofors
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_Bofors_40 )
GT.WS[ws].area = 'Sala_Comando'
GT.WS[ws].center = 'CENTER_TOWER_16'
GT.WS[ws].drawArgument1 = 169
GT.WS[ws].drawArgument2 = 70
GT.WS[ws].angles[1][1] = math.rad(-10);
GT.WS[ws].angles[1][2] = math.rad(150);
GT.WS[ws].reference_angle_Y = math.rad(-90); 
GT.WS[ws].LN[1].BR[1].recoilArgument = 137;
GT.WS[ws].LN[1].fireAnimationArgument = -90;  
GT.WS[ws].LN[1].BR[1].recoilTime = 1;
GT.WS[ws].LN[1].BR = { { connector_name = 'POINT_MGUN_5_1', recoilArgument = 137 }, { connector_name = 'POINT_MGUN_5_2', recoilArgument = 137 } }

-- ------------------------------------------------------------------------------
-- 20mm Oerlikon Mounts (Replacing German 2cm FlaK)
-- ------------------------------------------------------------------------------

-- 1 Port Oerlikon
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_oerlikon_20 )
GT.WS[ws].area = 'Sala_Comando'
GT.WS[ws].center = 'CENTER_TOWER_08' -- Kept user's fix
GT.WS[ws].drawArgument1 = 55
GT.WS[ws].drawArgument2 = 56
GT.WS[ws].angles[1][1] = math.rad(150);
GT.WS[ws].angles[1][2] = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(90);  
GT.WS[ws].LN[1].BR[1].recoilArgument = 130;
GT.WS[ws].LN[1].fireAnimationArgument = -90;
GT.WS[ws].LN[1].BR[1].connector_name = 'POINT_MGUN_4'
GT.WS[ws].LN[1].BR[1].recoilTime = 1;

-- 2 Port Oerlikon
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_oerlikon_20 )
GT.WS[ws].area = 'Sala_Comando'
GT.WS[ws].center = 'CENTER_TOWER_10'
GT.WS[ws].drawArgument1 = 57
GT.WS[ws].drawArgument2 = 58
GT.WS[ws].angles[1][1] = math.rad(150);
GT.WS[ws].angles[1][2] = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(90);  
GT.WS[ws].LN[1].BR[1].recoilArgument = 131;
GT.WS[ws].LN[1].fireAnimationArgument = -90;
GT.WS[ws].LN[1].BR[1].connector_name = 'POINT_MGUN_5'
GT.WS[ws].LN[1].BR[1].recoilTime = 1;

-- 3 Port Aft Oerlikon
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_oerlikon_20 )
GT.WS[ws].area = 'Sala_Comando'
GT.WS[ws].center = 'CENTER_TOWER_11'
GT.WS[ws].drawArgument1 = 59
GT.WS[ws].drawArgument2 = 60
GT.WS[ws].angles[1][1] = math.rad(18);
GT.WS[ws].angles[1][2] = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(135);  
GT.WS[ws].LN[1].BR[1].recoilArgument = 132;
GT.WS[ws].LN[1].fireAnimationArgument = -90;
GT.WS[ws].LN[1].BR[1].connector_name = 'POINT_MGUN_6'
GT.WS[ws].LN[1].BR[1].recoilTime = 1;

-- 4 Starboard Oerlikon
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_oerlikon_20 )
GT.WS[ws].area = 'Sala_Comando'
GT.WS[ws].center = 'CENTER_TOWER_12'
GT.WS[ws].drawArgument1 = 61
GT.WS[ws].drawArgument2 = 62
GT.WS[ws].angles[1][1] = math.rad(0);
GT.WS[ws].angles[1][2] = math.rad(180);
GT.WS[ws].reference_angle_Y = math.rad(-90);  
GT.WS[ws].LN[1].BR[1].recoilArgument = 133;
GT.WS[ws].LN[1].fireAnimationArgument = -90;
GT.WS[ws].LN[1].BR[1].connector_name = 'POINT_MGUN_7'
GT.WS[ws].LN[1].BR[1].recoilTime = 1;

-- 5 Starboard Oerlikon
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_oerlikon_20 )
GT.WS[ws].area = 'Ponte Poppa'
GT.WS[ws].center = 'CENTER_TOWER_13'
GT.WS[ws].drawArgument1 = 63
GT.WS[ws].drawArgument2 = 64
GT.WS[ws].angles[1][1] = math.rad(0);
GT.WS[ws].angles[1][2] = math.rad(180);
GT.WS[ws].reference_angle_Y = math.rad(150);  
GT.WS[ws].LN[1].BR[1].recoilArgument = 134;
GT.WS[ws].LN[1].fireAnimationArgument = -90;
GT.WS[ws].LN[1].BR[1].connector_name = 'POINT_MGUN_8'
GT.WS[ws].LN[1].BR[1].recoilTime = 1;

-- 6 Starboard Aft Oerlikon
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_oerlikon_20 )
GT.WS[ws].area = 'Ponte Poppa'
GT.WS[ws].center = 'CENTER_TOWER_14'
GT.WS[ws].drawArgument1 = 65
GT.WS[ws].drawArgument2 = 66
GT.WS[ws].angles[1][1] = math.rad(-180);
GT.WS[ws].angles[1][2] = math.rad(0);
GT.WS[ws].reference_angle_Y = math.rad(-150);  
GT.WS[ws].LN[1].BR[1].recoilArgument = 135;
GT.WS[ws].LN[1].fireAnimationArgument = -90;
GT.WS[ws].LN[1].BR[1].connector_name = 'POINT_MGUN_9'
GT.WS[ws].LN[1].BR[1].recoilTime = 1;

-- 7 Center Aft Oerlikon
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_oerlikon_20 )
GT.WS[ws].area = 'Ponte Poppa'
GT.WS[ws].center = 'CENTER_TOWER_18'
GT.WS[ws].drawArgument1 = 47
GT.WS[ws].drawArgument2 = 48
GT.WS[ws].angles[1][1] = math.rad(-30);
GT.WS[ws].angles[1][2] = math.rad(30);
GT.WS[ws].reference_angle_Y = math.rad(-180);  
GT.WS[ws].LN[1].fireAnimationArgument = -90;
GT.WS[ws].LN[1].BR[1].recoilArgument = 126;
GT.WS[ws].LN[1].BR[1].connector_name = 'POINT_MGUN_10'
GT.WS[ws].LN[1].BR[1].recoilTime = 1;

-- ------------------------------------------------------------------------------
-- 5x 5-inch/38 Main Guns (Replacing German heavy guns)
-- ------------------------------------------------------------------------------

-- Forward Gun 1
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_127_38_single )
GT.WS[ws].area = 'Torre_380_Anton'
GT.WS[ws].center = 'CENTER_TOWER_01'
GT.WS[ws].drawArgument1 = 0
GT.WS[ws].drawArgument2 = 1
GT.WS[ws].angles[1][1] = math.rad(150);
GT.WS[ws].angles[1][2] = math.rad(-150);
GT.WS[ws].LN[1].BR[1].connector_name = 'POINT_GUN_01'
GT.WS[ws].LN[1].BR[1].recoilArgument = 33;
GT.WS[ws].LN[1].BR[1].recoilTime = 1.0;

-- Forward Gun 2 (Superfiring)
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_127_38_single )
GT.WS[ws].area = 'Sala_Comando'
GT.WS[ws].center = 'CENTER_TOWER_02'
GT.WS[ws].drawArgument1 = 13
GT.WS[ws].drawArgument2 = 14
GT.WS[ws].angles[1][1] = math.rad(150);
GT.WS[ws].angles[1][2] = math.rad(-150);
GT.WS[ws].LN[1].BR[1].connector_name = 'POINT_GUN_02'
GT.WS[ws].LN[1].BR[1].recoilArgument = 34;
GT.WS[ws].LN[1].BR[1].recoilTime = 1.0;

-- Aft Gun 3
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_127_38_single )
GT.WS[ws].area = 'Strutture_Poppa'
GT.WS[ws].center = 'CENTER_TOWER_03'
GT.WS[ws].drawArgument1 = 15
GT.WS[ws].drawArgument2 = 16
GT.WS[ws].reference_angle_Y = math.rad(0);
GT.WS[ws].angles = {
					{math.rad(-30),  math.rad(-130), math.rad(-5), math.rad(75)},
					{math.rad(130), math.rad(30),      math.rad(-5), math.rad(75)},
					};
GT.WS[ws].LN[1].BR[1].connector_name = 'POINT_GUN_03'
GT.WS[ws].LN[1].BR[1].recoilArgument = 35;
GT.WS[ws].LN[1].BR[1].recoilTime = 1.0;

-- Aft Gun 4
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_127_38_single )
GT.WS[ws].area = 'Strutture_Poppa'
GT.WS[ws].center = 'CENTER_TOWER_04'
GT.WS[ws].drawArgument1 = 17
GT.WS[ws].drawArgument2 = 18
GT.WS[ws].reference_angle_Y = math.rad(180);
GT.WS[ws].angles[1][1] = math.rad(-45);
GT.WS[ws].angles[1][2] = math.rad(45);
GT.WS[ws].LN[1].BR[1].connector_name = 'POINT_GUN_04'
GT.WS[ws].LN[1].BR[1].recoilArgument = 36;
GT.WS[ws].LN[1].BR[1].recoilTime = 1.0;

-- Aft Gun 5
ws = GT_t.inc_ws();
GT.WS[ws] = {}
set_recursive_metatable(GT.WS[ws], GT_t.WS_t.ship_127_38_single )
GT.WS[ws].area = 'Ponte Poppa'
GT.WS[ws].center = 'CENTER_TOWER_05'
GT.WS[ws].drawArgument1 = 19
GT.WS[ws].drawArgument2 = 20
GT.WS[ws].reference_angle_Y = math.rad(180);
GT.WS[ws].angles[1][1] = math.rad(-45);
GT.WS[ws].angles[1][2] = math.rad(45);
GT.WS[ws].LN[1].BR[1].connector_name = 'POINT_GUN_05'
GT.WS[ws].LN[1].BR[1].recoilArgument = 37;
GT.WS[ws].LN[1].BR[1].recoilTime = 1.0;

-- ==============================================================================
-- 7. SHIP CLASSIFICATION & ATTRIBUTES
-- ==============================================================================

GT.Name = "WS_USS_Cassin_Young"
GT.DisplayName = _("[PTO43] USS Cassin Young")
GT.Rate = 4000

-- Using optical sensors and generic WW2 radar detection limits
GT.Sensors = {  OPTIC = {"long-range naval optics", "long-range naval LLTV", "long-range naval FLIR"} };

-- Fix for Invalid sensor height error
GT.sensor = {}; 
set_recursive_metatable(GT.sensor, GT_t.SN_visual);
GT.sensor.height = 15.0;
GT.sensor.max_range_finding_target = 50000;	
		
GT.DetectionRange  = GT.airFindDist;
GT.ThreatRange = GT.airWeaponDist;
GT.Singleton   ="no";

-- Fixed mapclasskey to generic Destroyer
GT.mapclasskey = "P0091000068";

-- Removed Cruisers and Battleplanes attributes, assigned to Destroyers
GT.attribute = {
    wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericLightArmoredShip,
    "Destroyers",
    "RADAR_BAND1_FOR_ARM",
    "DetectionByAWACS",
};
			
GT.Categories = { {name = "Armed Ship"} };
				
add_surface_unit(GT)