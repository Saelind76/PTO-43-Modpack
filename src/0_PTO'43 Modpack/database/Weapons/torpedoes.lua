-- ============================================================================
-- Imperial Japanese Navy Type 93 ("Long Lance") 610mm Oxygen Naval Torpedo
-- Standardized for DCS World (JP_*)
--
-- HISTORICAL & TECHNICAL SPECIFICATIONS:
-- - Type: Type 93 Model 1 Mod 2 (Pure oxygen wet-heater)
-- - Caliber: 610 mm (24.0 in)
-- - Length: 9.00 m (29 ft 6 in)
-- - Weight: 2,700 kg (5,952 lb)
-- - Warhead: 490 kg (1,080 lb) Type 97 explosive (HND + TNT)
-- - Speed & Range settings:
--     * Fast: 48 knots (24.7 m/s) to 20,000 m
--     * Medium: 40 knots (20.6 m/s) to 32,000 m
--     * Slow: 36 knots (18.5 m/s) to 40,000 m
-- ============================================================================

local _ = _ or function(str) return str end

_G.IJN_Weapons_Declared = _G.IJN_Weapons_Declared or {}
_G.PTO_NavalWeapons_Declared = _G.PTO_NavalWeapons_Declared or {}
if _G.IJN_Weapons_Declared["JP_610mm_Type93"] or _G.PTO_NavalWeapons_Declared["JP_610mm_Type93"] then
    return
end

local type93_warhead = {
    mass                 = 490.0,
    caliber              = 610,
    expl_mass            = 490.0,
    piercing_mass        = 98.0,
    fantom               = 0,
    other_factors        = { 4.0, 4.0, 4.0 },
    concrete_factors     = { 8.0, 8.0, 20.0 },
    concrete_obj_factor  = 8.0,
    obj_factors          = { 8.0, 8.0 },
    cumulative_factor    = 4.0,
    cumulative_thickness = 0.5,
    time_self_destruct   = 1100,
}

JP_610mm_Type93 = {
    category            = CAT_TORPEDOES or 4,
    name                = "JP_610mm_Type93",
    user_name           = _("Type 93 610mm Torpedo (Long Lance)"),
    display_name_short  = "Type 93",
    scheme              = "unguided_preset_torpedo",
    class_name          = "wAmmunition",
    model               = "Torpedo_G7A_T1",
    mass                = 2700.0,

    wsTypeOfWeapon      = {
        wsType_Weapon or 4,
        wsType_Torpedo or 8,
        wsType_S_Torpedo or 11,
        WSTYPE_PLACEHOLDER
    },

    Head_Type           = 0,
    Diam                = 610.0,
    D_max               = 15000.0,
    D_min               = 250.0,
    V_min               = -1.0,
    V_max               = 300.0,
    H_max               = 25.0,             -- High vertical tolerance to engage all surface vessels
    H_min               = -100.0,
    Life_Time           = 1100.0,
    Nr_max              = 2.0,
    v_mid               = 24.7,             -- 48 knots combat speed

    shape_table_data = {
        {
            name     = "JP_610mm_Type93",
            file     = "Torpedo_G7A_T1",    -- Stock DCS WWII torpedo EDM
            life     = 1,
            fire     = {0, 1},
            username = _("Type 93 610mm Torpedo"),
            index    = WSTYPE_PLACEHOLDER,
        },
    },

    fm = {
        mass         = 2700.0,
        caliber      = 0.610,
        cx_coeff     = {1, 0.39, 0.38, 0.236, 1.31},
        L            = 9.0,
        I            = 1 / 12 * 2700.0 * 9.0 * 9.0,
        Ma           = 0.2,
        Ma_x         = 0.1,
        Mw           = 0.4,
        Mw_x         = 0.01,
        Sw           = 0.5,
        Sww          = 0.5,
        dCydA        = {0.07, 0.036},
        A            = 0.5,
        maxAoa       = 0.3,
        finsTau      = 0.02,
        fins_val_div = 10000,
        int_rho_y    = 0.5,
        rho_w        = 517,
        splash_time  = 0.5,
        splash_dt    = 0.004,
        wind_sigma   = 0.0,
        wind_time    = 0.0,
    },

    autopilot = {
        delay                = 2.0,
        Kpv                  = 0.03,
        Kdv                  = 0.0,
        Kiv                  = 0.00002,
        Kph                  = 28.0,
        Kdh                  = 3.0,
        Kih                  = 0.0,
        steady_depth         = 3.0,          -- Runs at 3m depth to impact warship hull
        hKp_err_croll        = 0.0,
        roll_diff_correction = 1,
        fins_limit           = 0.25,
        x_fins_limit         = 0.0,
        vel_proj_div         = 10.0,
        v_vel_limit          = 25.0,
        hor_spir_on_time     = 0,
        hor_spir_period      = 0,
        hor_spir_power       = 0,
    },

    engine = {
        data_table     = {6600, 900, 12500, 500, 15000, 300},
        default_thrust = 12500,
        rail_thrust    = 6500,
    },

    warhead       = type93_warhead,
    warhead_water = type93_warhead,
}

if not (_G.IJN_Weapons_Declared[JP_610mm_Type93.name] or _G.PTO_NavalWeapons_Declared[JP_610mm_Type93.name]) then
    if declare_weapon then
        declare_weapon(JP_610mm_Type93)
        if type(JP_610mm_Type93.ws_type) == "table" and type(JP_610mm_Type93.ws_type[4]) == "number" then
            JP_610mm_Type93.wsTypeOfWeapon = JP_610mm_Type93.ws_type
        end
    end
    _G.IJN_Weapons_Declared[JP_610mm_Type93.name] = true
    _G.PTO_NavalWeapons_Declared[JP_610mm_Type93.name] = true
end
