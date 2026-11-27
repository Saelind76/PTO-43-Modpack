-- ============================================================================
-- IJN Cruiser Mogami / Kumano — Naval Shell & Projectile Definitions
-- Standardized for DCS World (JP_*) with safe duplicate-declaration guard
--
-- HISTORICAL & BALLISTIC REFERENCES:
-- 1. Campbell, John (1985). "Naval Weapons of World War Two". Naval Institute Press.
--    - 20cm/50 (203mm) 3rd Year Type No. 2: pp. 185-187.
--    - 12.7cm/40 (127mm) Type 89: pp. 192-193.
--    - 25mm/60 Type 96: pp. 200-202.
-- 2. DiGiulian, Tony. "Naval Weapons of the World" (NavWeaps.com):
--    - Japan 20 cm/50 (8") 3rd Year Type No. 2
--    - Japan 12.7 cm/40 (5") Type 89
--    - Japan 25 mm/60 (1") Type 96
-- ============================================================================

local _ = _ or function(str) return str end
local CAT_SHELLS = CAT_SHELLS or 6

_G.IJN_Weapons_Declared = _G.IJN_Weapons_Declared or {}
local function safe_declare_shell(tbl)
    if not tbl or not tbl.name then return end
    if _G.IJN_Weapons_Declared[tbl.name] then return end
    if declare_weapon then declare_weapon(tbl) end
    _G.IJN_Weapons_Declared[tbl.name] = true
    return tbl
end

-- ============================================================================
-- 20.3cm (203mm/50) 3rd Year Type No. 2 Projectiles (Main Battery)
-- Shell mass: 125.85 kg (277.4 lb), Muzzle velocity: 840 m/s
-- Max ballistic range: ~29,400 m at +45 deg elevation
-- ============================================================================
safe_declare_shell({
    category       = CAT_SHELLS,
    name           = "JP_203mm_Type91_AP",
    user_name      = _("203mm Type 91 AP (Mogami)"),
    model_name     = "tracer_bullet_yellow",
    v0             = 840.0,
    Da0            = 0.00055,
    Da1            = 0.00025,
    Dv0            = 0.0024,
    mass           = 125.85,
    round_mass     = 125.85,
    cartridge_mass = 33.8,
    explosive      = 3.1,               -- 3.1 kg Type 91 TNA burster
    life_time      = 95.0,
    caliber        = 203.2,
    piercing_mass  = 100.7,             -- 80% hardened AP core mass
    s              = 0.0324,
    j              = 0.0,
    l              = 0.86,
    charTime       = 0,
    cx             = { 1.0, 0.72, 0.58, 0.28, 1.8 },
    k1             = 1.6e-09,
    tracer_off     = -1,
    scale_tracer   = 0,
    rotation_freq  = 6,
    smoke_tail_life_time = -1,
    cartridge      = 0,
    type_name      = "shell",
    aiming_table   = {
        { init_vel = 840.0 },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = false,
    },
})

safe_declare_shell({
    category       = CAT_SHELLS,
    name           = "JP_203mm_Type0_HE",
    user_name      = _("203mm Type 0 Common HE (Mogami)"),
    model_name     = "tracer_bullet_yellow",
    v0             = 835.0,
    Da0            = 0.00055,
    Da1            = 0.00025,
    Dv0            = 0.0025,
    mass           = 125.85,
    round_mass     = 125.85,
    cartridge_mass = 33.8,
    explosive      = 8.17,              -- 8.17 kg Shimose / TNT HE burster
    life_time      = 95.0,
    caliber        = 203.2,
    piercing_mass  = 37.8,
    s              = 0.0324,
    j              = 0.0,
    l              = 0.86,
    charTime       = 0,
    cx             = { 1.0, 0.74, 0.60, 0.30, 1.8 },
    k1             = 1.7e-09,
    tracer_off     = -1,
    scale_tracer   = 0,
    rotation_freq  = 6,
    smoke_tail_life_time = -1,
    cartridge      = 0,
    type_name      = "shell",
    aiming_table   = {
        { init_vel = 835.0 },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = false,
    },
})

-- ============================================================================
-- 12.7cm (127mm/40) Type 89 Dual-Purpose Projectiles (Heavy AA & Secondary)
-- Shell mass: 23.0 kg (50.7 lb), Muzzle velocity: 720 m/s
-- ============================================================================
safe_declare_shell({
    category       = CAT_SHELLS,
    name           = "JP_127mm_Type89_HE",
    user_name      = _("127mm Type 89 DP HE (IJN)"),
    model_name     = "tracer_bullet_yellow",
    v0             = 720.0,
    Da0            = 0.0008,
    Da1            = 0.0004,
    Dv0            = 0.0032,
    mass           = 23.0,
    round_mass     = 23.0,
    cartridge_mass = 11.3,
    explosive      = 1.95,              -- 1.95 kg bursting charge
    life_time      = 40.0,
    caliber        = 127.0,
    piercing_mass  = 4.6,
    s              = 0.0,
    j              = 0.0,
    l              = 0.0,
    charTime       = 0,
    cx             = { 0.6, 0.45, 0.65, 0.15, 1.5 },
    k1             = 1.1e-09,
    tracer_on      = 0.01,
    tracer_off     = 18.0,
    scale_tracer   = 1.0,
    rotation_freq  = 12,
    smoke_tail_life_time = 2.0,
    cartridge      = 0,
    type_name      = "shell",
    aiming_table   = {
        { init_vel = 720.0 },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = true,
    },
})

-- ============================================================================
-- 25mm/60 Type 96 Anti-Aircraft Projectiles (Light AA)
-- Shell mass: 0.25 kg, Muzzle velocity: 900 m/s
-- ============================================================================
safe_declare_shell({
    category       = CAT_SHELLS,
    name           = "JP_25mm_Type96_HE",
    user_name      = _("25mm Type 96 HE-T (IJN)"),
    model_name     = "tracer_bullet_yellow",
    v0             = 900.0,
    Da0            = 0.0014,
    Da1            = 0.0007,
    Dv0            = 0.0035,
    mass           = 0.25,
    round_mass     = 0.68,
    cartridge_mass = 0.43,
    explosive      = 0.015,             -- 15 g HE filler
    life_time      = 8.0,
    caliber        = 25.0,
    piercing_mass  = 0.05,
    s              = 0.0,
    j              = 0.0,
    l              = 0.0,
    charTime       = 0,
    cx             = { 1.0, 0.85, 0.70, 0.30, 1.8 },
    k1             = 6.5e-08,
    tracer_on      = 0.01,
    tracer_off     = 5.5,
    scale_tracer   = 1.2,
    rotation_freq  = 18,
    smoke_tail_life_time = 0.8,
    cartridge      = 0,
    type_name      = "shell",
    aiming_table   = {
        { init_vel = 900.0 },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = true,
    },
})

-- ============================================================================
-- IJN Haruna: 356mm/45 Type 41 (14-inch) & 152mm/50 Type 41 (6-inch) Shells
-- ============================================================================
declare_shell({
    name              = "JP_356mm_Type91_AP",
    full_name         = _("35.6cm Type 91 AP"),
    user_name         = _("35.6cm Type 91 AP"),
    model_name        = "pula_152",
    v0                = 775.0,
    Dv0               = 0.005,
    Da0               = 0.00025,
    Da1               = 0.0,
    mass              = 673.5,
    round_mass        = 673.5,
    explosive         = 14.9,
    life_time         = 100.0,
    caliber           = 356.0,
    s                 = 0.0,
    j                 = 0.0,
    l                 = 0.0,
    charTime          = 0,
    cx                = { 1.0, 0.72, 0.38, 0.24, 1.85 },
    k1                = 9.0e-10,
    tracer_off        = 90,
    tracer_on         = 0,
    scale_smoke       = 1.0,
    cartridge         = 0,
    visual_effect_correction = 1.0,
    piercing_mass     = 673.5,
})

declare_shell({
    name              = "JP_356mm_Type0_HE",
    full_name         = _("35.6cm Type 0 HE"),
    user_name         = _("35.6cm Type 0 HE"),
    model_name        = "pula_152",
    v0                = 805.0,
    Dv0               = 0.005,
    Da0               = 0.00025,
    Da1               = 0.0,
    mass              = 625.0,
    round_mass        = 625.0,
    explosive         = 55.2,
    life_time         = 100.0,
    caliber           = 356.0,
    s                 = 0.0,
    j                 = 0.0,
    l                 = 0.0,
    charTime          = 0,
    cx                = { 1.0, 0.72, 0.38, 0.24, 1.85 },
    k1                = 9.0e-10,
    tracer_off        = 90,
    tracer_on         = 0,
    scale_smoke       = 1.0,
    cartridge         = 0,
    visual_effect_correction = 1.0,
})

declare_shell({
    name              = "JP_152mm_Type41_HE",
    full_name         = _("15.2cm Type 41 HE"),
    user_name         = _("15.2cm Type 41 HE"),
    model_name        = "pula_152",
    v0                = 850.0,
    Dv0               = 0.006,
    Da0               = 0.0003,
    Da1               = 0.0,
    mass              = 45.4,
    round_mass        = 45.4,
    explosive         = 3.4,
    life_time         = 60.0,
    caliber           = 152.0,
    s                 = 0.0,
    j                 = 0.0,
    l                 = 0.0,
    charTime          = 0,
    cx                = { 1.0, 0.74, 0.40, 0.25, 1.9 },
    k1                = 1.5e-09,
    tracer_off        = 60,
    tracer_on         = 0,
    scale_smoke       = 0.6,
    cartridge         = 0,
    visual_effect_correction = 1.0,
})
