-- ============================================================================================================
-- DCS WORLD COMPLETE AIRCRAFT DEFINITION & SFM SPECIFICATION (Master Suite v2.45)
-- GENERATED FOR: SBD-5 Dauntless
-- THEATER & PROVENANCE: Pacific Theater (PTO) | United States (US Navy) (1943)
-- INSTALLED ENGINE POWERTRAIN: Wright R-2600-13/20 Cyclone
-- ARCHITECTURE: Canonical SFM Standard
-- ============================================================================================================


-- ============================================================================================================
-- 0. LOCAL STANDALONE SHELL DECLARATIONS (AUTONOMOUS PTO AMMUNITION)
-- ============================================================================================================
local function safe_declare_shell(tbl)
    if declare_weapon then
        if not (weapons and weapons.shells and weapons.shells[tbl.name]) then
            declare_weapon(tbl)
        end
    end
end

-- 12.7x99mm Browning M2 (.50 BMG) AP/Tracer
safe_declare_shell({
    category             = CAT_SHELLS,
    name                 = "PTO_127mm_M2",
    user_name            = _("12.7x99mm Browning M2 (.50 BMG)"),
    model_name           = "tracer_bullet_yellow",
    v0                   = 870.0,
    Da0                  = 0.00085,
    Da1                  = 0.0,
    Dv0                  = 0.0082,
    mass                 = 0.043,
    round_mass           = 0.137,
    cartridge            = 204,                  -- <-- Corrige: "cartridge is not a number"
    cartridge_mass       = 0.019,
    explosive            = 0.0,
    life_time            = 6.5,
    caliber              = 12.7,
    s                    = 0.0,
    j                    = 0.0,
    l                    = 0.0,
    charTime             = 0,
    cx                   = {0.5, 0.61, 0.8, 0.27, 2.0},
    k1                   = 2.9e-08,
    tracer_off           = 4.0,
    smoke_tail_life_time = 0.0,
    scale_tracer         = 1.0,
})

-- 7.62x63mm Browning .30-06 AN/M2 Ball/Tracer
safe_declare_shell({
    category             = CAT_SHELLS,
    name                 = "PTO_3006_M2",
    user_name            = _("7.62x63mm Browning .30-06 AN/M2"),
    model_name           = "tracer_bullet_yellow",
    v0                   = 820.0,
    Da0                  = 0.0010,
    Da1                  = 0.0,
    Dv0                  = 0.0085,
    mass                 = 0.0098,
    round_mass           = 0.027,
    cartridge            = 204,                  -- <-- Corrige: "cartridge is not a number"
    cartridge_mass       = 0.012,
    explosive            = 0.0,
    life_time            = 5.0,
    caliber              = 7.62,
    s                    = 0.0,
    j                    = 0.0,
    l                    = 0.0,
    charTime             = 0,
    cx                   = {0.5, 0.61, 0.8, 0.27, 2.0},
    k1                   = 3.2e-08,
    tracer_off           = 3.5,
    smoke_tail_life_time = 0.0,
    scale_tracer         = 0.85,
})

-- ============================================================================================================
-- 1. US NAVY ORDNANCE CONSTRUCTORS
-- ============================================================================================================
local function USN_Browning50_127mm(tbl)
    tbl.category                = CAT_GUN_MOUNT
    tbl.name                    = tbl.name or "USN_Browning50_127mm"
    tbl.supply                  = {shells = {"PTO_127mm_M2"}, mixes = {{1}}, count = tbl.count or 360}
    tbl.gun                     = {
        max_burst_length = tbl.max_burst_length or 50,
        rates            = {800},
        recoil_coeff     = 1.0,
        barrels_count    = 1,
        trigger          = {name = "GunTrigger"},
    }
    tbl.aft_gun_mount           = false
    tbl.effective_fire_distance = 900
    tbl.drop_cartridge          = 204
    tbl.muzzle_pos              = tbl.muzzle_pos or {0.0, 0.0, 0.0}
    tbl.muzzle_pos_connector    = tbl.muzzle_pos_connector or "gunpoint_1"
    tbl.azimuth_initial         = tbl.azimuth_initial or 0.0
    tbl.elevation_initial       = tbl.elevation_initial or 0.0
    tbl.supply_position         = tbl.supply_position or {0.50, 0.35, 0.0}
    tbl.ejector_pos             = tbl.ejector_pos or {-0.15, -0.25, 0.0}
    tbl.ejector_dir             = tbl.ejector_dir or {0.0, -1.0, 0.0}
    tbl.effects                 = {{ name = "FireEffect", arg = tbl.effect_arg_number or 436 }, { name = "SmokeEffect" }}
    if declare_weapon then declare_weapon(tbl) end
    return tbl
end

local function USN_TwinBrowning30_762mm(tbl)
    tbl.category                = CAT_GUN_MOUNT
    tbl.name                    = tbl.name or "USN_TwinBrowning30_762mm"
    tbl.supply                  = {shells = {"PTO_3006_M2"}, mixes = {{1}}, count = tbl.count or 1000}
    tbl.gun                     = {
        max_burst_length = tbl.max_burst_length or 75,
        rates            = {1200},
        recoil_coeff     = 0.7,
        barrels_count    = 1,
        trigger          = {name = "GunTrigger"},
    }
    -- ED turret scheme (B-17G / A-20G): aft_gun_mount = false, initial angles 0,
    -- aim comes from the connector orientation + turret limits.
    tbl.aft_gun_mount           = false
    tbl.effective_fire_distance = 750
    tbl.drop_cartridge          = 204
    tbl.muzzle_pos              = tbl.muzzle_pos or {0.0, 0.0, 0.0}
    tbl.muzzle_pos_connector    = tbl.muzzle_pos_connector or "gunpoint_3"
    tbl.azimuth_initial         = tbl.azimuth_initial or 0
    tbl.elevation_initial       = tbl.elevation_initial or 0
    tbl.supply_position         = tbl.supply_position or {-1.85, 0.30, 0.0}
    tbl.ejector_pos             = tbl.ejector_pos or {-1.90, 0.15, 0.0}
    tbl.ejector_dir             = tbl.ejector_dir or {0.0, -1.0, 0.0}
    tbl.effects                 = {{ name = "FireEffect", arg = tbl.effect_arg_number or 350 }, { name = "SmokeEffect" }}
    if declare_weapon then declare_weapon(tbl) end
    return tbl
end

douglas_dauntless =  {
        
	Name 				=   'douglas dauntless',
	DisplayName			= _('[PTO43] Douglas SBD Dauntless'),
	

	
	Picture 			= "douglas dauntless.png",
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "douglas dauntless",
	XRayShape           = "sbd_dauntless_X-Ray",
	propellorShapeType  = "3ARG_PROC_BLUR",
	propellorShapeName  = "sbd_blade.FBX",   -- one blade, +Y radial; drawn on PROP_LOCATOR_0
	propellorShapeBlurX = 1.0,
	
	shape_table_data 	= 
	{
		{
			file  	 	= 'douglas dauntless';
			life  	 	= 18; -- lifebar
			vis   	 	= 3; -- visibility gain.
			desrt    	= 'genF-oblomoki'; -- Name of destroyed object file name
			fire  	 	= { 300, 2}; -- Fire on the ground after destoyed: 300sec 2m
			username	= 'douglas dauntless';
			index    	=  WSTYPE_PLACEHOLDER;
			classname 	= "lLandPlane";
			positioning = "BYNORMAL";
			drawonmap 	= true;
		},
		{
			name  = "genF-oblomoki";
			file  = "genF-oblomoki";
			fire  = { 240, 2};
		},

	},
	mapclasskey 		= "P0091000027",
	attribute  			= {wsType_Air, wsType_Airplane, wsType_Intruder, WSTYPE_PLACEHOLDER, "Strategic bombers"},
	Categories 			= {},	
	
	
-- ------------------------------------------------------------------------------------------------------------
--  PRIMARY GENERAL & AI PARAMETERS (DCS Core Aircraft Attributes)
-- ------------------------------------------------------------------------------------------------------------
M_empty                 = 2905, -- [kg] Operational empty weight
M_nominal               = 4318, -- [kg] Standard combat flight weight
M_max                   = 4853, -- [kg] Maximum permissible takeoff weight (MTOW)
M_fuel_max              = 680, -- [kg] Full internal fuel capacity mass
wing_area               = 30.19, -- [m^2] Reference wing gross planform area
wing_span               = 12.65, -- [m] Tip-to-tip wingspan
wing_type               = 0, -- [enum] 0 = Straight / Trapezoidal wing  ?????
length                  = 10.08, -- [m] Overall fuselage length
height                  = 3.83, -- [m] Ground parked height

-- Flight Test & AI Operational Airspeeds (TAS / CAS)
V_max_sea_level         = 104.2, -- [m/s] Maximum level speed at sea level (TAS)
V_max_h                 = 113.9, -- [m/s] Maximum level speed at critical supercharger altitude (TAS)
V_max_altitude          = 113.9, -- [m/s] Backward compatibility alias for V_max_h
V_opt                   = 67.7, -- [m/s] Optimal cruise speed (1.30 * V_stall_clean)
V_take_off              = 48.0, -- [m/s] Takeoff rotation airspeed
V_land                  = 52.0, -- [m/s] Landing approach airspeed
Vy_max                  = 8.6, -- [m/s] Initial sea-level rate of climb
H_max                   = 7780, -- [m] Service ceiling
Mach_max                = 0.69, -- Maximum permissible dive Mach limit

-- Static Thrust Ratings for AI & Catapult Calculation (Froude Momentum T0 in kgf)
thrust_sum_max          = 1587, -- [kgf] Maximum military static thrust for AI & catapult calculation
thrust_sum_ab           = 1587, -- [kgf] Identical to thrust_sum_max (no afterburner)

CAS_min                 = 37.1, -- [m/s] Minimum safe calibrated airspeed
Ny_min                  = -2.5, -- Minimum allowable G factor
Ny_max                  = 5.2, -- Maximum structural G limit for AI
wing_root_chord         = 2.80, -- [m] Theoretical centerline/root chord
wing_tip_chord          = 1.80, -- [m] Tip chord
wing_sweep              = 0.0, -- [deg] Quarter-chord sweep angle
tand_gear_max           = 0.577, -- Gear suspension deflection parameter

----------------------------------------------------------------------------------------------------------------------------------------------------------------

average_fuel_consumption 	= 0.059, -- this is highly relative, but good estimates are 36-40l/min = 28-31kg/min = 0.47-0.52kg/s -- 45l/min = 35kg/min = 0.583kg/s
Ny_max_e 					= 8.0,  -- Max G (for AI)
AOA_take_off 				= 0.14, -- AoA in take off (for AI)
bank_angle_max 				= 65, -- Max bank angle (for AI)
has_afteburner 				= false, -- AFB yes/no
has_speedbrake 				= true, -- Speedbrake yes/no

	flaps_maneuver 				= 0.3, -- Max flaps in take-off and maneuver (0.5 = 1st stage; 1.0 = 2nd stage) (for AI)
	range 						= 665, -- Max range in km (for AI)
	RCS 						= 2.5, -- Radar Cross Section m2
	IR_emission_coeff 			= 0.1, -- Normal engine -- IR_emission_coeff = 1 is Su-27 without afterburner. It is reference.
	IR_emission_coeff_ab 		= 0, -- With afterburner
	wing_tip_pos 				= 	{0.532,	0.328,	6.171}, -- wingtip coords for visual effects
	brakeshute_name 			= 0, -- Landing - brake chute visual shape after separation
	is_tanker 					= false, -- Tanker yes/no
	air_refuel_receptacle_pos 	= {0, 0, 0}, -- refuel coords
	engines_count				= 1, -- Engines count
	engines_nozzles = {
        
        [1] = {
            pos                 = { 0.850, -0.420, -0.580 }, 
            elevation           = math.rad(-5.0),           
            azimuth             = math.rad(-15.0),           
            diameter            = 0.12,                      
            exhaust_length_ab   = 0.15,                      
            exhaust_length_ab_K = 0.20,
            smokiness_level     = 0.045,                     
            engine_number       = 1,
        },
      
        [2] = {
            pos                 = { 0.850, -0.420,  0.580 },
            elevation           = math.rad(-5.0),
            azimuth             = math.rad( 15.0),
            diameter            = 0.12,
            exhaust_length_ab   = 0.15,
            exhaust_length_ab_K = 0.20,
            smokiness_level     = 0.045,
            engine_number       = 1,
        },
    }, -- end of engines_nozzles
-------------------------------------------------------------------------------------------------
	
	
	---- Valori di Mario	
	 nose_gear_pos				= 	{-3.769,	-0.490,	0}, -- nosegear coord 3.769,	-2.353,	0
	 nose_gear_amortizer_direct_stroke   		         =  0,  -- down from nose_gear_pos !!!
	 nose_gear_amortizer_reversal_stroke  		=  0,  -- up 
	 nose_gear_amortizer_normal_weight_stroke 	=  0,   -- up 
	 nose_gear_wheel_diameter 	               			 = 0.615, -- in m
	
	 main_gear_pos 				= 	{0.090,-1.287, -2.374}, -- main gear coords 0.072,	-2.374,	2.341
	 main_gear_amortizer_direct_stroke	 	    =   0, --  down from main_gear_pos !!!
	 main_gear_amortizer_reversal_stroke  	    = 	0, --  up 
	 main_gear_amortizer_normal_weight_stroke    =   0,-- down from main_gear_pos
	 main_gear_wheel_diameter 				    =   0.79, -- in m

crew_size = 2,
	crew_members = {
		[1] = {
			pilot_name           = "pilot_p51",            -- O "pilot_p51" si prefieres el uniforme USAAF/USN
			drop_canopy_name     = 0,                        
			ejection_seat_name   = 0,                        
			drop_parachute_name  = "pilot_p51_parachute",
			pos                  = {-0.450, 0.250, 0.000},   
			can_be_playable      = true,
			canopy_arg           = 38,                       
			ejection_order       = 1,
			role                 = "pilot",
			role_display_name    = _("Pilot"),
		}, -- end of [1]

		[2] = {
			pilot_name           = "pilot_p51",
			drop_canopy_name     = 0,                        
			ejection_seat_name   = 0,                       
			drop_parachute_name  = "pilot_p51_parachute",
			pos                  = {-1.750, 0.200, 0.000},  
			can_be_playable      = true,
			canopy_arg           = 421,                      
			pilot_body_arg       = 472,
			ejection_order       = 2,
			role                 = "gunner",
			role_display_name    = _("Rear Gunner"),
		}, -- end of [2]
	}, -- end of crew_members
	------------------------------------
	aim_error_level_bombing 	= 1.0,
	aim_error_dive_bombing	 	= 10.0,
    aim_error_ground_attack		= 1.0,	
    date_of_introduction		= 1940,
	country_of_origin			= "USA",
	------------------------------------

	-- ============================================================================================================
    -- DOUGLAS SBD DAUNTLESS - FIRE & SMOKE EMITTER LOCATIONS (fires_pos)
    -- Extracted directly from sbd_dauntless_X-Ray.edm geometry:
    -- Coordinate convention (DCS Aircraft Standard): { +X Forward (Nose), +Y Up, +Z Starboard (Right) }
    -- ============================================================================================================
    fires_pos = {
        -- [1] Engine core / Forward radial fire (XEng0Case crankcase & cylinder bank)
        [1]  = {  1.450,  0.150,  0.000 },

        -- [2] Starboard inner fuel tank fire (XFuelTank2 center section, Right)
        [2]  = { -0.550, -0.260,  1.580 },

        -- [3] Port inner fuel tank fire (XFuelTank1 center section, Left)
        [3]  = { -0.550, -0.260, -1.580 },

        -- [4] Starboard mid-wing / Fold joint fire (XSparWRHMid panel transition)
        [4]  = { -0.420, -0.150,  2.930 },

        -- [5] Port mid-wing / Fold joint fire (XSparWLHMid panel transition)
        [5]  = { -0.420, -0.150, -2.930 },

        -- [6] Starboard outer wing panel / Aileron bay fire (XSparWRHOut tip section)
        [6]  = { -0.420,  0.200,  5.180 },

        -- [7] Port outer wing panel / Aileron bay fire (XSparWLHOut tip section)
        [7]  = { -0.420,  0.200, -5.180 },

        -- [8] Main fuselage ventral fuel cell fire (XFuelTank0 under cockpit floor)
        [8]  = { -0.420, -0.320,  0.000 },

        -- [9] Empennage & tail cone fire (XSparKeelIn / Base of vertical fin & rudder)
        [9]  = { -5.850,  0.450,  0.000 },

        -- [10] Mid-aft fuselage belly fire (Aft of rear gunner station / radio compartment)
        [10] = { -2.850, -0.150,  0.000 },

        -- [11] Ventral oil radiator bath & lower firewall fire (XEng0OilRadiator0)
        [11] = {  0.950, -0.450,  0.000 },
    }, -- end of fires_pos
	
	
	-- Countermeasures
	SingleChargeTotal	 	= 0,
	CMDS_Incrementation 	= 0,
	ChaffDefault 			= 0, 
	ChaffChargeSize 		= 0,
	FlareDefault 			= 0, 
	FlareChargeSize 		= 0,
	CMDS_Edit 				= false,

	--sensors
	
	--sensors
	detection_range_max		 = 0,
	radar_can_see_ground 	 = false, -- this should be examined (what is this exactly?)
	CanopyGeometry 			 = makeAirplaneCanopyGeometry(LOOK_GOOD, LOOK_GOOD, LOOK_GOOD),
	Sensors = {		
   	},
	HumanRadio = {
		frequency = 127.5,  -- Radio Freq
		editable = true,
		minFrequency = 100.000,
		maxFrequency = 156.000,
		modulation = MODULATION_AM
	},
	
	
	-- ============================================================================================================
-- 3. GUNS & DEFENSIVE TURRET CONFIGURATION
-- ============================================================================================================
    Guns = {
        -- ---------------------------------------------------------------------
        -- 1. Pilot Fixed Cowl Gun (Port / Izquierda) - .50 cal Browning M2
        -- ---------------------------------------------------------------------
        USN_Browning50_127mm({
            name                 = "SBD_Cowl_50cal_L",
            muzzle_pos_connector = "gunpoint_1", -- Conector morro izquierdo
            effect_arg_number    = 436,
            count                = 360,
        }),

        -- ---------------------------------------------------------------------
        -- 2. Pilot Fixed Cowl Gun (Starboard / Derecha) - .50 cal Browning M2
        -- ---------------------------------------------------------------------
        USN_Browning50_127mm({
            name                 = "SBD_Cowl_50cal_R",
            muzzle_pos_connector = "gunpoint_2", -- Conector morro derecho
            effect_arg_number    = 437,
            count                = 360,
        }),

		-- =====================================================================
        -- REAR GUNNER TWIN MOUNT (Browning .30 AN/M2 Twin Mount)
        -- Dos cañones independientes para efectos 3D, pero enlazados a la misma torreta
        -- =====================================================================
        -- left barrel
        USN_TwinBrowning30_762mm({
            name                 = "SBD_Rear_30cal_L",
            muzzle_pos_connector = "gunpoint_3",
            effect_arg_number    = 350,
            count                = 1000,
            turret               = {
                name                   = "RearTwinTurret",
                H_Arg                  = 430,
                V_Arg                  = 431,
                H_Min                  = -85.0,
                H_Max                  =  85.0,
                V_Min                  = -15.0,
                V_Max                  =  70.0,
                H_Vel                  =  65.0,
                V_Vel                  =  55.0,
                SecondGun              = 4,   -- Guns[4] = right barrel, slaved to this turret (ED B-17G scheme)
                crewMemberInCommandIdx = 2,
            },
        }),

        -- Right barrel (slave: only the turret name, like ED's second barrels)
        USN_TwinBrowning30_762mm({
            name                 = "SBD_Rear_30cal_R",
            muzzle_pos_connector = "gunpoint_4",
            effect_arg_number    = 351,
            count                = 1000,
            turret               = {
                name                   = "RearTwinTurret",
            },
        }),
	}, -- end of Guns
	--------------------------------------------------------------------------
		
	Pylons = {
		pylon(1, 0, 0.000, -0.100, 0.000, {use_full_connector_position = false, connector = "pylon_1", arg = 308},
		{
			-- Historical SBD-5 wing racks: one 100 lb bomb each (HVAR and the GB-4 glide bomb were never SBD stores)
			{ CLSID = "PTO_US_ANM30_100LB", arg = 308, arg_value = 0.5 },
		}),
		pylon(2, 0, 0.000, -0.100, 0.000, {use_full_connector_position = false, connector = "pylon_2", arg = 311},
		{
			{ CLSID = "PTO_US_ANM30_100LB", arg = 308, arg_value = 0.5 },
		}),
		pylon(3, 0, 0.000, 0.000, 2.10, {use_full_connector_position = false, connector = "pylon_3", arg = 312},
		{
			-- Centerline displacing crutch: 1,000 lb or 500 lb bomb
			{ CLSID = "PTO_US_ANM65_1000LB", arg = 308, arg_value = 0.5 },
			{ CLSID = "PTO_US_ANM64_500LB",  arg = 308, arg_value = 0.5 },
		}),
    },
	
	
	
	------------------------------------------------------------------
	
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
        Cy0         = 0.1786, -- Zero-AoA 3D Wing Lift Coefficient (Rigorous Formulation)
        Mzalfa      = 5.9000, -- Pitch moment stability derivative (positive in DCS)
        Mzalfadt    = 1.3865, -- Pitch rate damping factor (positive in DCS)
        kjx         = 2.2276, -- Roll inertia factor
        kjz         = 0.0015, -- Yaw directional stability factor
        Czbe        = -0.0131, -- Directional weathercock side force derivative

        -- Drag & high-lift coefficients
        cx_gear     = 0.0146, -- Landing gear parasite drag increment
        cx_flap     = 0.0491, -- Landing flaps parasite drag increment
        cy_flap     = 0.3477, -- Landing flaps maximum lift increment
        cx_brk      = 0.0700, -- Airbrake / dive flap parasite drag increment

        table_data = {
            --      M     Cx0      Cya      B       B4     Omxmax  Aldop  Cymax
            [1]  = {0.00, 0.03201, 0.068, 0.08709, 0.30468, 0.037, 11.69, 0.990}, -- Static / Taxi
            [2]  = {0.08, 0.03201, 0.068, 0.08765, 0.21328, 0.259, 14.29, 1.162}, --Clean Stall Speed (Vs) / Deep Dogfight
            [3]  = {0.15, 0.03125, 0.069, 0.08909, 0.18281, 0.555, 15.88, 1.267}, -- Zoom Climb Threshold / Final Approach
            [4]  = {0.24, 0.03038, 0.070, 0.09241, 0.10664, 0.814, 16.40, 1.320}, -- Corner Speed / Optimal Sustained Turn
            [5]  = {0.34, 0.02959, 0.073, 0.09847, 0.07922, 0.925, 16.30, 1.294}, -- High Energy Combat / Peak Roll Rate
            [6]  = {0.44, 0.02910, 0.076, 0.10800, 0.06094, 0.666, 14.12, 1.122}, -- Max Level Speed (Vmax) / Fast Cruise
            [7]  = {0.55, 0.02910, 0.078, 0.12486, 0.12187, 0.375, 10.36, 0.858}, -- Dive Entry (Vne) / Heavy Control Stiffening
            [8]  = {0.65, 0.02947, 0.072, 0.15080, 0.30468, 0.208, 8.12, 0.634}, -- Wave Drag Onset (M_CR) / Roll Lockout
            [9]  = {0.75, 0.04413, 0.056, 0.19906, 1.21873, 0.111, 6.90, 0.422}, -- Transonic Drag Divergence (M_DD)
            [10] = {0.85, 0.12860, 0.038, 0.31384, 4.87490, 0.042, 5.70, 0.238}, -- Terminal Structural Shock / Safety Limit
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
        Displ                 = 42.60, -- [L] Engine displacement in liters
        Stroke                = 0.160, -- [m] Piston stroke in meters
        V_pist_0              = 13.87, -- [m/s] Mean linear piston velocity at nominal METO RPM
        k_Eps                 = 6.90, -- Geometric cylinder compression ratio
        k_gearbox             = 1.78, -- Engine/propeller gearbox reduction ratio

        -- Supercharger & Intake Manifold Pressure Regulation
        hMaxEng               = 4.8, -- [km] Critical full-throttle altitude
        k_boost               = 1.55, -- Supercharger boost stage multiplier
        k_cfug                = 0.0015, -- Centrifugal compressor pressure rise factor
        k_vel                 = 0.014, -- Intake ram air recovery factor
        k_adiab_1             = 0.0379, -- Supercharger Stage 1 charge heating coefficient
        k_adiab_2             = 0.0562, -- Supercharger Stage 2 charge heating coefficient
        k_after_cool          = 0.350, -- Engine intercooling booster efficiency
        MAX_Manifold_P_1      = 135000, -- [Pa] Max continuous/METO manifold pressure
        MAX_Manifold_P_2      = 169319, -- [Pa] Military dry takeoff manifold pressure
        MAX_Manifold_P_3      = 169319, -- [Pa] WEP wet emergency manifold pressure

        -- Deactivation of Linear Power Derivatives (Dynamic Simulation Enforcement)
        dpdh_m                = 1800, -- [Pa/m] 
        dpdh_f                = 1800, -- [Pa/m] 
        cemax                 = 0.37, -- [kg/s] Fuel consumption parameter
        cefor                 = 0.37, -- [kg/s] WEP fuel consumption parameter

        -- Thrust Table (Mach vs Available Thrust Pmax/Pfor in Newtons)
        table_data = {
            --      M     Pmax (N)   
            [1]  = {0.00, 15565.9}, -- Static Takeoff Thrust
            [2]  = {0.08, 14801.6}, -- Takeoff Roll
            [3]  = {0.15, 14009.3}, -- Climb Accel
            [4]  = {0.24, 13044.2}, -- Combat Climb
            [5]  = {0.34, 12063.6}, -- Fast Cruise
            [6]  = {0.44, 11098.5}, -- Near Vne
            [7]  = {0.55, 10242.4}, -- High Speed Dive
            [8]  = {0.65, 9666.4}, -- Dive Compressibility
            [9]  = {0.75, 9292.8}, -- Transonic Buffeting
            [10] = {0.85, 7362.7}, -- Propeller Windmilling Limit
        }, -- end of engine table_data

        -- Cooling, Friction & Governor Dynamics
        dcx_eng               = 0.024, -- Engine cooling and momentum intake drag
        Nu_0                  = 1.20, -- Propeller static thrust coefficient at V=0
        Nu_1                  = 0.87, -- Propeller advance ratio (J) decay coefficient
        Nu_2                  = 0.0011, -- Helical tip Mach shock loss coefficient
        N_indic_0             = 1350000, -- [W] Indicated thermodynamic power
        N_fr_0                = 0.040, -- Static mechanical friction mean effective pressure
        N_fr_1                = 0.001, -- Viscous friction decay with piston speed
        P_oil                 = 495438, -- [Pa] Engine oil operating pressure
        k_oil                 = 0.00004, -- Oil viscosity shearing resistance
        k_piston              = 3000, -- IMEP piston velocity scaler
        k_reg                 = 0.0050, -- Constant-speed governor tracking gain
        prop_direction        = 1, -- Propeller rotation direction from Engine_Database
        Init_Mom              = 220, -- [N*m] Starter cranking torque
        D_prop                = 3.81, -- [m] Propeller disc tip-to-tip diameter
        MOI_prop              = 46.0, -- [kg*m^2] Propeller polar mass moment of inertia
        prop_pitch_min        = 22.0, -- [deg] Fine pitch limit for takeoff
        prop_pitch_max        = 60.0, -- [deg] Coarse pitch limit for dive/cruise
        prop_pitch_feather    = 85.0, -- [deg] Feathered streamlined pitch angle
        prop_blades_count     = 3, -- Propeller blade count

    }, -- end of engine
}, -- end of SFM_Data

	-- ============================================================================================================
    -- DOUGLAS SBD DAUNTLESS (SBD-3 / SBD-5) - CANONICAL DAMAGE MODEL (35 SHELLS + 33 INNARDS)
    -- Fully unified with canonical DCS World conventions (args = {-1} on all cells)
    -- ============================================================================================================

    Damage = verbose_to_dmg_properties({
        -- =====================================================================
        -- 1. NOSE, ENGINE & PROPELLER
        -- =====================================================================
        ["NOSE_BOTTOM"] = {
            critical_damage = 3.5,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.8, skin = "Aluminum", thickness = 0.0012, spar = "Truss"},
            children = {"ENGINE"},
            radiator = {critical_damage = 1.6, volume = 0.30},
            innards = {
                { id = "XEng0OilRadiator0", skin = "Steel", wall = 0.003 },
            },
        },
        ["NOSE_LEFT_SIDE"] = {
            critical_damage = 3.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0010},
            innards = {
                { id = "XGun-100",     skin = "Steel",    wall = 0.008 },
                { id = "XAmmoBox-100", skin = "Aluminum", wall = 0.002 },
            },
        },
        ["NOSE_RIGHT_SIDE"] = {
            critical_damage = 3.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0010},
            innards = {
                { id = "XGun-101",     skin = "Steel",    wall = 0.008 },
                { id = "XAmmoBox-101", skin = "Aluminum", wall = 0.002 },
            },
        },
        ["ENGINE"] = {
            critical_damage = 8.5,
            args = {-1},
            damage_boundary = 0.10,
            droppable = false,
            refractory = false,
            construction = {durability = 4.0, skin = "Steel", thickness = 0.008, spar = "Rod"},
            children = {"ROTOR"},
            failures = {
                { "ENG0_OIL_RADIATOR_0_PIERCED", 0.60 },
                { "ENG0_OIL_HOSE_0_LEAK",        0.40 },
                { "ENG0_JAMMED",                 0.15 },
            },
            innards = {
                { id = "XEng0Case",         skin = "CastIron", wall = 0.025 },
                { id = "XEng0OilTank0",     skin = "Aluminum", wall = 0.004 },
                { id = "XEng0Supercharger", skin = "Steel",    wall = 0.006 },
            },
        },
        ["ROTOR"] = {
            critical_damage = 2.5,
            args = {-1},
            droppable = false,
            construction = {durability = 1.8, skin = "Steel", thickness = 0.0040, spar = "Rod"},
        },

        -- =====================================================================
        -- 2. COCKPIT, CABIN & FUSELAGE STATIONS
        -- =====================================================================
        ["COCKPIT"] = {
            critical_damage = 4.5,
            args = {-1},
            damage_boundary = 0.25,
            droppable = false,
            construction = {durability = 2.4, skin = "Glass", thickness = 0.0035, spar = "Truss"},
            innards = {
                { id = "XCrew0" },
                { id = "XCrew0H" },
                { id = "XCtrlCrew0Stick", skin = "Steel", wall = 0.025 },
                { id = "XArmor00",        skin = "Steel", wall = 0.0127 },
                { id = "XArmor01",        skin = "Glass", wall = 0.0380 },
            },
        },
        ["FUSELAGE_LEFT_SIDE"] = {
            critical_damage = 7.5,
            args = {-1},
            damage_boundary = 0.22,
            droppable = false,
            construction = {durability = 3.2, skin = "Aluminum", thickness = 0.0014, spar = "Truss"},
            children = {"NOSE_LEFT_SIDE", "COCKPIT", "TAIL_LEFT_SIDE"},
            innards = {
                { id = "XArmor03",          skin = "Steel", wall = 0.008 },
                { id = "XCrew1" },
                { id = "XCrew1H" },
                { id = "XArmor02",          skin = "Steel", wall = 0.008 },
                { id = "XGun-102",          skin = "Steel", wall = 0.008 },
                { id = "XAmmoBox-102",      skin = "Aluminum", wall = 0.002 },
                { id = "XCtrlLineElevator", skin = "Steel", wall = 0.002, plenum = 0.001 },
                { id = "XCtrlLineRudder",   skin = "Steel", wall = 0.002, plenum = 0.001 },
            },
        },
        ["FUSELAGE_RIGHT_SIDE"] = {
            critical_damage = 7.5,
            args = {-1},
            damage_boundary = 0.22,
            droppable = false,
            construction = {durability = 3.2, skin = "Aluminum", thickness = 0.0014, spar = "Truss"},
            children = {"NOSE_RIGHT_SIDE", "TAIL_RIGHT_SIDE"},
        },
        ["FUSELAGE_BOTTOM"] = {
            critical_damage = 9.0,
            args = {-1},
            damage_boundary = 0.25,
            droppable = false,
            construction = {durability = 3.6, skin = "Aluminum", thickness = 0.0016, spar = "Truss"},
            children = {"NOSE_BOTTOM", "FUSELAGE_LEFT_SIDE", "FUSELAGE_RIGHT_SIDE", "WING_L_IN", "WING_R_IN"},
            fuel_tank = {critical_damage = 3.0, volume = 568.0, integrity_loss_rate = 0.35},
            failures = {
                { "FUEL_TANK_00_MINOR_LEAK",  0.30 },
                { "FUEL_TANK_00_MEDIUM_LEAK", 0.20 },
                { "FUEL_TANK_00_MAJOR_LEAK",  0.10 },
                { "FUEL_TANK_00_FIRE",        0.15 },
                { "FUEL_TANK_00_EXPLODED",    0.03 },
            },
            innards = {
                { id = "XFuelTank0", skin = "Rubber", wall = 0.036, lining = "FoamFilledRubber", plenum = 0.65 },
            },
        },

        -- =====================================================================
        -- 3. PORT (LEFT) WING & CONTROL SURFACES
        -- =====================================================================
        ["WING_L_IN"] = {
            critical_damage = 8.5,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 3.8, skin = "Aluminum", thickness = 0.0015, spar = "FlangeBeam"},
            children = {"WING_L_CENTER", "FLAP_L", "WHEEL_L"},
            fuel_tank = {critical_damage = 2.5, volume = 378.0, integrity_loss_rate = 0.35},
            failures = {
                { "FUEL_TANK_01_MINOR_LEAK",  0.30 },
                { "FUEL_TANK_01_MEDIUM_LEAK", 0.20 },
                { "FUEL_TANK_01_MAJOR_LEAK",  0.10 },
                { "FUEL_TANK_01_FIRE",        0.15 },
                { "FUEL_TANK_01_EXPLODED",    0.03 },
            },
            innards = {
                { count = 2, durability = 1.35, id = "XSparWLHIn", plenum = 0.25, skin = "Aluminum", wall = 0.012 },
                { id = "XFuelTank1", skin = "Rubber", wall = 0.036, lining = "FoamFilledRubber", plenum = 0.70 },
            },
        },
        ["WING_L_CENTER"] = {
            critical_damage = 7.0,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 3.2, skin = "Aluminum", thickness = 0.0013, spar = "FlangeBeam"},
            children = {"WING_L_OUT"},
            innards = {
                { count = 2, durability = 1.15, id = "XSparWLHMid", plenum = 0.20, skin = "Aluminum", wall = 0.010 },
            },
        },
        ["WING_L_OUT"] = {
            critical_damage = 5.0,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 2.4, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
            children = {"AILERON_L"},
            innards = {
                { count = 2, durability = 0.90, id = "XSparWLHOut", plenum = 0.18, skin = "Aluminum", wall = 0.008 },
            },
        },
        ["AILERON_L"] = {
            critical_damage = 1.8,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.9, skin = "Fabric", thickness = 0.0006, spar = "Truss"},
        },
        ["FLAP_L"] = {
            critical_damage = 3.2,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 2.0, skin = "Aluminum", thickness = 0.0018},
        },

        -- =====================================================================
        -- 4. STARBOARD (RIGHT) WING & CONTROL SURFACES
        -- =====================================================================
        ["WING_R_IN"] = {
            critical_damage = 8.5,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 3.8, skin = "Aluminum", thickness = 0.0015, spar = "FlangeBeam"},
            children = {"WING_R_CENTER", "FLAP_R", "WHEEL_R"},
            fuel_tank = {critical_damage = 2.5, volume = 378.0, integrity_loss_rate = 0.35},
            failures = {
                { "FUEL_TANK_02_MINOR_LEAK",  0.30 },
                { "FUEL_TANK_02_MEDIUM_LEAK", 0.20 },
                { "FUEL_TANK_02_MAJOR_LEAK",  0.10 },
                { "FUEL_TANK_02_FIRE",        0.15 },
                { "FUEL_TANK_02_EXPLODED",    0.03 },
            },
            innards = {
                { count = 2, durability = 1.35, id = "XSparWRHIn", plenum = 0.25, skin = "Aluminum", wall = 0.012 },
                { id = "XFuelTank2", skin = "Rubber", wall = 0.036, lining = "FoamFilledRubber", plenum = 0.70 },
            },
        },
        ["WING_R_CENTER"] = {
            critical_damage = 7.0,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 3.2, skin = "Aluminum", thickness = 0.0013, spar = "FlangeBeam"},
            children = {"WING_R_OUT"},
            innards = {
                { count = 2, durability = 1.15, id = "XSparWRHMid", plenum = 0.20, skin = "Aluminum", wall = 0.010 },
            },
        },
        ["WING_R_OUT"] = {
            critical_damage = 5.0,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 2.4, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
            children = {"AILERON_R"},
            innards = {
                { count = 2, durability = 0.90, id = "XSparWRHOut", plenum = 0.18, skin = "Aluminum", wall = 0.008 },
            },
        },
        ["AILERON_R"] = {
            critical_damage = 1.8,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.9, skin = "Fabric", thickness = 0.0006, spar = "Truss"},
        },
        ["FLAP_R"] = {
            critical_damage = 3.2,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 2.0, skin = "Aluminum", thickness = 0.0018},
        },

        -- =====================================================================
        -- 5. TAIL CONE, EMPENNAGE & HOOK
        -- =====================================================================
        ["TAIL_LEFT_SIDE"] = {
            critical_damage = 5.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.2, skin = "Aluminum", thickness = 0.0010},
            children = {"TAIL"},
        },
        ["TAIL_RIGHT_SIDE"] = {
            critical_damage = 5.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.2, skin = "Aluminum", thickness = 0.0010},
        },
        ["TAIL"] = {
            critical_damage = 6.5,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.6, skin = "Aluminum", thickness = 0.0012, spar = "Truss"},
            children = {"FIN_L_BOTTOM", "STABILIZER_L_IN", "STABILIZER_R_IN", "HOOK", "WHEEL_REAR"},
        },
        ["FIN_L_BOTTOM"] = {
            critical_damage = 4.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.0, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
            children = {"FIN_L_TOP"},
            innards = {
                { id = "XSparKeelIn", plenum = 0.22, skin = "Aluminum", wall = 0.006 },
            },
        },
        ["FIN_L_TOP"] = {
            critical_damage = 2.8,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"RUDDER"},
        },
        ["RUDDER"] = {
            critical_damage = 1.8,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.8, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },
        ["HOOK"] = {
            critical_damage = 2.0,
            args = {-1},
            droppable = false,
            construction = {durability = 2.2, skin = "Steel", thickness = 0.0060},
        },
        ["STABILIZER_L_IN"] = {
            critical_damage = 3.6,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.8, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
            children = {"STABILIZER_L_OUT", "ELEVATOR_L"},
            innards = {
                { id = "XSparStabLHIn", skin = "Aluminum", wall = 0.005 },
            },
        },
        ["STABILIZER_L_OUT"] = {
            critical_damage = 2.6,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.4, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
        },
        ["ELEVATOR_L"] = {
            critical_damage = 1.8,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.8, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },
        ["STABILIZER_R_IN"] = {
            critical_damage = 3.6,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.8, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
            children = {"STABILIZER_R_OUT", "ELEVATOR_R"},
            innards = {
                { id = "XSparStabRHIn", skin = "Aluminum", wall = 0.005 },
            },
        },
        ["STABILIZER_R_OUT"] = {
            critical_damage = 2.6,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.4, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
        },
        ["ELEVATOR_R"] = {
            critical_damage = 1.8,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.8, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },

        -- =====================================================================
        -- 6. UNDERCARRIAGE
        -- =====================================================================
        ["WHEEL_L"] = {
            critical_damage = 3.5,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 2.2, skin = "Steel", thickness = 0.0050, spar = "Rod"},
        },
        ["WHEEL_R"] = {
            critical_damage = 3.5,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 2.2, skin = "Steel", thickness = 0.0050, spar = "Rod"},
        },
        ["WHEEL_REAR"] = {
            critical_damage = 2.2,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 1.6, skin = "Steel", thickness = 0.0030, spar = "Rod"},
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
	
Countries = {"USA"},
}

add_aircraft(douglas_dauntless)
