-- ============================================================================================================
-- DCS WORLD COMPLETE AIRCRAFT DEFINITION & SFM SPECIFICATION (Master Suite v2.4)
-- GENERATED FOR: Ki-45 KAIc Toryu (Allied code name: Nick)
-- THEATER & PROVENANCE: Pacific Theater (PTO) | Japan (IJA) (1944)
-- INSTALLED ENGINE POWERTRAIN: 2 x Mitsubishi Ha-102
-- ARCHITECTURE: Canonical SFM Standard
-- TEST BUILD. Coordinates: DCS model frame, x forward, y up, z right; origin = estimated CG.
-- ============================================================================================================

local _ = _ or function(str) return str end
local WSTYPE_PLACEHOLDER = WSTYPE_PLACEHOLDER or 0

-- ------------------------------------------------------------------------------------------------------------
-- WEAPONS (template: PTO P-39N lua). Local mount functions, unique names, so nothing clashes with other mods.
--   Gun_point_0  nose 37 mm Ho-203        (fixed, forward)
--   Gun_point_1  ventral 20 mm Ho-3       (fixed, forward)  -> stock DCS MG 151/20 shells as stand-in
--   Gun_point_2  rear 7.92 mm Type 98     (flexible: turret args 451/452, crew member 2)
-- ------------------------------------------------------------------------------------------------------------
-- Shells (Ki45_37mm_Ho203_HE, Ki45_792_Type98_T, Ki45_792_Type98_AP) are declared in PTO43_aircraft_ammo.lua
local CAT_GUN_MOUNT = CAT_GUN_MOUNT or 8

local function Ki45_gun(tbl, name, shells, mixes, count, rate, burst, eff_dist, aft)
    tbl.category = CAT_GUN_MOUNT
    tbl.name     = name
    tbl.supply   = { shells = shells, mixes = mixes, count = count }
    tbl.gun      = {
        max_burst_length = burst,
        rates            = {rate},
        recoil_coeff     = 1.0,
        barrels_count    = 1,
        trigger          = {name = "GunTrigger"},
    }
    tbl.ejector_pos             = tbl.ejector_pos or {0.0, -0.2, 0.0}
    tbl.ejector_dir             = tbl.ejector_dir or {0, -1, 0}
    tbl.supply_position         = tbl.supply_position or {0, 0, 0}
    tbl.aft_gun_mount           = aft
    tbl.effective_fire_distance = eff_dist
    tbl.drop_cartridge          = tbl.drop_cartridge or 204
    tbl.muzzle_pos              = {0, 0, 0}          -- position from the connector
    tbl.azimuth_initial         = tbl.azimuth_initial or 0
    tbl.elevation_initial       = tbl.elevation_initial or 0
    tbl.effects                 = tbl.effects or {
        { name = "FireEffect", arg = tbl.effect_arg_number or 350 },
        { name = "SmokeEffect" },
    }
    return declare_weapon(tbl)
end
local function Ki45_Ho203(tbl)  -- 37 mm, 16-round magazine, ~120 rpm
    return Ki45_gun(tbl, "Ki45_Ho203", {"Ki45_37mm_Ho203_HE"}, {{1}}, 16, 120, 16, 1000, false)
end
local function Ki45_Ho3(tbl)    -- 20 mm, 100 rounds, ~400 rpm
    return Ki45_gun(tbl, "Ki45_Ho3", {"PTO_20mm_Ho5_HE"}, {{1}}, 100, 400, 50, 900, false)  -- Japanese 20 mm round from the [PTO'43] core
end
local function Ki45_Type98(tbl) -- 7.92 mm flexible, 75-round drums (~675 rounds), ~1000 rpm
    return Ki45_gun(tbl, "Ki45_Type98", {"Ki45_792_Type98_T", "Ki45_792_Type98_AP"}, {{1, 2, 2}}, 675, 1000, 75, 600, false)  -- aim comes from the turret block
end

Ki45_KAIc = {
    Name                = 'Ki45_KAIc',
    DisplayName         = _('[PTO43] Kawasaki Ki-45 KAIc Toryu'),
    HumanCockpit        = false,
    Picture             = "Ki45_KAIc.png",
    Rate                = 40,
    Shape               = "Ki45_KAIc",
    XRayShape           = "Ki45_KAIc_xray",
    propellorShapeType  = "3ARG_PROC_BLUR",   -- procedural disc, same scheme as the A6M3
    propellorShapeName  = "Ki45_blade.FBX",   -- one blade, +Y radial, meters; discs: PROP_LOCATOR_0 = right (407/475), PROP_LOCATOR_1 = left (408/476)

    shape_table_data = {
        {
            file        = 'Ki45_KAIc',
            life        = 22,
            vis         = 3,
            desrt       = 'p51-oblomoki',
            fire        = {300, 2},
            username    = 'Ki45_KAIc',
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
    attribute           = {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER, "Battleplanes"},
    Categories          = {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor"},

    LandRWCategories    = { [1] = { Name = "Runway" } },
    TakeOffRWCategories = { [1] = { Name = "Runway" } },

-- ------------------------------------------------------------------------------------------------------------
-- 1. PRIMARY GENERAL & AI PARAMETERS (DCS Core Aircraft Attributes)
-- ------------------------------------------------------------------------------------------------------------
    M_empty                 = 4000, -- [kg] Operational empty weight
    M_nominal               = 5300, -- [kg] Standard combat flight weight
    M_max                   = 5500, -- [kg] Maximum permissible takeoff weight (MTOW)
    M_fuel_max              = 730, -- [kg] Full internal fuel capacity mass
    wing_area               = 32.00, -- [m^2] Reference wing gross planform area
    wing_span               = 15.02, -- [m] Tip-to-tip wingspan
    wing_type               = 0, -- [enum] 0 = Straight / Trapezoidal wing
    length                  = 11.00, -- [m] Overall fuselage length
    height                  = 4.18, -- [m] Ground parked height

    V_max_sea_level         = 130.6, -- [m/s] Maximum level speed at sea level (TAS)
    V_max_h                 = 150.0, -- [m/s] Maximum level speed at critical supercharger altitude (TAS)
    V_max_altitude          = 150.0, -- [m/s] Backward compatibility alias for V_max_h
    V_opt                   = 84.9, -- [m/s] Optimal cruise speed (0.65 * V_max_sea_level)
    V_take_off              = 48.3, -- [m/s] Takeoff rotation airspeed
    V_land                  = 52.4, -- [m/s] Landing approach airspeed
    Vy_max                  = 12.5, -- [m/s] Initial sea-level rate of climb
    H_max                   = 10000, -- [m] Service ceiling
    Mach_max                = 0.70, -- Maximum permissible dive Mach limit

    thrust_sum_max          = 1971, -- [kgf] Maximum military static thrust for AI & catapult calculation
    thrust_sum_ab           = 1971, -- [kgf] Identical to thrust_sum_max (no afterburner)

    CAS_min                 = 38.0, -- [m/s] Minimum safe calibrated airspeed
    Ny_min                  = -3.5, -- Minimum allowable G factor
    Ny_max                  = 7.0, -- Maximum structural G limit for AI
    wing_root_chord         = 3.17, -- [m] Theoretical centerline/root chord
    wing_tip_chord          = 0.93, -- [m] Tip chord
    wing_sweep              = 2.0, -- [deg] Quarter-chord sweep angle
    tand_gear_max           = 0.577, -- Gear suspension deflection parameter

    average_fuel_consumption = 0.35,
    AOA_take_off             = 0.16,
    bank_angle_max           = 60,
    has_afteburner           = false,
    has_speedbrake           = false,
    has_differential_stabilizer = false,
    tanker_type              = 0,
    is_tanker                = false,
    air_refuel_receptacle_pos= {0, 0, 0},
    flaps_maneuver           = 0.3,
    range                    = 2000,  -- [km]
    RCS                      = 5,
    IR_emission_coeff        = 0.15,
    IR_emission_coeff_ab     = 0,
    brakeshute_name          = 0,

    -- DCS takes these as the wheel contact point: axle centre minus wheel radius (axle values sank the wheels half a diameter)
    main_gear_pos            = { 0.441, -2.000, 2.022},   -- axle y -1.598 - 0.402
    main_gear_wheel_diameter = 0.803,
    nose_gear_pos            = {-7.109, -0.583, 0.000},   -- tail wheel, axle y -0.423 - 0.160
    nose_gear_wheel_diameter = 0.319,
    wing_tip_pos             = {-0.202, 0.674, 7.483},

    engines_count            = 2,
    engines_nozzles = {
        [1] = { pos = {0.70, -0.30, -1.996}, elevation = 0, diameter = 0, exhaust_length_ab = -3.0, exhaust_length_ab_K = 0.3 }, -- left
        [2] = { pos = {0.70, -0.30,  1.996}, elevation = 0, diameter = 0, exhaust_length_ab = -3.0, exhaust_length_ab_K = 0.3 }, -- right
    },

    crew_size    = 2,
    crew_members = {
        [1] = { pilot_name = 56, ejection_seat_name = 0, drop_canopy_name = 0, pos = { 0.40, 0.50, 0.0},
                canopy_pos = {0, 0, 0}, drop_parachute_name = "pilot_raf_parachute", role = "pilot" },
        [2] = { pilot_name = 56, ejection_seat_name = 0, drop_canopy_name = 0, pos = {-2.40, 0.50, 0.0},
                canopy_pos = {0, 0, 0}, drop_parachute_name = "pilot_raf_parachute", role = "gunner" },
    },

    fires_pos = {
        [1]  = { 1.35, -0.07, -1.996}, -- left engine
        [2]  = { 1.35, -0.07,  1.996}, -- right engine
        [3]  = {-0.80,  0.00,  0.000}, -- fuselage tank
        [4]  = {-0.80, -0.10, -1.200}, -- left inner wing tank
        [5]  = {-0.80, -0.10,  1.200}, -- right inner wing tank
        [6]  = {-0.70, -0.05, -3.200}, -- left outer wing tank
        [7]  = {-0.70, -0.05,  3.200}, -- right outer wing tank
        [8]  = {-1.40, -0.10, -1.996}, -- left nacelle rear
        [9]  = {-1.40, -0.10,  1.996}, -- right nacelle rear
        [10] = {-0.50,  0.40, -5.500}, -- left wing tip area
        [11] = {-0.50,  0.40,  5.500}, -- right wing tip area
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
    CanopyGeometry       = makeAirplaneCanopyGeometry(LOOK_GOOD, LOOK_GOOD, LOOK_GOOD),
    Sensors = {},

    HumanRadio = {
        frequency    = 127.5,
        editable     = true,
        minFrequency = 100.000,
        maxFrequency = 156.000,
        modulation   = MODULATION_AM
    },

    -- Gun connectors in the EDM: Gun_point_0 nose, Gun_point_1 ventral, Gun_point_2 rear (X-ray: XGun-100/101/102)
    Guns = {
        Ki45_Ho203 ({ muzzle_pos_connector = "Gun_point_0", effect_arg_number = 350, supply_position = { 2.20,  0.00, 0.0 } }),
        Ki45_Ho3   ({ muzzle_pos_connector = "Gun_point_1", effect_arg_number = 351, supply_position = { 1.00, -0.35, 0.0 } }),
        -- Rear flexible gun, ED A-20G/B-17G turret scheme. Gun_point_2 rides on the gun and points aft at rest.
        -- Model: arg 451 = azimuth (-1..1 = -180..+180 deg, + swings the muzzle to starboard),
        --        arg 452 = elevation (-1..1 = -90..+90 deg, + raises the muzzle). Crew member 2 = rear gunner.
        Ki45_Type98({ muzzle_pos_connector = "Gun_point_2", effect_arg_number = 352, supply_position = {-2.60,  0.20, 0.0 },
                      turret = { name = "Rear_gun", H_Arg = 451, H_Min = -60, H_Max = 60, H_Vel = 40,
                                 V_Arg = 452, V_Min = -5, V_Max = 55, V_Vel = 40, crewMemberInCommandIdx = 2 } }),
    },
    -- Historical KAIc fit: 2x underwing racks for 250 kg (anti-shipping) or 60 kg bombs.
    -- The EDM has no pylon connectors: rack positions measured on ki-45-Toryu_v14.blend
    -- (Ki45_Wing_L underside at +-3.0 m span, outboard of the nacelles), DCS axes.
    Pylons = {
        pylon(1, 0, -0.30, -0.02, -3.00, {arg = 308, DisplayName = "Wing L"},
        {
            { CLSID = "PTO_JP_TYPE98_250KG", arg_value = 0.25 },
            { CLSID = "PTO_JP_TYPE97_60KG",  arg_value = 0.25 },
        }),
        pylon(2, 0, -0.30, -0.02,  3.00, {arg = 309, DisplayName = "Wing R"},
        {
            { CLSID = "PTO_JP_TYPE98_250KG", arg_value = 0.25 },
            { CLSID = "PTO_JP_TYPE97_60KG",  arg_value = 0.25 },
        }),
    },

    Tasks = {
        aircraft_task(CAP),
        aircraft_task(Escort),
        aircraft_task(FighterSweep),
        aircraft_task(Intercept),
        aircraft_task(GroundAttack),
        aircraft_task(CAS),
        aircraft_task(AntishipStrike),
    },
    DefaultTask = aircraft_task(Intercept),

-- ------------------------------------------------------------------------------------------------------------
-- 2. STANDARD FLIGHT MODEL (SFM) AERODYNAMICS (SFM_Data.aerodynamics)
-- ------------------------------------------------------------------------------------------------------------
SFM_Data = {
    aerodynamics = {
        Cy0         = 0.1890, -- Zero-AoA 3D Wing Lift Coefficient (Rigorous Formulation)
        Mzalfa      = 4.3550, -- Pitch moment stability derivative (positive in DCS)
        Mzalfadt    = 0.8057, -- Pitch rate damping factor (positive in DCS)
        kjx         = 1.6201, -- Roll inertia factor
        kjz         = 0.0012, -- Yaw directional stability factor
        Czbe        = -0.0139, -- Directional weathercock side force derivative

        cx_gear     = 0.0163, -- Landing gear parasite drag increment
        cx_flap     = 0.0427, -- Landing flaps parasite drag increment
        cy_flap     = 0.1999, -- Landing flaps maximum lift increment
        cx_brk      = 0.0000, -- Airbrake / dive flap parasite drag increment

        table_data = {
            --      M     Cx0      Cya      B       B4     Omxmax  Aldop  Cymax
            [1]  = {0.00, 0.02647, 0.075, 0.06623, 0.12607, 0.036, 12.93, 1.226}, -- Static / Taxi
            [2]  = {0.08, 0.02647, 0.075, 0.06666, 0.08825, 0.252, 15.87, 1.438}, -- Clean Stall Speed (Vs) / Deep Dogfight
            [3]  = {0.15, 0.02584, 0.075, 0.06775, 0.07539, 0.539, 16.40, 1.569}, -- Zoom Climb Threshold / Final Approach
            [4]  = {0.24, 0.02512, 0.077, 0.07028, 0.04412, 0.791, 16.40, 1.635}, -- Corner Speed / Optimal Sustained Turn
            [5]  = {0.34, 0.02447, 0.078, 0.07489, 0.03278, 0.899, 16.40, 1.602}, -- High Energy Combat / Peak Roll Rate
            [6]  = {0.44, 0.02406, 0.078, 0.08213, 0.02521, 0.690, 16.40, 1.389}, -- Max Level Speed (Vmax) / Fast Cruise
            [7]  = {0.55, 0.02406, 0.078, 0.09495, 0.05043, 0.456, 12.58, 1.062}, -- Dive Entry (Vne) / Heavy Control Stiffening
            [8]  = {0.65, 0.02406, 0.078, 0.11468, 0.12607, 0.283, 9.02, 0.785}, -- Wave Drag Onset (M_CR) / Roll Lockout
            [9]  = {0.75, 0.02406, 0.061, 0.15138, 0.50427, 0.151, 7.51, 0.523}, -- Transonic Drag Divergence (M_DD)
            [10] = {0.85, 0.02406, 0.041, 0.23867, 2.01709, 0.057, 6.13, 0.294}, -- Terminal Structural Shock / Safety Limit
        }, -- end of table_data
    }, -- end of aerodynamics

    -- --------------------------------------------------------------------------------------------------------
    -- 3. PISTON ENGINE & SUPERCHARGER SPECIFICATION (SFM_Data.engine, typeng = 2) - per engine
    -- --------------------------------------------------------------------------------------------------------
    engine = {
        Nominal_RPM           = 2700.0, -- Full Throttle Rated Crankshaft RPM
        Nmg                   = 22.0, -- [%] Idle RPM Percentage
        MinRUD                = 0, -- Minimum throttle state
        MaxRUD                = 1, -- Maximum throttle state
        MaksRUD               = 1.00, -- 100% Military Dry Power Position
        ForsRUD               = 1.00, -- Emergency War Power (WEP) Position
        typeng                = 2, -- [enum] 2 = Piston engine with propeller dynamics
        type                  = "Radial", -- Engine Architecture
        Startup_Prework       = 12, -- Cranking duration before ignition
        Startup_RPMs          = { {0, 0}, {1, 66}, {4.6, 66}, {5, 300}, {5.5, 450}, {7, 500}, {9, 800}, {12, 900} },
        Startup_Ignition_Time = 7, -- Seconds to cylinder firing catch
        Shutdown_Duration     = 6.8, -- Spindown duration in seconds
        cylinder_firing_order = {1, 10, 5, 14, 9, 4, 13, 8, 3, 12, 7, 2, 11, 6},

        Displ                 = 28.00, -- [L] Engine displacement in liters
        Stroke                = 0.150, -- [m] Piston stroke in meters
        V_pist_0              = 13.50, -- [m/s] Mean linear piston velocity at nominal METO RPM
        k_Eps                 = 7.00, -- Geometric cylinder compression ratio
        k_gearbox             = 1.46, -- Engine/propeller gearbox reduction ratio

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

        dpdh_m                = 1800, -- [Pa/m]
        dpdh_f                = 1800, -- [Pa/m]
        cemax                 = 0.37, -- [kg/s] Fuel consumption parameter
        cefor                 = 0.37, -- [kg/s] WEP fuel consumption parameter

        table_data = {
            --      M     Pmax (N)
            [1]  = {0.00, 9666.7}, -- Static Takeoff Thrust
            [2]  = {0.08, 9192.1}, -- Takeoff Roll
            [3]  = {0.15, 8700.1}, -- Climb Accel
            [4]  = {0.24, 8100.7}, -- Combat Climb
            [5]  = {0.34, 7491.7}, -- Fast Cruise
            [6]  = {0.44, 6892.4}, -- Near Vne
            [7]  = {0.55, 6360.7}, -- High Speed Dive
            [8]  = {0.65, 6003.0}, -- Dive Compressibility
            [9]  = {0.75, 5771.0}, -- Transonic Buffeting
            [10] = {0.85, 4572.4}, -- Propeller Windmilling Limit
        }, -- end of engine table_data

        dcx_eng               = 0.020, -- Engine cooling and momentum intake drag
        Nu_0                  = 1.20, -- Propeller static thrust coefficient at V=0
        Nu_1                  = 0.88, -- Propeller advance ratio (J) decay coefficient
        Nu_2                  = 0.0010, -- Helical tip Mach shock loss coefficient
        N_indic_0             = 812000, -- [W] Indicated thermodynamic power
        N_fr_0                = 0.040, -- Static mechanical friction mean effective pressure
        N_fr_1                = 0.001, -- Viscous friction decay with piston speed
        P_oil                 = 495438, -- [Pa] Engine oil operating pressure
        k_oil                 = 0.00004, -- Oil viscosity shearing resistance
        k_piston              = 3000, -- IMEP piston velocity scaler
        k_reg                 = 0.0050, -- Constant-speed governor tracking gain
        prop_direction        = 1, -- +1 for CCW from front / CW from cockpit view
        Init_Mom              = 220, -- [N*m] Starter cranking torque
        D_prop                = 3.10, -- [m] Propeller disc tip-to-tip diameter
        MOI_prop              = 34.0, -- [kg*m^2] Propeller polar mass moment of inertia
        prop_pitch_min        = 20.0, -- [deg] Fine pitch limit for takeoff
        prop_pitch_max        = 55.0, -- [deg] Coarse pitch limit for dive/cruise
        prop_pitch_feather    = 85.0, -- [deg] Feathered streamlined pitch angle
        prop_blades_count     = 3, -- Propeller blade count
    }, -- end of engine
}, -- end of SFM_Data

-- ------------------------------------------------------------------------------------------------------------
-- 4. DAMAGE MODEL (same form as the G4M2 Betty)
-- Matched strictly to the exported shells: cell names = Ki45_KAIc_collision.edm, innard ids = Ki45_KAIc_xray.edm
-- Pure physics configuration: no visual args declared (the visual EDM has no damage arguments)
-- Engine 0 = left, engine 1 = right. Fuel tanks: 0 fuselage, 1/3 left wing in/out, 2/4 right wing in/out
-- ------------------------------------------------------------------------------------------------------------
    Damage = verbose_to_dmg_properties({
        -- =====================================================================
        -- 1. NOSE & COCKPIT
        -- =====================================================================
        ["NOSE_CENTER"] = {
            critical_damage = 3.5,
            damage_boundary = 0.20,
            droppable = false,
            construction = { durability = 1.4, skin = "Aluminum", thickness = 0.0010, spar = "Truss" },
            innards = {
                { id = "XGun-100", skin = "Steel", wall = 0.012 },          -- 37 mm Ho-203
            },
        },
        ["COCKPIT"] = {
            critical_damage = 3.0,
            damage_boundary = 0.25,
            droppable = false,
            construction = { durability = 1.3, skin = "Glass", thickness = 0.0030, spar = "Truss" },
            children = { "NOSE_CENTER" },
            innards = {
                { id = "XCrew0" },                                          -- pilot torso
                { id = "XCrew0H" },                                         -- pilot head
                { id = "XCtrlCrew0Stick", skin = "Steel", wall = 0.025 },
            },
        },

        -- =====================================================================
        -- 2. FUSELAGE STATIONS
        -- =====================================================================
        ["CABIN_LEFT_SIDE"] = {
            critical_damage = 5.0,
            damage_boundary = 0.25,
            droppable = false,
            construction = { durability = 1.6, skin = "Aluminum", thickness = 0.0010, spar = "Truss" },
            children = { "COCKPIT", "WING_L_IN" },
            fuel_tank = { critical_damage = 1.5, volume = 280.0, integrity_loss_rate = 0.60 },
            failures = {
                { "FUEL_TANK_00_MINOR_LEAK",  0.50 },
                { "FUEL_TANK_00_MEDIUM_LEAK", 0.35 },
                { "FUEL_TANK_00_MAJOR_LEAK",  0.25 },
                { "FUEL_TANK_00_FIRE",        0.35 },
                { "FUEL_TANK_00_EXPLODED",    0.10 },
            },
            innards = {
                { id = "XFuelTank0", skin = "Aluminum", wall = 0.002, plenum = 0.65 },
                { id = "XGun-101",   skin = "Steel",    wall = 0.008 },     -- 20 mm Ho-3 (ventral)
            },
        },
        ["CABIN_RIGHT_SIDE"] = {
            critical_damage = 5.0,
            damage_boundary = 0.25,
            droppable = false,
            construction = { durability = 1.6, skin = "Aluminum", thickness = 0.0010, spar = "Truss" },
            children = { "WING_R_IN" },
        },
        ["FUSELAGE_LEFT_SIDE"] = {
            critical_damage = 6.0,
            damage_boundary = 0.25,
            droppable = false,
            construction = { durability = 1.8, skin = "Aluminum", thickness = 0.0010, spar = "Truss" },
            children = { "CABIN_LEFT_SIDE", "TAIL_LEFT_SIDE" },
            innards = {
                { id = "XCrew1" },                                          -- rear gunner torso
                { id = "XCrew1H" },                                         -- rear gunner head
            },
        },
        ["FUSELAGE_RIGHT_SIDE"] = {
            critical_damage = 6.0,
            damage_boundary = 0.25,
            droppable = false,
            construction = { durability = 1.8, skin = "Aluminum", thickness = 0.0010, spar = "Truss" },
            children = { "CABIN_RIGHT_SIDE", "TAIL_RIGHT_SIDE" },
        },

        -- =====================================================================
        -- 3. PORT POWERPLANT & NACELLE (MITSUBISHI HA-102 #0, Z = -2.0 m)
        -- =====================================================================
        ["ENGINE_L"] = {
            critical_damage = 5.0,
            damage_boundary = 0.10,
            droppable = false,
            refractory = true,
            construction = { durability = 2.5, skin = "CastIron", thickness = 0.0060, spar = "Rod" },
            children = { "ROTOR_L" },
            failures = {
                { "ENG0_OIL_RADIATOR_0_PIERCED", 0.60 },
                { "ENG0_OIL_HOSE_0_LEAK",        0.40 },
                { "ENG0_JAMMED",                 0.15 },
            },
            innards = {
                { id = "XEng0Case",         skin = "CastIron", wall = 0.018 },
                { id = "XEng0Heads",        skin = "Aluminum", wall = 0.010 },
                { id = "XEng0OilTank0",     skin = "Aluminum", wall = 0.004 },
                { id = "XEng0Supercharger", skin = "Steel",    wall = 0.006 },
            },
        },
        ["ROTOR_L"] = {
            critical_damage = 2.0,
            droppable = true,
            construction = { durability = 1.4, skin = "Steel", thickness = 0.0040, spar = "Rod" },
        },
        ["MTG_L"] = {
            critical_damage = 5.0,
            damage_boundary = 0.20,
            droppable = false,
            construction = { durability = 1.6, skin = "Aluminum", thickness = 0.0010 },
            children = { "ENGINE_L", "MTG_L_BOTTOM" },
        },
        ["MTG_L_BOTTOM"] = {
            critical_damage = 4.5,
            damage_boundary = 0.20,
            droppable = false,
            construction = { durability = 1.6, skin = "Aluminum", thickness = 0.0010 },
            children = { "GEAR_L" },
            radiator = { critical_damage = 1.0, volume = 0.25 },
            innards = {
                { id = "XEng0OilRadiator0", skin = "Steel", wall = 0.003 },
            },
        },

        -- =====================================================================
        -- 4. STARBOARD POWERPLANT & NACELLE (MITSUBISHI HA-102 #1, Z = +2.0 m)
        -- =====================================================================
        ["ENGINE_R"] = {
            critical_damage = 5.0,
            damage_boundary = 0.10,
            droppable = false,
            refractory = true,
            construction = { durability = 2.5, skin = "CastIron", thickness = 0.0060, spar = "Rod" },
            children = { "ROTOR_R" },
            failures = {
                { "ENG1_OIL_RADIATOR_0_PIERCED", 0.60 },
                { "ENG1_OIL_HOSE_0_LEAK",        0.40 },
                { "ENG1_JAMMED",                 0.15 },
            },
            innards = {
                { id = "XEng1Case",         skin = "CastIron", wall = 0.018 },
                { id = "XEng1Heads",        skin = "Aluminum", wall = 0.010 },
                { id = "XEng1OilTank0",     skin = "Aluminum", wall = 0.004 },
                { id = "XEng1Supercharger", skin = "Steel",    wall = 0.006 },
            },
        },
        ["ROTOR_R"] = {
            critical_damage = 2.0,
            droppable = true,
            construction = { durability = 1.4, skin = "Steel", thickness = 0.0040, spar = "Rod" },
        },
        ["MTG_R"] = {
            critical_damage = 5.0,
            damage_boundary = 0.20,
            droppable = false,
            construction = { durability = 1.6, skin = "Aluminum", thickness = 0.0010 },
            children = { "ENGINE_R", "MTG_R_BOTTOM" },
        },
        ["MTG_R_BOTTOM"] = {
            critical_damage = 4.5,
            damage_boundary = 0.20,
            droppable = false,
            construction = { durability = 1.6, skin = "Aluminum", thickness = 0.0010 },
            children = { "GEAR_R" },
            radiator = { critical_damage = 1.0, volume = 0.25 },
            innards = {
                { id = "XEng1OilRadiator0", skin = "Steel", wall = 0.003 },
            },
        },

        -- =====================================================================
        -- 5. PORT (LEFT) WING & CONTROL SURFACES
        -- =====================================================================
        ["WING_L_IN"] = {
            critical_damage = 8.0,
            damage_boundary = 0.15,
            droppable = true,
            construction = { durability = 2.4, skin = "Aluminum", thickness = 0.0012, spar = "FlangeBeam" },
            children = { "WING_L_CENTER", "MTG_L", "FLAP_L_IN" },
            fuel_tank = { critical_damage = 1.8, volume = 200.0, integrity_loss_rate = 0.60 },
            failures = {
                { "FUEL_TANK_01_MINOR_LEAK",  0.50 },
                { "FUEL_TANK_01_MEDIUM_LEAK", 0.35 },
                { "FUEL_TANK_01_MAJOR_LEAK",  0.25 },
                { "FUEL_TANK_01_FIRE",        0.35 },
                { "FUEL_TANK_01_EXPLODED",    0.10 },
            },
            innards = {
                { id = "XSparWLHIn0", skin = "Aluminum", wall = 0.010, plenum = 0.25, durability = 1.20 },
                { id = "XSparWLHIn1", skin = "Aluminum", wall = 0.010, plenum = 0.25, durability = 1.20 },
                { id = "XFuelTank1",  skin = "Aluminum", wall = 0.002, plenum = 0.70 },
            },
        },
        ["WING_L_CENTER"] = {
            critical_damage = 6.5,
            damage_boundary = 0.15,
            droppable = true,
            construction = { durability = 2.0, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam" },
            children = { "WING_L_OUT", "FLAP_L_OUT" },
            fuel_tank = { critical_damage = 1.5, volume = 150.0, integrity_loss_rate = 0.60 },
            failures = {
                { "FUEL_TANK_03_MINOR_LEAK",  0.50 },
                { "FUEL_TANK_03_MAJOR_LEAK",  0.25 },
                { "FUEL_TANK_03_FIRE",        0.35 },
            },
            innards = {
                { id = "XSparWLHMid0", skin = "Aluminum", wall = 0.009, plenum = 0.25, durability = 1.10 },
                { id = "XSparWLHMid1", skin = "Aluminum", wall = 0.009, plenum = 0.25, durability = 1.10 },
                { id = "XFuelTank3",   skin = "Aluminum", wall = 0.002, plenum = 0.65 },
                { id = "XCtrlLineAileronLH", skin = "Steel", wall = 0.002, plenum = 0.001 },
            },
        },
        ["WING_L_OUT"] = {
            critical_damage = 4.5,
            damage_boundary = 0.15,
            droppable = true,
            construction = { durability = 1.5, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam" },
            children = { "AILERON_L" },
            innards = {
                { id = "XSparWLHOut0", skin = "Aluminum", wall = 0.007, plenum = 0.20, durability = 0.90 },
                { id = "XSparWLHOut1", skin = "Aluminum", wall = 0.007, plenum = 0.20, durability = 0.90 },
            },
        },
        ["AILERON_L"] = {
            critical_damage = 1.8,
            damage_boundary = 0.50,
            droppable = true,
            construction = { durability = 0.8, skin = "Fabric", thickness = 0.0005, spar = "Truss" },
        },
        ["FLAP_L_IN"] = {
            critical_damage = 2.2,
            damage_boundary = 0.50,
            droppable = false,
            construction = { durability = 1.1, skin = "Aluminum", thickness = 0.0008 },
        },
        ["FLAP_L_OUT"] = {
            critical_damage = 2.2,
            damage_boundary = 0.50,
            droppable = false,
            construction = { durability = 1.1, skin = "Aluminum", thickness = 0.0008 },
        },

        -- =====================================================================
        -- 6. STARBOARD (RIGHT) WING & CONTROL SURFACES
        -- =====================================================================
        ["WING_R_IN"] = {
            critical_damage = 8.0,
            damage_boundary = 0.15,
            droppable = true,
            construction = { durability = 2.4, skin = "Aluminum", thickness = 0.0012, spar = "FlangeBeam" },
            children = { "WING_R_CENTER", "MTG_R", "FLAP_R_IN" },
            fuel_tank = { critical_damage = 1.8, volume = 200.0, integrity_loss_rate = 0.60 },
            failures = {
                { "FUEL_TANK_02_MINOR_LEAK",  0.50 },
                { "FUEL_TANK_02_MEDIUM_LEAK", 0.35 },
                { "FUEL_TANK_02_MAJOR_LEAK",  0.25 },
                { "FUEL_TANK_02_FIRE",        0.35 },
                { "FUEL_TANK_02_EXPLODED",    0.10 },
            },
            innards = {
                { id = "XSparWRHIn0", skin = "Aluminum", wall = 0.010, plenum = 0.25, durability = 1.20 },
                { id = "XSparWRHIn1", skin = "Aluminum", wall = 0.010, plenum = 0.25, durability = 1.20 },
                { id = "XFuelTank2",  skin = "Aluminum", wall = 0.002, plenum = 0.70 },
            },
        },
        ["WING_R_CENTER"] = {
            critical_damage = 6.5,
            damage_boundary = 0.15,
            droppable = true,
            construction = { durability = 2.0, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam" },
            children = { "WING_R_OUT", "FLAP_R_OUT" },
            fuel_tank = { critical_damage = 1.5, volume = 150.0, integrity_loss_rate = 0.60 },
            failures = {
                { "FUEL_TANK_04_MINOR_LEAK",  0.50 },
                { "FUEL_TANK_04_MAJOR_LEAK",  0.25 },
                { "FUEL_TANK_04_FIRE",        0.35 },
            },
            innards = {
                { id = "XSparWRHMid0", skin = "Aluminum", wall = 0.009, plenum = 0.25, durability = 1.10 },
                { id = "XSparWRHMid1", skin = "Aluminum", wall = 0.009, plenum = 0.25, durability = 1.10 },
                { id = "XFuelTank4",   skin = "Aluminum", wall = 0.002, plenum = 0.65 },
                { id = "XCtrlLineAileronRH", skin = "Steel", wall = 0.002, plenum = 0.001 },
            },
        },
        ["WING_R_OUT"] = {
            critical_damage = 4.5,
            damage_boundary = 0.15,
            droppable = true,
            construction = { durability = 1.5, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam" },
            children = { "AILERON_R" },
            innards = {
                { id = "XSparWRHOut0", skin = "Aluminum", wall = 0.007, plenum = 0.20, durability = 0.90 },
                { id = "XSparWRHOut1", skin = "Aluminum", wall = 0.007, plenum = 0.20, durability = 0.90 },
            },
        },
        ["AILERON_R"] = {
            critical_damage = 1.8,
            damage_boundary = 0.50,
            droppable = true,
            construction = { durability = 0.8, skin = "Fabric", thickness = 0.0005, spar = "Truss" },
        },
        ["FLAP_R_IN"] = {
            critical_damage = 2.2,
            damage_boundary = 0.50,
            droppable = false,
            construction = { durability = 1.1, skin = "Aluminum", thickness = 0.0008 },
        },
        ["FLAP_R_OUT"] = {
            critical_damage = 2.2,
            damage_boundary = 0.50,
            droppable = false,
            construction = { durability = 1.1, skin = "Aluminum", thickness = 0.0008 },
        },

        -- =====================================================================
        -- 7. TAIL SECTION & EMPENNAGE
        -- =====================================================================
        ["TAIL_LEFT_SIDE"] = {
            critical_damage = 5.0,
            damage_boundary = 0.20,
            droppable = false,
            construction = { durability = 1.6, skin = "Aluminum", thickness = 0.0009 },
            children = { "TAIL" },
            innards = {
                { id = "XGun-102",          skin = "Steel", wall = 0.005 },  -- rear 7.92 mm Type 98
                { id = "XCtrlLineElevator", skin = "Steel", wall = 0.002, plenum = 0.001 },
            },
        },
        ["TAIL_RIGHT_SIDE"] = {
            critical_damage = 5.0,
            damage_boundary = 0.20,
            droppable = false,
            construction = { durability = 1.6, skin = "Aluminum", thickness = 0.0009 },
            innards = {
                { id = "XCtrlLineRudder", skin = "Steel", wall = 0.002, plenum = 0.001 },
            },
        },
        ["TAIL"] = {
            critical_damage = 6.0,
            damage_boundary = 0.20,
            droppable = true,
            construction = { durability = 2.0, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam" },
            children = { "FIN_L_BOTTOM", "STABILIZER_L_IN", "STABILIZER_R_IN", "WHEEL_REAR" },
        },
        ["FIN_L_BOTTOM"] = {
            critical_damage = 4.0,
            damage_boundary = 0.20,
            droppable = true,
            construction = { durability = 1.5, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam" },
            children = { "FIN_L_TOP" },
            innards = {
                { id = "XSparKeelIn", plenum = 0.25, skin = "Aluminum", wall = 0.005 },
            },
        },
        ["FIN_L_TOP"] = {
            critical_damage = 3.0,
            damage_boundary = 0.20,
            droppable = true,
            construction = { durability = 1.3, skin = "Aluminum", thickness = 0.0007, spar = "FlangeBeam" },
            children = { "RUDDER" },
            innards = {
                { id = "XSparKeelOut", plenum = 0.25, skin = "Aluminum", wall = 0.004 },
            },
        },
        ["RUDDER"] = {
            critical_damage = 2.0,
            damage_boundary = 0.50,
            droppable = true,
            construction = { durability = 0.8, skin = "Fabric", thickness = 0.0005 },
        },
        ["STABILIZER_L_IN"] = {
            critical_damage = 4.0,
            damage_boundary = 0.20,
            droppable = true,
            construction = { durability = 1.5, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam" },
            children = { "STABILIZER_L_OUT", "ELEVATOR_L_IN" },
            innards = {
                { id = "XSparStabLHIn", skin = "Aluminum", wall = 0.005 },
            },
        },
        ["STABILIZER_L_OUT"] = {
            critical_damage = 3.0,
            damage_boundary = 0.20,
            droppable = true,
            construction = { durability = 1.3, skin = "Aluminum", thickness = 0.0007, spar = "FlangeBeam" },
        },
        ["ELEVATOR_L_IN"] = {
            critical_damage = 2.0,
            damage_boundary = 0.50,
            droppable = true,
            construction = { durability = 0.8, skin = "Fabric", thickness = 0.0005 },
        },
        ["STABILIZER_R_IN"] = {
            critical_damage = 4.0,
            damage_boundary = 0.20,
            droppable = true,
            construction = { durability = 1.5, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam" },
            children = { "STABILIZER_R_OUT", "ELEVATOR_R_IN" },
            innards = {
                { id = "XSparStabRHIn", skin = "Aluminum", wall = 0.005 },
            },
        },
        ["STABILIZER_R_OUT"] = {
            critical_damage = 3.0,
            damage_boundary = 0.20,
            droppable = true,
            construction = { durability = 1.3, skin = "Aluminum", thickness = 0.0007, spar = "FlangeBeam" },
        },
        ["ELEVATOR_R_IN"] = {
            critical_damage = 2.0,
            damage_boundary = 0.50,
            droppable = true,
            construction = { durability = 0.8, skin = "Fabric", thickness = 0.0005 },
        },

        -- =====================================================================
        -- 8. UNDERCARRIAGE
        -- =====================================================================
        ["GEAR_L"] = {
            critical_damage = 3.0,
            droppable = false,
            construction = { durability = 1.8, skin = "Steel", thickness = 0.0050, spar = "Rod" },
            children = { "WHEEL_L" },
            innards = {
                { id = "XUCShockLH", skin = "Steel", wall = 0.006 },
            },
        },
        ["GEAR_R"] = {
            critical_damage = 3.0,
            droppable = false,
            construction = { durability = 1.8, skin = "Steel", thickness = 0.0050, spar = "Rod" },
            children = { "WHEEL_R" },
            innards = {
                { id = "XUCShockRH", skin = "Steel", wall = 0.006 },
            },
        },
        ["WHEEL_L"] = {
            critical_damage = 3.0,
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = { durability = 1.8, skin = "Steel", thickness = 0.0050, spar = "Rod" },
            innards = {
                { id = "XUCWheelDrumLH", skin = "Steel", wall = 0.006 },
            },
        },
        ["WHEEL_R"] = {
            critical_damage = 3.0,
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = { durability = 1.8, skin = "Steel", thickness = 0.0050, spar = "Rod" },
            innards = {
                { id = "XUCWheelDrumRH", skin = "Steel", wall = 0.006 },
            },
        },
        ["WHEEL_REAR"] = {
            critical_damage = 2.0,
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = { durability = 1.4, skin = "Steel", thickness = 0.0040, spar = "Rod" },
        },
    }),

    DamageParts = {},

-- ------------------------------------------------------------------------------------------------------------
-- 5. LIGHTS (positions measured on the model; no BANO connectors in the EDM yet)
-- ------------------------------------------------------------------------------------------------------------
    lights_data = {
        typename = "collection",
        lights = {
            [1] = {},
            [2] = {},
            [3] = {
                typename = "collection",
                lights = {
                    { typename = "omnilight", color = {0.32, 0.0, 0.07}, position = { 0.045, 0.670, -7.404}, argument = 190 }, -- left, red (on the wing tip)
                    { typename = "omnilight", color = {0.0, 0.26, 0.18}, position = { 0.045, 0.670,  7.404}, argument = 191 }, -- right, green (on the wing tip)
                    { typename = "omnilight", color = {0.8, 0.8, 0.8},   position = {-7.85,  0.25,   0.0},   argument = 203 }, -- tail, white
                },
            },
            [4] = {},
            [5] = {},
        },
    },
}

add_aircraft(Ki45_KAIc)
