-- ============================================================================================================
-- DCS WORLD COMPLETE AIRCRAFT DEFINITION & SFM SPECIFICATION (Master Suite v2.45)
-- GENERATED FOR: B6N2 Tenzan Model 12
-- THEATER & PROVENANCE: Pacific Theater (PTO) | Imperial Japan (IJN) (1943)
-- INSTALLED ENGINE POWERTRAIN: Mitsubishi Kasei 25
-- ARCHITECTURE: Canonical SFM Standard
-- ============================================================================================================
local _ = _ or function(str) return str end
local CAT_GUN_MOUNT = CAT_GUN_MOUNT or 8
local WSTYPE_PLACEHOLDER = WSTYPE_PLACEHOLDER or 0

local function MG_131(tbl) -- local: other mods (Betty/D4Y) also define a global MG_131
    tbl.category                = CAT_GUN_MOUNT
    tbl.name                    = tbl.name or "PTO_B6N2_13mm_Rear"
    tbl.supply                  = tbl.supply or {
        shells = {"MG_13x64_APT", "MG_13x64_API", "MG_13x64_HEI_T"},
        mixes  = tbl.mixes or {{1, 2, 3, 2}},
        count  = tbl.count or 600,
    }
    if tbl.mixes then
        tbl.supply.mixes = tbl.mixes
        tbl.mixes        = nil
    end

    tbl.gun = {
        max_burst_length = 200,
        rates            = tbl.rates or {875},
        recoil_coeff     = 1.0,
        barrels_count    = 1,
    }
    tbl.rates = nil

    tbl.effective_fire_distance = 1000
    tbl.drop_cartridge          = 204
    tbl.muzzle_pos              = tbl.muzzle_pos or {0.0, 0.0, 0.0}
    tbl.supply_position         = tbl.supply_position or {1.42, 0.50, 2.23}
    tbl.ejector_pos             = tbl.ejector_pos or {0.0, 0.05, 0.0}
    tbl.ejector_dir             = tbl.ejector_dir or {0.0, -1.0, 0.0}
    tbl.aft_gun_mount           = true
    tbl.effects                 = tbl.effects or { { name = "FireEffect", arg = tbl.effect_arg_number or 350 }, { name = "SmokeEffect" } }

    if declare_weapon then declare_weapon(tbl) end
    return tbl
end

b6n1jill =  {
        
	Name 				=   'b6n1jill',
	DisplayName			= _('[PTO43] Nakajima B6N2-Jill-'),
	
	--HumanCockpit 		= false,
	--HumanCockpitPath    = current_mod_path..'/Cockpit/',
	
	Picture 			= "b6n1jill.png",
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "b6n1jill",
	XRayShape           = "b6n1jill_X-Ray",
	
	shape_table_data 	= 
	{
		{
			file  	 = 'b6n1jill';
			life  	 = 18; -- lifebar
			vis   	 = 3; -- visibility gain.
			desrt    = 'genF-oblomoki'; -- Name of destroyed object file name
			fire  	 = { 300, 2}; -- Fire on the ground after destoyed: 300sec 2m
			username = 'b6n1jill';
			index    =  WSTYPE_PLACEHOLDER;
			classname   = "lLandPlane";
            positioning = "BYNORMAL";
            drawonmap   = true;
		},
		{
			name  = "genF-oblomoki";
			file  = "genF-oblomoki";
			fire  = { 240, 2};
		},

	},
    mapclasskey         = "P0091000027",
    attribute           = {wsType_Air, wsType_Airplane, wsType_Intruder, WSTYPE_PLACEHOLDER, "Strategic bombers"},
    Categories          = {},
	Countries           = {"Japan"},
    LandRWCategories = {
        [1] = { Name = "AircraftCarrier" },
        [2] = { Name = "AircraftCarrier With Arresting Gear" },
        [3] = { Name = "Runway" },
    },
    TakeOffRWCategories = {
        [1] = { Name = "AircraftCarrier" },
        [2] = { Name = "AircraftCarrier With Catapult" },
        [3] = { Name = "Runway" },
    },

-- ------------------------------------------------------------------------------------------------------------
-- 1. PRIMARY GENERAL & AI PARAMETERS (DCS Core Aircraft Attributes)
-- ------------------------------------------------------------------------------------------------------------
M_empty                 = 3010, -- [kg] Operational empty weight
M_nominal               = 5200, -- [kg] Standard combat flight weight
M_max                   = 5650, -- [kg] Maximum permissible takeoff weight (MTOW)
M_fuel_max              = 1160, -- [kg] Full internal fuel capacity mass
wing_area               = 37.20, -- [m^2] Reference wing gross planform area
wing_span               = 14.89, -- [m] Tip-to-tip wingspan
wing_type               = 0, -- [enum] 0 = Straight / Trapezoidal wing   
length                  = 10.87, -- [m] Overall fuselage length
height                  = 4.13, -- [m] Ground parked height

-- Flight Test & AI Operational Airspeeds (TAS / CAS)
V_max_sea_level         = 119.4, -- [m/s] Maximum level speed at sea level (TAS)
V_max_h                 = 133.6, -- [m/s] Maximum level speed at critical supercharger altitude (TAS)
V_max_altitude          = 133.6, -- [m/s] Backward compatibility alias for V_max_h
V_opt                   = 77.6, -- [m/s] Optimal cruise speed (1.30 * V_stall_clean)
V_take_off              = 50.7, -- [m/s] Takeoff rotation airspeed
V_land                  = 54.9, -- [m/s] Landing approach airspeed
Vy_max                  = 11.5, -- [m/s] Initial sea-level rate of climb
H_max                   = 9040, -- [m] Service ceiling
Mach_max                = 0.71, -- Maximum permissible dive Mach limit

-- Static Thrust Ratings for AI & Catapult Calculation (Froude Momentum T0 in kgf)
thrust_sum_max          = 1420, -- [kgf] Maximum military static thrust for AI & catapult calculation
thrust_sum_ab           = 1420, -- [kgf] Identical to thrust_sum_max (no afterburner)

CAS_min                 = 36.1, -- [m/s] Minimum safe calibrated airspeed
Ny_min                  = -2.5, -- Minimum allowable G factor
Ny_max                  = 5.2, -- Maximum structural G limit for AI
wing_root_chord         = 3.38, -- [m] Theoretical centerline/root chord
wing_tip_chord          = 1.62, -- [m] Tip chord
wing_sweep              = 1.1, -- [deg] Quarter-chord sweep angle
tand_gear_max           = 0.577, -- Gear suspension deflection parameter

--------
		average_fuel_consumption	=	0.302,
		has_afteburner	=	false,
		has_speedbrake	=	false,

        main_gear_pos = 	{ 0.63, -1.90, 1.779},
		nose_gear_pos = 	{-6.99, -0.230,	0},

		radar_can_see_ground	=	false,
		sound_name	=	"engine",
		AOA_take_off	=	0.14,
		stores_number	=	11,
		bank_angle_max	=	45,
		tanker_type	=	0,
		flaps_maneuver	=	0.33,
		range	=	1015,
		crew_size	=	3,
		RCS	=	2.5,
		Ny_max_e	=	7,
		detection_range_max	=	0,
		IR_emission_coeff	=	0.1,
		IR_emission_coeff_ab	=	0,
		engines_count	=	1,
		wing_tip_pos = 	{-0.5,	-1.0,	4.8},
		nose_gear_wheel_diameter	=	0.319,
		main_gear_wheel_diameter	=	0.683,

    engines_count   = 1,
    engines_nozzles = {
       
        [1] = {
            pos                 = { 1.350, -0.280, -0.680 },
            elevation           = math.rad(-5.0),
            azimuth             = math.rad(-12.0),
            diameter            = 0.12,
            exhaust_length_ab   = 0.0,
            exhaust_length_ab_K = 0.0,
            smokiness_level     = 0.045,
            engine_number       = 1,
        },
        
        [2] = {
            pos                 = { 1.350, -0.280,  0.680 },
            elevation           = math.rad(-5.0),
            azimuth             = math.rad( 12.0),
            diameter            = 0.12,
            exhaust_length_ab   = 0.0,
            exhaust_length_ab_K = 0.0,
            smokiness_level     = 0.045,
            engine_number       = 1,
        },
    },
fires_pos = {
    [1] = {  2.15, -0.05,  0.00 }, -- Engine crankcase & nose oil cooler
    [2] = {  0.50, -0.20,  0.00 }, -- Center fuselage fuel tank (Tank 03)
    [3] = { -0.20, -0.25, -1.65 }, -- Left wing root fuel cell (Tank 00)
    [4] = { -0.20, -0.25,  1.65 }, -- Right wing root fuel cell (Tank 01)
    [5] = { -0.40, -0.15, -3.30 }, -- Left mid-wing fuel tank
    [6] = { -0.40, -0.15,  3.30 }, -- Right mid-wing fuel tank
    [7] = { -4.30,  0.10,  0.00 }, -- Aft fuselage & empennage assembly
},
    crew_size    = 3,
    crew_members = {
        
        [1] = {
            pilot_name          = 56,
            ejection_seat_name  = 0,
            drop_canopy_name    = 0,
            pos                 = { 0.750, 0.420, 0.000 },
            canopy_pos          = { 0.750, 0.650, 0.000 },
            drop_parachute_name = "pilot_raf_parachute",
            role                = "pilot",
            role_display_name   = _("Pilot"),
        },
        
        [2] = {
            pilot_name          = 56,
            ejection_seat_name  = 0,
            drop_canopy_name    = 0,
            pos                 = {-0.350, 0.350, 0.000 },
            canopy_pos          = {-0.350, 0.600, 0.000 },
            drop_parachute_name = "pilot_raf_parachute",
            role                = "navigator",
            role_display_name   = _("Navigator / Observer"),
        },
        
        [3] = {
            pilot_name          = 56,
            ejection_seat_name  = 0,
            drop_canopy_name    = 0,
            pos                 = {-1.650, 0.450, 0.000 },
            canopy_pos          = {-1.650, 0.650, 0.000 },
            drop_parachute_name = "pilot_raf_parachute",
            role                = "gunner",
            role_display_name   = _("Dorsal Gunner / Radio Operator"),
        },
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
	
	detection_range_max		 = 60,
	radar_can_see_ground 	 = true, -- this should be examined (what is this exactly?)
	CanopyGeometry = {
		azimuth   = {-160.0, 160.0}, -- pilot view horizontal (AI)
		elevation = {-50.0, 90.0} -- pilot view vertical (AI)
	},
	Sensors = {
		
	},
	HumanRadio = {
		frequency = 127.5,  -- Radio Freq
		editable = true,
		minFrequency = 100.000,
		maxFrequency = 156.000,
		modulation = MODULATION_AM
	},
	
	Guns = {
        MG_131({
            muzzle_pos_connector = "Gun_point_3",
            rates                = {875},
            effect_arg_number    = 350,
            mixes                = {{1, 2, 3, 2}},
            -- Rear flexible gun, ED/Currenthill aft-gun scheme (Tu-95 tail):
            -- aft_gun_mount = true + azimuth_initial = 180 (DEGREES) = points aft.
            -- No turret{} block: the model has no known H/V animation args for this gun.
            azimuth_initial      = 180.0,
            elevation_initial    = 10.0,
            supply_position      = {-1.50, 0.50, 0.0},
            count                = 600,
            aft_gun_mount        = true,
        }),
    },
	
	Pylons = {
		pylon(1, 0, 0, 0, 0, {use_full_connector_position = false, connector = "Pylon_1", arg = 308},
		{
			-- Historical B6N2 centerline: Type 91 aerial torpedo, or 500 kg / 250 kg bombs (Japanese stores only)
			{ CLSID = "PTO_JP_TYPE91_TORPEDO", arg_value = 0.25, Type = 1, arg_increment = 0.0 },
			{ CLSID = "PTO_JP_TYPE2_500KG",    arg_value = 0.25 },
			{ CLSID = "PTO_JP_TYPE98_250KG",   arg_value = 0.25 },
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
-- 2. STANDARD FLIGHT MODEL (SFM) AERODYNAMICS (SFM_Data.aerodynamics) v2.45
-- ------------------------------------------------------------------------------------------------------------
SFM_Data = {
    aerodynamics = {
        -- Control authority & stability derivatives (DCS convention)
        Cy0         = 0.1621, -- Zero-AoA 3D Wing Lift Coefficient (Rigorous Formulation)
        Mzalfa      = 6.1000, -- Pitch moment stability derivative (positive in DCS)
        Mzalfadt    = 1.4335, -- Pitch rate damping factor (positive in DCS)
        kjx         = 1.9363, -- Roll inertia factor
        kjz         = 0.0014, -- Yaw directional stability factor
        Czbe        = -0.0102, -- Directional weathercock side force derivative

        -- Drag & high-lift coefficients
        cx_gear     = 0.0140, -- Landing gear parasite drag increment
        cx_flap     = 0.0500, -- Landing flaps parasite drag increment
        cy_flap     = 0.4662, -- Landing flaps maximum lift increment
        cx_brk      = 0.0000, -- Airbrake / dive flap parasite drag increment

        table_data = {
            --      M     Cx0      Cya      B       B4     Omxmax  Aldop  Cymax
            [1]  = {0.00, 0.02710, 0.071, 0.07764, 0.37237, 0.038, 10.54, 0.942}, -- Static / Taxi
            [2]  = {0.08, 0.02710, 0.071, 0.07814, 0.26066, 0.264, 12.91, 1.105}, --Clean Stall Speed (Vs) / Deep Dogfight
            [3]  = {0.15, 0.02646, 0.072, 0.07942, 0.22342, 0.566, 14.36, 1.205}, -- Zoom Climb Threshold / Final Approach
            [4]  = {0.24, 0.02572, 0.073, 0.08238, 0.13033, 0.830, 15.05, 1.255}, -- Corner Speed / Optimal Sustained Turn
            [5]  = {0.34, 0.02506, 0.075, 0.08778, 0.09682, 0.943, 14.74, 1.230}, -- High Energy Combat / Peak Roll Rate
            [6]  = {0.44, 0.02464, 0.078, 0.09627, 0.07447, 0.800, 12.94, 1.067}, -- Max Level Speed (Vmax) / Fast Cruise
            [7]  = {0.55, 0.02464, 0.078, 0.11131, 0.14895, 0.638, 9.72, 0.816}, -- Dive Entry (Vne) / Heavy Control Stiffening
            [8]  = {0.65, 0.02471, 0.075, 0.13443, 0.37237, 0.438, 7.27, 0.603}, -- Wave Drag Onset (M_CR) / Roll Lockout
            [9]  = {0.75, 0.03320, 0.058, 0.17745, 1.48947, 0.234, 6.17, 0.402}, -- Transonic Drag Divergence (M_DD)
            [10] = {0.85, 0.09533, 0.039, 0.27977, 5.95786, 0.088, 5.05, 0.226}, -- Terminal Structural Shock / Safety Limit
        }, -- end of table_data
    }, -- end of aerodynamics

    -- --------------------------------------------------------------------------------------------------------
    -- 3. PISTON ENGINE & SUPERCHARGER SPECIFICATION (SFM_Data.engine, typeng = 2)
    -- --------------------------------------------------------------------------------------------------------
    engine = {
        Nominal_RPM           = 2600.0, -- Full Throttle Rated Crankshaft RPM
        Nmg                   = 23.0, -- [%] Idle RPM Percentage
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
            [2]  = {0.08, 13249.4}, -- Takeoff Roll
            [3]  = {0.15, 12540.1}, -- Climb Accel
            [4]  = {0.24, 11676.3}, -- Combat Climb
            [5]  = {0.34, 10798.5}, -- Fast Cruise
            [6]  = {0.44, 9934.6}, -- Near Vne
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
        prop_direction        = 1, -- Propeller rotation direction from Engine_Database
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
-- 3. NAKAJIMA B6N2 "JILL" CANONICAL DAMAGE MODEL (33 COLLISION CELLS + 23 CORE INNARDS)
-- Scaled for 5,650 kg MTOW Carrier Torpedo Bomber / Mitsubishi Kasei 25 Radial Engine
-- Strictly mapped to the 23 verified X-Ray mesh primitives from collision shell dialog
-- Crash-proof configuration: args = {-1} on all cells, zero orphaned attachments
-- ============================================================================================================

Damage = verbose_to_dmg_properties({
    -- =========================================================================
    -- 1. NOSE & ENGINE COMPARTMENT
    -- =========================================================================
    ["NOSE_BOTTOM"] = {
        critical_damage = 5.0,
        args = {-1},
        damage_boundary = 0.20,
        droppable = false,
        construction = {durability = 2.5, skin = "Aluminum", thickness = 0.0012, spar = "Truss"},
        children = {"ENGINE"},
        radiator = {critical_damage = 1.2, volume = 0.25},
        innards = {
            -- 11: Chin Oil Radiator
            { id = "XEng0OilRadiator0", skin = "Steel", wall = 0.003 },
        },
    },
    ["NOSE_LEFT_SIDE"] = {
        critical_damage = 4.0,
        args = {-1},
        damage_boundary = 0.20,
        droppable = false,
        construction = {durability = 2.0, skin = "Aluminum", thickness = 0.0010},
    },
    ["NOSE_RIGHT_SIDE"] = {
        critical_damage = 4.0,
        args = {-1},
        damage_boundary = 0.20,
        droppable = false,
        construction = {durability = 2.0, skin = "Aluminum", thickness = 0.0010},
    },
    ["ENGINE"] = {
        critical_damage = 6.5,
        args = {-1},
        damage_boundary = 0.10,
        droppable = false,
        refractory = false,
        construction = {durability = 3.5, skin = "Steel", thickness = 0.008, spar = "Rod"},
        children = {"ROTOR"},
        failures = {
            { "ENG0_OIL_RADIATOR_0_PIERCED", 0.60 },
            { "ENG0_OIL_HOSE_0_LEAK",        0.40 },
            { "ENG0_JAMMED",                 0.15 },
        },
        innards = {
            -- 10: Crankcase & Radial Cylinder Block
            { id = "XEng0Case",          skin = "CastIron", wall = 0.020 },
            -- 12: Main Oil Reservoir
            { id = "XEng0OilTank0",      skin = "Aluminum", wall = 0.004 },
            -- 13: Mechanical Supercharger
            { id = "XEng0Supercharger",  skin = "Steel",    wall = 0.006 },
        },
    },
    ["ROTOR"] = {
        critical_damage = 2.5,
        args = {-1},
        droppable = false,
        construction = {durability = 1.8, skin = "Steel", thickness = 0.004, spar = "Rod"},
    },

    -- =========================================================================
    -- 2. COCKPIT & FUSELAGE STATIONS
    -- =========================================================================
    ["COCKPIT"] = {
        critical_damage = 4.0,
        args = {-1},
        damage_boundary = 0.25,
        droppable = false,
        construction = {durability = 2.2, skin = "Glass", thickness = 0.004, spar = "Truss"},
        innards = {
            -- 1: Pilot Armor Plate
            { id = "XArmor00", skin = "Steel", wall = 0.012 },
            -- 2 & 3: Pilot Body and Head
            { id = "XCrew0" },
            { id = "XCrew0H" },
        },
    },
    ["FUSELAGE_LEFT_SIDE"] = {
        critical_damage = 7.0,
        args = {-1},
        damage_boundary = 0.25,
        droppable = false,
        construction = {durability = 3.5, skin = "Aluminum", thickness = 0.0015, spar = "Truss"},
        children = {"NOSE_LEFT_SIDE", "COCKPIT", "WING_L_IN", "TAIL_LEFT_SIDE"},
        fuel_tank = {critical_damage = 2.0, volume = 280.0, integrity_loss_rate = 0.50},
        failures = {
            { "FUEL_TANK_03_MINOR_LEAK",  0.40 },
            { "FUEL_TANK_03_MEDIUM_LEAK", 0.25 },
            { "FUEL_TANK_03_MAJOR_LEAK",  0.15 },
            { "FUEL_TANK_03_FIRE",        0.20 },
            { "FUEL_TANK_03_EXPLODED",    0.05 },
        },
        innards = {
            -- 4 & 5: Observer / Navigator
            { id = "XCrew1" },
            { id = "XCrew1H" },
            -- 6 & 7: Dorsal Gunner / Radio Operator
            { id = "XCrew2" },
            { id = "XCrew2H" },
            -- 14: Fuselage Ventral Fuel Tank (280 L)
            { id = "XFuelTank0",         skin = "Rubber",   wall = 0.036, lining = "FoamFilledRubber", plenum = 0.65 },
            -- 8 & 9: Longitudinal Primary Flight Control Linkages
            { id = "XCtrlLineElevator",  skin = "Steel",    wall = 0.002, plenum = 0.001 },
            { id = "XCtrlLineRudder",    skin = "Steel",    wall = 0.002, plenum = 0.001 },
        },
    },
    ["FUSELAGE_RIGHT_SIDE"] = {
        critical_damage = 7.0,
        args = {-1},
        damage_boundary = 0.25,
        droppable = false,
        construction = {durability = 3.5, skin = "Aluminum", thickness = 0.0015, spar = "Truss"},
        children = {"NOSE_RIGHT_SIDE", "WING_R_IN", "TAIL_RIGHT_SIDE"},
    },

    -- =========================================================================
    -- 3. PORT (LEFT) WING & CONTROL SURFACES
    -- =========================================================================
    ["WING_L_IN"] = {
        critical_damage = 10.0,
        args = {-1},
        damage_boundary = 0.15,
        droppable = false,
        construction = {durability = 4.5, skin = "Aluminum", thickness = 0.0015, spar = "FlangeBeam"},
        children = {"WING_L_CENTER", "FLAP_L", "WHEEL_L"},
        fuel_tank = {critical_damage = 2.5, volume = 450.0, integrity_loss_rate = 0.55},
        failures = {
            { "FUEL_TANK_00_MINOR_LEAK",  0.45 },
            { "FUEL_TANK_00_MEDIUM_LEAK", 0.30 },
            { "FUEL_TANK_00_MAJOR_LEAK",  0.20 },
            { "FUEL_TANK_00_FIRE",        0.25 },
            { "FUEL_TANK_00_EXPLODED",    0.05 },
        },
        innards = {
            -- 20: Inboard Left Wing Main Spar
            { count = 2, durability = 1.30, id = "XSparWLHIn", plenum = 0.25, skin = "Aluminum", wall = 0.012 },
            -- 15: Left Inner Wing Fuel Tank (450 L)
            { id = "XFuelTank1", skin = "Rubber", wall = 0.036, lining = "FoamFilledRubber", plenum = 0.70 },
        },
    },
    ["WING_L_CENTER"] = {
        critical_damage = 8.5,
        args = {-1},
        damage_boundary = 0.15,
        droppable = false,
        construction = {durability = 3.8, skin = "Aluminum", thickness = 0.0012, spar = "FlangeBeam"},
        children = {"WING_L_OUT"},
    },
    ["WING_L_OUT"] = {
        critical_damage = 6.0,
        args = {-1},
        damage_boundary = 0.15,
        droppable = false,
        construction = {durability = 2.8, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
        children = {"AILERON_L"},
        innards = {
            -- 21: Outboard Left Wing Spar
            { count = 2, durability = 0.90, id = "XSparWLHOut", plenum = 0.20, skin = "Aluminum", wall = 0.008 },
        },
    },
    ["AILERON_L"] = {
        critical_damage = 2.0,
        args = {-1},
        damage_boundary = 0.50,
        droppable = false,
        construction = {durability = 0.8, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
    },
    ["FLAP_L"] = {
        critical_damage = 3.0,
        args = {-1},
        damage_boundary = 0.50,
        droppable = false,
        construction = {durability = 1.4, skin = "Aluminum", thickness = 0.0010, spar = "Truss"},
    },

    -- =========================================================================
    -- 4. STARBOARD (RIGHT) WING & CONTROL SURFACES
    -- =========================================================================
    ["WING_R_IN"] = {
        critical_damage = 10.0,
        args = {-1},
        damage_boundary = 0.15,
        droppable = false,
        construction = {durability = 4.5, skin = "Aluminum", thickness = 0.0015, spar = "FlangeBeam"},
        children = {"WING_R_CENTER", "FLAP_R", "WHEEL_R"},
        fuel_tank = {critical_damage = 2.5, volume = 450.0, integrity_loss_rate = 0.55},
        failures = {
            { "FUEL_TANK_01_MINOR_LEAK",  0.45 },
            { "FUEL_TANK_01_MEDIUM_LEAK", 0.30 },
            { "FUEL_TANK_01_MAJOR_LEAK",  0.20 },
            { "FUEL_TANK_01_FIRE",        0.25 },
            { "FUEL_TANK_01_EXPLODED",    0.05 },
        },
        innards = {
            -- 22: Inboard Right Wing Main Spar
            { count = 2, durability = 1.30, id = "XSparWRHIn", plenum = 0.25, skin = "Aluminum", wall = 0.012 },
            -- 16: Right Inner Wing Fuel Tank (450 L)
            { id = "XFuelTank2", skin = "Rubber", wall = 0.036, lining = "FoamFilledRubber", plenum = 0.70 },
        },
    },
    ["WING_R_CENTER"] = {
        critical_damage = 8.5,
        args = {-1},
        damage_boundary = 0.15,
        droppable = false,
        construction = {durability = 3.8, skin = "Aluminum", thickness = 0.0012, spar = "FlangeBeam"},
        children = {"WING_R_OUT"},
    },
    ["WING_R_OUT"] = {
        critical_damage = 6.0,
        args = {-1},
        damage_boundary = 0.15,
        droppable = false,
        construction = {durability = 2.8, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
        children = {"AILERON_R"},
        innards = {
            -- 23: Outboard Right Wing Spar
            { count = 2, durability = 0.90, id = "XSparWRHOut", plenum = 0.20, skin = "Aluminum", wall = 0.008 },
        },
    },
    ["AILERON_R"] = {
        critical_damage = 2.0,
        args = {-1},
        damage_boundary = 0.50,
        droppable = false,
        construction = {durability = 0.8, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
    },
    ["FLAP_R"] = {
        critical_damage = 3.0,
        args = {-1},
        damage_boundary = 0.50,
        droppable = false,
        construction = {durability = 1.4, skin = "Aluminum", thickness = 0.0010, spar = "Truss"},
    },

    -- =========================================================================
    -- 5. TAIL UNIT & EMPENNAGE SURFACES
    -- =========================================================================
    ["TAIL_LEFT_SIDE"] = {
        critical_damage = 5.0,
        args = {-1},
        damage_boundary = 0.20,
        droppable = false,
        construction = {durability = 2.5, skin = "Aluminum", thickness = 0.0010},
        children = {"TAIL"},
    },
    ["TAIL_RIGHT_SIDE"] = {
        critical_damage = 5.0,
        args = {-1},
        damage_boundary = 0.20,
        droppable = false,
        construction = {durability = 2.5, skin = "Aluminum", thickness = 0.0010},
    },
    ["TAIL"] = {
        critical_damage = 7.0,
        args = {-1},
        damage_boundary = 0.20,
        droppable = false,
        construction = {durability = 3.0, skin = "Aluminum", thickness = 0.0012, spar = "Truss"},
        children = {"FIN_L_BOTTOM", "STABILIZER_L_IN", "STABILIZER_R_IN", "WHEEL_REAR"},
        innards = {
            -- 17: Vertical Fin Internal Keel Spar
            { id = "XSparKeelIn", plenum = 0.25, skin = "Aluminum", wall = 0.005 },
        },
    },
    ["FIN_L_BOTTOM"] = {
        critical_damage = 5.0,
        args = {-1},
        damage_boundary = 0.20,
        droppable = false,
        construction = {durability = 2.0, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
        children = {"FIN_L_TOP", "RUDDER"},
    },
    ["FIN_L_TOP"] = {
        critical_damage = 3.5,
        args = {-1},
        damage_boundary = 0.20,
        droppable = false,
        construction = {durability = 1.5, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
    },
    ["RUDDER"] = {
        critical_damage = 2.0,
        args = {-1},
        damage_boundary = 0.50,
        droppable = false,
        construction = {durability = 0.8, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
    },
    ["STABILIZER_L_IN"] = {
        critical_damage = 4.0,
        args = {-1},
        damage_boundary = 0.20,
        droppable = false,
        construction = {durability = 2.0, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
        children = {"STABILIZER_L_OUT", "ELEVATOR_L"},
        innards = {
            -- 18: Horizontal Left Stabilizer Inboard Spar
            { id = "XSparStabLHIn", skin = "Aluminum", wall = 0.005 },
        },
    },
    ["STABILIZER_L_OUT"] = {
        critical_damage = 3.0,
        args = {-1},
        damage_boundary = 0.20,
        droppable = false,
        construction = {durability = 1.5, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
    },
    ["ELEVATOR_L"] = {
        critical_damage = 2.0,
        args = {-1},
        damage_boundary = 0.50,
        droppable = false,
        construction = {durability = 0.8, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
    },
    ["STABILIZER_R_IN"] = {
        critical_damage = 4.0,
        args = {-1},
        damage_boundary = 0.20,
        droppable = false,
        construction = {durability = 2.0, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
        children = {"STABILIZER_R_OUT", "ELEVATOR_R"},
        innards = {
            -- 19: Horizontal Right Stabilizer Inboard Spar
            { id = "XSparStabRHIn", skin = "Aluminum", wall = 0.005 },
        },
    },
    ["STABILIZER_R_OUT"] = {
        critical_damage = 3.0,
        args = {-1},
        damage_boundary = 0.20,
        droppable = false,
        construction = {durability = 1.5, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
    },
    ["ELEVATOR_R"] = {
        critical_damage = 2.0,
        args = {-1},
        damage_boundary = 0.50,
        droppable = false,
        construction = {durability = 0.8, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
    },

    -- =========================================================================
    -- 6. UNDERCARRIAGE (LANDING GEAR)
    -- =========================================================================
    ["WHEEL_L"] = {
        critical_damage = 3.5,
        args = {-1},
        damage_boundary = 1.0,
        droppable = false,
        refractory = true,
        construction = {durability = 2.2, skin = "Steel", thickness = 0.005, spar = "Rod"},
    },
    ["WHEEL_R"] = {
        critical_damage = 3.5,
        args = {-1},
        damage_boundary = 1.0,
        droppable = false,
        refractory = true,
        construction = {durability = 2.2, skin = "Steel", thickness = 0.005, spar = "Rod"},
    },
    ["WHEEL_REAR"] = {
        critical_damage = 2.0,
        args = {-1},
        damage_boundary = 1.0,
        droppable = false,
        refractory = true,
        construction = {durability = 1.5, skin = "Steel", thickness = 0.003, spar = "Rod"},
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

add_aircraft(b6n1jill)

