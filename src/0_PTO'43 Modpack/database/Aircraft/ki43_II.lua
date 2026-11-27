-- ============================================================================================================
-- DCS WORLD COMPLETE AIRCRAFT DEFINITION & SFM SPECIFICATION (Master Suite v2.45)
-- GENERATED FOR: Ki-43-II Hayabusa
-- THEATER & PROVENANCE: Pacific Theater (PTO) | Imperial Japan (IJA) (1943)
-- INSTALLED ENGINE POWERTRAIN: Nakajima Sakae 21
-- ARCHITECTURE: Canonical SFM Standard
-- ============================================================================================================

-- =============================================================================
-- WEAPON DEFINITIONS (Ho-103 12.7x81mmSR Cowl Machine Guns)
-- =============================================================================

local tracer_on_time = 0.01

declare_weapon({
    category    = CAT_SHELLS,
    name        = "Ki43_Kami_Ho103_127_AP",
    user_name   = _("12.7mm Ho-103 AP-T"),
    model_name  = "tracer_bullet_yellow",
    v0          = 780.0,
    Dv0         = 0.0080,
    Da0         = 0.0004,
    Da1         = 0.0,
    mass        = 0.038,
    round_mass  = 0.085,
    explosive   = 0.0018,
    life_time   = 5.5,
    caliber     = 12.7,
    s = 0.0, j = 0.0, l = 0.0, charTime = 0,
    cx          = {0.5, 1.27, 0.70, 0.200, 2.30},
    k1          = 2.2e-08,
    tracer_off  = 3.0,
    tracer_on   = tracer_on_time,
    scale_tracer = 1.0,
    smoke_tail_life_time = 0.4,
    cartridge   = 204,
})

function Ki43_Kami_Ho103_Cowl(tbl)
    tbl.category                = CAT_GUN_MOUNT
    tbl.name                    = "Ki43_Kami_Ho103"
    tbl.supply                  = {
        shells = {"Ki43_Kami_Ho103_127_AP"},
        mixes  = {{1}},
        count  = tbl.count or 250,
    }
    tbl.gun                     = {
        max_burst_length = 200,
        rates            = {900},
        recoil_coeff     = 1.0,
        barrels_count    = 1,
    }
    tbl.aft_gun_mount           = false
    tbl.effective_fire_distance = 800
    tbl.drop_cartridge          = 204
    tbl.azimuth_initial         = 0.0
    tbl.elevation_initial       = 0.0
    tbl.muzzle_pos              = {0.0, 0.0, 0.0}
    tbl.supply_position         = tbl.supply_position or {1.10, 0.35, 0.0}
    tbl.ejector_pos             = {-0.2, -0.4, 0.0}
    tbl.ejector_dir             = {0.0, -1.0, 0.0}
    tbl.effects                 = {
        { name = "FireEffect", arg = tbl.effect_arg_number or 436 },
        { name = "SmokeEffect" },
    }
    return declare_weapon(tbl)
end

ki43_Kamikaze = {
        
	Name 				= 'ki43_Kamikaze',
	DisplayName			= _('[PTO43] Nakajima Ki-43-II -Oscar-'),
	DisplayNameShort	= _('Ki-43-II'),
	
	Picture 			= "ki43_Kamikaze.png",
	Rate 				= 40,
	Shape 				= "ki43_kamikaze", -- Case-matching with Shapes/ki43_kamikaze.edm
	XRayShape           = "ki-43_X-Ray",
	propellorShapeType  = "3ARG_PROC_BLUR",
	propellorShapeName  = "ki43_blade.FBX",   -- one blade, +Y radial; blur drawn on PROP_LOCATOR_0 (static blades hidden by arg 475)
	propellorShapeBlurX = 1.0,
	
	shape_table_data 	= 
	{
		{
			file  	    = 'ki43_kamikaze',
			life  	    = 18,
			vis   	    = 3,
			desrt       = 'ki43_Kamikaze_Collision',
			fire  	    = {300, 2},
			username    = 'ki43_Kamikaze',
			index       = WSTYPE_PLACEHOLDER,
			classname 	= "lLandPlane",
			positioning = "BYNORMAL",
			drawonmap 	= true,
		},
		{
			name  = "ki43_Kamikaze_Collision",
			file  = "ki43_Kamikaze_Collision",
			fire  = {240, 2},
		},
	},
	mapclasskey = "P0091000025",
	attribute   = {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER, "Fighters"},	-- was "Battleplanes" (= attack aircraft)
	Categories  = {},

	LandRWCategories = 
    {
        [1] = { Name = "Runway" },
        [2] = { Name = "GrassRunway" },
    },
	
	TakeOffRWCategories = 
    {
        [1] = { Name = "Runway" },
        [2] = { Name = "GrassRunway" },
    },
	
	takeoff_and_landing_type = "Runway",
-- ------------------------------------------------------------------------------------------------------------
-- PRIMARY GEOMETRIC & MASS DECLARATIONS (DCS Core Aircraft Attributes)
-- ------------------------------------------------------------------------------------------------------------

	M_empty						= 1910,  -- [kg]
	M_nominal					= 2590,  -- [kg] Attack weight with 250kg bomb
	M_max						= 2925,  -- [kg] Max overload with 500kg bomb
	M_fuel_max					= 410,   -- [kg] Partial fuel load for single-way mission
	H_max						= 11200, -- [m]
	average_fuel_consumption	= 0.050,
	CAS_min						= 33.4,  -- [m/s]
	V_opt						= 82.2,
	V_take_off					= 44.7,
	V_land						= 48.4,
	V_max_sea_level				= 126.4, -- [m/s]
	V_max_h						= 147.2, -- [m/s] 511 km/h at 4,000 m
	Vy_max						= 17.0,
	Mach_max					= 0.71,
	Ny_min						= -3.5,
	Ny_max						= 7.0,
	Ny_max_e					= 7.0,
	AOA_take_off				= 0.14,
	bank_angle_max				= 70,
	has_afteburner				= false,
	has_speedbrake				= false,
    main_gear_pos 				= { 0.63, -2.17, 1.688},	-- 2026-11 new EDM (was 1.779)
	nose_gear_pos 				= {-5.14, -1.01, 0},		-- tail wheel contact, new EDM (was -6.99, -1.00)
	radar_can_see_ground		= false,
	sound_name					= "engine",
	stores_number				= 1,
	tand_gear_max				= 0.577,
	tanker_type					= 0,
	wing_area					= 21.40,
	wing_span					= 10.84,
	thrust_sum_max				= 1005,
	thrust_sum_ab				= 1005,
	length						= 8.92,
	height						= 3.39,
	wing_type                   = 0,	-- SFM Master Suite v2.45
	V_max_altitude              = 147.2,	-- SFM Master Suite v2.45
	wing_root_chord             = 2.30,	-- SFM Master Suite v2.45
	wing_tip_chord              = 1.50,	-- SFM Master Suite v2.45
	wing_sweep                  = 0.0,	-- SFM Master Suite v2.45
	flaps_maneuver				= 0.4,
	range						= 1200,
	crew_size					= 1,
	RCS							= 2.2,
	detection_range_max			= 0,
	IR_emission_coeff			= 0.15,
	IR_emission_coeff_ab		= 0,
	engines_count				= 1,
	wing_tip_pos 				= {0.15, -0.19, 5.54},	-- new EDM (was -0.5, -0.2, 5.42)
	nose_gear_wheel_diameter	= 0.23,		-- tail wheel (was 0.169)
	main_gear_wheel_diameter	= 0.60,		-- (was 0.617)
	engines_nozzles = {
        
        [1] = {
            pos                 = {  1.060, -0.360, -0.560 }, -- new EDM (was 1.55,-0.16,-0.58)
            elevation           = math.rad(-4.0),             
            azimuth             = math.rad(-12.0),            
            diameter            = 0.10,                       
            exhaust_length_ab   = 0.12,                       
            exhaust_length_ab_K = 0.20,
            smokiness_level     = 0.045,                       
            engine_number       = 1,
        },
       
        [2] = {
            pos                 = {  1.060, -0.360,  0.560 }, -- new EDM (was 1.55,-0.16,0.58)
            elevation           = math.rad(-4.0),
            azimuth             = math.rad( 12.0),
            diameter            = 0.10,
            exhaust_length_ab   = 0.12,
            exhaust_length_ab_K = 0.20,
            smokiness_level     = 0.08,
            engine_number       = 1,
        },
    },

	crew_members = 
	{
		[1] = 
		{
			pilot_name		  	= 56,
			ejection_seat_name	= 0,
			drop_canopy_name	= 0,
			pos		   			= {-0.64, 0.09, 0.0},	-- new EDM (was -1.46, -0.045, 0.0)
		},
	},
	brakeshute_name				= 0,
	is_tanker					= false,

    fires_pos = {
        -- [1] Engine core / Forward radial fire (XEng0Case crankcase & cylinder bank)
        [1]  = {  2.350,  0.000,  0.000 },

        -- [2] Main fuselage ventral fuel cell fire (XFuelTank0 under/behind cockpit floor)
        [2]  = {  1.000, -0.100,  0.000 },

        -- [3] Port root inner wing fuel tank fire (XFuelTank1 center section, Left)
        [3]  = {  0.200, -0.180, -1.100 },

        -- [4] Starboard root inner wing fuel tank fire (XFuelTank2 center section, Right)
        [4]  = {  0.200, -0.180,  1.100 },

        -- [5] Port mid-wing / Fold joint fire (XSparWLHMid panel transition)
        [5]  = {  0.120, -0.020, -2.700 },

        -- [6] Starboard mid-wing / Fold joint fire (XSparWRHMid panel transition)
        [6]  = {  0.120, -0.020,  2.700 },

        -- [7] Ventral oil radiator bath & lower cowl fire (XEng0OilRadiator0 chin scoop)
        [7]  = {  2.250, -0.550,  0.000 },

        -- [8] Empennage & tail cone fire (XSparKeelIn / Base of vertical fin & rudder)
        [8]  = { -4.700,  0.550,  0.000 },
    }, -- end of fires_pos
	
	Countermeasures 			= {},
	passivCounterm = {
		CMDS_Incrementation 	= 0,
		ChaffDefault 			= 0, 
		ChaffChargeSize 		= 0,
		FlareDefault 			= 0, 
		FlareChargeSize 		= 0,
		CMDS_Edit 				= false,
		SingleChargeTotal		= 0,
		chaff					= {default = 0, increment = 0, chargeSz = 0},
		flare					= {default = 0, increment = 0, chargeSz = 0},
	},
	chaff_flare_dispenser 		= {},

	detection_range_max		 	= 0,
	radar_can_see_ground 	 	= false,
	CanopyGeometry 			 = makeAirplaneCanopyGeometry(LOOK_GOOD, LOOK_GOOD, LOOK_GOOD),
	Sensors = {},
	HumanRadio = {
		frequency 				= 124.0,
		editable 				= true,
		minFrequency 			= 100.000,
		maxFrequency 			= 156.000,
		modulation 				= MODULATION_AM
	},
	
	-- 2x Cowling mounted 12.7mm Ho-103
	Guns = {
		Ki43_Kami_Ho103_Cowl({
			muzzle_pos_connector = "Gun_point_2",
			effect_arg_number = 432,
			supply_position = {1.42, 0.50, -0.35},
		}),
		Ki43_Kami_Ho103_Cowl({
			muzzle_pos_connector = "Gun_point_3",
			effect_arg_number = 433,
			supply_position = {1.42, 0.50, 0.35},
		}),
	},
            
	Pylons = {
		pylon(1, 1, 0, -1.00, 0, {use_full_connector_position = true, connector = "Pylon1", arg = 308},
		{
			-- Japanese stores only (was German SC 250/500): 250 kg Type 98, 500 kg Type 2 (special attack fit)
			{ CLSID = "PTO_JP_TYPE98_250KG", arg_value = 0.25 },
			{ CLSID = "PTO_JP_TYPE2_500KG",  arg_value = 0.25 },
		}),
    },
	
	Tasks = {
        aircraft_task(CAP),
        aircraft_task(Intercept),
        aircraft_task(Escort),
        aircraft_task(FighterSweep),
        aircraft_task(CAS),
        aircraft_task(GroundAttack),
        aircraft_task(AntishipStrike),
    },
    DefaultTask = aircraft_task(CAP),
	
-- ------------------------------------------------------------------------------------------------------------
-- 2. STANDARD FLIGHT MODEL (SFM) AERODYNAMICS (SFM_Data.aerodynamics) v2.45
-- ------------------------------------------------------------------------------------------------------------
SFM_Data = {
    aerodynamics = {
        -- Control authority & stability derivatives (DCS convention)
        Cy0         = 0.1399, -- Zero-AoA 3D Wing Lift Coefficient (Rigorous Formulation)
        Mzalfa      = 3.9000, -- Pitch moment stability derivative (positive in DCS)
        Mzalfadt    = 0.9165, -- Pitch rate damping factor (positive in DCS)
        kjx         = 3.0720, -- Roll inertia factor
        kjz         = 0.0021, -- Yaw directional stability factor
        Czbe        = -0.0125, -- Directional weathercock side force derivative

        -- Drag & high-lift coefficients
        cx_gear     = 0.0142, -- Landing gear parasite drag increment
        cx_flap     = 0.0373, -- Landing flaps parasite drag increment
        cy_flap     = 0.3682, -- Landing flaps maximum lift increment
        cx_brk      = 0.0000, -- Airbrake / dive flap parasite drag increment

        table_data = {
            --      M     Cx0      Cya      B       B4     Omxmax  Aldop  Cymax
            [1]  = {0.00, 0.02792, 0.069, 0.08408, 0.27039, 0.054, 11.16, 1.023}, -- Static / Taxi
            [2]  = {0.08, 0.02792, 0.069, 0.08462, 0.18927, 0.381, 13.81, 1.200}, --Clean Stall Speed (Vs) / Deep Dogfight
            [3]  = {0.15, 0.02726, 0.070, 0.08602, 0.16223, 0.817, 15.43, 1.309}, -- Zoom Climb Threshold / Final Approach
            [4]  = {0.24, 0.02650, 0.071, 0.08922, 0.09464, 1.198, 16.20, 1.364}, -- Corner Speed / Optimal Sustained Turn
            [5]  = {0.34, 0.02581, 0.073, 0.09507, 0.07030, 1.362, 15.86, 1.337}, -- High Energy Combat / Peak Roll Rate
            [6]  = {0.44, 0.02538, 0.077, 0.10427, 0.05408, 0.899, 13.63, 1.159}, -- Max Level Speed (Vmax) / Fast Cruise
            [7]  = {0.55, 0.02538, 0.078, 0.12055, 0.10815, 0.378, 9.94, 0.887}, -- Dive Entry (Vne) / Heavy Control Stiffening
            [8]  = {0.65, 0.02552, 0.073, 0.14559, 0.27039, 0.153, 7.51, 0.655}, -- Wave Drag Onset (M_CR) / Roll Lockout
            [9]  = {0.75, 0.03598, 0.057, 0.19218, 1.08155, 0.082, 6.27, 0.436}, -- Transonic Drag Divergence (M_DD)
            [10] = {0.85, 0.10567, 0.038, 0.30299, 4.32619, 0.031, 5.04, 0.246}, -- Terminal Structural Shock / Safety Limit
        }, -- end of table_data
    }, -- end of aerodynamics

    -- --------------------------------------------------------------------------------------------------------
    -- 3. PISTON ENGINE & SUPERCHARGER SPECIFICATION (SFM_Data.engine, typeng = 2)
    -- --------------------------------------------------------------------------------------------------------
    engine = {
        Nominal_RPM           = 2750.0, -- Full Throttle Rated Crankshaft RPM
        Nmg                   = 22.0, -- [%] Idle RPM Percentage
        MinRUD                = 0, -- Minimum throttle state
        MaxRUD                = 1, -- Maximum throttle state
        MaksRUD               = 1.00, -- 100% Military Dry Power Position
        ForsRUD               = 1.00, -- Emergency War Power (WEP) Position
        typeng                = 2, -- [enum] 2 = Piston engine with propeller dynamics
        type                  = "Piston", -- Canonical DCS SFM piston engine type
        Startup_Prework       = 12, -- Cranking duration before ignition
        Startup_RPMs          = { {0, 0}, {1, 66}, {4.6, 66}, {5, 300}, {5.5, 450}, {7, 500}, {9, 800}, {12, 900} },
        Startup_Ignition_Time = 7, -- Seconds to cylinder firing catch
        Shutdown_Duration     = 6.8, -- Spindown duration in seconds
        cylinder_firing_order = {1, 10, 5, 14, 9, 4, 13, 8, 3, 12, 7, 2, 11, 6},

        -- Mechanical & Thermodynamic Engine Dimensions
        Displ                 = 27.90, -- [L] Engine displacement in liters
        Stroke                = 0.150, -- [m] Piston stroke in meters
        V_pist_0              = 13.75, -- [m/s] Mean linear piston velocity at nominal METO RPM
        k_Eps                 = 7.00, -- Geometric cylinder compression ratio
        k_gearbox             = 1.46, -- Engine/propeller gearbox reduction ratio

        -- Supercharger & Intake Manifold Pressure Regulation
        hMaxEng               = 6.0, -- [km] Critical full-throttle altitude
        k_boost               = 1.35, -- Supercharger boost stage multiplier
        k_cfug                = 0.0015, -- Centrifugal compressor pressure rise factor
        k_vel                 = 0.014, -- Intake ram air recovery factor
        k_adiab_1             = 0.0379, -- Supercharger Stage 1 charge heating coefficient
        k_adiab_2             = 0.0562, -- Supercharger Stage 2 charge heating coefficient
        k_after_cool          = 0.350, -- Engine intercooling booster efficiency
        MAX_Manifold_P_1      = 125000, -- [Pa] Max continuous/METO manifold pressure
        MAX_Manifold_P_2      = 141325, -- [Pa] Military dry takeoff manifold pressure
        MAX_Manifold_P_3      = 141325, -- [Pa] WEP wet emergency manifold pressure

        -- Deactivation of Linear Power Derivatives (Dynamic Simulation Enforcement)
        dpdh_m                = 1800, -- [Pa/m] 
        dpdh_f                = 1800, -- [Pa/m] 
        cemax                 = 0.37, -- [kg/s] Fuel consumption parameter
        cefor                 = 0.37, -- [kg/s] WEP fuel consumption parameter

        -- Thrust Table (Mach vs Available Thrust Pmax/Pfor in Newtons)
        table_data = {
            --      M     Pmax (N)   
            [1]  = {0.00, 9858.6}, -- Static Takeoff Thrust
            [2]  = {0.08, 9374.5}, -- Takeoff Roll
            [3]  = {0.15, 8872.7}, -- Climb Accel
            [4]  = {0.24, 8261.5}, -- Combat Climb
            [5]  = {0.34, 7640.4}, -- Fast Cruise
            [6]  = {0.44, 7029.2}, -- Near Vne
            [7]  = {0.55, 6486.9}, -- High Speed Dive
            [8]  = {0.65, 6122.2}, -- Dive Compressibility
            [9]  = {0.75, 5885.6}, -- Transonic Buffeting
            [10] = {0.85, 4663.1}, -- Propeller Windmilling Limit
        }, -- end of engine table_data

        -- Cooling, Friction & Governor Dynamics
        dcx_eng               = 0.020, -- Engine cooling and momentum intake drag
        Nu_0                  = 1.20, -- Propeller static thrust coefficient at V=0
        Nu_1                  = 0.88, -- Propeller advance ratio (J) decay coefficient
        Nu_2                  = 0.0010, -- Helical tip Mach shock loss coefficient
        N_indic_0             = 850000, -- [W] Indicated thermodynamic power
        N_fr_0                = 0.040, -- Static mechanical friction mean effective pressure
        N_fr_1                = 0.001, -- Viscous friction decay with piston speed
        P_oil                 = 495438, -- [Pa] Engine oil operating pressure
        k_oil                 = 0.00004, -- Oil viscosity shearing resistance
        k_piston              = 3000, -- IMEP piston velocity scaler
        k_reg                 = 0.0050, -- Constant-speed governor tracking gain
        prop_direction        = 1, -- Propeller rotation direction from Engine_Database
        Init_Mom              = 220, -- [N*m] Starter cranking torque
        D_prop                = 3.05, -- [m] Propeller disc tip-to-tip diameter
        MOI_prop              = 34.0, -- [kg*m^2] Propeller polar mass moment of inertia
        prop_pitch_min        = 20.0, -- [deg] Fine pitch limit for takeoff
        prop_pitch_max        = 55.0, -- [deg] Coarse pitch limit for dive/cruise
        prop_pitch_feather    = 85.0, -- [deg] Feathered streamlined pitch angle
        prop_blades_count     = 3, -- Propeller blade count

    }, -- end of engine
}, -- end of SFM_Data



-- ============================================================================================================
    -- NAKAJIMA Ki-43 HAYABUSA ("OSCAR") - CANONICAL DAMAGE MODEL (33 COLLISION SHELLS + 29 INNARDS)
    -- Matched strictly to exported EDM collision shells and X-Ray innard registries
    -- Calibrated to IJA Army Fighter Specs (Nakajima Ha-115 14-Cyl Radial, 2x 12.7mm Ho-103 Cowl Guns)
    -- Crash-proof configuration: args = {-1} on all collision cells (zero missing debris assertions)
    -- ============================================================================================================

    Damage = verbose_to_dmg_properties({
        -- =====================================================================
        -- 1. NOSE, POWERPLANT & PROPELLER (NAKAJIMA Ha-115 RADIAL)
        -- =====================================================================
        ["NOSE_BOTTOM"] = {
            critical_damage = 2.8,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0010, spar = "Truss"},
            children = {"ENGINE"},
            radiator = {critical_damage = 1.0, volume = 0.20},
            innards = {
                { id = "XEng0OilRadiator0", skin = "Steel", wall = 0.003 }, -- Chin ventral oil cooler core
            },
        },
        ["NOSE_LEFT_SIDE"] = {
            critical_damage = 2.8,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.5, skin = "Aluminum", thickness = 0.0010},
            innards = {
                { id = "XGun-100",     skin = "Steel",    wall = 0.008 }, -- Port cowl synchronized 12.7mm Ho-103
                { id = "XAmmoBox-100", skin = "Aluminum", wall = 0.002 }, -- Port cowl ammunition box
            },
        },
        ["NOSE_RIGHT_SIDE"] = {
            critical_damage = 2.8,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.5, skin = "Aluminum", thickness = 0.0010},
            innards = {
                { id = "XGun-101",     skin = "Steel",    wall = 0.008 }, -- Starboard cowl synchronized 12.7mm Ho-103
                { id = "XAmmoBox-101", skin = "Aluminum", wall = 0.002 }, -- Starboard cowl ammunition box
            },
        },
        ["ENGINE"] = {
            critical_damage = 7.0,
            args = {-1},
            damage_boundary = 0.10,
            droppable = false,
            refractory = false,
            construction = {durability = 3.6, skin = "CastIron", thickness = 0.012, spar = "Rod"},
            children = {"ROTOR"},
            failures = {
                { "ENG0_OIL_RADIATOR_0_PIERCED", 0.60 },
                { "ENG0_OIL_HOSE_0_LEAK",        0.40 },
                { "ENG0_JAMMED",                 0.15 },
            },
            innards = {
                { id = "XEng0Case",         skin = "CastIron", wall = 0.025 }, -- Ha-115 14-cylinder radial crankcase
                { id = "XEng0OilTank0",     skin = "Aluminum", wall = 0.004 }, -- Forward firewall oil reservoir
                { id = "XEng0Supercharger", skin = "Steel",    wall = 0.006 }, -- Supercharger assembly
            },
        },
        ["ROTOR"] = {
            critical_damage = 1.8,
            args = {-1},
            droppable = false,
            construction = {durability = 1.4, skin = "Steel", thickness = 0.0035, spar = "Rod"},
        },

        -- =====================================================================
        -- 2. COCKPIT & FUSELAGE STATIONS
        -- =====================================================================
        ["COCKPIT"] = {
            critical_damage = 3.8,
            args = {-1},
            damage_boundary = 0.25,
            droppable = false,
            construction = {durability = 2.0, skin = "Glass", thickness = 0.0035, spar = "Truss"},
            innards = {
                { id = "XCrew0" },                                              -- Pilot torso
                { id = "XCrew0H" },                                             -- Pilot head
                { id = "XCtrlCrew0Stick", skin = "Steel", wall = 0.025 },       -- Flight control stick
                { id = "XArmor00",        skin = "Steel", wall = 0.013 },       -- 13mm head & back armor plate
                { id = "XArmor01",        skin = "Glass", wall = 0.038 },       -- Bullet-resistant glass windscreen
            },
        },
        ["FUSELAGE_LEFT_SIDE"] = {
            critical_damage = 5.5,
            args = {-1},
            damage_boundary = 0.22,
            droppable = false,
            construction = {durability = 2.5, skin = "Aluminum", thickness = 0.0010, spar = "Truss"},
            children = {"NOSE_LEFT_SIDE", "NOSE_BOTTOM", "COCKPIT", "WING_L_IN", "TAIL_LEFT_SIDE"},
            -- Main fuselage fuel tank (unprotected / semi-sealed light rubber tank, 280 L)
            fuel_tank = {critical_damage = 1.8, volume = 280.0, integrity_loss_rate = 0.50},
            failures = {
                { "FUEL_TANK_00_MINOR_LEAK",  0.40 },
                { "FUEL_TANK_00_MEDIUM_LEAK", 0.25 },
                { "FUEL_TANK_00_MAJOR_LEAK",  0.15 },
                { "FUEL_TANK_00_FIRE",        0.25 },
                { "FUEL_TANK_00_EXPLODED",    0.06 },
            },
            innards = {
                { id = "XArmor02",          skin = "Steel",  wall = 0.008 }, -- Firewall protective bulkhead
                { id = "XFuelTank0",        skin = "Rubber", wall = 0.020, lining = "FoamFilledRubber", plenum = 0.65 },
                { id = "XCtrlLineElevator", skin = "Steel",  wall = 0.002, plenum = 0.001 },
                { id = "XCtrlLineRudder",   skin = "Steel",  wall = 0.002, plenum = 0.001 },
            },
        },
        ["FUSELAGE_RIGHT_SIDE"] = {
            critical_damage = 5.5,
            args = {-1},
            damage_boundary = 0.22,
            droppable = false,
            construction = {durability = 2.5, skin = "Aluminum", thickness = 0.0010, spar = "Truss"},
            children = {"NOSE_RIGHT_SIDE", "WING_R_IN", "TAIL_RIGHT_SIDE"},
        },

        -- =====================================================================
        -- 3. PORT (LEFT) WING & CONTROL SURFACES
        -- =====================================================================
        ["WING_L_IN"] = {
            critical_damage = 6.8,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 3.0, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
            children = {"WING_L_CENTER", "FLAP_L", "WHEEL_L"},
            -- Port root wing fuel cell (145 L)
            fuel_tank = {critical_damage = 1.6, volume = 145.0, integrity_loss_rate = 0.50},
            failures = {
                { "FUEL_TANK_01_MINOR_LEAK",  0.40 },
                { "FUEL_TANK_01_MEDIUM_LEAK", 0.25 },
                { "FUEL_TANK_01_MAJOR_LEAK",  0.15 },
                { "FUEL_TANK_01_FIRE",        0.25 },
                { "FUEL_TANK_01_EXPLODED",    0.06 },
            },
            innards = {
                { count = 2, durability = 1.20, id = "XSparWLHIn", plenum = 0.22, skin = "Aluminum", wall = 0.010 },
                { id = "XFuelTank1", skin = "Rubber", wall = 0.018, lining = "FoamFilledRubber", plenum = 0.65 },
            },
        },
        ["WING_L_CENTER"] = {
            critical_damage = 5.0,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 2.4, skin = "Aluminum", thickness = 0.0009, spar = "FlangeBeam"},
            children = {"WING_L_OUT"},
            innards = {
                { count = 2, durability = 1.00, id = "XSparWLHMid", plenum = 0.20, skin = "Aluminum", wall = 0.008 },
            },
        },
        ["WING_L_OUT"] = {
            critical_damage = 3.6,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 1.8, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"AILERON_L"},
            innards = {
                { count = 2, durability = 0.80, id = "XSparWLHOut", plenum = 0.16, skin = "Aluminum", wall = 0.006 },
            },
        },
        ["AILERON_L"] = {
            critical_damage = 1.5,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.7, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },
        ["FLAP_L"] = {
            critical_damage = 2.0,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 1.1, skin = "Aluminum", thickness = 0.0008}, -- Fowler-type butterfly flap
        },

        -- =====================================================================
        -- 4. STARBOARD (RIGHT) WING & CONTROL SURFACES
        -- =====================================================================
        ["WING_R_IN"] = {
            critical_damage = 6.8,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 3.0, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
            children = {"WING_R_CENTER", "FLAP_R", "WHEEL_R"},
            -- Starboard root wing fuel cell (145 L)
            fuel_tank = {critical_damage = 1.6, volume = 145.0, integrity_loss_rate = 0.50},
            failures = {
                { "FUEL_TANK_02_MINOR_LEAK",  0.40 },
                { "FUEL_TANK_02_MEDIUM_LEAK", 0.25 },
                { "FUEL_TANK_02_MAJOR_LEAK",  0.15 },
                { "FUEL_TANK_02_FIRE",        0.25 },
                { "FUEL_TANK_02_EXPLODED",    0.06 },
            },
            innards = {
                { count = 2, durability = 1.20, id = "XSparWRHIn", plenum = 0.22, skin = "Aluminum", wall = 0.010 },
                { id = "XFuelTank2", skin = "Rubber", wall = 0.018, lining = "FoamFilledRubber", plenum = 0.65 },
            },
        },
        ["WING_R_CENTER"] = {
            critical_damage = 5.0,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 2.4, skin = "Aluminum", thickness = 0.0009, spar = "FlangeBeam"},
            children = {"WING_R_OUT"},
            innards = {
                { count = 2, durability = 1.00, id = "XSparWRHMid", plenum = 0.20, skin = "Aluminum", wall = 0.008 },
            },
        },
        ["WING_R_OUT"] = {
            critical_damage = 3.6,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 1.8, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"AILERON_R"},
            innards = {
                { count = 2, durability = 0.80, id = "XSparWRHOut", plenum = 0.16, skin = "Aluminum", wall = 0.006 },
            },
        },
        ["AILERON_R"] = {
            critical_damage = 1.5,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.7, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },
        ["FLAP_R"] = {
            critical_damage = 2.0,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 1.1, skin = "Aluminum", thickness = 0.0008}, -- Fowler-type butterfly flap
        },

        -- =====================================================================
        -- 5. TAIL UNIT & EMPENNAGE SURFACES
        -- =====================================================================
        ["TAIL_LEFT_SIDE"] = {
            critical_damage = 3.8,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.8, skin = "Aluminum", thickness = 0.0009},
            children = {"TAIL"},
        },
        ["TAIL_RIGHT_SIDE"] = {
            critical_damage = 3.8,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.8, skin = "Aluminum", thickness = 0.0009},
        },
        ["TAIL"] = {
            critical_damage = 4.6,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.2, skin = "Aluminum", thickness = 0.0010, spar = "Truss"},
            children = {"FIN_L_BOTTOM", "STABILIZER_L_IN", "STABILIZER_R_IN", "WHEEL_REAR"},
        },
        ["FIN_L_BOTTOM"] = {
            critical_damage = 3.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.5, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"FIN_L_TOP"},
            innards = {
                { id = "XSparKeelIn", plenum = 0.20, skin = "Aluminum", wall = 0.005 },
            },
        },
        ["FIN_L_TOP"] = {
            critical_damage = 2.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.2, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"RUDDER"},
            innards = {
                { id = "XSparKeelOut", plenum = 0.20, skin = "Aluminum", wall = 0.004 },
            },
        },
        ["RUDDER"] = {
            critical_damage = 1.4,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.6, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },
        ["STABILIZER_L_IN"] = {
            critical_damage = 2.8,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.5, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"STABILIZER_L_OUT", "ELEVATOR_L"},
            innards = {
                { id = "XSparStabLHIn", skin = "Aluminum", wall = 0.004 },
            },
        },
        ["STABILIZER_L_OUT"] = {
            critical_damage = 2.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.1, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
        },
        ["ELEVATOR_L"] = {
            critical_damage = 1.4,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.6, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },
        ["STABILIZER_R_IN"] = {
            critical_damage = 2.8,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.5, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"STABILIZER_R_OUT", "ELEVATOR_R"},
            innards = {
                { id = "XSparStabRHIn", skin = "Aluminum", wall = 0.004 },
            },
        },
        ["STABILIZER_R_OUT"] = {
            critical_damage = 2.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.1, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
        },
        ["ELEVATOR_R"] = {
            critical_damage = 1.4,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.6, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },

        -- =====================================================================
        -- 6. UNDERCARRIAGE (LANDING GEAR)
        -- =====================================================================
        ["WHEEL_L"] = {
            critical_damage = 2.5,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 1.6, skin = "Steel", thickness = 0.0040, spar = "Rod"},
        },
        ["WHEEL_R"] = {
            critical_damage = 2.5,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 1.6, skin = "Steel", thickness = 0.0040, spar = "Rod"},
        },
        ["WHEEL_REAR"] = {
            critical_damage = 1.5,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 1.2, skin = "Steel", thickness = 0.0025, spar = "Rod"},
        },
    }),

    DamageParts = {},

	lights_data = {	typename = "collection", lights = {
    [1] = {typename = "collection", lights = {}},
	[2] = {typename = "collection",
			lights = {
					  {typename = "spotlight", connector = "MAIN_SPOT_PTR_02", argument = 209, dir_correction = {elevation = math.rad(-1)}},
					  {typename = "spotlight", connector = "MAIN_SPOT_PTR_01", argument = 208, dir_correction = {elevation = math.rad(3)}}
					 }
			},
    [3]	= {typename = "collection",
			lights = {
					  {typename = "omnilight", connector = "BANO_1", color = {0.99, 0.11, 0.3}, pos_correction = {0, 0, -0.2}, argument = 190},
					  {typename = "omnilight", connector = "BANO_2", color = {0, 0.894, 0.6},  pos_correction = {0, 0,  0.2}, argument = 191},
					  {typename = "omnilight", connector = "BANO_0", color = {1, 1, 1},         pos_correction = {0, 0,  0.0}, argument = 192}
					 }
			},
    [4] = {typename = "collection", lights = {}},
	[5]	= {typename = "collection", lights = {}},
	}},
}

add_aircraft(ki43_Kamikaze)