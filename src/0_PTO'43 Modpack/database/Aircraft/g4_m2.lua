-- ============================================================================================================
-- DCS WORLD COMPLETE AIRCRAFT DEFINITION & SFM SPECIFICATION
-- GENERATED FOR: G4M2 Betty
-- THEATER & PROVENANCE: Pacific Theater (PTO) | Imperial Japan (IJN) (1943)
-- INSTALLED ENGINE POWERTRAIN: 2x Mitsubishi Kasei 25
-- ARCHITECTURE: Canonical SFM Standard
-- ============================================================================================================



local _ = _ or function(str) return str end

-- ============================================================================================================
-- 0. LOCAL TURRET MOUNT CONSTRUCTOR ("PTO_20mm_Type99_HE" is declared in database/Weapons/PTO43_aircraft_ammo.lua)
-- ============================================================================================================

local function IJN_Type99_20mm_Turret(tbl)
    tbl.category                = CAT_GUN_MOUNT
    tbl.name                    = tbl.name or "IJN_Type99_20mm_Turret"
    tbl.supply                  = {shells = {"PTO_20mm_Type99_HE"}, mixes = {{1}}, count = tbl.count or 500}
    tbl.gun                     = {
        max_burst_length = tbl.max_burst_length or 45,
        rates            = tbl.rates or {500},
        recoil_coeff     = 0.9,
        barrels_count    = 1,
        trigger          = {name = "GunTrigger"},
    }
    tbl.count                   = nil
    tbl.rates                   = nil
    tbl.max_burst_length        = nil
    tbl.aft_gun_mount           = false
    tbl.effective_fire_distance = tbl.effective_fire_distance or 1000
    tbl.drop_cartridge          = 204
    tbl.muzzle_pos              = tbl.muzzle_pos or {0.0, 0.0, 0.0}
    tbl.azimuth_initial         = tbl.azimuth_initial or 0
    tbl.elevation_initial       = tbl.elevation_initial or 0
    tbl.supply_position         = tbl.supply_position or {-14.50, 1.20, 0.0}
    tbl.ejector_pos             = tbl.ejector_pos or {0.0, 0.05, 0.0}
    tbl.ejector_dir             = tbl.ejector_dir or {0.0, -1.0, 0.0}
    tbl.effects                 = tbl.effects or {{ name = "FireEffect", arg = tbl.effect_arg_number or 350 }, { name = "SmokeEffect" }}
    if declare_weapon then declare_weapon(tbl) end
    return tbl
end



g4_m2 =  {
        
	Name 				=   'g4_m2',
	DisplayName			= _('[PTO43] Mitsubishi G4M-2 Betty'),
	
	-- Procedural FBX prop disabled (as in the standalone Betty mod): the EDM's own propellers look right.
	-- propellorShapeType = "3ARG_PROC_BLUR",
	-- propellorShapeName  = "g4_m2_blade.FBX",
	
	Picture 			= "g4_m2.png",
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "g4_m2",
	XRayShape           = "g4_m2_X-Ray",
	
	shape_table_data 	= 
	{
		{
			file  	 = 'g4_m2';
			life  	 = 18; -- lifebar
			vis   	 = 3; -- visibility gain.
			desrt    = 'n3d-crush109a'; -- Name of destroyed object file name
			fire  	 = { 300, 2}; -- Fire on the ground after destoyed: 300sec 2m
			username = 'g4_m2';
			index    =  WSTYPE_PLACEHOLDER;
			classname 	= "lLandPlane";
			positioning = "BYNORMAL";
			drawonmap 	= true;
		},
		{
			name  = "n3d-crush109a";
			file  = "n3d-crush109a";
			fire  = { 240, 2};
		},

	},
	
	            prop_blades_count   = 4,
                prop_locations      = {
                    {2.211, -0.014, 0.000}, {0.0, 0.0, math.rad(-1.87)},
                },
	
	
	mapclasskey 				= "P0091000027",
	attribute 					= {wsType_Air, wsType_Airplane, wsType_Intruder, WSTYPE_PLACEHOLDER, "Strategic bombers","Bombers"},
	Categories 			= {},	

	  LandRWCategories = 
    {
        [1] = 
        {
            Name = "Runway",
        },
    },
    TakeOffRWCategories = 
    {
        [1] = 
        {
            Name = "Runway",
        },
    },
	
	------------------------------------
	aim_error_level_bombing 	= 1.0,
	aim_error_dive_bombing	 	= 10.0,
    aim_error_ground_attack		= 1.0,	
    date_of_introduction		= 1940,
	country_of_origin			= "Japan",
	------------------------------------
-- ------------------------------------------------------------------------------------------------------------
--  PRIMARY GENERAL & AI PARAMETERS (DCS Core Aircraft Attributes)
-- ------------------------------------------------------------------------------------------------------------
M_empty                 = 8160, -- [kg] Operational empty weight
M_nominal               = 12500, -- [kg] Standard combat flight weight
M_max                   = 15000, -- [kg] Maximum permissible takeoff weight (MTOW)
M_fuel_max              = 3900, -- [kg] Full internal fuel capacity mass
wing_area               = 78.13, -- [m^2] Reference wing gross planform area
wing_span               = 24.89, -- [m] Tip-to-tip wingspan
wing_type               = 0, -- [enum] 0 = Straight / Trapezoidal wing   
length                  = 19.63, -- [m] Overall fuselage length
height                  = 7.46, -- [m] Ground parked height

-- Flight Test & AI Operational Airspeeds (TAS / CAS)
V_max_sea_level         = 105.6, -- [m/s] Maximum level speed at sea level (TAS)
V_max_h                 = 121.4, -- [m/s] Maximum level speed at critical supercharger altitude (TAS)
V_max_altitude          = 121.4, -- [m/s] Backward compatibility alias for V_max_h
V_opt                   = 68.6, -- [m/s] Optimal cruise speed (1.30 * V_stall_clean)
V_take_off              = 50.7, -- [m/s] Takeoff rotation airspeed
V_land                  = 54.9, -- [m/s] Landing approach airspeed
Vy_max                  = 7.5, -- [m/s] Initial sea-level rate of climb
H_max                   = 8950, -- [m] Service ceiling
Mach_max                = 0.68, -- Maximum permissible dive Mach limit

-- Static Thrust Ratings for AI & Catapult Calculation (Froude Momentum T0 in kgf)
thrust_sum_max          = 2841, -- [kgf] Maximum military static thrust for AI & catapult calculation
thrust_sum_ab           = 2841, -- [kgf] Identical to thrust_sum_max (no afterburner)

CAS_min                 = 37.0, -- [m/s] Minimum safe calibrated airspeed
Ny_min                  = -3.5, -- Minimum allowable G factor
Ny_max                  = 7.0, -- Maximum structural G limit for AI
wing_root_chord         = 4.10, -- [m] Theoretical centerline/root chord
wing_tip_chord          = 2.00, -- [m] Tip chord
wing_sweep              = 3.0, -- [deg] Quarter-chord sweep angle
tand_gear_max           = 0.577, -- Gear suspension deflection parameter

		
		average_fuel_consumption	=	0.302,
		has_afteburner	=	false,
		has_speedbrake	=	false,
        main_gear_pos = 	{ 0.63, -1.99, 1.779},
		nose_gear_pos = 	{-6.99, -1.20,	0},
		nose_gear_wheel_diameter	=	0.319,
		main_gear_wheel_diameter	=	0.683,
		sound_name	=	"engine",
		AOA_take_off	=	0.14,
		stores_number	=	11,
		bank_angle_max	=	30,
		tanker_type	=	0,
		flaps_maneuver	=	0.5,
		range	=	1015,
		RCS	=	2.5,
		Ny_max_e	=	6,
		detection_range_max	=	0,
		IR_emission_coeff	=	0.1,
		IR_emission_coeff_ab	=	0,
		engines_count	=	2,
		wing_tip_pos = 	{-0.5,	-1.0,	10.8},

		engines_nozzles = {
        [1] = { pos = {0.85, 0.05, -3.35}, elevation = math.rad(-5.0), azimuth = math.rad(-25.0), diameter = 0.12, exhaust_length_ab = 0.15, exhaust_length_ab_K = 0.15, smokiness_level = 0.04, engine_number = 1 },
        [2] = { pos = {0.85, 0.05, -2.35}, elevation = math.rad(-5.0), azimuth = math.rad( 25.0), diameter = 0.12, exhaust_length_ab = 0.15, exhaust_length_ab_K = 0.15, smokiness_level = 0.04, engine_number = 1 },
        [3] = { pos = {0.85, 0.05,  2.35}, elevation = math.rad(-5.0), azimuth = math.rad(-25.0), diameter = 0.12, exhaust_length_ab = 0.15, exhaust_length_ab_K = 0.15, smokiness_level = 0.04, engine_number = 2 },
        [4] = { pos = {0.85, 0.05,  3.35}, elevation = math.rad(-5.0), azimuth = math.rad( 25.0), diameter = 0.12, exhaust_length_ab = 0.15, exhaust_length_ab_K = 0.15, smokiness_level = 0.04, engine_number = 2 },
    },

    crew_size = 7,
    crew_members = {
        -- role is required: AI defensive guns are manned by crew with role = "gunner" (as in B6N / SBD / ED B-17G)
        [1] = { pilot_name = 56, ejection_seat_name = 0, drop_canopy_name = 0, drop_parachute_name = "pilot_raf_parachute", pos = { 3.50, 0.45, -0.35}, role = "pilot",          role_display_name = _("Pilot") },
        [2] = { pilot_name = 56, ejection_seat_name = 0, drop_canopy_name = 0, drop_parachute_name = "pilot_raf_parachute", pos = { 3.50, 0.45,  0.35}, role = "copilot",        role_display_name = _("Co-Pilot") },
        [3] = { pilot_name = 56, ejection_seat_name = 0, drop_canopy_name = 0, drop_parachute_name = "pilot_raf_parachute", pos = { 6.00, 0.00,  0.00}, role = "navigator",      role_display_name = _("Bombardier / Nose Gunner") },
        [4] = { pilot_name = 56, ejection_seat_name = 0, drop_canopy_name = 0, drop_parachute_name = "pilot_raf_parachute", pos = { 1.50, 0.00,  0.00}, role = "flight_officer", role_display_name = _("Radio Operator") },
        [5] = { pilot_name = 56, ejection_seat_name = 0, drop_canopy_name = 0, drop_parachute_name = "pilot_raf_parachute", pos = {-2.50, 0.50,  0.00}, role = "gunner",         role_display_name = _("Dorsal Gunner") },
        [6] = { pilot_name = 56, ejection_seat_name = 0, drop_canopy_name = 0, drop_parachute_name = "pilot_raf_parachute", pos = {-3.50, 0.00,  0.00}, role = "gunner",         role_display_name = _("Waist Gunner") },
        [7] = { pilot_name = 56, ejection_seat_name = 0, drop_canopy_name = 0, drop_parachute_name = "pilot_raf_parachute", pos = {-8.50, 0.20,  0.00}, role = "gunner",         role_display_name = _("Tail Gunner") },
    },

    fires_pos = {
        [1]  = {-2.00,  0.595,  0.500},
        [2]  = { 0.00,  0.000,  2.237},
        [3]  = { 0.00,  0.000, -2.237},
        [4]  = { 0.265, 0.000,  1.500},
        [5]  = {-0.265, 0.000, -1.500},
        [6]  = { 0.500, 0.000,  4.274},
        [7]  = { 0.500, 0.000, -4.274},
        [8]  = {-5.000, 0.500,  0.000},
        [9]  = {-5.000, 0.500,  0.000},
        [10] = {-5.000, 0.500,  0.000},
        [11] = {-5.000, 0.500,  0.000},
    },
		brakeshute_name	=	0,
		is_tanker	=	false,
	
	-- Countermeasures
	SingleChargeTotal	 	= 0,
	CMDS_Incrementation 	= 0,
	ChaffDefault 			= 0, 
	ChaffChargeSize 		= 0,
	FlareDefault 			= 0, 
	FlareChargeSize 		= 0,
	CMDS_Edit 				= false,
	chaff_flare_dispenser 	= {
		[1] = 
		{
			dir =  {0, -1, -1},
			pos =  {-3, -1, 2},
		}, -- end of [1]
		[2] = 
		{
			dir =  {0, -1, 1},
			pos =  {-3, -1, -2},
		}, -- end of [2]
	}, -- end of chaff_flare_dispenser

	--sensors
	detection_range_max		 = 0,
	radar_can_see_ground 	 = false, -- this should be examined (what is this exactly?)
	CanopyGeometry 			 = makeAirplaneCanopyGeometry(LOOK_GOOD, LOOK_GOOD, LOOK_GOOD),
	Sensors = {},
	HumanRadio = {
		frequency = 127.5,  -- Radio Freq
		editable = true,
		minFrequency = 100.000,
		maxFrequency = 156.000,
		modulation = MODULATION_AM
	},
	

	-- Defensive turret guns (Dauntless / ED B-17G turret scheme):
	-- g4_m2.edm connectors:
	--   Gun_point_0 = tail   (-15.89, 1.33, 0)
	--   Gun_point_1 = dorsal ( -5.69, 2.71, 0)
	Guns = {
		IJN_Type99_20mm_Turret({
			name                 = "G4M2_Tail_20mm",
			muzzle_pos_connector = "Gun_point_0", -- tail (-15.89, 1.33, 0) in g4_m2.edm
			effect_arg_number    = 350,
			count                = 500,
			supply_position      = {-14.50, 1.20, 0.0},
			turret               = {
				name                   = "TailTurret",
				H_Arg                  = 430,
				V_Arg                  = 431,
				H_Min                  = -180.0,
				H_Max                  =  180.0,
				V_Min                  =  -35.0,
				V_Max                  =   45.0,
				H_Vel                  =   65.0,
				V_Vel                  =   55.0,
				crewMemberInCommandIdx = 7, -- Tail Gunner
			},
		}),
		IJN_Type99_20mm_Turret({
			name                 = "G4M2_Dorsal_20mm",
			muzzle_pos_connector = "Gun_point_1", -- dorsal (-5.69, 2.71, 0) in g4_m2.edm
			effect_arg_number    = 351,
			count                = 400,
			supply_position      = {-5.69, 2.20, 0.0},
			turret               = {
				name                   = "DorsalTurret",
				H_Arg                  = 451,
				V_Arg                  = 452,
				H_Min                  = -180.0,
				H_Max                  =  180.0,
				V_Min                  =  -10.0,
				V_Max                  =   80.0,
				H_Vel                  =   65.0,
				V_Vel                  =   55.0,
				crewMemberInCommandIdx = 5, -- Dorsal Gunner
			},
		}),
	},
            
	
	Pylons = {
		-- One bomb-bay station (G4M2: one torpedo or one load of bombs). Fixed position as in the
		-- standalone Betty mod.
		pylon(1, 0, 0.85, -1.18, 0.0, {arg = 308, DisplayName = "Bomb bay"},
		{
			{ CLSID = "PTO_JP_TYPE91_TORPEDO", Type = 1, arg_increment = 0.0 },
			{ CLSID = "PTO_JP_G4M_4X250KG",    arg_value = 0.50 },
			{ CLSID = "PTO_JP_G4M_12X60KG",    arg_value = 0.50 },
			{ CLSID = "PTO_JP_TYPE2_500KG",    arg_value = 0.50 },
			{ CLSID = "PTO_JP_TYPE98_250KG",   arg_value = 0.35 },
		}),
	},
	
	Tasks = {
        aircraft_task(GroundAttack),
        aircraft_task(CAS),
        aircraft_task(AFAC),
        aircraft_task(RunwayAttack),
        aircraft_task(AntishipStrike),
    },
    DefaultTask = aircraft_task(AntishipStrike),
	
-- ------------------------------------------------------------------------------------------------------------
-- STANDARD FLIGHT MODEL (SFM) AERODYNAMICS (SFM_V2.3)
-- ------------------------------------------------------------------------------------------------------------
SFM_Data = {
    aerodynamics = {
        -- Control authority & stability derivatives (DCS convention)
        Cy0         = 0.1948, -- Zero-AoA 3D Wing Lift Coefficient (Rigorous Formulation)
        Mzalfa      = 7.2000, -- Pitch moment stability derivative (positive in DCS)
        Mzalfadt    = 1.3320, -- Pitch rate damping factor (positive in DCS)
        kjx         = 1.0121, -- Roll inertia factor
        kjz         = 0.0007, -- Yaw directional stability factor
        Czbe        = -0.0149, -- Directional weathercock side force derivative

        -- Drag & high-lift coefficients
        cx_gear     = 0.0123, -- Landing gear parasite drag increment
        cx_flap     = 0.0437, -- Landing flaps parasite drag increment
        cy_flap     = 0.4363, -- Landing flaps maximum lift increment
        cx_brk      = 0.06812, -- Airbrake / dive flap parasite drag increment

        table_data = {
            --      M     Cx0      Cya      B       B4     Omxmax  Aldop  Cymax
            [1]  = {0.00, 0.03987, 0.077, 0.05892, 0.21113, 0.023, 10.88, 1.078}, -- Static / Taxi
            [2]  = {0.08, 0.03987, 0.077, 0.05930, 0.14779, 0.162, 13.38, 1.264}, --Clean Stall Speed (Vs) / Deep Dogfight
            [3]  = {0.15, 0.03893, 0.078, 0.06027, 0.12625, 0.347, 14.92, 1.379}, -- Zoom Climb Threshold / Final Approach
            [4]  = {0.24, 0.03784, 0.078, 0.06252, 0.07389, 0.509, 15.91, 1.437}, -- Corner Speed / Optimal Sustained Turn
            [5]  = {0.34, 0.03687, 0.078, 0.06662, 0.05489, 0.579, 16.11, 1.408}, -- High Energy Combat / Peak Roll Rate
            [6]  = {0.44, 0.03625, 0.078, 0.07306, 0.04223, 0.405, 14.61, 1.221}, -- Max Level Speed (Vmax) / Fast Cruise
            [7]  = {0.55, 0.03625, 0.078, 0.08447, 0.08445, 0.234, 10.93, 0.934}, -- Dive Entry (Vne) / Heavy Control Stiffening
            [8]  = {0.65, 0.03625, 0.078, 0.10202, 0.21113, 0.130, 7.81, 0.690}, -- Wave Drag Onset (M_CR) / Roll Lockout
            [9]  = {0.75, 0.03625, 0.063, 0.13467, 0.84451, 0.069, 6.26, 0.460}, -- Transonic Drag Divergence (M_DD)
            [10] = {0.85, 0.03625, 0.042, 0.21231, 3.37803, 0.026, 5.08, 0.259}, -- Terminal Structural Shock / Safety Limit
        }, -- end of table_data
    }, -- end of aerodynamics

    -- --------------------------------------------------------------------------------------------------------
    --  PISTON ENGINE & SUPERCHARGER SPECIFICATION (SFM_Data.engine, typeng = 2)
    -- --------------------------------------------------------------------------------------------------------
    engine = {
        Nominal_RPM           = 2600.0, -- Full Throttle Rated Crankshaft RPM
        Nmg                   = 23.0, -- [%] Idle RPM Percentage
        MinRUD                = 0, -- Minimum throttle state
        MaxRUD                = 1, -- Maximum throttle state
        MaksRUD               = 1.00, -- 100% Military Dry Power Position
        ForsRUD               = 1.00, -- Emergency War Power (WEP) Position
        typeng                = 2, -- [enum] 2 = Piston engine with propeller dynamics
        type                  = "Piston", -- Engine Architecture ******************************
        Startup_Prework       = 12, -- Cranking duration before ignition
        Startup_RPMs          = { {0, 0}, {1, 66}, {4.6, 66}, {5, 300}, {5.5, 450}, {7, 500}, {9, 800}, {12, 900} },
        Startup_Ignition_Time = 7, -- Seconds to cylinder firing catch
        Shutdown_Duration     = 6.8, -- Spindown duration in seconds
        cylinder_firing_order = {1, 10, 5, 14, 9, 4, 13, 8, 3, 12, 7, 2, 11, 6},

        -- Mechanical & Thermodynamic Engine Dimensions
        Displ                 = 42.10, -- [L] Engine displacement in liters
        Stroke                = 0.170, -- [m] Piston stroke in meters
        V_pist_0              = 14.73, -- [m/s] Mean linear piston velocity at nominal METO RPM
        k_Eps                 = 6.80, -- Geometric cylinder compression ratio
        k_gearbox             = 1.72, -- Engine/propeller gearbox reduction ratio

        -- Supercharger & Intake Manifold Pressure Regulation
        hMaxEng               = 5.5, -- [km] Critical full-throttle altitude
        k_boost               = 1.50, -- Supercharger boost stage multiplier
        k_cfug                = 0.0015, -- Centrifugal compressor pressure rise factor
        k_vel                 = 0.014, -- Intake ram air recovery factor
        k_adiab_1             = 0.0379, -- Supercharger Stage 1 charge heating coefficient
        k_adiab_2             = 0.0562, -- Supercharger Stage 2 charge heating coefficient
        k_after_cool          = 0.700, -- Engine intercooling booster efficiency
        MAX_Manifold_P_1      = 135000, -- [Pa] Max continuous/METO manifold pressure
        MAX_Manifold_P_2      = 147990, -- [Pa] Military dry takeoff manifold pressure
        MAX_Manifold_P_3      = 147990, -- [Pa] WEP wet emergency manifold pressure

        -- Deactivation of Linear Power Derivatives (Dynamic Simulation Enforcement)
        dpdh_m                = 1800, -- [Pa/m] 
        dpdh_f                = 1800, -- [Pa/m] 
        cemax                 = 0.37, -- [kg/s] Fuel consumption parameter
        cefor                 = 0.37, -- [kg/s] WEP fuel consumption parameter

        -- Thrust Table (Mach vs Available Thrust Pmax/Pfor in Newtons)
        table_data = {
            --      M     Pmax (N)   
            [1]  = {0.00, 13933.5}, -- Static Takeoff Thrust
            [2]  = {0.08, 13249.4}, -- Takeoff Roll (~70 kts)
            [3]  = {0.15, 12540.1}, -- Climb Accel (~140 kts)
            [4]  = {0.24, 11676.3}, -- Combat Climb (~210 kts)
            [5]  = {0.34, 10798.5}, -- Fast Cruise (~280 kts)
            [6]  = {0.44, 9934.6}, -- Near Vne (~350 kts)
            [7]  = {0.55, 9168.2}, -- High Speed Dive
            [8]  = {0.65, 8652.7}, -- Dive Compressibility
            [9]  = {0.75, 8318.3}, -- Transonic Buffeting
            [10] = {0.85, 6590.5}, -- Propeller Windmilling Limit
        }, -- end of engine table_data

        -- Cooling, Friction & Governor Dynamics
        dcx_eng               = 0.021, -- Engine cooling and momentum intake drag
        Nu_0                  = 1.20, -- Propeller static thrust coefficient at V=0
        Nu_1                  = 0.89, -- Propeller advance ratio (J) decay coefficient
        Nu_2                  = 0.0009, -- Helical tip Mach shock loss coefficient
        N_indic_0             = 1320000, -- [W] Indicated thermodynamic power
        N_fr_0                = 0.040, -- Static mechanical friction mean effective pressure
        N_fr_1                = 0.001, -- Viscous friction decay with piston speed
        P_oil                 = 495438, -- [Pa] Engine oil operating pressure
        k_oil                 = 0.00004, -- Oil viscosity shearing resistance
        k_piston              = 3000, -- IMEP piston velocity scaler
        k_reg                 = 0.0050, -- Constant-speed governor tracking gain
        prop_direction        = 1, -- +1 for CCW from front / CW from cockpit view
        Init_Mom              = 220, -- [N*m] Starter cranking torque
        D_prop                = 3.30, -- [m] Propeller disc tip-to-tip diameter
        MOI_prop              = 45.0, -- [kg*m^2] Propeller polar mass moment of inertia
        prop_pitch_min        = 22.0, -- [deg] Fine pitch limit for takeoff
        prop_pitch_max        = 58.0, -- [deg] Coarse pitch limit for dive/cruise
        prop_pitch_feather    = 85.0, -- [deg] Feathered streamlined pitch angle
        prop_blades_count     = 4, -- Propeller blade count

    }, -- end of engine
}, -- end of SFM_Data

-- ============================================================================================================
    -- MITSUBISHI G4M2 "BETTY" - VERBOSE DAMAGE MODEL (40 COLLISION SHELLS + 34 INNARDS)
    -- Matched strictly to exported EDM collision shells and X-Ray innard registries
    -- Calibrated to Tier 4 Medium/Heavy Bomber specifications (2x Mitsubishi Kasei 25 Radials, MTOW: ~12,500 kg)
    -- Vulnerability profile ("The Flying Lighter"): Unsealed integral wing & ventral keel fuel cells
    -- Pure physics configuration: zero visual args declarations to avoid missing-mesh assertions
    -- ============================================================================================================

    Damage = verbose_to_dmg_properties({
        -- =====================================================================
        -- 1. NOSE & FORWARD COMPARTMENTS
        -- =====================================================================
        ["NOSE_BOTTOM"] = {
            critical_damage = 7.0,
            damage_boundary = 0.20,
            droppable = false,
            construction = { durability = 2.2, skin = "Aluminum", thickness = 0.0010, spar = "Truss" },
            children = { "NOSE_LEFT_SIDE", "NOSE_RIGHT_SIDE" },
            innards = {
                { id = "XCrew1" },  -- Nose bombardier / bow gunner torso
                { id = "XCrew1H" }, -- Nose bombardier / bow gunner head
            },
        },
        ["NOSE_LEFT_SIDE"] = {
            critical_damage = 6.0,
            damage_boundary = 0.20,
            droppable = false,
            construction = { durability = 2.0, skin = "Aluminum", thickness = 0.0010 },
        },
        ["NOSE_RIGHT_SIDE"] = {
            critical_damage = 6.0,
            damage_boundary = 0.20,
            droppable = false,
            construction = { durability = 2.0, skin = "Aluminum", thickness = 0.0010 },
        },

        -- =====================================================================
        -- 2. FLIGHT DECK, FUSELAGE STATIONS & DORSAL DOME
        -- =====================================================================
        ["COCKPIT"] = {
            critical_damage = 5.5,
            damage_boundary = 0.25,
            droppable = false,
            construction = { durability = 2.0, skin = "Glass", thickness = 0.0035, spar = "Truss" },
            innards = {
                { id = "XCrew0" },          -- Command pilot torso
                { id = "XCrew0H" },         -- Command pilot head
                { id = "XCtrlCrew0Stick", skin = "Steel", wall = 0.025 },
            },
        },
        ["CABIN_LEFT_SIDE"] = {
            critical_damage = 12.0,
            damage_boundary = 0.25,
            droppable = false,
            construction = { durability = 2.5, skin = "Aluminum", thickness = 0.0012, spar = "Truss" },
            children = { "COCKPIT", "NOSE_BOTTOM", "WING_L_IN", "FUSELAGE_TOP" },
            innards = {
                { id = "XCtrlLineElevator", skin = "Steel", wall = 0.002, plenum = 0.001 },
                { id = "XCtrlLineRudder",   skin = "Steel", wall = 0.002, plenum = 0.001 },
            },
        },
        ["CABIN_RIGHT_SIDE"] = {
            critical_damage = 12.0,
            damage_boundary = 0.25,
            droppable = false,
            construction = { durability = 2.5, skin = "Aluminum", thickness = 0.0012, spar = "Truss" },
            children = { "WING_R_IN" },
        },
        ["FUSELAGE_TOP"] = {
            critical_damage = 5.0,
            damage_boundary = 0.25,
            droppable = false,
            construction = { durability = 1.8, skin = "Glass", thickness = 0.0040, spar = "Truss" },
            innards = {
                { id = "XCrew2" },  -- Dorsal 20mm turret gunner torso
                { id = "XCrew2H" }, -- Dorsal 20mm turret gunner head
            },
        },
        ["FUSELAGE_BOTTOM"] = {
            critical_damage = 16.0,
            damage_boundary = 0.25,
            droppable = false,
            construction = { durability = 2.8, skin = "Aluminum", thickness = 0.0014, spar = "Truss" },
            children = { "CABIN_LEFT_SIDE", "CABIN_RIGHT_SIDE", "TAIL_LEFT_SIDE", "TAIL_RIGHT_SIDE" },
            fuel_tank = { critical_damage = 2.5, volume = 640.0, integrity_loss_rate = 0.60 },
            failures = {
                { "FUEL_TANK_00_MINOR_LEAK",  0.50 },
                { "FUEL_TANK_00_MEDIUM_LEAK", 0.35 },
                { "FUEL_TANK_00_MAJOR_LEAK",  0.25 },
                { "FUEL_TANK_00_FIRE",        0.35 },
                { "FUEL_TANK_00_EXPLODED",    0.10 },
            },
            innards = {
                { id = "XFuelTank0", skin = "Aluminum", wall = 0.002, plenum = 0.65 },
            },
        },

        -- =====================================================================
        -- 3. PORT POWERPLANT & NACELLE (MITSUBISHI KASEI 25 #0, Z = -2.85m)
        -- =====================================================================
        ["ENGINE_L"] = {
            critical_damage = 8.5,
            damage_boundary = 0.10,
            droppable = false,
            refractory = true,
            construction = { durability = 3.5, skin = "CastIron", thickness = 0.0080, spar = "Rod" },
            children = { "ROTOR_L" },
            failures = {
                { "ENG0_OIL_RADIATOR_0_PIERCED", 0.60 },
                { "ENG0_OIL_HOSE_0_LEAK",        0.40 },
                { "ENG0_JAMMED",                 0.15 },
            },
            innards = {
                { id = "XEng0Case",         skin = "CastIron", wall = 0.020 },
                { id = "XEng0OilTank0",     skin = "Aluminum", wall = 0.004 },
                { id = "XEng0Supercharger", skin = "Steel",    wall = 0.006 },
            },
        },
        ["ROTOR_L"] = {
            critical_damage = 3.0,
            droppable = true,
            construction = { durability = 1.8, skin = "Steel", thickness = 0.0040, spar = "Rod" },
        },
        ["MTG_L"] = {
            critical_damage = 8.0,
            damage_boundary = 0.20,
            droppable = false,
            construction = { durability = 2.2, skin = "Aluminum", thickness = 0.0012 },
            children = { "ENGINE_L", "MTG_L_BOTTOM" },
        },
        ["MTG_L_BOTTOM"] = {
            critical_damage = 7.5,
            damage_boundary = 0.20,
            droppable = false,
            construction = { durability = 2.2, skin = "Aluminum", thickness = 0.0012 },
            children = { "WHEEL_L" },
            radiator = { critical_damage = 1.2, volume = 0.35 },
            innards = {
                { id = "XEng0OilRadiator0", skin = "Steel", wall = 0.003 },
            },
        },

        -- =====================================================================
        -- 4. STARBOARD POWERPLANT & NACELLE (MITSUBISHI KASEI 25 #1, Z = +2.85m)
        -- =====================================================================
        ["ENGINE_R"] = {
            critical_damage = 8.5,
            damage_boundary = 0.10,
            droppable = false,
            refractory = true,
            construction = { durability = 3.5, skin = "CastIron", thickness = 0.0080, spar = "Rod" },
            children = { "ROTOR_R" },
            failures = {
                { "ENG1_OIL_RADIATOR_0_PIERCED", 0.60 },
                { "ENG1_OIL_HOSE_0_LEAK",        0.40 },
                { "ENG1_JAMMED",                 0.15 },
            },
            innards = {
                { id = "XEng1Case",         skin = "CastIron", wall = 0.020 },
                { id = "XEng1OilTank0",     skin = "Aluminum", wall = 0.004 },
                { id = "XEng1Supercharger", skin = "Steel",    wall = 0.006 },
            },
        },
        ["ROTOR_R"] = {
            critical_damage = 3.0,
            droppable = true,
            construction = { durability = 1.8, skin = "Steel", thickness = 0.0040, spar = "Rod" },
        },
        ["MTG_R"] = {
            critical_damage = 8.0,
            damage_boundary = 0.20,
            droppable = false,
            construction = { durability = 2.2, skin = "Aluminum", thickness = 0.0012 },
            children = { "ENGINE_R", "MTG_R_BOTTOM" },
        },
        ["MTG_R_BOTTOM"] = {
            critical_damage = 7.5,
            damage_boundary = 0.20,
            droppable = false,
            construction = { durability = 2.2, skin = "Aluminum", thickness = 0.0012 },
            children = { "WHEEL_R" },
            radiator = { critical_damage = 1.2, volume = 0.35 },
            innards = {
                { id = "XEng1OilRadiator0", skin = "Steel", wall = 0.003 },
            },
        },

        -- =====================================================================
        -- 5. PORT (LEFT) WING & CONTROL SURFACES
        -- =====================================================================
        ["WING_L_IN"] = {
            critical_damage = 14.0,
            damage_boundary = 0.15,
            droppable = true,
            construction = { durability = 3.2, skin = "Aluminum", thickness = 0.0014, spar = "FlangeBeam" },
            children = { "WING_L_CENTER", "MTG_L", "FLAP_L" },
            fuel_tank = { critical_damage = 2.5, volume = 1200.0, integrity_loss_rate = 0.60 },
            failures = {
                { "FUEL_TANK_01_MINOR_LEAK",  0.50 },
                { "FUEL_TANK_01_MEDIUM_LEAK", 0.35 },
                { "FUEL_TANK_01_MAJOR_LEAK",  0.25 },
                { "FUEL_TANK_01_FIRE",        0.35 },
                { "FUEL_TANK_01_EXPLODED",    0.10 },
            },
            innards = {
                { count = 2, durability = 1.30, id = "XSparWLHIn", plenum = 0.25, skin = "Aluminum", wall = 0.012 },
                { id = "XFuelTank1", skin = "Aluminum", wall = 0.002, plenum = 0.70 },
            },
        },
        ["WING_L_CENTER"] = {
            critical_damage = 11.0,
            damage_boundary = 0.15,
            droppable = true,
            construction = { durability = 2.6, skin = "Aluminum", thickness = 0.0012, spar = "FlangeBeam" },
            children = { "WING_L_OUT" },
            fuel_tank = { critical_damage = 2.0, volume = 850.0, integrity_loss_rate = 0.60 },
            failures = {
                { "FUEL_TANK_03_MINOR_LEAK",  0.50 },
                { "FUEL_TANK_03_MAJOR_LEAK",  0.25 },
                { "FUEL_TANK_03_FIRE",        0.35 },
            },
            innards = {
                { count = 2, durability = 1.15, id = "XSparWLHMid", plenum = 0.25, skin = "Aluminum", wall = 0.010 },
                { id = "XFuelTank3", skin = "Aluminum", wall = 0.002, plenum = 0.65 },
            },
        },
        ["WING_L_OUT"] = {
            critical_damage = 7.0,
            damage_boundary = 0.15,
            droppable = true,
            construction = { durability = 2.0, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam" },
            children = { "AILERON_L" },
            innards = {
                { count = 2, durability = 0.90, id = "XSparWLHOut", plenum = 0.20, skin = "Aluminum", wall = 0.008 },
            },
        },
        ["AILERON_L"] = {
            critical_damage = 2.5,
            damage_boundary = 0.50,
            droppable = true,
            construction = { durability = 1.0, skin = "Fabric", thickness = 0.0006, spar = "Truss" },
        },
        ["FLAP_L"] = {
            critical_damage = 3.5,
            damage_boundary = 0.50,
            droppable = false,
            construction = { durability = 1.5, skin = "Aluminum", thickness = 0.0010 },
        },

        -- =====================================================================
        -- 6. STARBOARD (RIGHT) WING & CONTROL SURFACES
        -- =====================================================================
        ["WING_R_IN"] = {
            critical_damage = 14.0,
            damage_boundary = 0.15,
            droppable = true,
            construction = { durability = 3.2, skin = "Aluminum", thickness = 0.0014, spar = "FlangeBeam" },
            children = { "WING_R_CENTER", "MTG_R", "FLAP_R" },
            fuel_tank = { critical_damage = 2.5, volume = 1200.0, integrity_loss_rate = 0.60 },
            failures = {
                { "FUEL_TANK_02_MINOR_LEAK",  0.50 },
                { "FUEL_TANK_02_MEDIUM_LEAK", 0.35 },
                { "FUEL_TANK_02_MAJOR_LEAK",  0.25 },
                { "FUEL_TANK_02_FIRE",        0.35 },
                { "FUEL_TANK_02_EXPLODED",    0.10 },
            },
            innards = {
                { count = 2, durability = 1.30, id = "XSparWRHIn", plenum = 0.25, skin = "Aluminum", wall = 0.012 },
                { id = "XFuelTank2", skin = "Aluminum", wall = 0.002, plenum = 0.70 },
            },
        },
        ["WING_R_CENTER"] = {
            critical_damage = 11.0,
            damage_boundary = 0.15,
            droppable = true,
            construction = { durability = 2.6, skin = "Aluminum", thickness = 0.0012, spar = "FlangeBeam" },
            children = { "WING_R_OUT" },
            fuel_tank = { critical_damage = 2.0, volume = 850.0, integrity_loss_rate = 0.60 },
            failures = {
                { "FUEL_TANK_04_MINOR_LEAK",  0.50 },
                { "FUEL_TANK_04_MAJOR_LEAK",  0.25 },
                { "FUEL_TANK_04_FIRE",        0.35 },
            },
            innards = {
                { count = 2, durability = 1.15, id = "XSparWRHMid", plenum = 0.25, skin = "Aluminum", wall = 0.010 },
                { id = "XFuelTank4", skin = "Aluminum", wall = 0.002, plenum = 0.65 },
            },
        },
        ["WING_R_OUT"] = {
            critical_damage = 7.0,
            damage_boundary = 0.15,
            droppable = true,
            construction = { durability = 2.0, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam" },
            children = { "AILERON_R" },
            innards = {
                { count = 2, durability = 0.90, id = "XSparWRHOut", plenum = 0.20, skin = "Aluminum", wall = 0.008 },
            },
        },
        ["AILERON_R"] = {
            critical_damage = 2.5,
            damage_boundary = 0.50,
            droppable = true,
            construction = { durability = 1.0, skin = "Fabric", thickness = 0.0006, spar = "Truss" },
        },
        ["FLAP_R"] = {
            critical_damage = 3.5,
            damage_boundary = 0.50,
            droppable = false,
            construction = { durability = 1.5, skin = "Aluminum", thickness = 0.0010 },
        },

        -- =====================================================================
        -- 7. TAIL SECTION & EMPENNAGE
        -- =====================================================================
        ["TAIL_LEFT_SIDE"] = {
            critical_damage = 8.0,
            damage_boundary = 0.20,
            droppable = false,
            construction = { durability = 2.2, skin = "Aluminum", thickness = 0.0010 },
            children = { "TAIL" },
        },
        ["TAIL_RIGHT_SIDE"] = {
            critical_damage = 8.0,
            damage_boundary = 0.20,
            droppable = false,
            construction = { durability = 2.2, skin = "Aluminum", thickness = 0.0010 },
        },
        ["TAIL"] = {
            critical_damage = 11.0,
            damage_boundary = 0.20,
            droppable = true,
            construction = { durability = 2.8, skin = "Aluminum", thickness = 0.0012, spar = "FlangeBeam" },
            children = { "FIN_L_BOTTOM", "STABILIZER_L_IN", "STABILIZER_R_IN" },
            innards = {
                { id = "XCrew3" },  -- Aft tail cone gunner torso
                { id = "XCrew3H" }, -- Aft tail cone gunner head
            },
        },
        ["FIN_L_BOTTOM"] = {
            critical_damage = 7.0,
            damage_boundary = 0.20,
            droppable = true,
            construction = { durability = 2.0, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam" },
            children = { "FIN_L_TOP" },
            innards = {
                { id = "XSparKeelIn", plenum = 0.25, skin = "Aluminum", wall = 0.006 },
            },
        },
        ["FIN_L_TOP"] = {
            critical_damage = 5.0,
            damage_boundary = 0.20,
            droppable = true,
            construction = { durability = 1.8, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam" },
            children = { "RUDDER" },
            innards = {
                { id = "XSparKeelOut", plenum = 0.25, skin = "Aluminum", wall = 0.005 },
            },
        },
        ["RUDDER"] = {
            critical_damage = 3.5,
            damage_boundary = 0.50,
            droppable = true,
            construction = { durability = 1.0, skin = "Fabric", thickness = 0.0005 },
        },
        ["STABILIZER_L_IN"] = {
            critical_damage = 7.0,
            damage_boundary = 0.20,
            droppable = true,
            construction = { durability = 2.0, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam" },
            children = { "STABILIZER_L_OUT", "ELEVATOR_L" },
            innards = {
                { id = "XSparStabLHIn", skin = "Aluminum", wall = 0.006 },
            },
        },
        ["STABILIZER_L_OUT"] = {
            critical_damage = 5.0,
            damage_boundary = 0.20,
            droppable = true,
            construction = { durability = 1.8, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam" },
        },
        ["ELEVATOR_L"] = {
            critical_damage = 3.0,
            damage_boundary = 0.50,
            droppable = true,
            construction = { durability = 1.0, skin = "Fabric", thickness = 0.0005 },
        },
        ["STABILIZER_R_IN"] = {
            critical_damage = 7.0,
            damage_boundary = 0.20,
            droppable = true,
            construction = { durability = 2.0, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam" },
            children = { "STABILIZER_R_OUT", "ELEVATOR_R" },
            innards = {
                { id = "XSparStabRHIn", skin = "Aluminum", wall = 0.006 },
            },
        },
        ["STABILIZER_R_OUT"] = {
            critical_damage = 5.0,
            damage_boundary = 0.20,
            droppable = true,
            construction = { durability = 1.8, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam" },
        },
        ["ELEVATOR_R"] = {
            critical_damage = 3.0,
            damage_boundary = 0.50,
            droppable = true,
            construction = { durability = 1.0, skin = "Fabric", thickness = 0.0005 },
        },

        -- =====================================================================
        -- 8. UNDERCARRIAGE
        -- =====================================================================
        ["WHEEL_L"] = {
            critical_damage = 5.0,
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = { durability = 2.5, skin = "Steel", thickness = 0.0050, spar = "Rod" },
        },
        ["WHEEL_R"] = {
            critical_damage = 5.0,
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = { durability = 2.5, skin = "Steel", thickness = 0.0050, spar = "Rod" },
        },
    }),

    DamageParts = {},

lights_data = {	typename = "collection", lights = {
    [1] = {typename = "collection",lights = {}},
	[2] = {typename = "collection",
			lights = {-- Landing light
					  {typename = "spotlight",
					   connector = "MAIN_SPOT_PTR_02",
					   argument = 209,
					   dir_correction = {elevation = math.rad(-1)}
					  },
					  {-- Landing/Taxi light
					   typename = "spotlight",
					   connector = "MAIN_SPOT_PTR_01",
					   argument = 208,
					   dir_correction = {elevation = math.rad(3)}
					  }
					 }
			},
    [3]	= {typename = "collection",
			lights = {-- Left Position Light (red)
					  {typename = "omnilight",
					   connector = "BANO_1",
					   color = {0.99, 0.11, 0.3},
					   pos_correction  = {0, 0, -0.2},
					   argument  = 190
					  },
					  -- Right Position Light (green)
					  {typename = "omnilight",
					   connector = "BANO_2",
					   color = {0, 0.894, 0.6},
					   pos_correction = {0, 0, 0.2},
					   argument  = 191
					   },
					  -- Tail Position Light (white)
					  {typename = "omnilight",
					  connector = "BANO_0",
					  color = {1, 1, 1},
					  pos_correction  = {0, 0, 0},
					  argument  = 192
					  }}
			},
    [4] = {typename = "collection",lights = {}},
	[5]	= {typename = "collection",lights = {}},
	}}, -- end lights_data




}

add_aircraft(g4_m2)