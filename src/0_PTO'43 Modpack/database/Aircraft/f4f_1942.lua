-- ============================================================================================================
-- DCS WORLD COMPLETE AIRCRAFT DEFINITION & SFM SPECIFICATION (Master Suite v2.45)
-- GENERATED FOR: F4F-4 Wildcat
-- THEATER & PROVENANCE: Pacific Theater (PTO) | United States (US Navy) (1943)
-- INSTALLED ENGINE POWERTRAIN: Pratt & Whitney R-1830-86/92
-- ARCHITECTURE: Canonical SFM Standard
-- ============================================================================================================

local _ = _ or function(str) return str end
local CAT_SHELLS    = CAT_SHELLS or 6
local CAT_GUN_MOUNT = CAT_GUN_MOUNT or 8
local CAT_FUEL_TANKS = CAT_FUEL_TANKS or 1
local tracer_on_time = 0.01

-- Prevent duplicate weapon declarations
_G.PTO_Weapons_Declared = _G.PTO_Weapons_Declared or {}
_G.PTO_Loadouts_Declared = _G.PTO_Loadouts_Declared or {}
local function safe_declare_weapon(tbl)
    if not tbl or not tbl.name then return end
    if _G.PTO_Weapons_Declared[tbl.name] then return tbl end
    if declare_weapon then declare_weapon(tbl) end
    _G.PTO_Weapons_Declared[tbl.name] = true
    return tbl
end

-- ============================================================================================================
-- LOADOUT DEFINITIONS
-- ============================================================================================================
if declare_loadout and not _G.PTO_Loadouts_Declared["{f4f_wildcat_belly_tank}"] then
    declare_loadout({
        category         = CAT_FUEL_TANKS,
        CLSID            = "{f4f_wildcat_belly_tank}",
        attribute        = {wsType_Air, wsType_Free_Fall, wsType_FuelTank, WSTYPE_PLACEHOLDER},
        Picture          = "f4f_wildcat_belly_tank.png",
        displayName      = _("F4F Wildcat Belly Tank"),
        Weight_Empty     = 25,
        Weight           = 25 + (0.72 * 220), -- ~58 gal / ~220 L fuel
        Cx_pil           = 0.002,
        shape_table_data = {
            {
                name     = "f4f_wildcat_belly_tank",
                file     = "f4f_wildcat_belly_tank",
                life     = 1,
                fire     = {0, 1},
                username = "f4f_wildcat_belly_tank",
                index    = WSTYPE_PLACEHOLDER,
            },
        },
        Elements = {
            { ShapeName = "f4f_wildcat_belly_tank" }, 
        }, 
    })
    _G.PTO_Loadouts_Declared["{f4f_wildcat_belly_tank}"] = true
end

-- ============================================================================================================
-- GUN SHELLS & CONSTRUCTORS (Declared before aircraft table)
-- ============================================================================================================
safe_declare_weapon({
    category       = CAT_SHELLS,
    name           = "PTO_50BMG_Wildcat_AP",
    user_name      = _(".50 BMG AP M2 (PTO)"),
    model_name     = "tracer_bullet_yellow",
    v0             = 870.0,
    Dv0            = 0.0082,
    Da0            = 0.0004,
    Da1            = 0.0,
    mass           = 0.046,
    round_mass     = 0.115,
    explosive      = 0.0,
    life_time      = 6.0,
    caliber        = 12.7,
    s              = 0.0,
    j              = 0.0,
    l              = 0.0,
    charTime       = 0,
    cx             = {0.5, 1.27, 0.70, 0.200, 2.30},
    k1             = 2.2e-08,
    tracer_off     = -1,
    tracer_on      = tracer_on_time,
    scale_tracer   = 1,
    cartridge      = 0,
    type_name      = "shell",
})

safe_declare_weapon({
    category       = CAT_SHELLS,
    name           = "PTO_50BMG_Wildcat_Tracer",
    user_name      = _(".50 BMG T M1 (PTO)"),
    model_name     = "tracer_bullet_yellow",
    v0             = 870.0,
    Dv0            = 0.0082,
    Da0            = 0.0004,
    Da1            = 0.0,
    mass           = 0.044,
    round_mass     = 0.112,
    explosive      = 0.0,
    life_time      = 5.5,
    caliber        = 12.7,
    s              = 0.0,
    j              = 0.0,
    l              = 0.0,
    charTime       = 0,
    cx             = {0.5, 1.27, 0.70, 0.200, 2.30},
    k1             = 2.2e-08,
    tracer_off     = 3.5,
    tracer_on      = tracer_on_time,
    scale_tracer   = 1.2,
    cartridge      = 0,
    type_name      = "shell",
})

local function PTO_Wildcat_M2(tbl)
    tbl.category                = CAT_GUN_MOUNT
    tbl.name                    = "PTO_Wildcat_Browning_M2"
    tbl.display_name            = _("Browning .50 M2 (F4F)")
    tbl.supply                  = tbl.supply or {
        shells = {"PTO_50BMG_Wildcat_AP", "PTO_50BMG_Wildcat_Tracer"},
        mixes  = {{1, 1, 2, 1}},
        count  = tbl.count or 240,
    }
    tbl.gun = {
        max_burst_length = 200,
        rates            = tbl.rates or {750},
        recoil_coeff     = 0.8,
        barrels_count    = 1,
    }
    tbl.aft_gun_mount           = false
    tbl.effective_fire_distance = 900
    tbl.drop_cartridge          = 204
    tbl.muzzle_pos              = tbl.muzzle_pos or {0.0, 0.0, 0.0}
    tbl.azimuth_initial         = tbl.azimuth_initial or 0.0
    tbl.elevation_initial       = tbl.elevation_initial or 0.0
    tbl.supply_position         = tbl.supply_position or {0.0, 0.0, 0.0}
    tbl.ejector_pos             = tbl.ejector_pos or {-0.2, -0.4, 0.0}
    tbl.ejector_dir             = tbl.ejector_dir or {0.0, -1.0, 0.0}
    tbl.effects                 = tbl.effects or {
        { name = "FireEffect", arg = tbl.effect_arg_number or 350 },
        { name = "SmokeEffect" },
    }
    if declare_weapon then declare_weapon(tbl) end
    return tbl
end

-- ============================================================================================================
-- SECTION 1: IDENTITY, UI & SHAPE DEFINITIONS
-- ============================================================================================================
f4f_1942 = {
    Name            = 'f4f_1942',
    DisplayName     = _('[PTO43] Grumman F4F Wildcat-42'),
    Cannon          = "yes",
    
    Picture         = "f4f_1942.png",
    Rate            = 40,
    Shape           = "f4f_1942",
	XRayShape           = "f4f_X-Ray",
	propellorShapeType  = "3ARG_PROC_BLUR",
	propellorShapeName  = "F4F_blade.FBX",   -- own Wildcat blade (one blade, +Y radial); blur on PROP_LOCATOR_0
	propellorShapeBlurX = 1.0,
    
    shape_table_data = {
        {
            file        = 'f4f_1942',
            life        = 18,
            vis         = 3,
            desrt       = 'genF-oblomoki',
            fire        = {240, 2},
            username    = 'f4f_1942',
            index       = WSTYPE_PLACEHOLDER,
            classname   = "lLandPlane",
            positioning = "BYNORMAL",
            drawonmap   = true,
        },
    },

    mapclasskey     = "P0091000024",
    attribute       = {wsType_Air, wsType_Airplane, wsType_Fighter, FA_18C, "Multirole fighters", "Refuelable"},
    Categories      = {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor"}, 

    ViewSettings = {
        Cockpit = {
            [1] = {
                CockpitLocalPoint      = {0.0, 0.3, 0.0},
                CameraViewAngleLimits  = {20.000000, 120.000000},
                CameraAngleRestriction = {false, 60.000000, 0.400000},
                CameraAngleLimits      = {140.000000, -75.000000, 90.000000},
                EyePoint               = {0.000000, 0.000000, 0.000000},
                limits_6DOF            = {x = {-0.050000, 0.450000}, y = {-0.200000, 0.200000}, z = {-0.220000, 0.220000}, roll = 90.000000},
            },
        },
        Chase = {
            LocalPoint   = {4.259000, 3.819000, 0.000000},
            AnglesDefault= {180.000000, -8.000000},
        },
        Arcade = {
            LocalPoint   = {-12.041000, 6.419000, 0.000000},
            AnglesDefault= {0.000000, -8.000000},
        },
    },      
    
    -- Primary Parameters
    M_empty                  = 2674,
    M_nominal                = 3607,
    M_max                    = 4067,
    M_fuel_max               = 560,
    wing_area                = 24.15,
    wing_span                = 11.58,
    wing_type                = 0,
    length                   = 8.76,
    height                   = 3.33,

    V_max_sea_level          = 124.4,
    V_max_h                  = 143.1,
    V_max_altitude           = 143.1,
    V_opt                    = 80.9,
    V_take_off               = 48.7,
    V_land                   = 52.7,
    Vy_max                   = 9.9,
    H_max                    = 10360,
    Mach_max                 = 0.70,

    thrust_sum_max           = 1002,
    thrust_sum_ab            = 1002,

    CAS_min                  = 37.5,
    Ny_min                   = -3.5,
    Ny_max                   = 7.0,
    wing_root_chord          = 2.45,
    wing_tip_chord           = 1.70,
    wing_sweep               = 0.0,
    tand_gear_max            = 0.577,

    stores_number            = 5,
    Ny_max_e                 = 7.0,
    AOA_take_off             = 0.16,
    bank_angle_max           = 65,
    has_afteburner           = false,
    has_speedbrake           = false,
    average_fuel_consumption = 0.305,

    -- x/y/diameters measured from the rebuilt EDM wheels (axle centres); z (track) kept from the old tuning
    nose_gear_pos            = {-4.425, -1.240, 0.000},   -- tail wheel, y = tyre bottom (axle -1.110 - r 0.13) (old: {-4.846, -0.96, 0.000}, d 0.328)
    nose_gear_wheel_diameter = 0.26,
    main_gear_pos            = { 0.940, -2.200,  1.779},  -- y = tyre bottom (axle -1.885 - r 0.315) (old: { 0.030, -1.780, 1.779}, d 0.76); model track is 0.985
    main_gear_wheel_diameter = 0.63,
    
    tanker_type              = 0,
    flaps_maneuver           = 0.3,
    range                    = 1521,
    RCS                      = 2.5,
    crew                     = 1,
    IR_emission_coeff        = 0.2,
    IR_emission_coeff_ab     = 0,
    wing_tip_pos             = {-1.2, 0.25, 5.79},
    brakeshute_name          = 0,
    is_tanker                = false,
    air_refuel_receptacle_pos= {6.731, 0.825, 0.492},
    engines_count            = 1,
    engines_nozzles = {
        [1] = {
            pos                 = {1.200, -0.480, -0.520},
            elevation           = math.rad(-6.0),
            azimuth             = math.rad(-12.0),
            diameter            = 0.12,
            exhaust_length_ab   = 0.0,
            exhaust_length_ab_K = 0.0,
            smokiness_level     = 0.045,
            engine_number       = 1,
        },
        [2] = {
            pos                 = {1.200, -0.480,  0.520},
            elevation           = math.rad(-6.0),
            azimuth             = math.rad(12.0),
            diameter            = 0.12,
            exhaust_length_ab   = 0.0,
            exhaust_length_ab_K = 0.0,
            smokiness_level     = 0.045,
            engine_number       = 1,
        },
    },

    mechanimations = {
        FoldableWings = {
            {Transition = {"Retract", "Extend"}, Sequence = {{C = {{"Arg", 8, "to", 0.0, "in", 5.0}}}}, Flags = {"Reversible"}},
            {Transition = {"Extend", "Retract"}, Sequence = {{C = {{"Arg", 8, "to", 1.0, "in", 15.0}}}}, Flags = {"Reversible", "StepsBackwards"}},
        },
    },
    
    crew_members = {
        [1] = {
            drop_canopy_name     = "f4f_1942_Canopy",
            ejection_seat_name   = 0,
            pilot_name           = "F4U-1D_Pilot",
            drop_parachute_name  = "F4U-1D_Pilot_Parachute",
            pos                  = {-1.85, 0.80, 0.00},
            canopy_arg           = 38, 
            pilot_body_arg       = 50,
            canopy_pos           = {0.00, 0.00, 0.00},
            canopy_ejection_dir  = {-0.10, 0.20, 0.20},
            ejection_added_speed = {0.0, 1.0, -1.0},
        },
    },

    fires_pos = {
        [1]  = { 1.950, -0.100,  0.000},
        [2]  = { 0.850, -0.150,  0.000},
        [3]  = {-3.200, -0.450,  0.000},
        [4]  = {-0.150, -0.220,  1.450},
        [5]  = {-0.150, -0.220, -1.450},
        [6]  = { 0.250,  0.050,  2.650},
        [7]  = { 0.250,  0.050, -2.650},
        [8]  = {-0.820,  0.150,  2.700},
        [9]  = {-0.820,  0.150, -2.700},
        [10] = {-0.650,  0.100,  4.650},
        [11] = {-0.650,  0.100, -4.650},
    },

    LandRWCategories = {
        [1] = { Name = "AircraftCarrier" },
        [2] = { Name = "AircraftCarrier With Arresting Gear" },
    },
    TakeOffRWCategories = {
        [1] = { Name = "AircraftCarrier" },
        [2] = { Name = "AircraftCarrier With Catapult" },
        [3] = { Name = "AircraftCarrier With Tramplin" },
    },

    SingleChargeTotal   = 0,
    CMDS_Incrementation = 0,
    ChaffDefault        = 0, 
    ChaffChargeSize     = 0,
    FlareDefault        = 0, 
    FlareChargeSize     = 0,
    CMDS_Edit           = false,

    detection_range_max  = 0,
    radar_can_see_ground = false,
	CanopyGeometry 			 = makeAirplaneCanopyGeometry(LOOK_GOOD, LOOK_GOOD, LOOK_GOOD),
    Sensors = {},
    HumanRadio = {
        frequency    = 127.5,
        editable     = true,
        minFrequency = 100.000,
        maxFrequency = 156.000,
        modulation   = MODULATION_AM
    },

    -- =========================================================================
    -- INTERNAL ARMAMENT (GUNS)
    -- =========================================================================
    Guns = {
        PTO_Wildcat_M2({
            muzzle_pos_connector = "Gun_point_1",
            rates                = {750},
            effect_arg_number    = 350,
            azimuth_initial      = -0.0066,
            elevation_initial    =  0.0063,
            supply_position      = {1.1104, -0.263, -2.727},
            count                = 240,
        }),
        PTO_Wildcat_M2({
            muzzle_pos_connector = "Gun_point_2",
            rates                = {750},
            effect_arg_number    = 350,
            azimuth_initial      = -0.0066,
            elevation_initial    =  0.0063,
            supply_position      = {1.1950, -0.288, -2.520},
            count                = 240,
        }),
        PTO_Wildcat_M2({
            muzzle_pos_connector = "Gun_point_3",
            rates                = {750},
            effect_arg_number    = 350,
            azimuth_initial      = -0.0066,
            elevation_initial    =  0.0063,
            supply_position      = {1.2870, -0.317, -2.306},
            count                = 240,
        }),
        PTO_Wildcat_M2({
            muzzle_pos_connector = "Gun_point_4",
            rates                = {750},
            effect_arg_number    = 350,
            azimuth_initial      =  0.0066,
            elevation_initial    =  0.0063,
            supply_position      = {1.2870, -0.381,  2.318},
            count                = 240,
        }),
        PTO_Wildcat_M2({
            muzzle_pos_connector = "Gun_point_5",
            rates                = {750},
            effect_arg_number    = 350,
            azimuth_initial      =  0.0066,
            elevation_initial    =  0.0063,
            supply_position      = {1.1940, -0.292,  2.532},
            count                = 240,
        }),
        PTO_Wildcat_M2({
            muzzle_pos_connector = "Gun_point_6",
            rates                = {750},
            effect_arg_number    = 350,
            azimuth_initial      =  0.0066,
            elevation_initial    =  0.0063,
            supply_position      = {1.1040, -0.268,  2.748},
            count                = 240,
        }),
    },

    -- =========================================================================
    -- EXTERNAL HARDPOINTS (PYLONS 1-5)
    -- =========================================================================
    -- Historical F4F-4 (1942): one 100 lb bomb under each wing (no 500 lb bombs, no rockets
    -- until the FM-2). Belly tank removed: f4f_wildcat_belly_tank.edm is the F6F's 150 gal tank
    -- (same file), far too big for the Wildcat and hanging below it. The real F4F-4 used two
    -- 58 gal wing tanks, which have no model yet.
    Pylons = {
        pylon(1, 0, 0, 0, 0, {use_full_connector_position = false, connector = "pylon_1", arg = 308, arg_value = 0}, {
            {CLSID = "PTO_US_ANM30_100LB", arg_value = 0.5},
        }),
        pylon(2, 0, 0, 0, 0, {use_full_connector_position = false, connector = "pylon_4", arg = 311, arg_value = 0}, {
            {CLSID = "PTO_US_ANM30_100LB", arg_value = 0.5},
        }),
    },
    
    Tasks = {
        aircraft_task(Intercept),
        aircraft_task(CAP),
        aircraft_task(Escort),
        aircraft_task(CAS),
        aircraft_task(GroundAttack),
        aircraft_task(Reconnaissance),
        aircraft_task(AntishipStrike),
        aircraft_task(FighterSweep),
    },
    DefaultTask = aircraft_task(Intercept),

-- ------------------------------------------------------------------------------------------------------------
-- 2. STANDARD FLIGHT MODEL (SFM) AERODYNAMICS (SFM_Data.aerodynamics) v2.45
-- ------------------------------------------------------------------------------------------------------------
SFM_Data = {
    aerodynamics = {
        -- Control authority & stability derivatives (DCS convention)
        Cy0         = 0.1410, -- Zero-AoA 3D Wing Lift Coefficient (Rigorous Formulation)
        Mzalfa      = 4.4000, -- Pitch moment stability derivative (positive in DCS)
        Mzalfadt    = 1.0340, -- Pitch rate damping factor (positive in DCS)
        kjx         = 2.3302, -- Roll inertia factor
        kjz         = 0.0017, -- Yaw directional stability factor
        Czbe        = -0.0132, -- Directional weathercock side force derivative

        -- Drag & high-lift coefficients
        cx_gear     = 0.0172, -- Landing gear parasite drag increment
        cx_flap     = 0.0411, -- Landing flaps parasite drag increment
        cy_flap     = 0.3281, -- Landing flaps maximum lift increment
        cx_brk      = 0.0000, -- Airbrake / dive flap parasite drag increment

        table_data = {
            --      M     Cx0      Cya      B       B4     Omxmax  Aldop  Cymax
            [1]  = {0.00, 0.02846, 0.069, 0.08323, 0.27039, 0.050, 12.15, 1.027}, -- Static / Taxi
            [2]  = {0.08, 0.02846, 0.070, 0.08377, 0.18927, 0.348, 14.80, 1.205}, --Clean Stall Speed (Vs) / Deep Dogfight
            [3]  = {0.15, 0.02779, 0.070, 0.08515, 0.16223, 0.746, 16.40, 1.315}, -- Zoom Climb Threshold / Final Approach
            [4]  = {0.24, 0.02701, 0.071, 0.08832, 0.09464, 1.094, 16.40, 1.370}, -- Corner Speed / Optimal Sustained Turn
            [5]  = {0.34, 0.02632, 0.074, 0.09411, 0.07030, 1.244, 16.40, 1.342}, -- High Energy Combat / Peak Roll Rate
            [6]  = {0.44, 0.02588, 0.077, 0.10322, 0.05408, 0.870, 14.63, 1.164}, -- Max Level Speed (Vmax) / Fast Cruise
            [7]  = {0.55, 0.02588, 0.078, 0.11933, 0.10815, 0.451, 10.97, 0.890}, -- Dive Entry (Vne) / Heavy Control Stiffening
            [8]  = {0.65, 0.02617, 0.074, 0.14413, 0.27039, 0.233, 8.51, 0.658}, -- Wave Drag Onset (M_CR) / Roll Lockout
            [9]  = {0.75, 0.03959, 0.057, 0.19025, 1.08155, 0.124, 7.26, 0.438}, -- Transonic Drag Divergence (M_DD)
            [10] = {0.85, 0.11986, 0.038, 0.29994, 4.32619, 0.047, 6.04, 0.247}, -- Terminal Structural Shock / Safety Limit
        }, -- end of table_data
    }, -- end of aerodynamics

    -- --------------------------------------------------------------------------------------------------------
    -- 3. PISTON ENGINE & SUPERCHARGER SPECIFICATION (SFM_Data.engine, typeng = 2)
    -- --------------------------------------------------------------------------------------------------------
    engine = {
        Nominal_RPM           = 2700.0, -- Full Throttle Rated Crankshaft RPM
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
        Displ                 = 30.00, -- [L] Engine displacement in liters
        Stroke                = 0.140, -- [m] Piston stroke in meters
        V_pist_0              = 12.60, -- [m/s] Mean linear piston velocity at nominal METO RPM
        k_Eps                 = 6.70, -- Geometric cylinder compression ratio
        k_gearbox             = 1.50, -- Engine/propeller gearbox reduction ratio

        -- Supercharger & Intake Manifold Pressure Regulation
        hMaxEng               = 5.8, -- [km] Critical full-throttle altitude
        k_boost               = 1.40, -- Supercharger boost stage multiplier
        k_cfug                = 0.0015, -- Centrifugal compressor pressure rise factor
        k_vel                 = 0.013, -- Intake ram air recovery factor
        k_adiab_1             = 0.0379, -- Supercharger Stage 1 charge heating coefficient
        k_adiab_2             = 0.0379, -- Supercharger Stage 2 charge heating coefficient
        k_after_cool          = 0.350, -- Engine intercooling booster efficiency
        MAX_Manifold_P_1      = 125000, -- [Pa] Max continuous/METO manifold pressure
        MAX_Manifold_P_2      = 162546, -- [Pa] Military dry takeoff manifold pressure
        MAX_Manifold_P_3      = 162546, -- [Pa] WEP wet emergency manifold pressure

        -- Deactivation of Linear Power Derivatives (Dynamic Simulation Enforcement)
        dpdh_m                = 1800, -- [Pa/m] 
        dpdh_f                = 1800, -- [Pa/m] 
        cemax                 = 0.37, -- [kg/s] Fuel consumption parameter
        cefor                 = 0.37, -- [kg/s] WEP fuel consumption parameter

        -- Thrust Table (Mach vs Available Thrust Pmax/Pfor in Newtons)
        table_data = {
            --      M     Pmax (N)   
            [1]  = {0.00, 9829.4}, -- Static Takeoff Thrust
            [2]  = {0.08, 9346.8}, -- Takeoff Roll
            [3]  = {0.15, 8846.5}, -- Climb Accel
            [4]  = {0.24, 8237.0}, -- Combat Climb
            [5]  = {0.34, 7617.8}, -- Fast Cruise
            [6]  = {0.44, 7008.4}, -- Near Vne
            [7]  = {0.55, 6467.7}, -- High Speed Dive
            [8]  = {0.65, 6104.1}, -- Dive Compressibility
            [9]  = {0.75, 5868.1}, -- Transonic Buffeting
            [10] = {0.85, 4649.3}, -- Propeller Windmilling Limit
        }, -- end of engine table_data

        -- Cooling, Friction & Governor Dynamics
        dcx_eng               = 0.020, -- Engine cooling and momentum intake drag
        Nu_0                  = 1.20, -- Propeller static thrust coefficient at V=0
        Nu_1                  = 0.87, -- Propeller advance ratio (J) decay coefficient
        Nu_2                  = 0.0010, -- Helical tip Mach shock loss coefficient
        N_indic_0             = 890000, -- [W] Indicated thermodynamic power
        N_fr_0                = 0.040, -- Static mechanical friction mean effective pressure
        N_fr_1                = 0.001, -- Viscous friction decay with piston speed
        P_oil                 = 495438, -- [Pa] Engine oil operating pressure
        k_oil                 = 0.00004, -- Oil viscosity shearing resistance
        k_piston              = 3000, -- IMEP piston velocity scaler
        k_reg                 = 0.0050, -- Constant-speed governor tracking gain
        prop_direction        = 1, -- Propeller rotation direction from Engine_Database
        Init_Mom              = 220, -- [N*m] Starter cranking torque
        D_prop                = 2.90, -- [m] Propeller disc tip-to-tip diameter
        MOI_prop              = 35.0, -- [kg*m^2] Propeller polar mass moment of inertia
        prop_pitch_min        = 20.0, -- [deg] Fine pitch limit for takeoff
        prop_pitch_max        = 55.0, -- [deg] Coarse pitch limit for dive/cruise
        prop_pitch_feather    = 85.0, -- [deg] Feathered streamlined pitch angle
        prop_blades_count     = 3, -- Propeller blade count

    }, -- end of engine
}, -- end of SFM_Data

	-- ============================================================================================================
    -- GRUMMAN F4F-4 WILDCAT - CANONICAL DAMAGE MODEL (33 COLLISION SHELLS + 38 INNARDS)
    -- Matched strictly to exported EDM collision shells and X-Ray innard registries
    -- Calibrated to US Navy Carrier Fighter Specs (Pratt & Whitney R-1830-86 Twin Wasp, 6x .50 Browning M2)
    -- Crash-proof configuration: args = {-1} on all collision cells (zero missing debris assertions)
    -- ============================================================================================================

    Damage = verbose_to_dmg_properties({
        -- =====================================================================
        -- 1. NOSE, POWERPLANT & PROPELLER (PRATT & WHITNEY R-1830-86 TWIN WASP)
        -- =====================================================================
        ["NOSE_LEFT_SIDE"] = {
            critical_damage = 3.5,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.8, skin = "Aluminum", thickness = 0.0012},
            children = {"ENGINE"},
        },
        ["NOSE_RIGHT_SIDE"] = {
            critical_damage = 3.5,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.8, skin = "Aluminum", thickness = 0.0012},
        },
        ["ENGINE"] = {
            critical_damage = 8.0,
            args = {-1},
            damage_boundary = 0.10,
            droppable = false,
            refractory = false,
            construction = {durability = 4.0, skin = "CastIron", thickness = 0.014, spar = "Rod"},
            children = {"ROTOR"},
            radiator = {critical_damage = 1.4, volume = 0.30},
            failures = {
                { "ENG0_OIL_RADIATOR_0_PIERCED", 0.60 },
                { "ENG0_OIL_HOSE_0_LEAK",        0.40 },
                { "ENG0_JAMMED",                 0.15 },
            },
            innards = {
                { id = "XEng0Case",         skin = "CastIron", wall = 0.025 }, -- R-1830 crankcase & 14 cylinders
                { id = "XEng0OilTank0",     skin = "Aluminum", wall = 0.004 }, -- Forward firewall oil reservoir
                { id = "XEng0Supercharger", skin = "Steel",    wall = 0.006 }, -- Two-stage two-speed supercharger
                { id = "XEng0OilRadiator0", skin = "Steel",    wall = 0.003 }, -- Chin oil radiator core
            },
        },
        ["ROTOR"] = {
            critical_damage = 2.2,
            args = {-1},
            droppable = false,
            construction = {durability = 1.6, skin = "Steel", thickness = 0.0040, spar = "Rod"},
        },

        -- =====================================================================
        -- 2. COCKPIT & FUSELAGE STATIONS (GRUMMAN IRON WORKS ARMOR SUITE)
        -- =====================================================================
        ["COCKPIT"] = {
            critical_damage = 4.5,
            args = {-1},
            damage_boundary = 0.25,
            droppable = false,
            construction = {durability = 2.4, skin = "Glass", thickness = 0.0035, spar = "Truss"},
            innards = {
                { id = "XCrew0" },                                              -- Pilot torso
                { id = "XCrew0H" },                                             -- Pilot head
                { id = "XCtrlCrew0Stick", skin = "Steel", wall = 0.025 },       -- Flight control stick
                { id = "XArmor00",        skin = "Steel", wall = 0.0127 },      -- Pilot seat back & head armor plate (1/2 in)
                { id = "XArmor01",        skin = "Glass", wall = 0.0380 },      -- Bullet-resistant glass windscreen
            },
        },
        ["FUSELAGE_LEFT_SIDE"] = {
            critical_damage = 7.0,
            args = {-1},
            damage_boundary = 0.22,
            droppable = false,
            construction = {durability = 3.0, skin = "Aluminum", thickness = 0.0014, spar = "Truss"},
            children = {"NOSE_LEFT_SIDE", "COCKPIT", "WING_L_IN", "TAIL_LEFT_SIDE"},
            innards = {
                { id = "XArmor02",          skin = "Steel", wall = 0.0095 },    -- Forward firewall protective armor plate
                { id = "XCtrlLineElevator", skin = "Steel", wall = 0.002, plenum = 0.001 },
                { id = "XCtrlLineRudder",   skin = "Steel", wall = 0.002, plenum = 0.001 },
            },
        },
        ["FUSELAGE_RIGHT_SIDE"] = {
            critical_damage = 7.0,
            args = {-1},
            damage_boundary = 0.22,
            droppable = false,
            construction = {durability = 3.0, skin = "Aluminum", thickness = 0.0014, spar = "Truss"},
            children = {"NOSE_RIGHT_SIDE", "WING_R_IN", "TAIL_RIGHT_SIDE"},
        },
        ["FUSELAGE_BOTTOM"] = {
            critical_damage = 8.5,
            args = {-1},
            damage_boundary = 0.25,
            droppable = false,
            construction = {durability = 3.5, skin = "Aluminum", thickness = 0.0016, spar = "Truss"},
            children = {"FUSELAGE_LEFT_SIDE", "FUSELAGE_RIGHT_SIDE"},
            -- Main fuselage protected self-sealing fuel cell (under cockpit floor, 443 L)
            fuel_tank = {critical_damage = 2.8, volume = 443.0, integrity_loss_rate = 0.35},
            failures = {
                { "FUEL_TANK_00_MINOR_LEAK",  0.30 },
                { "FUEL_TANK_00_MEDIUM_LEAK", 0.20 },
                { "FUEL_TANK_00_MAJOR_LEAK",  0.10 },
                { "FUEL_TANK_00_FIRE",        0.15 },
                { "FUEL_TANK_00_EXPLODED",    0.03 },
            },
            innards = {
                { id = "XFuelTank0", skin = "Rubber", wall = 0.035, lining = "FoamFilledRubber", plenum = 0.65 },
                { id = "XArmor03",   skin = "Steel",  wall = 0.0095 },          -- Ventral cockpit armor plate
            },
        },

        -- =====================================================================
        -- 3. PORT (LEFT) WING & CONTROL SURFACES (3x BROWNING M2 .50 CAL)
        -- =====================================================================
        ["WING_L_IN"] = {
            critical_damage = 8.0,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 3.6, skin = "Aluminum", thickness = 0.0014, spar = "FlangeBeam"},
            children = {"WING_L_CENTER", "FLAP_L", "WHEEL_L"},
            -- Port root wing auxiliary fuel cell (self-sealing rubber cell)
            fuel_tank = {critical_damage = 2.2, volume = 160.0, integrity_loss_rate = 0.35},
            failures = {
                { "FUEL_TANK_01_MINOR_LEAK",  0.30 },
                { "FUEL_TANK_01_MEDIUM_LEAK", 0.20 },
                { "FUEL_TANK_01_MAJOR_LEAK",  0.10 },
                { "FUEL_TANK_01_FIRE",        0.15 },
                { "FUEL_TANK_01_EXPLODED",    0.03 },
            },
            innards = {
                { count = 2, durability = 1.30, id = "XSparWLHIn", plenum = 0.25, skin = "Aluminum", wall = 0.012 },
                { id = "XFuelTank1", skin = "Rubber", wall = 0.030, lining = "FoamFilledRubber", plenum = 0.65 },
            },
        },
        ["WING_L_CENTER"] = {
            critical_damage = 6.5,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 3.0, skin = "Aluminum", thickness = 0.0012, spar = "FlangeBeam"},
            children = {"WING_L_OUT"},
            innards = {
                { count = 2, durability = 1.10, id = "XSparWLHMid", plenum = 0.20, skin = "Aluminum", wall = 0.010 },
                -- 3x .50 cal Browning M2 guns & ammo boxes (Inboard, Mid, Outboard)
                { id = "XGun-100",     skin = "Steel",    wall = 0.008 },
                { id = "XAmmoBox-100", skin = "Aluminum", wall = 0.002 },
                { id = "XGun-101",     skin = "Steel",    wall = 0.008 },
                { id = "XAmmoBox-101", skin = "Aluminum", wall = 0.002 },
                { id = "XGun-102",     skin = "Steel",    wall = 0.008 },
                { id = "XAmmoBox-102", skin = "Aluminum", wall = 0.002 },
            },
        },
        ["WING_L_OUT"] = {
            critical_damage = 4.5,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 2.2, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
            children = {"AILERON_L"},
            innards = {
                { count = 2, durability = 0.85, id = "XSparWLHOut", plenum = 0.16, skin = "Aluminum", wall = 0.008 },
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
            critical_damage = 2.8,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0014},
        },

        -- =====================================================================
        -- 4. STARBOARD (RIGHT) WING & CONTROL SURFACES (3x BROWNING M2 .50 CAL)
        -- =====================================================================
        ["WING_R_IN"] = {
            critical_damage = 8.0,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 3.6, skin = "Aluminum", thickness = 0.0014, spar = "FlangeBeam"},
            children = {"WING_R_CENTER", "FLAP_R", "WHEEL_R"},
            -- Starboard root wing auxiliary fuel cell (self-sealing rubber cell)
            fuel_tank = {critical_damage = 2.2, volume = 160.0, integrity_loss_rate = 0.35},
            failures = {
                { "FUEL_TANK_02_MINOR_LEAK",  0.30 },
                { "FUEL_TANK_02_MEDIUM_LEAK", 0.20 },
                { "FUEL_TANK_02_MAJOR_LEAK",  0.10 },
                { "FUEL_TANK_02_FIRE",        0.15 },
                { "FUEL_TANK_02_EXPLODED",    0.03 },
            },
            innards = {
                { count = 2, durability = 1.30, id = "XSparWRHIn", plenum = 0.25, skin = "Aluminum", wall = 0.012 },
                { id = "XFuelTank2", skin = "Rubber", wall = 0.030, lining = "FoamFilledRubber", plenum = 0.65 },
            },
        },
        ["WING_R_CENTER"] = {
            critical_damage = 6.5,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 3.0, skin = "Aluminum", thickness = 0.0012, spar = "FlangeBeam"},
            children = {"WING_R_OUT"},
            innards = {
                { count = 2, durability = 1.10, id = "XSparWRHMid", plenum = 0.20, skin = "Aluminum", wall = 0.010 },
                -- 3x .50 cal Browning M2 guns & ammo boxes (Inboard, Mid, Outboard)
                { id = "XGun-103",     skin = "Steel",    wall = 0.008 },
                { id = "XAmmoBox-103", skin = "Aluminum", wall = 0.002 },
                { id = "XGun-104",     skin = "Steel",    wall = 0.008 },
                { id = "XAmmoBox-104", skin = "Aluminum", wall = 0.002 },
                { id = "XGun-105",     skin = "Steel",    wall = 0.008 },
                { id = "XAmmoBox-105", skin = "Aluminum", wall = 0.002 },
            },
        },
        ["WING_R_OUT"] = {
            critical_damage = 4.5,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 2.2, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
            children = {"AILERON_R"},
            innards = {
                { count = 2, durability = 0.85, id = "XSparWRHOut", plenum = 0.16, skin = "Aluminum", wall = 0.008 },
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
            critical_damage = 2.8,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0014},
        },

        -- =====================================================================
        -- 5. TAIL UNIT & EMPENNAGE SURFACES
        -- =====================================================================
        ["TAIL_LEFT_SIDE"] = {
            critical_damage = 4.5,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.0, skin = "Aluminum", thickness = 0.0010},
            children = {"TAIL"},
        },
        ["TAIL_RIGHT_SIDE"] = {
            critical_damage = 4.5,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.0, skin = "Aluminum", thickness = 0.0010},
        },
        ["TAIL"] = {
            critical_damage = 5.5,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.5, skin = "Aluminum", thickness = 0.0012, spar = "Truss"},
            children = {"FIN_L_BOTTOM", "STABILIZER_L_IN", "STABILIZER_R_IN", "WHEEL_REAR"},
        },
        ["FIN_L_BOTTOM"] = {
            critical_damage = 3.6,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.8, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
            children = {"FIN_L_TOP"},
            innards = {
                { id = "XSparKeelIn", plenum = 0.20, skin = "Aluminum", wall = 0.006 },
            },
        },
        ["FIN_L_TOP"] = {
            critical_damage = 2.5,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.4, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"RUDDER"},
            innards = {
                { id = "XSparKeelOut", plenum = 0.20, skin = "Aluminum", wall = 0.005 },
            },
        },
        ["RUDDER"] = {
            critical_damage = 1.6,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.8, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },
        ["STABILIZER_L_IN"] = {
            critical_damage = 3.2,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"STABILIZER_L_OUT", "ELEVATOR_L"},
            innards = {
                { id = "XSparStabLHIn", skin = "Aluminum", wall = 0.005 },
            },
        },
        ["STABILIZER_L_OUT"] = {
            critical_damage = 2.4,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.2, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
        },
        ["ELEVATOR_L"] = {
            critical_damage = 1.6,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.8, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },
        ["STABILIZER_R_IN"] = {
            critical_damage = 3.2,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"STABILIZER_R_OUT", "ELEVATOR_R"},
            innards = {
                { id = "XSparStabRHIn", skin = "Aluminum", wall = 0.005 },
            },
        },
        ["STABILIZER_R_OUT"] = {
            critical_damage = 2.4,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.2, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
        },
        ["ELEVATOR_R"] = {
            critical_damage = 1.6,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.8, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },

        -- =====================================================================
        -- 6. UNDERCARRIAGE (LANDING GEAR)
        -- =====================================================================
        ["WHEEL_L"] = {
            critical_damage = 3.2,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 2.0, skin = "Steel", thickness = 0.0050, spar = "Rod"},
        },
        ["WHEEL_R"] = {
            critical_damage = 3.2,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 2.0, skin = "Steel", thickness = 0.0050, spar = "Rod"},
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

    -- =========================================================================
    -- LIGHTS SPECIFICATIONS
    -- =========================================================================
    lights_data = {
        typename = "collection",
        lights = {
            [1] = { 
                typename = "collection",
                lights = {
                    {typename = "natostrobelight", connector = "WHITE_BEACON L", argument_1 = 195, period = 1.2, phase_shift = 0},
                    {typename = "natostrobelight", connector = "WHITE_BEACON R", argument_1 = 196, period = 1.2, phase_shift = 0},
                    {typename = "natostrobelight", connector = "BANO_0_BACK", argument_1 = 192, period = 1.2, phase_shift = 0},
                }
            },
            [2] = { 
                typename = "collection",
                lights = {
                    {typename = "spotlight", connector = "MAIN_SPOT_PTR_02", argument = 209, dir_correction = {elevation = math.rad(-1)}},
                    {typename = "spotlight", connector = "MAIN_SPOT_PTR_01", argument = 208, dir_correction = {elevation = math.rad(3)}},
                }
            },
            [3] = { 
                typename = "collection",
                lights = {
                    {typename = "omnilight", connector = "BANO_1", color = {0.99, 0.11, 0.3}, pos_correction = {0, 0, 0}, argument = 190},
                    {typename = "omnilight", connector = "BANO_2", color = {0, 0.894, 0.6}, pos_correction = {0, 0, 0}, argument = 191},
                    {typename = "omnilight", connector = "BANO_0_BACK", color = {1, 1, 1}, pos_correction = {0, 0, 0}, argument = 203},
                }
            },
            [4] = { 
                typename = "collection",
                lights = {
                    {typename = "natostrobelight", connector = "WHITE_TOP", argument_1 = 192, period = 1.0, color = {0.8, 0.8, 1.0}, phase_shift = 0.0},
                }
            },
            [5] = {
                typename = "collection",
                lights = {
                    {
                        typename = "collection",
                        lights = {
                            {typename = "spotlight", position = {0.5, 1.2, 0}, color = {1.0, 1.0, 1.0}, intensity_max = 6.0, angle_max = 0.45, direction = {azimuth = math.rad(150), elevation = math.rad(5)}, dont_change_color = false, angle_change_rate = 0},
                            {typename = "spotlight", position = {0.5, 1.2, 0}, color = {1.0, 1.0, 1.0}, intensity_max = 6.0, angle_max = 0.45, direction = {azimuth = math.rad(-150), elevation = math.rad(5)}, dont_change_color = false, angle_change_rate = 0},
                            {typename = "argumentlight", argument = 212},
                        },
                    },
                    {
                        typename = "collection",
                        lights = {
                            {typename = "spotlight", position = {0, -0.3, -5.80}, color = {1.0, 1.0, 1.0}, intensity_max = 6.0, angle_max = 0.45, direction = {azimuth = math.rad(45)}, argument = 211, dont_change_color = false, angle_change_rate = 0},
                            {typename = "spotlight", position = {0, -0.3,  5.80}, color = {1.0, 1.0, 1.0}, intensity_max = 6.0, angle_max = 0.45, direction = {azimuth = math.rad(-45)}, argument = 210, dont_change_color = false, angle_change_rate = 0},
                        }
                    },
                },
            },
            [6] = {
                typename = "collection",
                lights = {
                    {typename = "omnilight", connector = "FORM_LIGHTS_1", color = {0.99, 0.11, 0.3}, pos_correction = {0, 0, 0}, argument = 200},
                    {typename = "omnilight", connector = "FORM_LIGHTS_2", color = {1.0, 0.5, 0.0}, pos_correction = {0, 0, 0}, argument = 202},
                    {typename = "omnilight", connector = "FORM_LIGHTS_3", color = {0, 0.894, 0.6}, pos_correction = {0, 0, 0}, argument = 201},
                }
            },
            {
                typename = "omnilight", position = {6.5, 0.4, 0}, color = {1, 1, 1}
            },
        }
    },
}

add_aircraft(f4f_1942)