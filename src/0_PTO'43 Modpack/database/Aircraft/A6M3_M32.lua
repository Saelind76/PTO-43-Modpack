-- ============================================================================================================
-- DCS WORLD COMPLETE AIRCRAFT DEFINITION & SFM SPECIFICATION (Master Suite v2.45)
-- GENERATED FOR: A6M3 Model 32
-- THEATER & PROVENANCE: Pacific Theater of Operations (PTO '43) | Imperial Japanese Navy (IJN)
-- INSTALLED ENGINE POWERTRAIN: Nakajima Sakae 21
-- ARCHITECTURE: Canonical SFM Standard (Crash-Proof Architecture)
-- ============================================================================================================

local _ = _ or function(str) return str end
local CAT_SHELLS     = CAT_SHELLS or 6
local CAT_GUN_MOUNT  = CAT_GUN_MOUNT or 8
local CAT_FUEL_TANKS = CAT_FUEL_TANKS or 1
local WSTYPE_PLACEHOLDER = WSTYPE_PLACEHOLDER or 0

-- Safe declaration guards to prevent "DUPLICATE not allowed" crashes
_G.PTO_Weapons_Declared = _G.PTO_Weapons_Declared or {}

local function safe_declare_weapon(tbl)
    if not tbl or not tbl.name then return end
    if _G.PTO_Weapons_Declared[tbl.name] then return tbl end
    if declare_weapon then declare_weapon(tbl) end
    _G.PTO_Weapons_Declared[tbl.name] = true
    return tbl
end

local function safe_declare_loadout(tbl)
    if not tbl or not tbl.CLSID then return end
    if _G.PTO_Weapons_Declared[tbl.CLSID] then return tbl end
    if declare_loadout then declare_loadout(tbl) end
    _G.PTO_Weapons_Declared[tbl.CLSID] = true
    return tbl
end

-- ============================================================================================================
-- LOADOUT DEFINITIONS (VENTRAL DROP TANK)
-- ============================================================================================================
-- 330 L belly tank: PTO_JP_TANK_330L (PTO43_aircraft_ammo.lua, shape A6M3_DropTank)

-- ============================================================================================================
-- GUN MOUNTS (historical A6M3 Model 32 fit)
--   2x Type 97 7.7 mm  (cowl, synchronized, 700 rpg)
--   2x Type 99-1 Mk 3 20 mm (wings, 100-round drum each)
-- The EDM has no Gun_point connectors, so muzzles are placed by coordinates measured on
-- the source model (A6M3-MODEL 32_v5.4.blend, objects GUN_IN_L/R and GUN_L_W/R_W),
-- converted to DCS axes (X fwd, Y up, Z right).
-- Shells PTO_77mm_Type97 / PTO_20mm_Type99_HE are declared in PTO43_aircraft_ammo.lua
-- ============================================================================================================
local function A6M3_gun(tbl, name, shells, count, rate, burst, eff_dist)
    tbl.category = CAT_GUN_MOUNT
    tbl.name     = name
    tbl.supply   = { shells = shells, mixes = {{1}}, count = count }
    tbl.gun      = {
        max_burst_length = burst,
        rates            = {rate},
        recoil_coeff     = 1.0,
        barrels_count    = 1,
    }
    tbl.ejector_pos             = {0.0, -0.1, 0.0}
    tbl.ejector_dir             = {0, -1, 0}
    tbl.supply_position         = tbl.supply_position or {0, 0, 0}
    tbl.aft_gun_mount           = false
    tbl.effective_fire_distance = eff_dist
    tbl.drop_cartridge          = 204
    tbl.azimuth_initial         = tbl.azimuth_initial or 0
    tbl.elevation_initial       = tbl.elevation_initial or 0
    tbl.effects                 = {
        { name = "FireEffect", arg = tbl.effect_arg_number or 350 },
        { name = "SmokeEffect" },
    }
    return declare_weapon(tbl)
end
local function A6M3_Type97(tbl)   -- 7.7 mm, ~900 rpm synchronized
    return A6M3_gun(tbl, "PTO_A6M3_Type97_77", {"PTO_77mm_Type97"}, 700, 900, 140, 800)
end
local function A6M3_Type99(tbl)   -- 20 mm, ~490 rpm, 100-round drum
    return A6M3_gun(tbl, "PTO_A6M3_Type99_20", {"PTO_20mm_Type99_HE"}, 100, 490, 50, 800)
end

-- ============================================================================================================
-- MAIN DECLARATION: A6M5 ZERO
-- ============================================================================================================
A6M3_M32 = {
    Name                = 'A6M3_M32',
    DisplayName         = _('[PTO43] Mitsubishi A6M3 Model 32 -Hamp-'),
    HumanCockpit        = false,
    Picture             = "A6M3_M32.png",
    Rate                = 40,
    Shape               = "A6M3_M32",
    propellorShapeType  = "3ARG_PROC_BLUR",   -- procedural prop blur (same scheme as the Ki-84 Frank)
    propellorShapeName  = "A6M3_blade.FBX",   -- one blade, +Y radial, meters; blur sits on PROP_LOCATOR_0

    shape_table_data = {
        {
            file        = 'A6M3_M32',
            life        = 18,
            vis         = 3,
            desrt       = 'p51-oblomoki',
            fire        = {300, 2},
            username    = 'A6M3_M32',
            index       = WSTYPE_PLACEHOLDER,
            classname   = "lLandPlane",
            positioning = "BYNORMAL",
            drawonmap   = true,
        },
        {
            name        = "p51-oblomoki",
            file        = "p51-oblomoki",
            fire        = {240, 2},
        },
    },

    mapclasskey         = "P0091000024",
    attribute           = {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER, "Fighters"},
    Categories          = {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor"},

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
M_empty                 = 1807, -- [kg] Operational empty weight
M_nominal               = 2544, -- [kg] Standard combat flight weight
M_max                   = 2944, -- [kg] Maximum permissible takeoff weight (MTOW)
M_fuel_max              = 370, -- [kg] Full internal fuel capacity mass
wing_area               = 21.53, -- [m^2] Reference wing gross planform area
wing_span               = 11.00, -- [m] Tip-to-tip wingspan
wing_type               = 0, -- [enum] 0 = Straight / Trapezoidal wing   ***************************check**********************************
length                  = 9.06, -- [m] Overall fuselage length
height                  = 3.44, -- [m] Ground parked height

-- Flight Test & AI Operational Airspeeds (TAS / CAS)
V_max_sea_level         = 126.4, -- [m/s] Maximum level speed at sea level (TAS)
V_max_h                 = 151.4, -- [m/s] Maximum level speed at critical supercharger altitude (TAS)
V_max_altitude          = 151.4, -- [m/s] Backward compatibility alias for V_max_h
V_opt                   = 82.2, -- [m/s] Optimal cruise speed (0.65 * V_max_sea_level)
V_take_off              = 43.3, -- [m/s] Takeoff rotation airspeed
V_land                  = 46.9, -- [m/s] Landing approach airspeed
Vy_max                  = 15.7, -- [m/s] Initial sea-level rate of climb
H_max                   = 11050, -- [m] Service ceiling
Mach_max                = 0.71, -- Maximum permissible dive Mach limit

-- Static Thrust Ratings for AI & Catapult Calculation (Froude Momentum T0 in kgf)
thrust_sum_max          = 1005, -- [kgf] Maximum military static thrust for AI & catapult calculation
thrust_sum_ab           = 1005, -- [kgf] Identical to thrust_sum_max (no afterburner)

CAS_min                 = 35.0, -- [m/s] Minimum safe calibrated airspeed
Ny_min                  = -3.5, -- Minimum allowable G factor
Ny_max                  = 7.0, -- Maximum structural G limit for AI
wing_root_chord         = 2.50, -- [m] Theoretical centerline/root chord
wing_tip_chord          = 1.42, -- [m] Tip chord
wing_sweep              = 2.5, -- [deg] Quarter-chord sweep angle
tand_gear_max           = 0.577, -- Gear suspension deflection parameter



    average_fuel_consumption = 0.302,
    AOA_take_off             = 0.157,
    bank_angle_max           = 60,
    has_afteburner           = false,
    has_speedbrake           = false,
    main_gear_pos            = { 0.106, -1.902,  2.199},
    nose_gear_pos            = {-5.814, -0.334,  0.000},
    has_differential_stabilizer = false,
    tanker_type              = 0,
    flaps_maneuver           = 0.3,
    range                    = 1055,  -- [km] Combat radius / range
    RCS                      = 2.5,
    IR_emission_coeff        = 0.1,
    IR_emission_coeff_ab     = 0,
    wing_tip_pos             = {-0.744, 0.135, 5.452},
    nose_gear_wheel_diameter = 0.189,
    main_gear_wheel_diameter = 0.697,
    brakeshute_name          = 0,
    is_tanker                = false,
    air_refuel_receptacle_pos= {0, 0, 0},
    engines_count            = 1,
    engines_nozzles          = {},

    -- Pilot & Cockpit Configuration (No orphan EDM references)
    crew_size    = 1,
    crew_members = {
        [1] = {
            pilot_name          = 56,
            ejection_seat_name  = 0,
            drop_canopy_name    = 0, -- Set to 0 to prevent loading "null.edm"
            pos                 = {-1.132, 0.225, 0.0},
            canopy_pos          = {0, 0, 0},
            drop_parachute_name = "pilot_raf_parachute",
        },
    },

fires_pos = {
    -- Powerplant & Fuselage
    [1]  = { 1.650, -0.050,  0.000}, -- Sakae 12 radial engine core
    [2]  = { 0.650, -0.150,  0.000}, -- Forward fuselage fuel cell (145 L)
    [3]  = {-3.400, -0.200,  0.000}, -- Aft fuselage / tailwheel bay

    -- Wing Roots / Inboard Fuel Tanks (155 L per wing)
    [4]  = {-0.150, -0.200,  1.250}, -- Starboard inner wing root
    [5]  = {-0.150, -0.200, -1.250}, -- Port inner wing root

    -- Mid Wing / 20mm Cannon Bays & Outer Tanks (45 L per wing)
    [6]  = {-0.350, -0.100,  2.400}, -- Starboard mid-wing / Type 99 cannon bay
    [7]  = {-0.350, -0.100, -2.400}, -- Port mid-wing / Type 99 cannon bay

    -- Trailing Edge & Flap Wells
    [8]  = {-0.750, -0.080,  1.900}, -- Starboard inboard flap trailing edge
    [9]  = {-0.750, -0.080, -1.900}, -- Port inboard flap trailing edge

    -- Outer Wing Panels & Ailerons
    [10] = {-0.650,  0.050,  4.500}, -- Starboard outer wing / aileron area
    [11] = {-0.650,  0.050, -4.500}, -- Port outer wing / aileron area
},
    -- Countermeasures
    SingleChargeTotal   = 0,
    CMDS_Incrementation = 0,
    ChaffDefault        = 0, 
    ChaffChargeSize     = 0,
    FlareDefault        = 0, 
    FlareChargeSize     = 0,
    CMDS_Edit           = false,

    -- Sensors
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

    -- ============================================================================================================
    -- INTERNAL WEAPONRY (Harmonized at 250m Convergence Point)
    -- ============================================================================================================
    -- All four fire parallel to the axis (no convergence set: tune azimuth_initial in-game if wanted).
    Guns = {
        A6M3_Type97({ muzzle_pos = {0.906, 0.662, -0.228}, supply_position = {0.4, 0.5, -0.2} }), -- cowl L
        A6M3_Type97({ muzzle_pos = {0.906, 0.662,  0.228}, supply_position = {0.4, 0.5,  0.2} }), -- cowl R
        A6M3_Type99({ muzzle_pos = {0.843, -0.216, -1.945}, supply_position = {0.0, -0.2, -1.9} }), -- wing L
        A6M3_Type99({ muzzle_pos = {0.843, -0.216,  1.945}, supply_position = {0.0, -0.2,  1.9} }), -- wing R
    },

    -- ============================================================================================================
    -- EXTERNAL HARDPOINTS (historical: 1x 330 L belly tank, 2x 30/60 kg wing bombs)
    -- Wing rack positions measured on the source model (wing underside at +-2.4 m span).
    -- ============================================================================================================
    -- Station 1 MUST be the centerline: DCS binds station 1 to the model's "Pylon1" connector
    -- (with the wing as station 1 its bomb appeared under the fuselage).
    Pylons = {
        pylon(1, 0, 0, 0, 0, {use_full_connector_position = true, connector = "Pylon1", arg = 308, DisplayName = "Centerline"},
        {
            { CLSID = "PTO_JP_TANK_330L", arg_value = 0.25 },
        }),
        pylon(2, 0, -0.20, -0.34, -2.40, {arg = 309, DisplayName = "Wing L"},
        {
            { CLSID = "PTO_JP_TYPE97_60KG", arg_value = 0.25 },
            { CLSID = "PTO_JP_TYPE97_30KG", arg_value = 0.25 },
        }),
        pylon(3, 0, -0.20, -0.34,  2.40, {arg = 310, DisplayName = "Wing R"},
        {
            { CLSID = "PTO_JP_TYPE97_60KG", arg_value = 0.25 },
            { CLSID = "PTO_JP_TYPE97_30KG", arg_value = 0.25 },
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
        aircraft_task(Intercept),
    },  
    DefaultTask = aircraft_task(CAP),

-- ------------------------------------------------------------------------------------------------------------
-- 2. STANDARD FLIGHT MODEL (SFM) AERODYNAMICS (SFM_Data.aerodynamics) v2.45
-- ------------------------------------------------------------------------------------------------------------
SFM_Data = {
    aerodynamics = {
        -- Control authority & stability derivatives (DCS convention)
        Cy0         = 0.1996, -- Zero-AoA 3D Wing Lift Coefficient (Rigorous Formulation)
        Mzalfa      = 4.0000, -- Pitch moment stability derivative (positive in DCS)
        Mzalfadt    = 0.9400, -- Pitch rate damping factor (positive in DCS)
        kjx         = 3.1010, -- Roll inertia factor
        kjz         = 0.0021, -- Yaw directional stability factor
        Czbe        = -0.0120, -- Directional weathercock side force derivative

        -- Drag & high-lift coefficients
        cx_gear     = 0.0156, -- Landing gear parasite drag increment
        cx_flap     = 0.0615, -- Landing flaps parasite drag increment
        cy_flap     = 0.1407, -- Landing flaps maximum lift increment
        cx_brk      = 0.0000, -- Airbrake / dive flap parasite drag increment

        table_data = {
            --      M     Cx0      Cya      B       B4     Omxmax  Aldop  Cymax
            [1]  = {0.00, 0.02241, 0.070, 0.08220, 0.27039, 0.058, 11.38, 1.050}, -- Static / Taxi
            [2]  = {0.08, 0.02241, 0.070, 0.08273, 0.18927, 0.403, 14.08, 1.232}, --Clean Stall Speed (Vs) / Deep Dogfight
            [3]  = {0.15, 0.02188, 0.070, 0.08410, 0.16223, 0.864, 15.73, 1.344}, -- Zoom Climb Threshold / Final Approach
            [4]  = {0.24, 0.02127, 0.072, 0.08723, 0.09464, 1.267, 16.40, 1.400}, -- Corner Speed / Optimal Sustained Turn
            [5]  = {0.34, 0.02072, 0.074, 0.09295, 0.07030, 1.440, 16.16, 1.372}, -- High Energy Combat / Peak Roll Rate
            [6]  = {0.44, 0.02037, 0.078, 0.10194, 0.05408, 0.991, 13.91, 1.190}, -- Max Level Speed (Vmax) / Fast Cruise
            [7]  = {0.55, 0.02037, 0.078, 0.11785, 0.10815, 0.485, 10.23, 0.910}, -- Dive Entry (Vne) / Heavy Control Stiffening
            [8]  = {0.65, 0.02047, 0.074, 0.14234, 0.27039, 0.238, 7.66, 0.672}, -- Wave Drag Onset (M_CR) / Roll Lockout
            [9]  = {0.75, 0.02976, 0.057, 0.18789, 1.08155, 0.127, 6.41, 0.448}, -- Transonic Drag Divergence (M_DD)
            [10] = {0.85, 0.09503, 0.038, 0.29623, 4.32619, 0.048, 5.14, 0.252}, -- Terminal Structural Shock / Safety Limit
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
    -- MITSUBISHI A6M2 "ZEKE" MODEL 21 - CANONICAL DAMAGE MODEL (34 COLLISION SHELLS + 22 TAIC INNARDS)-----------------------------revise for a6m5!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    -- Calibrated to TAIC No. 1 vulnerability data (Unarmored cockpit, unsealed fuel cells, Extra Super Duralumin)
    -- Fully crash-proof configuration: args = {-1} on all collision cells (zero missing debris crashes)
    -- ============================================================================================================

    Damage = verbose_to_dmg_properties({
        -- =====================================================================
        -- 1. NOSE, ENGINE & PROPELLER (NAKAJIMA SAKAE 12 RADIAL)
        -- =====================================================================
        ["NOSE_BOTTOM"] = {
            critical_damage = 2.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.0, skin = "Aluminum", thickness = 0.0008},
            children = {"ENGINE"},
            radiator = {critical_damage = 0.7, volume = 0.18}, -- Fragile lower chin oil radiator scoop
            innards = {
                { id = "XEng0OilRadiator0", skin = "Steel", wall = 0.002 },
            },
        },
        ["NOSE_LEFT_SIDE"] = {
            critical_damage = 1.8,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 0.9, skin = "Aluminum", thickness = 0.0008},
        },
        ["NOSE_RIGHT_SIDE"] = {
            critical_damage = 1.8,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 0.9, skin = "Aluminum", thickness = 0.0008},
        },
        ["ENGINE"] = {
            critical_damage = 3.5,
            args = {-1},
            damage_boundary = 0.10,
            droppable = false,
            refractory = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0015},
            children = {"ROTOR"},
            failures = {
                { "ENG0_OIL_RADIATOR_0_PIERCED", 0.60 },
                { "ENG0_OIL_HOSE_0_LEAK",        0.40 },
                { "ENG0_JAMMED",                 0.15 },
            },
            innards = {
                { id = "XEng0Case",         skin = "CastIron", wall = 0.015 },
                { id = "XEng0OilTank0",     skin = "Aluminum", wall = 0.003 },
                { id = "XEng0Supercharger", skin = "Steel",    wall = 0.004 },
            },
        },
        ["ROTOR"] = {
            critical_damage = 1.5,
            args = {-1},
            droppable = false,
            construction = {durability = 1.0, skin = "Steel", thickness = 0.0030},
        },

        -- =====================================================================
        -- 2. COCKPIT, CABIN & FUSELAGE STATIONS (ZERO ARMOR PROTECTION)
        -- =====================================================================
        ["COCKPIT"] = {
            critical_damage = 2.2,
            args = {-1},
            damage_boundary = 0.25,
            droppable = false,
            construction = {durability = 1.0, skin = "Glass", thickness = 0.0020, spar = "Truss"},
            innards = {
                { id = "XCrew0" }, -- Pilot torso (Immediate kill on penetration)
                { id = "XCrew0H" }, -- Pilot head
                { id = "XCtrlCrew0Stick", skin = "Steel", wall = 0.025 },
            },
        },
        ["CABIN_LEFT_SIDE"] = {
            critical_damage = 2.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.0, skin = "Aluminum", thickness = 0.0008},
            children = {"NOSE_LEFT_SIDE"},
            innards = {
                { id = "XGun-101", skin = "Steel", wall = 0.006 }, -- Port synchronised 7.7mm Type 97 cowl gun
            },
        },
        ["CABIN_RIGHT_SIDE"] = {
            critical_damage = 2.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.0, skin = "Aluminum", thickness = 0.0008},
            children = {"NOSE_RIGHT_SIDE"},
            innards = {
                { id = "XGun-102", skin = "Steel", wall = 0.006 }, -- Starboard synchronised 7.7mm Type 97 cowl gun
            },
        },
        ["FUSELAGE_LEFT_SIDE"] = {
            critical_damage = 2.8,
            args = {-1},
            damage_boundary = 0.25,
            droppable = false,
            construction = {durability = 1.1, skin = "Aluminum", thickness = 0.0008},
            children = {"CABIN_LEFT_SIDE", "COCKPIT", "WING_L_IN", "TAIL"},
            -- Unsealed forward main tank (145 L): instantaneous burn risk under .50 BMG fire
            fuel_tank = {critical_damage = 1.0, volume = 145.0, integrity_loss_rate = 0.80},
            failures = {
                { "FUEL_TANK_03_MINOR_LEAK",  0.50 },
                { "FUEL_TANK_03_MEDIUM_LEAK", 0.35 },
                { "FUEL_TANK_03_MAJOR_LEAK",  0.25 },
                { "FUEL_TANK_03_FIRE",        0.35 },
                { "FUEL_TANK_03_EXPLODED",    0.10 },
            },
            innards = {
                { id = "XFuelTank0",        skin = "Aluminum", wall = 0.002 },
                { id = "XCtrlLineElevator", skin = "Steel",    wall = 0.002, plenum = 0.001 },
                { id = "XCtrlLineRudder",   skin = "Steel",    wall = 0.002, plenum = 0.001 },
            },
        },
        ["FUSELAGE_RIGHT_SIDE"] = {
            critical_damage = 2.8,
            args = {-1},
            damage_boundary = 0.25,
            droppable = false,
            construction = {durability = 1.1, skin = "Aluminum", thickness = 0.0008},
            children = {"CABIN_RIGHT_SIDE", "WING_R_IN"},
        },

        -- =====================================================================
        -- 3. PORT (LEFT) WING & CONTROL SURFACES
        -- =====================================================================
        ["WING_L_IN"] = {
            critical_damage = 3.0,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 1.2, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
            children = {"WING_L_CENTER", "FLAP_L_IN", "WHEEL_L"},
            -- Unprotected port wing root tank (98 L)
            fuel_tank = {critical_damage = 1.0, volume = 98.0, integrity_loss_rate = 0.80},
            failures = {
                { "FUEL_TANK_00_MINOR_LEAK",  0.50 },
                { "FUEL_TANK_00_MEDIUM_LEAK", 0.35 },
                { "FUEL_TANK_00_MAJOR_LEAK",  0.25 },
                { "FUEL_TANK_00_FIRE",        0.35 },
                { "FUEL_TANK_00_EXPLODED",    0.10 },
            },
            innards = {
                { count = 2, durability = 1.10, id = "XSparWLHIn", plenum = 0.20, skin = "Aluminum", wall = 0.008 },
                { id = "XFuelTank1", skin = "Aluminum", wall = 0.002 },
                { id = "XGun-100",   skin = "Steel",    wall = 0.008 }, -- Port 20mm Type 99 cannon
            },
        },
        ["WING_L_CENTER"] = {
            critical_damage = 2.4,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 1.0, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"WING_L_OUT"},
        },
        ["WING_L_OUT"] = {
            critical_damage = 1.8,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 0.8, skin = "Aluminum", thickness = 0.0007, spar = "FlangeBeam"},
            children = {"AILERON_L"},
            innards = {
                { count = 2, durability = 0.80, id = "XSparWLHOut", plenum = 0.15, skin = "Aluminum", wall = 0.006 },
            },
        },
        ["AILERON_L"] = {
            critical_damage = 1.0,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.6, skin = "Fabric", thickness = 0.0004, spar = "Truss"},
        },
        ["FLAP_L_IN"] = {
            critical_damage = 1.2,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.8, skin = "Aluminum", thickness = 0.0008},
        },

        -- =====================================================================
        -- 4. STARBOARD (RIGHT) WING & CONTROL SURFACES
        -- =====================================================================
        ["WING_R_IN"] = {
            critical_damage = 3.0,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 1.2, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
            children = {"WING_R_CENTER", "FLAP_R_IN", "WHEEL_R"},
            -- Unprotected starboard wing root tank (98 L)
            fuel_tank = {critical_damage = 1.0, volume = 98.0, integrity_loss_rate = 0.80},
            failures = {
                { "FUEL_TANK_01_MINOR_LEAK",  0.50 },
                { "FUEL_TANK_01_MEDIUM_LEAK", 0.35 },
                { "FUEL_TANK_01_MAJOR_LEAK",  0.25 },
                { "FUEL_TANK_01_FIRE",        0.35 },
                { "FUEL_TANK_01_EXPLODED",    0.10 },
            },
            innards = {
                { count = 2, durability = 1.10, id = "XSparWRHIn", plenum = 0.20, skin = "Aluminum", wall = 0.008 },
                { id = "XFuelTank2", skin = "Aluminum", wall = 0.002 },
                { id = "XGun-103",   skin = "Steel",    wall = 0.008 }, -- Starboard 20mm Type 99 cannon
            },
        },
        ["WING_R_CENTER"] = {
            critical_damage = 2.4,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 1.0, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"WING_R_OUT"},
        },
        ["WING_R_OUT"] = {
            critical_damage = 1.8,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 0.8, skin = "Aluminum", thickness = 0.0007, spar = "FlangeBeam"},
            children = {"AILERON_R"},
            innards = {
                { count = 2, durability = 0.80, id = "XSparWRHOut", plenum = 0.15, skin = "Aluminum", wall = 0.006 },
            },
        },
        ["AILERON_R"] = {
            critical_damage = 1.0,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.6, skin = "Fabric", thickness = 0.0004, spar = "Truss"},
        },
        ["FLAP_R_IN"] = {
            critical_damage = 1.2,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.8, skin = "Aluminum", thickness = 0.0008},
        },

        -- =====================================================================
        -- 5. TAIL UNIT & EMPENNAGE SURFACES
        -- =====================================================================
        ["TAIL"] = {
            critical_damage = 3.5,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.2, skin = "Aluminum", thickness = 0.0008},
            children = {"FIN_L_BOTTOM", "STABILIZER_L_IN", "STABILIZER_R_IN", "HOOK", "WHEEL_REAR"},
        },
        ["FIN_L_BOTTOM"] = {
            critical_damage = 1.8,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 0.9, skin = "Aluminum", thickness = 0.0007},
            children = {"FIN_L_TOP"},
            innards = {
                { id = "XSparKeelIn", plenum = 0.20, skin = "Aluminum", wall = 0.004 },
            },
        },
        ["FIN_L_TOP"] = {
            critical_damage = 1.2,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 0.8, skin = "Aluminum", thickness = 0.0007},
            children = {"RUDDER"},
        },
        ["RUDDER"] = {
            critical_damage = 1.0,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.6, skin = "Fabric", thickness = 0.0004},
        },
        ["HOOK"] = {
            critical_damage = 1.5,
            args = {-1},
            droppable = false,
            construction = {durability = 1.8, skin = "Steel", thickness = 0.0050},
        },
        ["STABILIZER_L_IN"] = {
            critical_damage = 1.8,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.0, skin = "Aluminum", thickness = 0.0008},
            children = {"STABILIZER_L_OUT"},
            innards = {
                { id = "XSparStabLHIn", skin = "Aluminum", wall = 0.004 },
            },
        },
        ["STABILIZER_L_OUT"] = {
            critical_damage = 1.3,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 0.8, skin = "Aluminum", thickness = 0.0007},
            children = {"ELEVATOR_LEFT"},
        },
        ["ELEVATOR_LEFT"] = {
            critical_damage = 1.0,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.6, skin = "Fabric", thickness = 0.0004},
        },
        ["STABILIZER_R_IN"] = {
            critical_damage = 1.8,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.0, skin = "Aluminum", thickness = 0.0008},
            children = {"STABILIZER_R_OUT"},
            innards = {
                { id = "XSparStabRHIn", skin = "Aluminum", wall = 0.004 },
            },
        },
        ["STABILIZER_R_OUT"] = {
            critical_damage = 1.3,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 0.8, skin = "Aluminum", thickness = 0.0007},
            children = {"ELEVATOR_RIGHT"},
        },
        ["ELEVATOR_RIGHT"] = {
            critical_damage = 1.0,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.6, skin = "Fabric", thickness = 0.0004},
        },

        -- =====================================================================
        -- 6. UNDERCARRIAGE (LANDING GEAR)
        -- =====================================================================
        ["WHEEL_L"] = {
            critical_damage = 2.0,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 1.4, skin = "Steel", thickness = 0.0040},
        },
        ["WHEEL_R"] = {
            critical_damage = 2.0,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 1.4, skin = "Steel", thickness = 0.0040},
        },
        ["WHEEL_REAR"] = {
            critical_damage = 1.5,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 1.2, skin = "Steel", thickness = 0.0030},
        },
    }), 

    DamageParts = {}, 
    -- --------------------------------------------------------------------------------------------------------
    -- 5. LIGHTS SPECIFICATIONS
    -- --------------------------------------------------------------------------------------------------------
    lights_data = {
        typename = "collection",
        lights = {
            [1] = {},
            [2] = {},
            [3] = {
                typename = "collection",
                lights = {
                    -- Left Navigation Light (Red)
                    {
                        typename = "omnilight",
                        color    = {0.32, 0.0, 0.07},
                        position = {-0.272, 0.133, -5.341},
                        argument = 190,
                    },
                    -- Right Navigation Light (Green)
                    {
                        typename = "omnilight",
                        color    = {0.0, 0.26, 0.18},
                        position = {-0.272, 0.133, 5.341},
                        argument = 191,
                    },
                    -- Tail Position Light (White)
                    {
                        typename = "omnilight",
                        color    = {0.8, 0.8, 0.8},
                        position = {-6.886, 0.0, 0.0},
                        argument = 203,
                    },
                },
            },
            [4] = {},
            [5] = {
                typename = "collection",
                lights = {
                    {
                        typename       = "omnilight",
                        connector      = "FORM_LIGHTS_2",
                        color          = {0.0, 0.0, 0.0},
                        pos_correction = {0, 0, 0},
                        argument       = 202,
                    },
                },
            },
        },
    },
}

add_aircraft(A6M3_M32)