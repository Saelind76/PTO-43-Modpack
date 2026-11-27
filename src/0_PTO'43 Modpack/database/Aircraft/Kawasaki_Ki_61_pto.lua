-- ============================================================================================================
-- DCS WORLD COMPLETE AIRCRAFT DEFINITION & SFM SPECIFICATION (Master Suite v2.45)
-- GENERATED FOR: Ki-61-I-Tei Hien
-- THEATER & PROVENANCE: Pacific Theater (PTO) | Imperial Japan (IJA) (1944)
-- INSTALLED ENGINE POWERTRAIN: Kawasaki Ha-40
-- ARCHITECTURE: Canonical SFM Standard
-- ============================================================================================================



local function MG_131(tbl)

	tbl.category = CAT_GUN_MOUNT 
	tbl.name 	 = tbl.name or "PTO_Ki61_Ho103_127"
	tbl.supply 	 = 
	{
		shells = {"PTO_127mm_Ho103"},   -- Ho-103 12.7 mm ([PTO'43] ammo core)
		mixes  = {{1}},
		count  = 250,
	}
	tbl.mixes = nil   -- single shell type: per-gun mixes no longer apply
	tbl.gun = 
	{
		max_burst_length = 267,
		rates 			 = {900},
		recoil_coeff 	 = 1,
		barrels_count 	 = 1,
	}
	if tbl.rates then 
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end	
	tbl.ejector_pos 			= tbl.ejector_pos or {-0.4, -1.2, 0.18}
	tbl.ejector_dir 			= {0,-1,0}
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 1000
	tbl.drop_cartridge 			= 0
	tbl.muzzle_pos				= tbl.muzzle_pos 		 or  {0,0,0} -- all position from connector
	tbl.muzzle_pos_connector	= tbl.muzzle_pos_connector 		 or  "Gun_point" -- all position from connector
	tbl.azimuth_initial 		= tbl.azimuth_initial    or 0   
	tbl.elevation_initial 		= tbl.elevation_initial  or 0   
	if  tbl.effects == nil then
		tbl.effects = {{ name = "FireEffect"     , arg 		 = tbl.effect_arg_number or 436 },
					   { name = "HeatEffectExt"  , shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
					   { name = "SmokeEffect"}}
	end
	return declare_weapon(tbl)
end

local function MG_151_20(tbl)
	tbl.category = CAT_GUN_MOUNT 
	tbl.name 	 = tbl.name or "PTO_Ki61_MG151_20"
	tbl.supply 	 = 
	{
		shells = {"PTO_20mm_Ho5_HE"},   -- Ho-5 20 mm ([PTO'43] ammo core)
		mixes  = {{1}},
		count  = 120,   -- 120 rpg (Ki-61-I Hei/Tei)
	}
	tbl.mixes = nil   -- single shell type: per-gun mixes no longer apply
	tbl.gun = 
	{
		max_burst_length = 150,
		rates 			 = {700},-- unsync mount
		recoil_coeff 	 = 1.0,
		barrels_count 	 = 1,
	}
	if tbl.rates then 
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end	
	tbl.ejector_pos 		= tbl.ejector_pos or {0.0, 0.05, 0.0}
	tbl.ejector_dir 		= {0,-1,0}
	tbl.effect_arg_number	= tbl.effect_arg_number or 436
	tbl.supply_position  	= tbl.supply_position   or {0, -0.3, -1.5}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 1000
	tbl.drop_cartridge 			= 204
	tbl.muzzle_pos				= {0,0,0} -- all position from connector
	tbl.azimuth_initial 		=  tbl.azimuth_initial  or 0   
	tbl.elevation_initial 		=  tbl.elevation_initial  or 0   
	
	return declare_weapon(tbl)
end


Kawasaki_Ki_61_pto = {
	Name 					=   'Kawasaki_Ki_61_pto',
	DisplayName			= _('[PTO43] Kawasaki Ki-61 -Tony-'),
	
	Picture 			= "Kawasaki_Ki_61_pto.png",
	Rate 				= 40,
	Shape               = "kawasaki_ki_61_pto",
    XRayShape           = "ki-61_X-Ray",
    propellorShapeName  = "ki61_blade.FBX",    -- pala propia Ki-61 (antes japan_blade.FBX = pala del Ki-84 sin textura)
	propellorShapeType  = "3ARG_PROC_BLUR",             -- canonical propeller (docs/canon/PROPELLER_CANON.md)
	propellorShapeBlurX = 1.0,	
    
	shape_table_data = 
    {
        {
            file        = 'kawasaki_ki_61_pto',
            life        = 18,
            vis         = 3,
            desrt       = 'genF-oblomoki',
            fire        = {300, 2},
            username    = 'Kawasaki_Ki_61_pto',
            index       = WSTYPE_PLACEHOLDER,
            classname   = "lLandPlane",
            positioning = "BYNORMAL",
            drawonmap   = true,
        },
        {
            name        = "genF-oblomoki",
            file        = "genF-oblomoki",
            fire        = {240, 2},
        },
    },

    mapclasskey         = "P0091000024",
    attribute           = {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER, "Fighters"},
    Categories          = {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor"},

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
	
-- ------------------------------------------------------------------------------------------------------------
-- 1. PRIMARY GENERAL & AI PARAMETERS (DCS Core Aircraft Attributes)
-- ------------------------------------------------------------------------------------------------------------
M_empty                 = 2630, -- [kg] Operational empty weight
M_nominal               = 3470, -- [kg] Standard combat flight weight
M_max                   = 3780, -- [kg] Maximum permissible takeoff weight (MTOW)
M_fuel_max              = 420, -- [kg] Full internal fuel capacity mass
wing_area               = 20.00, -- [m^2] Reference wing gross planform area
wing_span               = 12.00, -- [m] Tip-to-tip wingspan
wing_type               = 0, -- [enum] 0 = Straight / Trapezoidal wing   ***************************check**********************************
length                  = 8.94, -- [m] Overall fuselage length
height                  = 3.40, -- [m] Ground parked height

-- Flight Test & AI Operational Airspeeds (TAS / CAS)
V_max_sea_level         = 136.1, -- [m/s] Maximum level speed at sea level (TAS)
V_max_h                 = 161.1, -- [m/s] Maximum level speed at critical supercharger altitude (TAS)
V_max_altitude          = 161.1, -- [m/s] Backward compatibility alias for V_max_h
V_opt                   = 88.5, -- [m/s] Optimal cruise speed (1.30 * V_stall_clean)
V_take_off              = 52.7, -- [m/s] Takeoff rotation airspeed
V_land                  = 57.1, -- [m/s] Landing approach airspeed
Vy_max                  = 14.0, -- [m/s] Initial sea-level rate of climb
H_max                   = 11000, -- [m] Service ceiling
Mach_max                = 0.71, -- Maximum permissible dive Mach limit

-- Static Thrust Ratings for AI & Catapult Calculation (Froude Momentum T0 in kgf)
thrust_sum_max          = 1006, -- [kgf] Maximum military static thrust for AI & catapult calculation
thrust_sum_ab           = 1006, -- [kgf] Identical to thrust_sum_max (no afterburner)

CAS_min                 = 40.2, -- [m/s] Minimum safe calibrated airspeed
Ny_min                  = -3.5, -- Minimum allowable G factor
Ny_max                  = 7.0, -- Maximum structural G limit for AI
wing_root_chord         = 2.10, -- [m] Theoretical centerline/root chord
wing_tip_chord          = 1.20, -- [m] Tip chord
wing_sweep              = 2.0, -- [deg] Quarter-chord sweep angle
tand_gear_max           = 0.577, -- Gear suspension deflection parameter


----------------------------------------------------------------------------------------------- included on the SFM MaterSuite----------------------------------------------------------------------------------
	
		average_fuel_consumption	=	0.044,
		has_afteburner	=	false,
		has_speedbrake	=	false,
        main_gear_pos = {  0.700, -1.715, 2.015 },
		nose_gear_pos = { -4.670, -0.520, 0.000 },
		
		radar_can_see_ground	=	false,
		sound_name	=	"engine",
		AOA_take_off	=	0.14,
		stores_number	=	3,
		bank_angle_max	=	65,
		Ny_max_e	=	7,
		tanker_type	=	0,
		
		range	=	1015,
		RCS	=	2.5,
		
		detection_range_max	=	0,
		IR_emission_coeff	=	0.1,
		IR_emission_coeff_ab	=	0,
		engines_count	=	1,
		
		
		
		flaps_maneuver	=	0.33,
		wing_tip_pos = 	{-0.5,	-1.0,	4.8},
		nose_gear_wheel_diameter	=	0.224,
		main_gear_wheel_diameter	=	0.605,
		
		-- Engine exhaust nozzle emitters (Kawasaki Ha-40 inverted V-12)
        -- Positioned on nose forward cowl flanks, exhausting aft-downwards
        engines_nozzles = {
            [1] = { -- Port (Left) exhaust stack
                pos                 = { 1.35, -0.22, -0.46 }, -- Forward of firewall, on lower cowl flank
                elevation           = math.rad(-6.0),         -- Angled slightly downward
                azimuth             = math.rad(-165.0),       -- Exhaust plume flowing backwards and slightly out
                diameter            = 0.10,                   -- Exhaust pipe bore diameter (m)
                exhaust_length_ab   = 0.25,                   -- High-power heat blur length scaler
                exhaust_length_ab_K = 0.30,                   -- WEP thermal distortion factor
                smokiness_level     = 0.05,                   -- Baseline exhaust soot density
                engine_number       = 1,
            },
            [2] = { -- Starboard (Right) exhaust stack
                pos                 = { 1.35, -0.22,  0.46 }, -- Starboard cowl flank
                elevation           = math.rad(-6.0),
                azimuth             = math.rad(165.0),
                diameter            = 0.10,
                exhaust_length_ab   = 0.25,
                exhaust_length_ab_K = 0.30,
                smokiness_level     = 0.05,
                engine_number       = 1,
            },
        },
	
	crew_size	 = 1,

		crew_members = 
		{
			[1] = 
			{
			    pilot_name		  	 = 56,
				ejection_seat_name	=	0,
				drop_canopy_name	=	0,
				pos		   = 	{-1.460000,-0.045000,0.000000},
-----				canopy_pos =	{ 0,0,0},
			}, -- end of [1]
		}, -- end of crew_members
		
		brakeshute_name	=	0,
		is_tanker	=	false,
		-- Aircraft damage fire and smoke emitters
        -- Canonical PTO mapping: Engine core, wing fuel cells, fuselage tank, and empennage
        fires_pos = 
        {
            [1] = {  1.400, -0.150,  0.000 }, -- Engine block core / forward oil tank fire
            [2] = {  0.150, -0.180,  1.100 }, -- Starboard inner wing root fuel cell
            [3] = {  0.150, -0.180, -1.100 }, -- Port inner wing root fuel cell
            [4] = { -0.100, -0.150,  2.300 }, -- Starboard mid-wing fuel tank / gun bay
            [5] = { -0.100, -0.150, -2.300 }, -- Port mid-wing fuel tank / gun bay
            [6] = { -0.350, -0.100,  4.200 }, -- Starboard outer wing / aileron area
            [7] = { -0.350, -0.100, -4.200 }, -- Port outer wing / aileron area
            [8] = { -1.850,  0.250,  0.000 }, -- Fuselage reserve fuel tank (behind pilot armor)
            [9] = { -4.500,  0.400,  0.000 }, -- Empennage base / vertical fin structure
        }, -- end of fires_pos
	
	
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

-- ========================================================================================================
-- AVIONICS, SENSORS & PILOT VISUAL DETECTION (WWII Fighter Standard)
-- ========================================================================================================
    detection_range_max  = 0,      -- No radar or active search suites; AI uses visual target acquisition
    radar_can_see_ground = false,  -- Disables surface radar scanning
	CanopyGeometry 			 = makeAirplaneCanopyGeometry(LOOK_GOOD, LOOK_GOOD, LOOK_GOOD),	
    Sensors = {},                  -- Empty: Piston fighter with strictly human visual acquisition
	
	HumanRadio = {
		frequency = 127.5,  -- Radio Freq
		editable = true,
		minFrequency = 100.000,
		maxFrequency = 156.000,
		modulation = MODULATION_AM
	},
	

	Guns =  {	MG_131	 ({muzzle_pos_connector	= "Gun_point_3",rates = {875},effect_arg_number = 350,mixes = {{1,2,3,2}},azimuth_initial = 0		,elevation_initial = 0.385,supply_position = {1.42, 0.50, 2.23}}), --L
				MG_131	 ({muzzle_pos_connector	= "Gun_point_2",rates = {883},effect_arg_number = 350,mixes = {{3,2,1,2}},azimuth_initial = 0		,elevation_initial = 0.385,supply_position = {1.42, 0.50, -2.33}}), --R
				MG_151_20({muzzle_pos_connector	= "Gun_point_4",rates = {688},effect_arg_number = 350,mixes = {{1,2,2,3,3}},azimuth_initial = -0.092,elevation_initial = 0.563,supply_position = {1.42, 0.50, 2.23}}), --L
				MG_151_20({muzzle_pos_connector	= "Gun_point_1",rates = {679},effect_arg_number = 350,mixes = {{3,3,1,2,2}},azimuth_initial =  0.092,elevation_initial = 0.563,supply_position = {1.42, 0.50, -2.33}}), --R
				-- Historical Ki-61-I Hei/Tei: 4 guns (2x 12.7 mm Ho-103 + 2x 20 mm). The extra pair on
				-- Gun_point_5 / Gun_point_0 (6 guns total) was not historical and is disabled.
			},
            
	
		Pylons = {
		pylon(1, 0, 0, 0.00, 0, {use_full_connector_position = true, connector = "Pylon1", arg = 308},
		{
			{ CLSID = "PTO_JP_TYPE98_250KG", arg_value = 0.25 },
			{ CLSID = "PTO_JP_TYPE97_60KG",  arg_value = 0.25 },
		}),
		pylon(2, 0, 0, 0.00, 0, {use_full_connector_position = true, connector = "Pylon2", arg = 309},
		{
			{ CLSID = "PTO_JP_TYPE98_250KG", arg_value = 0.25 },
			{ CLSID = "PTO_JP_TYPE97_60KG",  arg_value = 0.25 },
		}),
    },
	
	Tasks = 
	{
		aircraft_task(GroundAttack),
		aircraft_task(RunwayAttack),
		aircraft_task(CAP),
		aircraft_task(CAS),
		aircraft_task(Intercept),
    },	
	DefaultTask = aircraft_task(CAP),

-- ------------------------------------------------------------------------------------------------------------
-- 2. STANDARD FLIGHT MODEL (SFM) AERODYNAMICS (SFM_Data.aerodynamics) v2.45
-- ------------------------------------------------------------------------------------------------------------
SFM_Data = {
    aerodynamics = {
        -- Control authority & stability derivatives (DCS convention)
        Cy0         = 0.1644, -- Zero-AoA 3D Wing Lift Coefficient (Rigorous Formulation)
        Mzalfa      = 4.1500, -- Pitch moment stability derivative (positive in DCS)
        Mzalfadt    = 0.9753, -- Pitch rate damping factor (positive in DCS)
        kjx         = 1.9358, -- Roll inertia factor
        kjz         = 0.0014, -- Yaw directional stability factor
        Czbe        = -0.0129, -- Directional weathercock side force derivative

        -- Drag & high-lift coefficients
        cx_gear     = 0.0168, -- Landing gear parasite drag increment
        cx_flap     = 0.0441, -- Landing flaps parasite drag increment
        cy_flap     = 0.3450, -- Landing flaps maximum lift increment
        cx_brk      = 0.0000, -- Airbrake / dive flap parasite drag increment

        table_data = {
            --      M     Cx0      Cya      B       B4     Omxmax  Aldop  Cymax
            [1]  = {0.00, 0.02524, 0.075, 0.06453, 0.27039, 0.053, 10.52, 1.028}, -- Static / Taxi
            [2]  = {0.08, 0.02524, 0.075, 0.06495, 0.18927, 0.370, 12.97, 1.206}, --Clean Stall Speed (Vs) / Deep Dogfight
            [3]  = {0.15, 0.02465, 0.076, 0.06602, 0.16223, 0.792, 14.47, 1.315}, -- Zoom Climb Threshold / Final Approach
            [4]  = {0.24, 0.02396, 0.077, 0.06848, 0.09464, 1.162, 15.18, 1.370}, -- Corner Speed / Optimal Sustained Turn
            [5]  = {0.34, 0.02334, 0.078, 0.07297, 0.07030, 1.320, 15.23, 1.343}, -- High Energy Combat / Peak Roll Rate
            [6]  = {0.44, 0.02295, 0.078, 0.08003, 0.05408, 0.993, 13.81, 1.165}, -- Max Level Speed (Vmax) / Fast Cruise
            [7]  = {0.55, 0.02295, 0.078, 0.09252, 0.10815, 0.624, 10.29, 0.891}, -- Dive Entry (Vne) / Heavy Control Stiffening
            [8]  = {0.65, 0.02302, 0.078, 0.11175, 0.27039, 0.376, 7.31, 0.658}, -- Wave Drag Onset (M_CR) / Roll Lockout
            [9]  = {0.75, 0.03151, 0.062, 0.14751, 1.08155, 0.201, 5.99, 0.438}, -- Transonic Drag Divergence (M_DD)
            [10] = {0.85, 0.09365, 0.041, 0.23255, 4.32619, 0.075, 4.86, 0.247}, -- Terminal Structural Shock / Safety Limit
        }, -- end of table_data
    }, -- end of aerodynamics

    -- --------------------------------------------------------------------------------------------------------
    -- 3. PISTON ENGINE & SUPERCHARGER SPECIFICATION (SFM_Data.engine, typeng = 2)
    -- --------------------------------------------------------------------------------------------------------
    engine = {
        Nominal_RPM           = 2800.0, -- Full Throttle Rated Crankshaft RPM
        Nmg                   = 25.0, -- [%] Idle RPM Percentage
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
        cylinder_firing_order = {1, 8, 5, 10, 3, 7, 6, 11, 2, 9, 4, 12},

        -- Mechanical & Thermodynamic Engine Dimensions
        Displ                 = 33.90, -- [L] Engine displacement in liters
        Stroke                = 0.160, -- [m] Piston stroke in meters
        V_pist_0              = 14.93, -- [m/s] Mean linear piston velocity at nominal METO RPM
        k_Eps                 = 6.90, -- Geometric cylinder compression ratio
        k_gearbox             = 1.69, -- Engine/propeller gearbox reduction ratio

        -- Supercharger & Intake Manifold Pressure Regulation
        hMaxEng               = 4.8, -- [km] Critical full-throttle altitude
        k_boost               = 1.35, -- Supercharger boost stage multiplier
        k_cfug                = 0.0015, -- Centrifugal compressor pressure rise factor
        k_vel                 = 0.017, -- Intake ram air recovery factor
        k_adiab_1             = 0.0379, -- Supercharger Stage 1 charge heating coefficient
        k_adiab_2             = 0.0379, -- Supercharger Stage 2 charge heating coefficient
        k_after_cool          = 0.350, -- Engine intercooling booster efficiency
        MAX_Manifold_P_1      = 125000, -- [Pa] Max continuous/METO manifold pressure
        MAX_Manifold_P_2      = 140000, -- [Pa] Military dry takeoff manifold pressure
        MAX_Manifold_P_3      = 140000, -- [Pa] WEP wet emergency manifold pressure

        -- Deactivation of Linear Power Derivatives (Dynamic Simulation Enforcement)
        dpdh_m                = 1800, -- [Pa/m] 
        dpdh_f                = 1800, -- [Pa/m] 
        cemax                 = 0.37, -- [kg/s] Fuel consumption parameter
        cefor                 = 0.37, -- [kg/s] WEP fuel consumption parameter

        -- Thrust Table (Mach vs Available Thrust Pmax/Pfor in Newtons)
        table_data = {
            --      M     Pmax (N)   
            [1]  = {0.00, 9864.9}, -- Static Takeoff Thrust
            [2]  = {0.08, 9380.5}, -- Takeoff Roll
            [3]  = {0.15, 8878.4}, -- Climb Accel
            [4]  = {0.24, 8266.8}, -- Combat Climb
            [5]  = {0.34, 7645.3}, -- Fast Cruise
            [6]  = {0.44, 7033.7}, -- Near Vne
            [7]  = {0.55, 6491.1}, -- High Speed Dive
            [8]  = {0.65, 6126.1}, -- Dive Compressibility
            [9]  = {0.75, 5889.3}, -- Transonic Buffeting
            [10] = {0.85, 4666.1}, -- Propeller Windmilling Limit
        }, -- end of engine table_data

        -- Cooling, Friction & Governor Dynamics
        dcx_eng               = 0.016, -- Engine cooling and momentum intake drag
        Nu_0                  = 1.20, -- Propeller static thrust coefficient at V=0
        Nu_1                  = 0.89, -- Propeller advance ratio (J) decay coefficient
        Nu_2                  = 0.0010, -- Helical tip Mach shock loss coefficient
        N_indic_0             = 865000, -- [W] Indicated thermodynamic power
        N_fr_0                = 0.040, -- Static mechanical friction mean effective pressure
        N_fr_1                = 0.001, -- Viscous friction decay with piston speed
        P_oil                 = 495438, -- [Pa] Engine oil operating pressure
        k_oil                 = 0.00004, -- Oil viscosity shearing resistance
        k_piston              = 3000, -- IMEP piston velocity scaler
        k_reg                 = 0.0050, -- Constant-speed governor tracking gain
        prop_direction        = 1, -- Propeller rotation direction from Engine_Database
        Init_Mom              = 220, -- [N*m] Starter cranking torque
        D_prop                = 3.00, -- [m] Propeller disc tip-to-tip diameter
        MOI_prop              = 36.0, -- [kg*m^2] Propeller polar mass moment of inertia
        prop_pitch_min        = 22.0, -- [deg] Fine pitch limit for takeoff
        prop_pitch_max        = 55.0, -- [deg] Coarse pitch limit for dive/cruise
        prop_pitch_feather    = 85.0, -- [deg] Feathered streamlined pitch angle
        prop_blades_count     = 3, -- Propeller blade count

    }, -- end of engine
}, -- end of SFM_Data




-- ============================================================================================================
    -- KAWASAKI Ki-61-I HIEN "TONY" - CANONICAL DAMAGE MODEL (34 COLLISION SHELLS + 32 INNARDS)
    -- Calibrated to TAIC No. 1 vulnerability data (Kawasaki Ha-40 Inverted V12, 13mm seat armor, self-sealing tanks)
    -- Fully crash-proof configuration: args = {-1} on all collision cells (zero missing debris assertions)
    -- ============================================================================================================

    Damage = verbose_to_dmg_properties({
        -- =====================================================================
        -- 1. NOSE, ENGINE & PROPELLER (KAWASAKI Ha-40 INVERTED V12)
        -- =====================================================================
        ["NOSE_BOTTOM"] = {
            critical_damage = 3.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.5, skin = "Aluminum", thickness = 0.0010, spar = "Truss"},
            children = {"ENGINE"},
        },
        ["NOSE_LEFT_SIDE"] = {
            critical_damage = 3.2,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0010},
            innards = {
                { id = "XGun-101",     skin = "Steel",    wall = 0.008 }, -- Port synchronized 12.7mm Ho-103 cowl gun
                { id = "XAmmoBox-101", skin = "Aluminum", wall = 0.002 }, -- Port cowl ammunition box
            },
        },
        ["NOSE_RIGHT_SIDE"] = {
            critical_damage = 3.2,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0010},
            innards = {
                { id = "XGun-102",     skin = "Steel",    wall = 0.008 }, -- Starboard synchronized 12.7mm Ho-103 cowl gun
                { id = "XAmmoBox-102", skin = "Aluminum", wall = 0.002 }, -- Starboard cowl ammunition box
            },
        },
        ["ENGINE"] = {
            critical_damage = 6.0,
            args = {-1},
            damage_boundary = 0.10,
            droppable = false,
            refractory = false,
            construction = {durability = 3.5, skin = "CastIron", thickness = 0.015, spar = "Rod"},
            children = {"ROTOR"},
            failures = {
                { "ENG0_OIL_RADIATOR_0_PIERCED", 0.60 },
                { "ENG0_OIL_HOSE_0_LEAK",        0.40 },
                { "ENG0_JAMMED",                 0.15 },
            },
            innards = {
                { id = "XEng0Case",         skin = "CastIron", wall = 0.025 }, -- Kawasaki Ha-40 inverted V12 engine crankcase
                { id = "XEng0OilTank0",     skin = "Aluminum", wall = 0.004 }, -- Oil reservoir tank forward of firewall
                { id = "XEng0Supercharger", skin = "Steel",    wall = 0.006 }, -- Port-mounted centrifugal supercharger
            },
        },
        ["ROTOR"] = {
            critical_damage = 2.0,
            args = {-1},
            droppable = false,
            construction = {durability = 1.4, skin = "Steel", thickness = 0.0035, spar = "Rod"},
        },

        -- =====================================================================
        -- 2. COCKPIT, CABIN & FUSELAGE STATIONS (TAIC No. 1 PROTECTED ARCHITECTURE)
        -- =====================================================================
        ["COCKPIT"] = {
            critical_damage = 3.5,
            args = {-1},
            damage_boundary = 0.25,
            droppable = false,
            construction = {durability = 2.2, skin = "Glass", thickness = 0.0030, spar = "Truss"},
            innards = {
                { id = "XCrew0" },                                              -- Pilot torso
                { id = "XCrew0H" },                                             -- Pilot head
                { id = "XCtrlCrew0Stick", skin = "Steel", wall = 0.025 },       -- Flight control stick
                { id = "XArmor00",        skin = "Steel", wall = 0.013 },       -- TAIC No. 1: 13mm steel headrest & seat armor plate
                { id = "XArmor01",        skin = "Glass", wall = 0.038 },       -- Bullet-resistant laminated glass windscreen
            },
        },
        ["FUSELAGE_LEFT_SIDE"] = {
            critical_damage = 5.5,
            args = {-1},
            damage_boundary = 0.25,
            droppable = false,
            construction = {durability = 2.8, skin = "Aluminum", thickness = 0.0012, spar = "Truss"},
            children = {"NOSE_LEFT_SIDE", "COCKPIT", "WING_L_IN", "TAIL_LEFT_SIDE"},
            -- TAIC No. 1: Fuselage Self-Sealing Fuel Cell (165 L, aft of pilot seat)
            fuel_tank = {critical_damage = 2.0, volume = 165.0, integrity_loss_rate = 0.40},
            failures = {
                { "FUEL_TANK_03_MINOR_LEAK",  0.35 },
                { "FUEL_TANK_03_MEDIUM_LEAK", 0.20 },
                { "FUEL_TANK_03_MAJOR_LEAK",  0.10 },
                { "FUEL_TANK_03_FIRE",        0.15 },
                { "FUEL_TANK_03_EXPLODED",    0.03 },
            },
            innards = {
                { id = "XArmor02",          skin = "Steel",  wall = 0.008 }, -- Fire barrier armor plate
                { id = "XFuelTank0",        skin = "Rubber", wall = 0.036, lining = "FoamFilledRubber", plenum = 0.65 },
                { id = "XCtrlLineElevator", skin = "Steel",  wall = 0.002, plenum = 0.001 },
                { id = "XCtrlLineRudder",   skin = "Steel",  wall = 0.002, plenum = 0.001 },
            },
        },
        ["FUSELAGE_RIGHT_SIDE"] = {
            critical_damage = 5.5,
            args = {-1},
            damage_boundary = 0.25,
            droppable = false,
            construction = {durability = 2.8, skin = "Aluminum", thickness = 0.0012, spar = "Truss"},
            children = {"NOSE_RIGHT_SIDE", "WING_R_IN", "TAIL_RIGHT_SIDE"},
        },
        ["FUSELAGE_BOTTOM"] = {
            critical_damage = 5.0,
            args = {-1},
            damage_boundary = 0.25,
            droppable = false,
            construction = {durability = 2.5, skin = "Aluminum", thickness = 0.0012, spar = "Truss"},
            children = {"NOSE_BOTTOM"},
            -- Ventral Radiator Bath (Kühlerbad): Combined Glycol Coolant & Oil Radiator
            radiator = {critical_damage = 1.6, volume = 0.35},
            innards = {
                { id = "XEng0OilRadiator0", skin = "Steel", wall = 0.003 }, -- Ventral radiator assembly
            },
        },

        -- =====================================================================
        -- 3. PORT (LEFT) WING & CONTROL SURFACES
        -- =====================================================================
        ["WING_L_IN"] = {
            critical_damage = 7.0,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 3.2, skin = "Aluminum", thickness = 0.0012, spar = "FlangeBeam"},
            children = {"WING_L_CENTER", "FLAP_L", "WHEEL_L"},
            -- TAIC No. 1: Port Inner Wing Protected Fuel Cell (190 L)
            fuel_tank = {critical_damage = 2.2, volume = 190.0, integrity_loss_rate = 0.45},
            failures = {
                { "FUEL_TANK_00_MINOR_LEAK",  0.35 },
                { "FUEL_TANK_00_MEDIUM_LEAK", 0.20 },
                { "FUEL_TANK_00_MAJOR_LEAK",  0.10 },
                { "FUEL_TANK_00_FIRE",        0.18 },
                { "FUEL_TANK_00_EXPLODED",    0.04 },
            },
            innards = {
                { count = 2, durability = 1.25, id = "XSparWLHIn", plenum = 0.22, skin = "Aluminum", wall = 0.010 },
                { id = "XFuelTank1", skin = "Rubber", wall = 0.030, lining = "FoamFilledRubber", plenum = 0.65 },
            },
        },
        ["WING_L_CENTER"] = {
            critical_damage = 5.5,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 2.6, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
            children = {"WING_L_OUT"},
            innards = {
                { count = 2, durability = 1.05, id = "XSparWLHMid", plenum = 0.20, skin = "Aluminum", wall = 0.008 },
                { id = "XGun-100",     skin = "Steel",    wall = 0.008 }, -- Port wing gun (12.7mm Ho-103 or 20mm MG 151)
                { id = "XAmmoBox-100", skin = "Aluminum", wall = 0.002 }, -- Port wing ammo box
            },
        },
        ["WING_L_OUT"] = {
            critical_damage = 4.0,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 2.0, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"AILERON_L"},
            innards = {
                { count = 2, durability = 0.85, id = "XSparWLHOut", plenum = 0.16, skin = "Aluminum", wall = 0.006 },
            },
        },
        ["AILERON_L"] = {
            critical_damage = 1.6,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.8, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },
        ["FLAP_L"] = {
            critical_damage = 2.2,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 1.2, skin = "Aluminum", thickness = 0.0010},
        },

        -- =====================================================================
        -- 4. STARBOARD (RIGHT) WING & CONTROL SURFACES
        -- =====================================================================
        ["WING_R_IN"] = {
            critical_damage = 7.0,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 3.2, skin = "Aluminum", thickness = 0.0012, spar = "FlangeBeam"},
            children = {"WING_R_CENTER", "FLAP_R", "WHEEL_R"},
            -- TAIC No. 1: Starboard Inner Wing Protected Fuel Cell (190 L)
            fuel_tank = {critical_damage = 2.2, volume = 190.0, integrity_loss_rate = 0.45},
            failures = {
                { "FUEL_TANK_01_MINOR_LEAK",  0.35 },
                { "FUEL_TANK_01_MEDIUM_LEAK", 0.20 },
                { "FUEL_TANK_01_MAJOR_LEAK",  0.10 },
                { "FUEL_TANK_01_FIRE",        0.18 },
                { "FUEL_TANK_01_EXPLODED",    0.04 },
            },
            innards = {
                { count = 2, durability = 1.25, id = "XSparWRHIn", plenum = 0.22, skin = "Aluminum", wall = 0.010 },
                { id = "XFuelTank2", skin = "Rubber", wall = 0.030, lining = "FoamFilledRubber", plenum = 0.65 },
            },
        },
        ["WING_R_CENTER"] = {
            critical_damage = 5.5,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 2.6, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
            children = {"WING_R_OUT"},
            innards = {
                { count = 2, durability = 1.05, id = "XSparWRHMid", plenum = 0.20, skin = "Aluminum", wall = 0.008 },
                { id = "XGun-103",     skin = "Steel",    wall = 0.008 }, -- Starboard wing gun (12.7mm Ho-103 or 20mm MG 151)
                { id = "XAmmoBox-103", skin = "Aluminum", wall = 0.002 }, -- Starboard wing ammo box
            },
        },
        ["WING_R_OUT"] = {
            critical_damage = 4.0,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 2.0, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"AILERON_R"},
            innards = {
                { count = 2, durability = 0.85, id = "XSparWRHOut", plenum = 0.16, skin = "Aluminum", wall = 0.006 },
            },
        },
        ["AILERON_R"] = {
            critical_damage = 1.6,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.8, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },
        ["FLAP_R"] = {
            critical_damage = 2.2,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 1.2, skin = "Aluminum", thickness = 0.0010},
        },

        -- =====================================================================
        -- 5. TAIL UNIT & EMPENNAGE SURFACES
        -- =====================================================================
        ["TAIL_LEFT_SIDE"] = {
            critical_damage = 4.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.0, skin = "Aluminum", thickness = 0.0010},
            children = {"TAIL"},
        },
        ["TAIL_RIGHT_SIDE"] = {
            critical_damage = 4.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.0, skin = "Aluminum", thickness = 0.0010},
        },
        ["TAIL"] = {
            critical_damage = 5.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.4, skin = "Aluminum", thickness = 0.0010, spar = "Truss"},
            children = {"FIN_L", "STABILIZER_L_IN", "STABILIZER_R_IN", "WHEEL_REAR"},
        },
        ["FIN_L"] = {
            critical_damage = 3.2,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"FIN_TOP", "RUDDER"},
            innards = {
                { id = "XSparKeelIn", plenum = 0.20, skin = "Aluminum", wall = 0.005 },
            },
        },
        ["FIN_TOP"] = {
            critical_damage = 2.2,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.2, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
        },
        ["RUDDER"] = {
            critical_damage = 1.5,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.7, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },
        ["STABILIZER_L_IN"] = {
            critical_damage = 3.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"STABILIZER_L_OUT", "ELEVATOR_L"},
            innards = {
                { id = "XSparStabLHIn", skin = "Aluminum", wall = 0.004 },
            },
        },
        ["STABILIZER_L_OUT"] = {
            critical_damage = 2.2,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.2, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
        },
        ["ELEVATOR_L"] = {
            critical_damage = 1.5,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.7, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },
        ["STABILIZER_R_IN"] = {
            critical_damage = 3.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"STABILIZER_R_OUT", "ELEVATOR_R"},
            innards = {
                { id = "XSparStabRHIn", skin = "Aluminum", wall = 0.004 },
            },
        },
        ["STABILIZER_R_OUT"] = {
            critical_damage = 2.2,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.2, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
        },
        ["ELEVATOR_R"] = {
            critical_damage = 1.5,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.7, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },

        -- =====================================================================
        -- 6. UNDERCARRIAGE (LANDING GEAR)
        -- =====================================================================
        ["WHEEL_L"] = {
            critical_damage = 2.8,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 1.8, skin = "Steel", thickness = 0.0045, spar = "Rod"},
        },
        ["WHEEL_R"] = {
            critical_damage = 2.8,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 1.8, skin = "Steel", thickness = 0.0045, spar = "Rod"},
        },
        ["WHEEL_REAR"] = {
            critical_damage = 1.8,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 1.4, skin = "Steel", thickness = 0.0030, spar = "Rod"},
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


add_aircraft(Kawasaki_Ki_61_pto)

