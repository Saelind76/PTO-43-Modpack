-- ============================================================================================================
-- DCS WORLD COMPLETE AIRCRAFT DEFINITION & SFM SPECIFICATION (Master Suite v2.45)
-- GENERATED FOR: P-39N Airacobra
-- THEATER & PROVENANCE: Pacific Theater (PTO) | United States (USAAF) (1943)
-- INSTALLED ENGINE POWERTRAIN: Allison V-1710-85
-- ARCHITECTURE: Canonical SFM Standard
-- ============================================================================================================


local _ = _ or function(s) return s end
_G.PTO_Weapons_Declared = _G.PTO_Weapons_Declared or {}
local function safe_declare_weapon(tbl)
    if not tbl or not tbl.name then return end
    if _G.PTO_Weapons_Declared[tbl.name] then return tbl end
    if declare_weapon then declare_weapon(tbl) end
    _G.PTO_Weapons_Declared[tbl.name] = true
    return tbl
end

-- -----------------------------------------------------------------------------
-- WEAPON DEFINITIONS (USAAF Pacific Theater Standard)
-- -----------------------------------------------------------------------------

-- Oldsmobile M4 37mm Cannon Shells
safe_declare_weapon({
    category       = CAT_SHELLS,
    name           = "M54_37mm_HE",
    user_name      = _("37mm HE-T M54"),
    model_name     = "tracer_bullet_red",
    mass           = 0.608,
    round_mass     = 1.150,
    cartridge_mass = 0.542,
    explosive      = 0.045,
    v0             = 610.0,
    Dv0            = 0.0080,
    Da0            = 0.0006,
    Da1            = 0.0,
    life_time      = 8.0,
    caliber        = 37,
    s              = 0.0,
    j              = 0.0,
    l              = 0.0,
    charTime       = 0,
    cx             = {1.3, 0.93, 0.55, 0.36, 1.8},
    k1             = 2.1e-08,
    tracer_off     = 3.5,
    tracer_on      = 0.01,
    smoke_tail_life_time = 0.5,
    scale_tracer   = 1.5,
    cartridge      = 0,
    scale_smoke    = 0.8,
    smoke_opacity  = 0.8,
})

safe_declare_weapon({
    category       = CAT_SHELLS,
    name           = "M80_37mm_AP",
    user_name      = _("37mm AP M80"),
    model_name     = "tracer_bullet_yellow",
    mass           = 0.753,
    round_mass     = 1.300,
    cartridge_mass = 0.547,
    explosive      = 0.000,
    v0             = 556.0,
    Dv0            = 0.0080,
    Da0            = 0.0006,
    Da1            = 0.0,
    life_time      = 8.0,
    caliber        = 37,
    s              = 0.0,
    j              = 0.0,
    l              = 0.0,
    charTime       = 0,
    cx             = {1.3, 0.93, 0.55, 0.36, 1.8},
    k1             = 2.1e-08,
    tracer_off     = -1,
    tracer_on      = 0.01,
    smoke_tail_life_time = 0,
    scale_tracer   = 1.5,
    cartridge      = 0,
    scale_smoke    = 0.8,
    smoke_opacity  = 0.8,
})

-- 1. Centerline 37mm M4 Hub Cannon
local function Oldsmobile_M4_37(tbl)
    tbl.category = CAT_GUN_MOUNT
    tbl.name     = tbl.name or "PTO_P39_Oldsmobile_M4_37"
    tbl.supply   = {
        shells = {"M54_37mm_HE", "M80_37mm_AP"},
        mixes  = {{1, 1, 2}}, -- 2x HE to 1x AP
        count  = 30,          -- Historical magazine capacity
    }
    tbl.gun = {
        max_burst_length = 30,
        rates            = {150}, -- ~150 RPM slow cyclic rate
        recoil_coeff     = 1.4,
        barrels_count    = 1,
    }
    tbl.ejector_pos             = tbl.ejector_pos or {0.0, -0.3, 0.0}
    tbl.ejector_dir             = tbl.ejector_dir or {0, -1, 0}
    tbl.supply_position         = tbl.supply_position or {0.604, 0.071, 0.1}
    tbl.aft_gun_mount           = false
    tbl.effective_fire_distance = 1200
    tbl.muzzle_pos              = tbl.muzzle_pos or {0.604, -0.071, 0.0}
    tbl.azimuth_initial         = 0
    tbl.elevation_initial       = 0

    return declare_weapon(tbl)
end

-- 2. Nose Synchronized Browning M2 .50 cal
local function Browning_M2_Nose(tbl)
    tbl.category = CAT_GUN_MOUNT
    tbl.name     = tbl.name or "PTO_P39_Browning_M2_Nose"
    tbl.supply   = {
        shells = {"50Browning_AP_M2", "50Browning_API_M8", "50Browning_T_M1"},
        mixes  = {{1, 2, 1, 3}},
        count  = 200, -- Synchronized cowl ammunition load
    }
    tbl.gun = {
        max_burst_length = 60,
        rates            = {650}, -- Synchronizer throttles cyclic rate
        recoil_coeff     = 0.75,
        barrels_count    = 1,
    }
    tbl.ejector_pos             = tbl.ejector_pos or {0.0, -0.2, 0.0}
    tbl.ejector_dir             = tbl.ejector_dir or {0, -1, 0}
    tbl.supply_position         = tbl.supply_position or {0, 0, 0}
    tbl.aft_gun_mount           = false
    tbl.effective_fire_distance = 800
    tbl.muzzle_pos              = tbl.muzzle_pos or {0, 0, 0}
    tbl.azimuth_initial         = tbl.azimuth_initial or 0
    tbl.elevation_initial       = tbl.elevation_initial or 0

    return declare_weapon(tbl)
end

-- 3. Wing-Mounted AN/M2 .30-06 cal Paired Machine Guns (P-39N 4x .30 cal = 2x paired mounts)
safe_declare_weapon({
    category       = CAT_SHELLS,
    name           = "M2_30_06_AP",
    user_name      = _(".30-06 AP M2"),
    model_name     = "tracer_bullet_red",
    mass           = 0.0108,
    round_mass     = 0.025,
    cartridge_mass = 0.014,
    explosive      = 0.0,
    v0             = 853.0,
    Dv0            = 0.0080,
    Da0            = 0.0007,
    Da1            = 0.0,
    life_time      = 5.0,
    caliber        = 7.62,
    s              = 0.0,
    j              = 0.0,
    l              = 0.0,
    charTime       = 0,
    cx             = {0.7, 0.70, 0.25, 0.236, 2.31},
    k1             = 7.0e-09,
    tracer_off     = -1,
    tracer_on      = 0.0,
    smoke_tail_life_time = 0,
    scale_tracer   = 0,
    cartridge      = 0,
})

safe_declare_weapon({
    category       = CAT_SHELLS,
    name           = "M1_30_06_T",
    user_name      = _(".30-06 Tracer M1"),
    model_name     = "tracer_bullet_red",
    mass           = 0.0098,
    round_mass     = 0.024,
    cartridge_mass = 0.014,
    explosive      = 0.0,
    v0             = 840.0,
    Dv0            = 0.0080,
    Da0            = 0.0007,
    Da1            = 0.0,
    life_time      = 5.0,
    caliber        = 7.62,
    s              = 0.0,
    j              = 0.0,
    l              = 0.0,
    charTime       = 0,
    cx             = {0.7, 0.70, 0.25, 0.236, 2.31},
    k1             = 7.0e-09,
    tracer_off     = 3.5,
    tracer_on      = 0.01,
    smoke_tail_life_time = 0.2,
    scale_tracer   = 0.9,
    cartridge      = 0,
})

local function Browning_30_Wing(tbl)
    tbl.category = CAT_GUN_MOUNT
    tbl.name     = tbl.name or "PTO_P39_Browning_30_Wing"
    tbl.supply   = {
        shells = {"M2_30_06_AP", "M1_30_06_T"},
        mixes  = {{1, 1, 1, 2}},
        count  = tbl.count or 2000, -- 2x 1000 rds per wing (P-39N 4x .30 cal)
    }
    tbl.gun = {
        max_burst_length = 200,
        rates            = {2400}, -- 2x 1200 RPM free-firing AN/M2 .30 cal pair
        recoil_coeff     = 0.45,
        barrels_count    = 2,
    }
    tbl.ejector_pos             = tbl.ejector_pos or {0.0, -0.2, 0.0}
    tbl.ejector_dir             = tbl.ejector_dir or {0, -1, 0}
    tbl.supply_position         = tbl.supply_position or {0, 0, 0}
    tbl.aft_gun_mount           = false
    tbl.effective_fire_distance = 650
    tbl.muzzle_pos              = tbl.muzzle_pos or {0, 0, 0}
    tbl.azimuth_initial         = tbl.azimuth_initial or 0
    tbl.elevation_initial       = tbl.elevation_initial or 0

    return declare_weapon(tbl)
end

-- -----------------------------------------------------------------------------
-- MAIN AIRCRAFT TABLE DEFINITION
-- -----------------------------------------------------------------------------
P39_AirCobra = {
    Name        = 'P39',
    DisplayName = _('[PTO43] Bell P-39N Airacobra'),
    Picture     = "P39.png",
    Rate        = 40,
    Shape       = "P39",
    XRayShape   = "P39_XRay",
    propellorShapeName  = "p39_blade.FBX",
	propellorShapeType  = "3ARG_PROC_BLUR",
    shape_table_data = {
        {
            file        = 'P39',
            life        = 18,
            vis         = 3,
            desrt       = 'N3D-crush109a',
            fire        = {300, 2},
            username    = 'P39',
            index       = WSTYPE_PLACEHOLDER,
            classname   = "lLandPlane",
            positioning = "BYNORMAL",
            drawonmap   = true,
        },
        {
            name = "N3D-crush109a",
            file = "N3D-crush109a",
            fire = {240, 2},
        },
    },

    mapclasskey = "P0091000025",
    attribute   = {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER, "Fighters"},
    Categories  = {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor"},

    nose_gear_pos                            = {2.642, -2.028, 0.000},
    nose_gear_amortizer_direct_stroke        = 0.0,
    nose_gear_amortizer_reversal_stroke      = -0.14,
    nose_gear_amortizer_normal_weight_stroke = -0.05,
    nose_gear_wheel_diameter                 = 0.478,

    main_gear_pos                            = {-0.350, -1.976, 1.735},
    main_gear_amortizer_direct_stroke        = 0.0,
    main_gear_amortizer_reversal_stroke      = -0.16,
    main_gear_amortizer_normal_weight_stroke = -0.06,
    main_gear_wheel_diameter                 = 0.667,

-- ------------------------------------------------------------------------------------------------------------
-- 1. PRIMARY GENERAL & AI PARAMETERS (DCS Core Aircraft Attributes)
-- ------------------------------------------------------------------------------------------------------------
M_empty                 = 2560, -- [kg] Operational empty weight
M_nominal               = 3450, -- [kg] Standard combat flight weight
M_max                   = 3765, -- [kg] Maximum permissible takeoff weight (MTOW)
M_fuel_max              = 380, -- [kg] Full internal fuel capacity mass
wing_area               = 19.80, -- [m^2] Reference wing gross planform area
wing_span               = 10.36, -- [m] Tip-to-tip wingspan
wing_type               = 0, -- [enum] 0 = Straight / Trapezoidal wing   ***************************check**********************************
length                  = 9.20, -- [m] Overall fuselage length
height                  = 3.50, -- [m] Ground parked height

-- Flight Test & AI Operational Airspeeds (TAS / CAS)
V_max_sea_level         = 141.7, -- [m/s] Maximum level speed at sea level (TAS)
V_max_h                 = 172.2, -- [m/s] Maximum level speed at critical supercharger altitude (TAS)
V_max_altitude          = 172.2, -- [m/s] Backward compatibility alias for V_max_h
V_opt                   = 92.1, -- [m/s] Optimal cruise speed (1.30 * V_stall_clean)
V_take_off              = 57.3, -- [m/s] Takeoff rotation airspeed
V_land                  = 62.1, -- [m/s] Landing approach airspeed
Vy_max                  = 19.1, -- [m/s] Initial sea-level rate of climb
H_max                   = 10670, -- [m] Service ceiling
Mach_max                = 0.71, -- Maximum permissible dive Mach limit

-- Static Thrust Ratings for AI & Catapult Calculation (Froude Momentum T0 in kgf)
thrust_sum_max          = 1114, -- [kgf] Maximum military static thrust for AI & catapult calculation
thrust_sum_ab           = 1114, -- [kgf] Identical to thrust_sum_max (no afterburner)

CAS_min                 = 42.4, -- [m/s] Minimum safe calibrated airspeed
Ny_min                  = -3.5, -- Minimum allowable G factor
Ny_max                  = 7.0, -- Maximum structural G limit for AI
wing_root_chord         = 2.35, -- [m] Theoretical centerline/root chord
wing_tip_chord          = 1.25, -- [m] Tip chord
wing_sweep              = 3.2, -- [deg] Quarter-chord sweep angle
tand_gear_max           = 0.577, -- Gear suspension deflection parameter

 
    average_fuel_consumption = 0.038,
    has_afteburner           = false,
    has_speedbrake           = false,
    has_differential_stabilizer = false,
    radar_can_see_ground     = false,
    AOA_take_off             = 0.14,
    stores_number            = 11,
    bank_angle_max           = 65,
    tanker_type              = 0,
    flaps_maneuver           = 0.3,
    range                    = 1050,
    RCS                      = 2.5,
    Ny_max_e                 = 8.0,
    detection_range_max      = 0,
    IR_emission_coeff        = 0.1,
    IR_emission_coeff_ab     = 0,
    engines_count            = 1,

    engines_nozzles = {
        [1] = {
            pos                 = {-0.60, 0.07, 0.0},
            elevation           = 0,
            diameter            = 0.2,
            exhaust_length_ab   = 0.0,
            exhaust_length_ab_K = 0.0,
            smokiness_level     = 0.06,
            engine_number       = 1,
        },
    },

    crew_members = {
        [1] = {
            pilot_name          = "pilot_p51",
            ejection_seat_name  = 0,
            drop_canopy_name    = "SpitfireIXc_fonar",
            pos                 = {0.24, 0.45, 0.0},
            canopy_pos          = {0, 0, 0},
        },
    },

    fires_pos = {
        [1]  = {-1.162, -0.215, -0.873},
        [2]  = {-1.205, -0.165,  0.874},
        [3]  = {-0.378,  0.018, -2.708},
        [4]  = {-0.378,  0.018,  2.545},
        [5]  = {-0.378,  0.089, -3.999},
        [6]  = {-0.378,  0.089,  3.956},
        [7]  = { 0.500, -1.300, -1.274},
        [8]  = {-1.000, -1.000,  0.000},
        [9]  = {-3.500, -1.500,  0.000},
        [10] = {-2.500, -1.100,  0.000},
        [11] = {-1.000, -1.200,  0.000},
    },

    LandRWCategories = {
        [1] = { Name = "Runway" },
        [2] = { Name = "GrassRunway" },
    },
    TakeOffRWCategories = {
        [1] = { Name = "Runway" },
        [2] = { Name = "GrassRunway" },
    },

    SingleChargeTotal   = 0,
    CMDS_Incrementation = 0,
    ChaffDefault        = 0, 
    ChaffChargeSize     = 0,
    FlareDefault        = 0, 
    FlareChargeSize     = 0,
    CMDS_Edit           = false,

    detection_range_max = 0,
    radar_can_see_ground= false,
    CanopyGeometry = {
        azimuth   = {-160.0, 160.0},
        elevation = {-50.0, 90.0}
    },
    Sensors = {},
    HumanRadio = {
        frequency    = 127.5,
        editable     = true,
        minFrequency = 100.000,
        maxFrequency = 156.000,
        modulation   = MODULATION_AM
    },

    -- -------------------------------------------------------------------------
    -- HISTORICAL P-39N ARMAMENT (1x 37mm M4 Hub + 2x .50 cal Nose + 4x .30 cal Wing)
    -- Connectors and 3D muzzle positions aligned with Manilov P-39N EDM
    -- -------------------------------------------------------------------------
    Guns = {
        -- Mount 1: 37mm Centerline Hub Cannon (Historical M4, 30 rounds)
        Oldsmobile_M4_37({
            muzzle_pos_connector = "Gun_point_CannonC",
            muzzle_pos           = {3.558, 0.000, 0.000},
            supply_position      = {2.200, 0.000, 0.000},
            count                = 30,
        }),

        -- Mount 2: LH (Port) Nose Synchronized Browning .50 cal
        Browning_M2_Nose({
            muzzle_pos_connector = "Gun_point_CannonL",
            muzzle_pos           = {2.898, 0.200, -0.300},
            effect_arg_number    = 350,
            count                = 200,
            azimuth_initial      = 0.0,
            elevation_initial    = 0.0,
            supply_position      = {2.200, 0.000, -0.240},
            drop_cartridge       = 204,
            ejector_pos_connector = "ejector_CannonL",
            ejector_dir          = {-0.20, -0.6, 0},
            effects = {
                {name = "FireEffect", arg = 350, attenuation = 1.0, light_pos = {0.5, 0.5, 0.0}, light_time = 0.1},
                {name = "SmokeEffect"},
                {name = "PortEffect", seal_arg = 329},
            }
        }),

        -- Mount 3: RH (Starboard) Nose Synchronized Browning .50 cal
        Browning_M2_Nose({
            muzzle_pos_connector = "Gun_point_CannonR",
            muzzle_pos           = {2.898, 0.200, 0.300},
            effect_arg_number    = 432,
            count                = 200,
            azimuth_initial      = 0.0,
            elevation_initial    = 0.0,
            supply_position      = {2.200, 0.000, 0.240},
            drop_cartridge       = 204,
            ejector_pos_connector = "ejector_CannonR",
            ejector_dir          = {-0.20, -0.6, 0},
            effects = {
                {name = "FireEffect", arg = 350, attenuation = 1.0, light_pos = {0.5, 0.5, 0.0}, light_time = 0.1},
                {name = "SmokeEffect"},
                {name = "PortEffect", seal_arg = 330},
            }
        }),

        -- Mount 4: LH (Port) Wing Paired .30 cal AN/M2 (2 guns x 1000 rds)
        Browning_30_Wing({
            muzzle_pos_connector = "Gun_point_MachinegunL1",
            muzzle_pos           = {0.976, -0.464, -2.978},
            effect_arg_number    = 433,
            count                = 2000,
            azimuth_initial      = 0.0,
            elevation_initial    = 0.0,
            supply_position      = {0.200, -0.580, -2.978},
            drop_cartridge       = 204,
            ejector_pos_connector = "ejector_MachinegunL1",
            ejector_dir          = {-1.5, -0.6, 0},
            effects = {
                {name = "FireEffect", arg = 350, attenuation = 1.0, light_pos = {0.5, 0.5, 0.0}, light_time = 0.1},
                {name = "SmokeEffect"},
                {name = "PortEffect", seal_arg = 328},
            }
        }),

        -- Mount 5: RH (Starboard) Wing Paired .30 cal AN/M2 (2 guns x 1000 rds)
        Browning_30_Wing({
            muzzle_pos_connector = "Gun_point_MachinegunR1",
            muzzle_pos           = {0.976, -0.464, 2.978},
            effect_arg_number    = 435,
            count                = 2000,
            azimuth_initial      = 0.0,
            elevation_initial    = 0.0,
            supply_position      = {0.200, -0.580, 2.978},
            drop_cartridge       = 204,
            ejector_pos_connector = "ejector_MachinegunR1",
            ejector_dir          = {-1.5, -0.6, 0},
            effects = {
                {name = "FireEffect", arg = 350, attenuation = 1.0, light_pos = {0.5, 0.5, 0.0}, light_time = 0.1},
                {name = "SmokeEffect"},
                {name = "PortEffect", seal_arg = 327},
            }
        }),
    },

    Pylons = {
        -- Historical P-39N: only the belly station is used (the empty wing stations were removed).
        pylon(1, 0, -0.350, -0.920, 0.000, {use_full_connector_position = true, connector = "Point Pilon", arg = 309, arg_value = 0},
        {
            -- one 500 lb or 250 lb bomb, or the 75 gal drop tank
            { CLSID = "PTO_US_ANM64_500LB" },
            { CLSID = "{AN_M57}" },
            { CLSID = "{DT75GAL}", arg = 309, arg_value = 1.0 },
        }),
    },

    Tasks = {
        aircraft_task(CAP),
        aircraft_task(Escort),
        aircraft_task(FighterSweep),
        aircraft_task(GroundAttack),
        aircraft_task(CAS),
        aircraft_task(AFAC),
        aircraft_task(RunwayAttack),
        aircraft_task(AntishipStrike),
    },	
    DefaultTask = aircraft_task(CAS),
   
-- ------------------------------------------------------------------------------------------------------------
-- 2. STANDARD FLIGHT MODEL (SFM) AERODYNAMICS (SFM_Data.aerodynamics) v2.45
-- ------------------------------------------------------------------------------------------------------------
SFM_Data = {
    aerodynamics = {
        -- Control authority & stability derivatives (DCS convention)
        Cy0         = 0.0883, -- Zero-AoA 3D Wing Lift Coefficient (Rigorous Formulation)
        Mzalfa      = 4.3000, -- Pitch moment stability derivative (positive in DCS)
        Mzalfadt    = 1.0105, -- Pitch rate damping factor (positive in DCS)
        kjx         = 2.2326, -- Roll inertia factor
        kjz         = 0.0014, -- Yaw directional stability factor
        Czbe        = -0.0165, -- Directional weathercock side force derivative

        -- Drag & high-lift coefficients
        cx_gear     = 0.0194, -- Landing gear parasite drag increment
        cx_flap     = 0.0401, -- Landing flaps parasite drag increment
        cy_flap     = 0.3319, -- Landing flaps maximum lift increment
        cx_brk      = 0.0000, -- Airbrake / dive flap parasite drag increment

        table_data = {
            --      M     Cx0      Cya      B       B4     Omxmax  Aldop  Cymax
            [1]  = {0.00, 0.02825, 0.069, 0.08524, 0.41464, 0.068, 11.29, 0.917}, -- Static / Taxi
            [2]  = {0.08, 0.02825, 0.069, 0.08579, 0.29025, 0.477, 13.67, 1.075}, --Clean Stall Speed (Vs) / Deep Dogfight
            [3]  = {0.15, 0.02758, 0.070, 0.08721, 0.24879, 1.022, 15.13, 1.173}, -- Zoom Climb Threshold / Final Approach
            [4]  = {0.24, 0.02681, 0.071, 0.09045, 0.14513, 1.498, 15.83, 1.222}, -- Corner Speed / Optimal Sustained Turn
            [5]  = {0.34, 0.02612, 0.073, 0.09639, 0.10781, 1.703, 15.52, 1.198}, -- High Energy Combat / Peak Roll Rate
            [6]  = {0.44, 0.02568, 0.077, 0.10571, 0.08293, 1.294, 13.52, 1.039}, -- Max Level Speed (Vmax) / Fast Cruise
            [7]  = {0.55, 0.02568, 0.078, 0.12221, 0.16586, 0.834, 10.14, 0.794}, -- Dive Entry (Vne) / Heavy Control Stiffening
            [8]  = {0.65, 0.02577, 0.073, 0.14761, 0.41464, 0.511, 8.01, 0.587}, -- Wave Drag Onset (M_CR) / Roll Lockout
            [9]  = {0.75, 0.03470, 0.056, 0.19484, 1.65858, 0.272, 6.89, 0.391}, -- Transonic Drag Divergence (M_DD)
            [10] = {0.85, 0.09857, 0.038, 0.30718, 6.63430, 0.102, 5.78, 0.220}, -- Terminal Structural Shock / Safety Limit
        }, -- end of table_data
    }, -- end of aerodynamics

    -- --------------------------------------------------------------------------------------------------------
    -- 3. PISTON ENGINE & SUPERCHARGER SPECIFICATION (SFM_Data.engine, typeng = 2)
    -- --------------------------------------------------------------------------------------------------------
    engine = {
        Nominal_RPM           = 3000.0, -- Full Throttle Rated Crankshaft RPM
        Nmg                   = 24.0, -- [%] Idle RPM Percentage
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
        cylinder_firing_order = {1, 6, 5, 2, 3, 4, 6, 1, 2, 5, 4, 3},

        -- Mechanical & Thermodynamic Engine Dimensions
        Displ                 = 28.00, -- [L] Engine displacement in liters
        Stroke                = 0.152, -- [m] Piston stroke in meters
        V_pist_0              = 15.20, -- [m/s] Mean linear piston velocity at nominal METO RPM
        k_Eps                 = 6.65, -- Geometric cylinder compression ratio
        k_gearbox             = 2.00, -- Engine/propeller gearbox reduction ratio

        -- Supercharger & Intake Manifold Pressure Regulation
        hMaxEng               = 4.6, -- [km] Critical full-throttle altitude
        k_boost               = 1.30, -- Supercharger boost stage multiplier
        k_cfug                = 0.0015, -- Centrifugal compressor pressure rise factor
        k_vel                 = 0.014, -- Intake ram air recovery factor
        k_adiab_1             = 0.0379, -- Supercharger Stage 1 charge heating coefficient
        k_adiab_2             = 0.0379, -- Supercharger Stage 2 charge heating coefficient
        k_after_cool          = 0.350, -- Engine intercooling booster efficiency
        MAX_Manifold_P_1      = 135000, -- [Pa] Max continuous/METO manifold pressure
        MAX_Manifold_P_2      = 176000, -- [Pa] Military dry takeoff manifold pressure
        MAX_Manifold_P_3      = 176000, -- [Pa] WEP wet emergency manifold pressure

        -- Deactivation of Linear Power Derivatives (Dynamic Simulation Enforcement)
        dpdh_m                = 1800, -- [Pa/m] 
        dpdh_f                = 1800, -- [Pa/m] 
        cemax                 = 0.37, -- [kg/s] Fuel consumption parameter
        cefor                 = 0.37, -- [kg/s] WEP fuel consumption parameter

        -- Thrust Table (Mach vs Available Thrust Pmax/Pfor in Newtons)
        table_data = {
            --      M     Pmax (N)   
            [1]  = {0.00, 10924.2}, -- Static Takeoff Thrust
            [2]  = {0.08, 10387.8}, -- Takeoff Roll
            [3]  = {0.15, 9831.8}, -- Climb Accel
            [4]  = {0.24, 9154.5}, -- Combat Climb
            [5]  = {0.34, 8466.2}, -- Fast Cruise
            [6]  = {0.44, 7788.9}, -- Near Vne
            [7]  = {0.55, 7188.1}, -- High Speed Dive
            [8]  = {0.65, 6783.9}, -- Dive Compressibility
            [9]  = {0.75, 6521.7}, -- Transonic Buffeting
            [10] = {0.85, 5167.1}, -- Propeller Windmilling Limit
        }, -- end of engine table_data

        -- Cooling, Friction & Governor Dynamics
        dcx_eng               = 0.017, -- Engine cooling and momentum intake drag
        Nu_0                  = 1.20, -- Propeller static thrust coefficient at V=0
        Nu_1                  = 0.88, -- Propeller advance ratio (J) decay coefficient
        Nu_2                  = 0.0009, -- Helical tip Mach shock loss coefficient
        N_indic_0             = 960000, -- [W] Indicated thermodynamic power
        N_fr_0                = 0.040, -- Static mechanical friction mean effective pressure
        N_fr_1                = 0.001, -- Viscous friction decay with piston speed
        P_oil                 = 495438, -- [Pa] Engine oil operating pressure
        k_oil                 = 0.00004, -- Oil viscosity shearing resistance
        k_piston              = 3000, -- IMEP piston velocity scaler
        k_reg                 = 0.0050, -- Constant-speed governor tracking gain
        prop_direction        = 1, -- Propeller rotation direction from Engine_Database
        Init_Mom              = 220, -- [N*m] Starter cranking torque
        D_prop                = 3.15, -- [m] Propeller disc tip-to-tip diameter
        MOI_prop              = 38.0, -- [kg*m^2] Propeller polar mass moment of inertia
        prop_pitch_min        = 22.0, -- [deg] Fine pitch limit for takeoff
        prop_pitch_max        = 56.0, -- [deg] Coarse pitch limit for dive/cruise
        prop_pitch_feather    = 85.0, -- [deg] Feathered streamlined pitch angle
        prop_blades_count     = 3, -- Propeller blade count

    }, -- end of engine
}, -- end of SFM_Data





Damage = verbose_to_dmg_properties({
        -- =====================================================================
        -- 1. NOSE, REDUCTION GEARBOX & FORWARD ARMAMENT BAY (37mm M4 + 2x .50)
        -- =====================================================================
        ["NOSE_CENTER"] = {
            critical_damage = 4.2,
            args = {-1},
            damage_boundary = 0.18,
            droppable = false,
            construction = {durability = 2.1, skin = "Aluminum", thickness = 0.0014, spar = "Truss"},
            children = {"ROTOR"},
            innards = {
                { id = "XGun-100",     skin = "Steel",    wall = 0.014 }, -- 37mm Oldsmobile M4 hub cannon
                { id = "XAmmoBox-100", skin = "Steel",    wall = 0.004 }, -- 30-rd horseshoe 37mm endless-belt magazine
                { id = "XArmor02",     skin = "Steel",    wall = 0.016 }, -- Forward nose bulkhead & reduction gearbox armor
            },
        },
        ["NOSE_LEFT_SIDE"] = {
            critical_damage = 3.4,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.7, skin = "Aluminum", thickness = 0.0012},
            innards = {
                { id = "XGun-101",     skin = "Steel",    wall = 0.008 }, -- Port synchronized .50 cal AN/M2
                { id = "XAmmoBox-101", skin = "Aluminum", wall = 0.003 }, -- Port .50 cal ammo drum
            },
        },
        ["NOSE_RIGHT_SIDE"] = {
            critical_damage = 3.4,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.7, skin = "Aluminum", thickness = 0.0012},
            innards = {
                { id = "XGun-102",     skin = "Steel",    wall = 0.008 }, -- Starboard synchronized .50 cal AN/M2
                { id = "XAmmoBox-102", skin = "Aluminum", wall = 0.003 }, -- Starboard .50 cal ammo drum
            },
        },
        ["NOSE_BOTTOM"] = {
            critical_damage = 3.2,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0012, spar = "FlangeBeam"},
            children = {"WHEEL_F"},
        },
        ["ROTOR"] = {
            critical_damage = 1.8,
            args = {-1},
            droppable = false,
            construction = {durability = 1.4, skin = "Steel", thickness = 0.0035, spar = "Rod"},
        },

        -- =====================================================================
        -- 2. COCKPIT & FORWARD CABIN (265 LB USAAF ARMOR SUITE + CAR DOOR)
        -- =====================================================================
        ["COCKPIT"] = {
            critical_damage = 4.5,
            args = {-1},
            damage_boundary = 0.22,
            droppable = false,
            construction = {durability = 2.4, skin = "Glass", thickness = 0.0035, spar = "Truss"},
            innards = {
                { id = "XCrew0" },                                        -- Seated USAAF pilot torso & limbs
                { id = "XCrew0H" },                                       -- Pilot head & helmet
                { id = "XCtrlCrew0Stick", skin = "Steel", wall = 0.024 }, -- Central control stick
                { id = "XArmor00",        skin = "Steel", wall = 0.016 }, -- 16mm pilot seat-back / engine firewall armor
                { id = "XArmor01",        skin = "Glass", wall = 0.038 }, -- 38mm bullet-resistant glass windscreen
            },
        },
        ["CABIN_LEFT_SIDE"] = {
            critical_damage = 4.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.2, skin = "Aluminum", thickness = 0.0014, spar = "FlangeBeam"},
            children = {"NOSE_LEFT_SIDE"},
        },
        ["CABIN_RIGHT_SIDE"] = {
            critical_damage = 4.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.2, skin = "Aluminum", thickness = 0.0014, spar = "FlangeBeam"},
            children = {"NOSE_RIGHT_SIDE"},
        },
        ["CABIN_BOTTOM"] = {
            critical_damage = 4.4,
            args = {-1},
            damage_boundary = 0.18,
            droppable = false,
            construction = {durability = 2.5, skin = "Aluminum", thickness = 0.0015, spar = "FlangeBeam"},
            children = {"NOSE_CENTER", "NOSE_BOTTOM"},
            innards = {
                { id = "XCtrlLineElevator", skin = "Steel", wall = 0.002, plenum = 0.001 },
                { id = "XCtrlLineRudder",   skin = "Steel", wall = 0.002, plenum = 0.001 },
            },
        },

        -- =====================================================================
        -- 3. MID-FUSELAGE ALLISON V-1710-85 V-12 ENGINE & VENTRAL RADIATOR BAY
        -- =====================================================================
        ["ENGINE"] = {
            critical_damage = 7.2,
            args = {-1},
            damage_boundary = 0.12,
            droppable = false,
            refractory = false,
            construction = {durability = 3.6, skin = "CastIron", thickness = 0.014, spar = "Rod"},
            failures = {
                { "ENG0_WATER_RADIATOR_0_PIERCED", 0.55 },
                { "ENG0_OIL_RADIATOR_0_PIERCED",   0.45 },
                { "ENG0_OIL_HOSE_0_LEAK",          0.35 },
                { "ENG0_JAMMED",                   0.15 },
            },
            innards = {
                { id = "XEng0Case",         skin = "CastIron", wall = 0.024 }, -- Mid-mounted Allison V-1710-85 V-12 + driveshaft + gearbox
                { id = "XEng0Supercharger", skin = "Steel",    wall = 0.006 }, -- Single-stage centrifugal supercharger & dorsal intake
                { id = "XEng0OilTank0",     skin = "Aluminum", wall = 0.004 }, -- Aft engine-bay oil reservoir
            },
        },
        ["FUSELAGE_LEFT_SIDE"] = {
            critical_damage = 4.6,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.4, skin = "Aluminum", thickness = 0.0013, spar = "FlangeBeam"},
        },
        ["FUSELAGE_RIGHT_SIDE"] = {
            critical_damage = 4.6,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.4, skin = "Aluminum", thickness = 0.0013, spar = "FlangeBeam"},
        },
        ["FUSELAGE_BOTTOM"] = {
            critical_damage = 4.2,
            args = {-1},
            damage_boundary = 0.18,
            droppable = false,
            construction = {durability = 2.2, skin = "Aluminum", thickness = 0.0013, spar = "FlangeBeam"},
            radiator = {critical_damage = 1.3, volume = 0.36}, -- Ventral center-section glycol & oil heat exchanger
            innards = {
                { id = "XEng0OilRadiator0", skin = "Steel", wall = 0.003 },
            },
        },

        -- =====================================================================
        -- 4. PORT & STARBOARD WINGS (SELF-SEALING FUEL CELLS + 4x .30 CAL GUNS)
        -- =====================================================================
        ["WING_L_IN"] = {
            critical_damage = 7.4,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 3.3, skin = "Aluminum", thickness = 0.0013, spar = "FlangeBeam"},
            children = {"WING_L_CENTER", "FLAP_L", "WHEEL_L"},
            fuel_tank = {critical_damage = 2.2, volume = 190.0, integrity_loss_rate = 0.35},
            failures = {
                { "FUEL_TANK_00_MINOR_LEAK",  0.35 },
                { "FUEL_TANK_00_MEDIUM_LEAK", 0.22 },
                { "FUEL_TANK_00_MAJOR_LEAK",  0.12 },
                { "FUEL_TANK_00_FIRE",        0.18 },
                { "FUEL_TANK_00_EXPLODED",    0.04 },
            },
            innards = {
                { count = 2, durability = 1.30, id = "XSparWLHIn", plenum = 0.25, skin = "Aluminum", wall = 0.010 },
                { id = "XFuelTank1", skin = "Rubber", wall = 0.020, lining = "FoamFilledRubber", plenum = 0.65 },
                { id = "XUCShockLH", skin = "Steel",  wall = 0.006 },
            },
        },
        ["WING_L_CENTER"] = {
            critical_damage = 5.6,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 2.7, skin = "Aluminum", thickness = 0.0011, spar = "FlangeBeam"},
            children = {"WING_L_OUT"},
            innards = {
                { count = 2, durability = 1.10, id = "XSparWLHMid", plenum = 0.20, skin = "Aluminum", wall = 0.008 },
                { id = "XGun-103",            skin = "Steel", wall = 0.006 }, -- Port paired .30-06 AN/M2 wing guns
                { id = "XCtrlLineAileronLH",  skin = "Steel", wall = 0.002, plenum = 0.001 },
            },
        },
        ["WING_L_OUT"] = {
            critical_damage = 4.0,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 1.9, skin = "Aluminum", thickness = 0.0009, spar = "FlangeBeam"},
            children = {"AILERON_L"},
            innards = {
                { count = 2, durability = 0.88, id = "XSparWLHOut", plenum = 0.16, skin = "Aluminum", wall = 0.006 },
            },
        },
        ["AILERON_L"] = {
            critical_damage = 1.6,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.85, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },
        ["FLAP_L"] = {
            critical_damage = 2.4,
            args = {-1},
            damage_boundary = 0.45,
            droppable = false,
            construction = {durability = 1.4, skin = "Aluminum", thickness = 0.0010},
        },

        ["WING_R_IN"] = {
            critical_damage = 7.4,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 3.3, skin = "Aluminum", thickness = 0.0013, spar = "FlangeBeam"},
            children = {"WING_R_CENTER", "FLAP_R", "WHEEL_R"},
            fuel_tank = {critical_damage = 2.2, volume = 190.0, integrity_loss_rate = 0.35},
            failures = {
                { "FUEL_TANK_01_MINOR_LEAK",  0.35 },
                { "FUEL_TANK_01_MEDIUM_LEAK", 0.22 },
                { "FUEL_TANK_01_MAJOR_LEAK",  0.12 },
                { "FUEL_TANK_01_FIRE",        0.18 },
                { "FUEL_TANK_01_EXPLODED",    0.04 },
            },
            innards = {
                { count = 2, durability = 1.30, id = "XSparWRHIn", plenum = 0.25, skin = "Aluminum", wall = 0.010 },
                { id = "XFuelTank2", skin = "Rubber", wall = 0.020, lining = "FoamFilledRubber", plenum = 0.65 },
                { id = "XUCShockRH", skin = "Steel",  wall = 0.006 },
            },
        },
        ["WING_R_CENTER"] = {
            critical_damage = 5.6,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 2.7, skin = "Aluminum", thickness = 0.0011, spar = "FlangeBeam"},
            children = {"WING_R_OUT"},
            innards = {
                { count = 2, durability = 1.10, id = "XSparWRHMid", plenum = 0.20, skin = "Aluminum", wall = 0.008 },
                { id = "XGun-104",            skin = "Steel", wall = 0.006 }, -- Starboard paired .30-06 AN/M2 wing guns
                { id = "XCtrlLineAileronRH",  skin = "Steel", wall = 0.002, plenum = 0.001 },
            },
        },
        ["WING_R_OUT"] = {
            critical_damage = 4.0,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 1.9, skin = "Aluminum", thickness = 0.0009, spar = "FlangeBeam"},
            children = {"AILERON_R"},
            innards = {
                { count = 2, durability = 0.88, id = "XSparWRHOut", plenum = 0.16, skin = "Aluminum", wall = 0.006 },
            },
        },
        ["AILERON_R"] = {
            critical_damage = 1.6,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.85, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },
        ["FLAP_R"] = {
            critical_damage = 2.4,
            args = {-1},
            damage_boundary = 0.45,
            droppable = false,
            construction = {durability = 1.4, skin = "Aluminum", thickness = 0.0010},
        },

        -- =====================================================================
        -- 5. AFT FUSELAGE & EMPENNAGE
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
        ["TAIL_BOTTOM"] = {
            critical_damage = 3.8,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.9, skin = "Aluminum", thickness = 0.0010},
        },
        ["TAIL"] = {
            critical_damage = 4.8,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.3, skin = "Aluminum", thickness = 0.0011, spar = "Truss"},
            children = {"FIN_L_BOTTOM", "STABILIZER_L_IN", "STABILIZER_R_IN"},
        },
        ["FIN_L_BOTTOM"] = {
            critical_damage = 3.2,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0009, spar = "FlangeBeam"},
            children = {"FIN_L_TOP"},
            innards = {
                { id = "XSparKeelIn", plenum = 0.20, skin = "Aluminum", wall = 0.005 },
            },
        },
        ["FIN_L_TOP"] = {
            critical_damage = 2.3,
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
            critical_damage = 1.6,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.85, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },
        ["STABILIZER_L_IN"] = {
            critical_damage = 3.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.5, skin = "Aluminum", thickness = 0.0009, spar = "FlangeBeam"},
            children = {"STABILIZER_L_OUT", "ELEVATOR_L"},
            innards = {
                { id = "XSparStabLHIn", skin = "Aluminum", wall = 0.004 },
            },
        },
        ["STABILIZER_L_OUT"] = {
            critical_damage = 2.1,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.1, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
        },
        ["ELEVATOR_L"] = {
            critical_damage = 1.5,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.75, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },
        ["STABILIZER_R_IN"] = {
            critical_damage = 3.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.5, skin = "Aluminum", thickness = 0.0009, spar = "FlangeBeam"},
            children = {"STABILIZER_R_OUT", "ELEVATOR_R"},
            innards = {
                { id = "XSparStabRHIn", skin = "Aluminum", wall = 0.004 },
            },
        },
        ["STABILIZER_R_OUT"] = {
            critical_damage = 2.1,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.1, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
        },
        ["ELEVATOR_R"] = {
            critical_damage = 1.5,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.75, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },

        -- =====================================================================
        -- 6. TRICYCLE UNDERCARRIAGE
        -- =====================================================================
        ["WHEEL_F"] = {
            critical_damage = 2.4,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 1.6, skin = "Steel", thickness = 0.0040, spar = "Rod"},
        },
        ["WHEEL_L"] = {
            critical_damage = 2.8,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 1.8, skin = "Steel", thickness = 0.0045, spar = "Rod"},
            innards = {
                { id = "XUCWheelDrumLH", skin = "Steel", wall = 0.006 },
            },
        },
        ["WHEEL_R"] = {
            critical_damage = 2.8,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 1.8, skin = "Steel", thickness = 0.0045, spar = "Rod"},
            innards = {
                { id = "XUCWheelDrumRH", skin = "Steel", wall = 0.006 },
            },
        },
    }),

    DamageParts = {},


    
    lights_data = {
        typename = "collection",
        lights = {
            [2] = {
                typename = "collection",
                lights = {
                    {
                        typename          = "spotlight",
                        connector         = "RESERV_SPOT_PTR",
                        argument          = 208,
                        dir_correction    = {elevation = math.rad(-12)},
                        dont_change_color = false,
                        angle_max         = math.rad(50),
                    }
                },
            },
            [3] = {
                typename = "collection",
                lights = {
                    {typename = "argumentlight", argument = 190},
                    {typename = "argumentlight", argument = 191},
                    {typename = "argumentlight", argument = 192},
                },
            },
            [4] = {
                typename = "collection",
                lights = {
                    {typename = "argumentlight", argument = 200},
                    {typename = "argumentlight", argument = 201},
                },
            },
        }
    },
}

add_aircraft(P39_AirCobra)