-- ============================================================================================================

-- Guard to prevent duplicate loading
-- PTO '43 MODPACK - MASTER CENTRALIZED NAVAL AMMUNITION & TORPEDO REPERTOIRE
-- File: PTO43_ship_ammo.lua
-- Load via dofile() in entry.lua BEFORE any ship / gun mount definitions.
-- Supports both canonical PTO'43 (IJN_* / USN_* / PTO_*) and template (JP_*) namespaces.
-- ============================================================================================================

-- Guard to prevent duplicate loading

local _ = _ or function(str) return str end
local CAT_SHELLS    = CAT_SHELLS or 6
local CAT_TORPEDOES = CAT_TORPEDOES or 4

-- Unified global registries to prevent "DUPLICATE not allowed" crashes across standalone & pack mods
_G.PTO_NavalWeapons_Declared = _G.PTO_NavalWeapons_Declared or {}
_G.IJN_Weapons_Declared      = _G.IJN_Weapons_Declared or {}

-- Deep copy: every alias needs its OWN sub-tables (aiming_table, cx, warhead...).
-- DCS consumes/modifies aiming_table when it declares a shell, so a shared table
-- leaves the alias without "weapons.shells_aiming.<name>" -> "Failed to create ship".
local function deep_copy(orig)
    if type(orig) ~= "table" then return orig end
    local copy = {}
    for k, v in pairs(orig) do
        copy[k] = deep_copy(v)
    end
    return copy
end

local function safe_declare_naval_weapon(tbl, aliases)
    if not tbl or not tbl.name then return end

    -- Enforce mandatory DCS 2.9+ CAT_SHELLS fields when declaring shells
    if (tbl.category or CAT_SHELLS) == CAT_SHELLS then
        tbl.category       = CAT_SHELLS
        tbl.type_name      = tbl.type_name or "shell"
        tbl.cartridge      = tbl.cartridge or 0
        tbl.cartridge_mass = tbl.cartridge_mass or 0
        tbl.Da0            = tbl.Da0 or 0.0004
        tbl.Da1            = tbl.Da1 or 0.0002
        tbl.Dv0            = tbl.Dv0 or 0.0030
        tbl.s              = tbl.s or 0.0
        tbl.j              = tbl.j or 0.0
        tbl.l              = tbl.l or 0.0
        tbl.charTime       = tbl.charTime or 0
    end

    -- Pristine snapshot taken BEFORE declare_weapon touches the table
    local template = deep_copy(tbl)

    if not (_G.PTO_NavalWeapons_Declared[tbl.name] or _G.IJN_Weapons_Declared[tbl.name]) then
        if declare_weapon then declare_weapon(tbl) end
        _G.PTO_NavalWeapons_Declared[tbl.name] = true
        _G.IJN_Weapons_Declared[tbl.name]      = true
    end

    -- Register backwards-compatible aliases (e.g. JP_* <-> IJN_*) safely
    if aliases then
        for _, alias_name in ipairs(aliases) do
            if not (_G.PTO_NavalWeapons_Declared[alias_name] or _G.IJN_Weapons_Declared[alias_name]) then
                local alias_tbl = deep_copy(template)
                alias_tbl.name = alias_name
                if declare_weapon then declare_weapon(alias_tbl) end
                _G.PTO_NavalWeapons_Declared[alias_name] = true
                _G.IJN_Weapons_Declared[alias_name]      = true
            end
        end
    end

    return tbl
end

-- Legacy fallback guard in case an older standalone script invokes declare_shell() directly
declare_shell = declare_shell or function(tbl)
    return safe_declare_naval_weapon(tbl)
end

-- ============================================================================================================

-- Guard to prevent duplicate loading
-- 1. HEAVY BATTLESHIP BATTERIES (410mm, 406mm & 356mm)
-- ============================================================================================================

-- Guard to prevent duplicate loading

-- IJN 410mm (16.1"/45) Type 91 AP Shell (Nagato / Mutsu)
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "IJN_410mm_Type91_AP",
    user_name       = _("410mm Type 91 AP (Nagato)"),
    AP_cap_caliber  = 410,
    aiming_table    = { { init_vel = 790.0 }, precalculateAimingTable = true },
    model_name      = "pula",
    mass            = 1020.0, round_mass = 1020.0, explosive = 14.9, v0 = 790.0,
    Da0             = 0.0009, Da1 = 0.00040, Dv0 = 0.0028, damage_factor = 1450, life_time = 130.0, caliber = 410.0,
    piercing_mass   = 816.0,
    s = 0.035, j = 0.0, l = 1.73, charTime = 0, cx = {1.25, 0.58, 0.70, 0.15, 2.10}, k1 = 2.3e-09,
    tracer_off      = 100.0, scale_tracer = 0, rotation_freq = 5, cartridge = 0, cartridge_mass = 0, type_name = "shell",
}, {"JP_410mm_Type91_AP"})

-- IJN 410mm (16.1"/45) Type 0 Common / HE Shell (Nagato / Mutsu)
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "IJN_410mm_Type0_HE",
    user_name       = _("410mm Type 0 HE (Nagato)"),
    AP_cap_caliber  = 410,
    aiming_table    = { { init_vel = 805.0 }, precalculateAimingTable = true },
    model_name      = "pula",
    mass            = 938.5, round_mass = 938.5, explosive = 44.5, v0 = 805.0,
    Da0             = 0.0009, Da1 = 0.00040, Dv0 = 0.0028, damage_factor = 920, life_time = 120.0, caliber = 410.0,
    piercing_mass   = 281.5,
    s = 0.035, j = 0.0, l = 1.60, charTime = 0, cx = {1.25, 0.58, 0.70, 0.15, 2.10}, k1 = 2.3e-09,
    tracer_off      = 100.0, scale_tracer = 0, rotation_freq = 5, cartridge = 0, cartridge_mass = 0, type_name = "shell",
}, {"JP_410mm_Type0_HE"})

-- IJN 356mm (14"/45) Type 91 AP Shell (Kongo / Haruna / Kirishima / Hiei)
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "IJN_356mm_Type91_AP",
    user_name       = _("356mm Type 91 AP (Haruna/Kongo)"),
    AP_cap_caliber  = 356,
    aiming_table    = { { init_vel = 775.0 }, precalculateAimingTable = true },
    model_name      = "pula",
    mass            = 673.5, round_mass = 673.5, explosive = 14.9, v0 = 775.0,
    Da0             = 0.00045, Da1 = 0.00020, Dv0 = 0.0030, damage_factor = 1150, life_time = 110.0, caliber = 356.0,
    piercing_mass   = 538.8,
    s = 0.035, j = 0.0, l = 1.52, charTime = 0, cx = {1.25, 0.60, 0.68, 0.16, 2.05}, k1 = 2.6e-09,
    tracer_off      = 90.0, tracer_on = 0.0, scale_tracer = 0, scale_smoke = 1.0, rotation_freq = 5,
    visual_effect_correction = 1.0, cartridge = 0, cartridge_mass = 0, type_name = "shell",
}, {"JP_356mm_Type91_AP"})

-- IJN 356mm (14"/45) Type 0 HE Shell (Kongo / Haruna / Kirishima / Hiei)
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "IJN_356mm_Type0_HE",
    user_name       = _("356mm Type 0 HE (Haruna/Kongo)"),
    AP_cap_caliber  = 356,
    aiming_table    = { { init_vel = 805.0 }, precalculateAimingTable = true },
    model_name      = "pula",
    mass            = 625.0, round_mass = 625.0, explosive = 55.2, v0 = 805.0,
    Da0             = 0.00045, Da1 = 0.00020, Dv0 = 0.0030, damage_factor = 780, life_time = 110.0, caliber = 356.0,
    piercing_mass   = 187.5,
    s = 0.035, j = 0.0, l = 1.48, charTime = 0, cx = {1.25, 0.62, 0.70, 0.17, 2.05}, k1 = 2.7e-09,
    tracer_off      = 90.0, tracer_on = 0.0, scale_tracer = 0, scale_smoke = 1.0, rotation_freq = 5,
    visual_effect_correction = 1.0, cartridge = 0, cartridge_mass = 0, type_name = "shell",
}, {"JP_356mm_Type0_HE"})

-- USN 16-inch (406mm) AP Mark 8 "Super Heavy" (Massachusetts, Iowa, North Carolina)
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "406_Mk8_AP",
    user_name       = _("406mm AP Mk 8 (USN BB)"),
    AP_cap_caliber  = 406,
    aiming_table    = { { init_vel = 701.0 }, precalculateAimingTable = true },
    model_name      = "pula",
    mass            = 1225.0, round_mass = 1225.0, explosive = 18.5, v0 = 701.0,
    Da0             = 0.001, Da1 = 0.00044, Dv0 = 0.003, damage_factor = 1500, life_time = 120.0, caliber = 406.0,
    s = 0.0, j = 0.0, l = 0.0, charTime = 0, cx = {1.3, 0.60, 0.75, 0.16, 2.20}, k1 = 2.5e-09,
    tracer_off      = 100.0, scale_tracer = 0, rotation_freq = 0, cartridge = 0, cartridge_mass = 0, type_name = "shell",
}, {"USN_406mm_Mk8_AP"})

-- USN 16-inch (406mm) HC Mark 13 High Capacity HE
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "406_Mk13HC_HE",
    user_name       = _("406mm HC Mk 13 (USN BB)"),
    AP_cap_caliber  = 406,
    aiming_table    = { { init_vel = 820.0 }, precalculateAimingTable = true },
    model_name      = "pula",
    mass            = 860.0, round_mass = 860.0, explosive = 297.1, v0 = 820.0,
    Da0             = 0.001, Da1 = 0.00044, Dv0 = 0.003, damage_factor = 639, life_time = 100.0, caliber = 406.0,
    s = 0.0, j = 0.0, l = 0.0, charTime = 0, cx = {1.3, 0.60, 0.75, 0.16, 2.20}, k1 = 2.5e-09,
    tracer_off      = 100.0, scale_tracer = 0, rotation_freq = 0, cartridge = 0, cartridge_mass = 0, type_name = "shell",
}, {"USN_406mm_Mk13HC_HE"})

-- ============================================================================================================

-- Guard to prevent duplicate loading
-- 2. HEAVY CRUISER BATTERIES (203mm / 8-inch)
-- ============================================================================================================

-- Guard to prevent duplicate loading

-- IJN 203mm (8"/50) Type 91 AP Shell (Mogami, Kumano, Takao, Myoko, Tone)
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "IJN_203mm_Type91_AP",
    user_name       = _("203mm Type 91 AP (Mogami)"),
    AP_cap_caliber  = 203,
    aiming_table    = { { init_vel = 840.0 }, precalculateAimingTable = true },
    model_name      = "tracer_bullet_yellow",
    mass            = 125.85, round_mass = 125.85, cartridge_mass = 33.8, explosive = 3.1, v0 = 840.0,
    Da0             = 0.0005, Da1 = 0.00025, Dv0 = 0.0024, damage_factor = 320, life_time = 95.0, caliber = 203.2,
    piercing_mass   = 100.7,
    s = 0.0324, j = 0.0, l = 0.86, charTime = 0, cx = { 1.0, 0.72, 0.58, 0.28, 1.8 }, k1 = 1.6e-09,
    tracer_off      = 100.0, scale_tracer = 1.5, rotation_freq = 6, cartridge = 0, type_name = "shell",
}, {"JP_203mm_Type91_AP"})

-- IJN 203mm (8"/50) Type 0 HE Shell (Mogami, Kumano, Takao, Myoko)
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "IJN_203mm_Type0_HE",
    user_name       = _("203mm Type 0 HE (Mogami)"),
    AP_cap_caliber  = 203,
    aiming_table    = { { init_vel = 835.0 }, precalculateAimingTable = true },
    model_name      = "tracer_bullet_yellow",
    mass            = 125.85, round_mass = 125.85, cartridge_mass = 33.8, explosive = 8.17, v0 = 835.0,
    Da0             = 0.0005, Da1 = 0.00025, Dv0 = 0.0025, damage_factor = 260, life_time = 95.0, caliber = 203.2,
    piercing_mass   = 37.8,
    s = 0.0324, j = 0.0, l = 0.86, charTime = 0, cx = { 1.0, 0.74, 0.60, 0.30, 1.8 }, k1 = 1.7e-09,
    tracer_off      = 100.0, scale_tracer = 1.5, rotation_freq = 6, cartridge = 0, type_name = "shell",
}, {"JP_203mm_Type0_HE", "PTO_203mm_HE_Type0"})

-- USN 8-inch (203mm/55) AP Mark 21 "Super Heavy" (Baltimore, Wichita, New Orleans)
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "USN_203mm_Mk21_AP",
    user_name       = _("8-inch Mk 21 AP (Baltimore)"),
    AP_cap_caliber  = 203,
    aiming_table    = { { init_vel = 762.0 }, precalculateAimingTable = true },
    model_name      = "tracer_bullet_red",
    mass            = 152.0, round_mass = 152.0, explosive = 2.3, v0 = 762.0,
    Da0             = 0.0005, Da1 = 0.0006, Dv0 = 0.003, damage_factor = 360, life_time = 75.0, caliber = 203.2,
    s = 0.0324, j = 0.0, l = 0.94, charTime = 0, cx = { 1.1, 0.70, 0.65, 0.30, 1.9 }, k1 = 2.0e-08,
    tracer_off      = 100.0, scale_tracer = 1.5, rotation_freq = 0, cartridge = 0, cartridge_mass = 0, type_name = "shell",
})

-- ============================================================================================================

-- Guard to prevent duplicate loading
-- 3. SECONDARY & LIGHT CRUISER BATTERIES (155mm, 152mm & 140mm)
-- ============================================================================================================

-- Guard to prevent duplicate loading

-- IJN 155mm (6.1"/60) Type 91 AP (Mogami 1939 config, Yamato secondary, Oyodo)
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "IJN_155mm_Type91_AP",
    user_name       = _("155mm Type 91 AP (IJN CL)"),
    AP_cap_caliber  = 155,
    aiming_table    = { { init_vel = 920.0 }, precalculateAimingTable = true },
    model_name      = "pula",
    mass            = 55.87, round_mass = 55.87, explosive = 1.15, v0 = 920.0,
    Da0             = 0.0004, Da1 = 0.0005, Dv0 = 0.003, damage_factor = 180, life_time = 60.0, caliber = 155.0,
    s = 0.02, j = 0.0, l = 0.68, charTime = 0, cx = { 0.8, 0.60, 0.65, 0.25, 1.6 }, k1 = 1.5e-08,
    tracer_off      = 80.0, scale_tracer = 1.2, rotation_freq = 0, cartridge = 0, cartridge_mass = 0, type_name = "shell",
}, {"JP_155mm_Type91_AP"})

-- IJN 152mm (6"/50) Type 41 HE (Kongo / Haruna secondary casemate battery, Agano)
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "IJN_152mm_Type41_HE",
    user_name       = _("152mm Type 41 HE (Haruna Casemate)"),
    AP_cap_caliber  = 152,
    aiming_table    = { { init_vel = 850.0 }, precalculateAimingTable = true },
    model_name      = "pula",
    mass            = 45.4, round_mass = 45.4, explosive = 3.4, v0 = 850.0,
    Da0             = 0.0004, Da1 = 0.00025, Dv0 = 0.0032, damage_factor = 165, life_time = 60.0, caliber = 152.0,
    piercing_mass   = 13.6,
    s = 0.02, j = 0.0, l = 0.65, charTime = 0, cx = { 0.85, 0.60, 0.65, 0.25, 1.70 }, k1 = 1.6e-08,
    tracer_off      = 60.0, tracer_on = 0.01, scale_tracer = 1.0, scale_smoke = 0.6, rotation_freq = 8,
    visual_effect_correction = 1.0, cartridge = 0, cartridge_mass = 0, type_name = "shell",
}, {"JP_152mm_Type41_HE"})

-- IJN 140mm (5.5"/50) Type 3 AP/Common (Nagato casemate guns, Katori, Kuma/Nagara)
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "IJN_140mm_Type3_AP",
    user_name       = _("140mm Type 3 (Nagato Casemate)"),
    AP_cap_caliber  = 140,
    aiming_table    = { { init_vel = 850.0 }, precalculateAimingTable = true },
    model_name      = "pula",
    mass            = 38.0, round_mass = 38.0, explosive = 2.0, v0 = 850.0,
    Da0             = 0.0004, Da1 = 0.0005, Dv0 = 0.0035, damage_factor = 140, life_time = 50.0, caliber = 140.0,
    s = 0.015, j = 0.0, l = 0.55, charTime = 0, cx = { 0.8, 0.60, 0.65, 0.25, 1.6 }, k1 = 1.4e-08,
    tracer_off      = 60.0, scale_tracer = 1.0, rotation_freq = 0, cartridge = 0, cartridge_mass = 0, type_name = "shell",
}, {"JP_140mm_Type3_AP"})

-- USN 6-inch (152mm/47) AP Mark 35 (Cleveland, Brooklyn)
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "USN_152mm_Mk35_AP",
    user_name       = _("6-inch Mk 35 AP (Cleveland)"),
    AP_cap_caliber  = 152,
    aiming_table    = { { init_vel = 762.0 }, precalculateAimingTable = true },
    model_name      = "pula",
    mass            = 59.0, round_mass = 59.0, explosive = 0.9, v0 = 762.0,
    Da0             = 0.0004, Da1 = 0.0005, Dv0 = 0.003, damage_factor = 190, life_time = 65.0, caliber = 152.0,
    s = 0.02, j = 0.0, l = 0.70, charTime = 0, cx = { 0.85, 0.60, 0.65, 0.25, 1.7 }, k1 = 1.6e-08,
    tracer_off      = 75.0, scale_tracer = 1.2, rotation_freq = 0, cartridge = 0, cartridge_mass = 0, type_name = "shell",
})

-- ============================================================================================================

-- Guard to prevent duplicate loading
-- 4. DESTROYER & DUAL PURPOSE BATTERIES (127mm & 100mm)
-- ============================================================================================================

-- Guard to prevent duplicate loading

-- IJN 127mm (5"/50) Type 3 HE (Fubuki, Kagero, Yugumo, Shimakaze Destroyers)
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "IJN_127mm_Type3_HE",
    user_name       = _("127mm Type 3 HE (Fubuki DD)"),
    AP_cap_caliber  = 127,
    aiming_table    = { { init_vel = 910.0 }, precalculateAimingTable = true, precalculateAirDefenceAimingTable = true },
    model_name      = "tracer_bullet_yellow",
    mass            = 23.0, round_mass = 23.0, explosive = 2.2, v0 = 910.0,
    Da0             = 0.0003, Da1 = 0.0005, Dv0 = 0.004, damage_factor = 95, life_time = 45.0, caliber = 127.0,
    s = 0.0, j = 0.0, l = 0.0, charTime = 0, cx = {0.6, 0.45, 0.65, 0.15, 1.5}, k1 = 1.1e-09,
    tracer_off      = 40.0, scale_tracer = 1.5, tracer_on = 0.01, rotation_freq = 0, cartridge = 0, cartridge_mass = 0, type_name = "shell",
}, {"JP_127mm_Type3_HE"})

-- IJN 127mm (5"/40) Type 89 Dual Purpose HE/AA (Nagato, Mogami, Haruna, Zuiho, Zuikaku)
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "IJN_127mm_Type89_HE",
    user_name       = _("127mm Type 89 DP (IJN AA)"),
    AP_cap_caliber  = 127,
    aiming_table    = { { init_vel = 720.0 }, precalculateAimingTable = true, precalculateAirDefenceAimingTable = true },
    model_name      = "tracer_bullet_yellow",
    mass            = 23.0, round_mass = 23.0, cartridge_mass = 11.3, explosive = 1.95, v0 = 720.0,
    Da0             = 0.0003, Da1 = 0.0005, Dv0 = 0.004, damage_factor = 90, life_time = 40.0, caliber = 127.0,
    piercing_mass   = 4.6,
    s = 0.0, j = 0.0, l = 0.0, charTime = 0, cx = {0.6, 0.45, 0.65, 0.15, 1.5}, k1 = 1.1e-09,
    tracer_off      = 35.0, scale_tracer = 1.5, tracer_on = 0.01, rotation_freq = 12, smoke_tail_life_time = 2.0,
    cartridge       = 0, type_name = "shell",
}, {"JP_127mm_Type89_HE", "PTO_127mm_Type89_HE"})

-- IJN 100mm (3.9"/65) Type 98 High-Angle Gun (Akizuki class, Taiho)
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "IJN_100mm_Type98_HE",
    user_name       = _("100mm Type 98 DP (Akizuki)"),
    AP_cap_caliber  = 100,
    aiming_table    = { { init_vel = 1000.0 }, precalculateAimingTable = true, precalculateAirDefenceAimingTable = true },
    model_name      = "tracer_bullet_yellow",
    mass            = 13.0, round_mass = 13.0, explosive = 0.95, v0 = 1000.0,
    Da0             = 0.00025, Da1 = 0.00045, Dv0 = 0.0035, damage_factor = 65, life_time = 35.0, caliber = 100.0,
    s = 0.0, j = 0.0, l = 0.0, charTime = 0, cx = {0.5, 0.40, 0.60, 0.14, 1.4}, k1 = 1.0e-09,
    tracer_off      = 30.0, scale_tracer = 1.5, tracer_on = 0.01, rotation_freq = 0, cartridge = 0, cartridge_mass = 0, type_name = "shell",
}, {"JP_100mm_Type98_HE"})

-- USN 5-inch (127mm/38) AAC Mark 49 VT-Fuze (Massachusetts, Fletcher, Cassin Young, Essex)
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "127_Mk49_AAC",
    user_name       = _("5-inch Mk 49 AAC VT-Fuze (USN)"),
    AP_cap_caliber  = 127,
    aiming_table    = { { init_vel = 792.0 }, precalculateAimingTable = true, precalculateAirDefenceAimingTable = true },
    model_name      = "tracer_bullet_red",
    mass            = 25.0, round_mass = 25.0, explosive = 3.3, v0 = 792.0,
    Da0             = 0.0003, Da1 = 0.0005, Dv0 = 0.004, damage_factor = 639, life_time = 120.0, caliber = 127.0,
    s = 0.0, j = 0.0, l = 0.0, charTime = 0, cx = {0.5, 0.43, 0.7, 0.138, 1.43}, k1 = 1.2e-09,
    tracer_off      = 30.0, scale_tracer = 1.5, tracer_on = 0.01, rotation_freq = 7, cartridge = 0, cartridge_mass = 0, type_name = "shell",
}, {"USN_127mm_Mk49_AAC"})

-- USN 5-inch (127mm/38) Common AP Mark 32 (Fletcher, Cruisers)
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "USN_127mm_Mk32_AP",
    user_name       = _("5-inch Mk 32 Common AP (Fletcher)"),
    AP_cap_caliber  = 127,
    aiming_table    = { { init_vel = 792.0 }, precalculateAimingTable = true },
    model_name      = "tracer_bullet_red",
    mass            = 24.5, round_mass = 24.5, explosive = 1.1, v0 = 792.0,
    Da0             = 0.0003, Da1 = 0.0005, Dv0 = 0.004, damage_factor = 110, life_time = 45.0, caliber = 127.0,
    s = 0.0, j = 0.0, l = 0.0, charTime = 0, cx = {0.5, 0.43, 0.7, 0.138, 1.43}, k1 = 1.2e-09,
    tracer_off      = 30.0, scale_tracer = 1.5, tracer_on = 0.01, rotation_freq = 0, cartridge = 0, cartridge_mass = 0, type_name = "shell",
})

-- ============================================================================================================

-- Guard to prevent duplicate loading
-- 5. ANTI-AIRCRAFT NETWORK (40mm, 25mm, 20mm & 13.2mm)
-- ============================================================================================================

-- Guard to prevent duplicate loading

-- USN 40mm Bofors HE-T
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "PTO_40mm_Bofors_HE",
    user_name       = _("40mm Bofors HE-T"),
    AP_cap_caliber  = 40,
    aiming_table    = { { init_vel = 881.0 }, precalculateAimingTable = true, precalculateAirDefenceAimingTable = true },
    model_name      = "tracer_bullet_red",
    mass            = 0.90, round_mass = 2.10, explosive = 0.068, v0 = 881.0,
    Dv0             = 0.0027, Da0 = 0.00036, Da1 = 0.0009, damage_factor = 35, life_time = 12.0, caliber = 40.0,
    s = 0.0, j = 0.0, l = 0.0, charTime = 0, cx = {1.3, 0.60, 0.75, 0.16, 2.20}, k1 = 9.0e-10,
    tracer_off      = 8.0, scale_tracer = 2.0, tracer_on = 0.01, rotation_freq = 0, cartridge = 0, cartridge_mass = 0, type_name = "shell",
})

-- IJN 25mm/60 Type 96 HE-T / AP-T (Standard IJN light AA across all fleet units)
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "IJN_25mm_Type96_HE",
    user_name       = _("25mm Type 96 HE-T (IJN AA)"),
    AP_cap_caliber  = 25,
    aiming_table    = { { init_vel = 900.0 }, precalculateAimingTable = true, precalculateAirDefenceAimingTable = true },
    model_name      = "tracer_bullet_yellow",
    mass            = 0.25, round_mass = 0.68, cartridge_mass = 0.43, explosive = 0.015, v0 = 900.0,
    Da0             = 0.00038, Da1 = 0.00095, Dv0 = 0.0028, damage_factor = 18, life_time = 9.5, caliber = 25.0,
    piercing_mass   = 0.05,
    s = 0.0, j = 0.0, l = 0.0, charTime = 0, cx = {1.2, 0.55, 0.70, 0.15, 2.0}, k1 = 8.5e-10,
    tracer_off      = 5.5, scale_tracer = 1.2, tracer_on = 0.01, rotation_freq = 18, smoke_tail_life_time = 0.8,
    cartridge       = 0, type_name = "shell",
}, {"JP_25mm_Type96_HE", "PTO_25mm_Type96_HE"})

-- USN 20mm Oerlikon HE-I
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "PTO_20mm_Oerlikon_HE",
    user_name       = _("20mm Oerlikon HE-I"),
    AP_cap_caliber  = 20,
    aiming_table    = { { init_vel = 835.0 }, precalculateAimingTable = true, precalculateAirDefenceAimingTable = true },
    model_name      = "tracer_bullet_red",
    mass            = 0.123, round_mass = 0.240, explosive = 0.011, v0 = 835.0,
    Dv0             = 0.0027, Da0 = 0.00036, Da1 = 0.0009, damage_factor = 12, life_time = 6.0, caliber = 20.0,
    s = 0.0, j = 0.0, l = 0.0, charTime = 0, cx = {1.3, 0.60, 0.75, 0.16, 2.20}, k1 = 9.0e-10,
    tracer_off      = 4.0, scale_tracer = 1.0, tracer_on = 0.01, rotation_freq = 0, cartridge = 0, cartridge_mass = 0, type_name = "shell",
})

-- IJN 13.2mm Type 93 Heavy Machine Gun AA
safe_declare_naval_weapon({
    category        = CAT_SHELLS,
    name            = "IJN_13_2mm_Type93",
    user_name       = _("13.2mm Type 93 (IJN HMG)"),
    AP_cap_caliber  = 13.2,
    aiming_table    = { { init_vel = 800.0 }, precalculateAimingTable = true, precalculateAirDefenceAimingTable = true },
    model_name      = "tracer_bullet_yellow",
    mass            = 0.052, round_mass = 0.118, explosive = 0.0, v0 = 800.0,
    Dv0             = 0.003, Da0 = 0.0004, Da1 = 0.001, damage_factor = 6, life_time = 5.0, caliber = 13.2,
    s = 0.0, j = 0.0, l = 0.0, charTime = 0, cx = {1.3, 0.60, 0.75, 0.16, 2.20}, k1 = 9.0e-10,
    tracer_off      = 3.5, scale_tracer = 0.8, tracer_on = 0.01, rotation_freq = 0, cartridge = 0, cartridge_mass = 0, type_name = "shell",
}, {"JP_13_2mm_Type93"})

-- ============================================================================================================

-- Guard to prevent duplicate loading
-- 6. SHIPBORNE TORPEDOES (610mm IJN Type 93 "Long Lance")
-- ============================================================================================================

-- Guard to prevent duplicate loading

if not (JP_610mm_Type93 and type(JP_610mm_Type93.wsTypeOfWeapon) == "table" and type(JP_610mm_Type93.wsTypeOfWeapon[4]) == "number") then
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
        category           = CAT_TORPEDOES,
        name               = "JP_610mm_Type93",
        user_name          = _("Type 93 610mm Torpedo (Long Lance)"),
        display_name_short = "Type 93",
        scheme             = "unguided_preset_torpedo",
        class_name         = "wAmmunition",
        model              = "Torpedo_G7A_T1",
        mass               = 2700.0,
        wsTypeOfWeapon     = {
            wsType_Weapon or 4,
            wsType_Torpedo or 8,
            wsType_S_Torpedo or 11,
            WSTYPE_PLACEHOLDER or "WSTYPE_PLACEHOLDER",
        },
        Head_Type          = 0,
        Diam               = 610.0,
        D_max              = 15000.0,
        D_min              = 250.0,
        V_min              = -1.0,
        V_max              = 300.0,
        H_max              = 25.0,
        H_min              = -100.0,
        Life_Time          = 1100.0,
        Nr_max             = 2.0,
        v_mid              = 24.7,
        shape_table_data   = {
            {
                name     = "JP_610mm_Type93",
                file     = "Torpedo_G7A_T1",
                life     = 1,
                fire     = {0, 1},
                username = _("Type 93 610mm Torpedo"),
                index    = WSTYPE_PLACEHOLDER or "WSTYPE_PLACEHOLDER",
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
            steady_depth         = 3.0,
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

    safe_declare_naval_weapon(JP_610mm_Type93)
end
