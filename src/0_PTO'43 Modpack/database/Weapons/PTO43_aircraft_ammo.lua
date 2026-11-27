-- ============================================================================================================
-- PTO '43 MODPACK - CENTRALIZED ORDNANCE & SHELLS (1943 HISTORICAL)
-- Contains ONLY Shells, Bombs, Torpedoes, and Drop Tanks.
-- Gun mounts are declared locally in their respective aircraft .lua files.
-- ============================================================================================================

local _ = _ or function(str) return str end

local CAT_BOMBS      = CAT_BOMBS or 1
local CAT_FUEL_TANKS = CAT_FUEL_TANKS or 5
local CAT_SHELLS     = CAT_SHELLS or 6
local CAT_TORPEDOES  = CAT_TORPEDOES or 7

local wsType_Weapon       = wsType_Weapon or 4
local wsType_Bomb         = wsType_Bomb or 5
local wsType_StandardBomb = wsType_StandardBomb or 37
local wsType_Bomb_A       = wsType_Bomb_A or 38
local wsType_Torpedo      = wsType_Torpedo or 39
local wsType_Free_Fall    = wsType_Free_Fall or 9
local wsType_FuelTank     = wsType_FuelTank or 104
local wsType_Air          = wsType_Air or 1

local WSTYPE_PLACEHOLDER  = WSTYPE_PLACEHOLDER or 0   -- keep DCS magic value (a literal 0 made loadouts collide: DUPLICATE not allowed)

_G.PTO_Weapons_Declared = _G.PTO_Weapons_Declared or {}
_G.PTO_Weapon_Tables = _G.PTO_Weapon_Tables or {}
local function safe_declare_weapon(tbl)
    if not tbl or not tbl.name then return end
    if _G.PTO_Weapons_Declared[tbl.name] then return _G.PTO_Weapon_Tables[tbl.name] or tbl end
    if tbl.category == CAT_SHELLS and weapons_table and weapons_table.weapons and weapons_table.weapons.shells and weapons_table.weapons.shells[tbl.name] then
        _G.PTO_Weapons_Declared[tbl.name] = true
        return weapons_table.weapons.shells[tbl.name]
    end
    if declare_weapon then declare_weapon(tbl) end
    _G.PTO_Weapons_Declared[tbl.name] = true
    _G.PTO_Weapon_Tables[tbl.name] = tbl
    return tbl
end

-- wsType of a weapon declared in this file (resolved by declare_weapon), as ED does: attribute = SC_50.wsTypeOfWeapon
local function ws_of(name)
    local t = _G.PTO_Weapon_Tables[name]
    return t and t.wsTypeOfWeapon
end
-- wsType of a stock DCS weapon table (e.g. AN_M65, LTF_5B), nil if not available
local function core_ws(t)
    return type(t) == "table" and t.wsTypeOfWeapon or nil
end
-- The 4th wsType element of a weapon we declare stays WSTYPE_PLACEHOLDER until DCS resolves it
-- after loading (ED and the Community pack pass weapon.wsTypeOfWeapon by reference for exactly
-- this reason). So "own" weapon tables are accepted as they are; anything else must already be
-- four numbers. (2026-11-26: the old numbers-only check silently dropped every Japanese bomb.)
local function own_ws(a)
    for _, t in pairs(_G.PTO_Weapon_Tables) do
        if t.wsTypeOfWeapon == a then return true end
    end
    return false
end
local function ws_ok(a)
    if type(a) ~= "table" then return false end
    if own_ws(a) then return true end
    return type(a[1]) == "number" and type(a[2]) == "number" and type(a[3]) == "number" and type(a[4]) == "number"
end

_G.PTO_Loadouts_Declared = _G.PTO_Loadouts_Declared or {}
local function safe_declare_loadout(tbl)
    if not tbl or not tbl.CLSID then return end
    if _G.PTO_Loadouts_Declared[tbl.CLSID] then return end
    -- bombs/torpedoes must point to a real, resolved weapon wsType (an unresolved WSTYPE_PLACEHOLDER
    -- breaks db_scan: "db_main.lua:37 bad argument #5 to 'format'"): skip the loadout instead of crashing
    if (tbl.category == CAT_BOMBS or tbl.category == CAT_TORPEDOES) and not ws_ok(tbl.attribute) then return end
    if db and db.Weapons and db.Weapons.ByCLSID and db.Weapons.ByCLSID[tbl.CLSID] then
        _G.PTO_Loadouts_Declared[tbl.CLSID] = true
        return
    end
    if declare_loadout then declare_loadout(tbl) end
    _G.PTO_Loadouts_Declared[tbl.CLSID] = true
end

local tracer_on_time = 0.01

-- ============================================================================================================
-- 1. SHELLS (BALLISTICS & AMMUNITION)
-- ============================================================================================================

-- Allied Forces Shells (.50 cal, 20mm Hispano/AN-M2, 37mm M4)
safe_declare_weapon({
    category        = CAT_SHELLS,
    name            = "PTO_50BMG_AP",
    user_name       = _(".50 BMG AP M2"),
    model_name      = "tracer_bullet_yellow",
    v0              = 890.0,
    Dv0             = 0.0082,
    Da0             = 0.0004,
    Da1             = 0.0,
    mass            = 0.046,
    round_mass      = 0.115,
    explosive       = 0.0,
    life_time       = 6.0,
    caliber         = 12.7,
    s               = 0.0,
    j               = 0.0,
    l               = 0.0,
    charTime        = 0,
    cx              = {0.5, 1.27, 0.70, 0.200, 2.30},
    k1              = 2.2e-08,
    tracer_off      = -1,
    tracer_on       = tracer_on_time,
    cartridge       = 0,
    cartridge_mass  = 0,
    type_name       = "shell",
})

safe_declare_weapon({
    category        = CAT_SHELLS,
    name            = "PTO_20mm_Hispano_HE",
    user_name       = _("20mm Hispano HE"),
    model_name      = "tracer_bullet_red",
    v0              = 840.0,
    Dv0             = 0.0080,
    Da0             = 0.0004,
    Da1             = 0.0,
    mass            = 0.130,
    round_mass      = 0.250,
    explosive       = 0.012,
    life_time       = 6.0,
    caliber         = 20.0,
    s               = 0.0,
    j               = 0.0,
    l               = 0.0,
    charTime        = 0,
    cx              = {1.3, 0.93, 0.55, 0.36, 1.80},
    k1              = 3.6e-08,
    tracer_off      = 3.0,
    tracer_on       = tracer_on_time,
    cartridge       = 0,
    cartridge_mass  = 0,
    type_name       = "shell",
})

safe_declare_weapon({
    category        = CAT_SHELLS,
    name            = "PTO_37mm_M4_HE",
    user_name       = _("37mm M4 HE"),
    model_name      = "tracer_bullet_red",
    v0              = 610.0,
    Dv0             = 0.0075,
    Da0             = 0.0005,
    Da1             = 0.0,
    mass            = 0.608,
    round_mass      = 1.150,
    explosive       = 0.045,
    life_time       = 8.0,
    caliber         = 37.0,
    s               = 0.0,
    j               = 0.0,
    l               = 0.0,
    charTime        = 0,
    cx              = {1.3, 0.93, 0.55, 0.36, 1.80},
    k1              = 2.1e-08,
    tracer_off      = 3.5,
    tracer_on       = tracer_on_time,
    cartridge       = 0,
    cartridge_mass  = 0,
    type_name       = "shell",
})

-- Axis Forces Shells (7.7mm Type 97, 12.7mm Ho-103, 20mm Type 99 IJN, 20mm Ho-5 IJA)
safe_declare_weapon({
    category        = CAT_SHELLS,
    name            = "PTO_77mm_Type97",
    user_name       = _("7.7mm Type 97"),
    model_name      = "tracer_bullet_white",
    v0              = 730.0,
    Dv0             = 0.0082,
    Da0             = 0.0004,
    Da1             = 0.0,
    mass            = 0.011,
    round_mass      = 0.024,
    explosive       = 0.0,
    life_time       = 4.0,
    caliber         = 7.7,
    s               = 0.0,
    j               = 0.0,
    l               = 0.0,
    charTime        = 0,
    cx              = {1.0, 0.912, 0.70, 0.25, 1.80},
    k1              = 4.8e-08,
    tracer_off      = 2.0,
    tracer_on       = tracer_on_time,
    cartridge       = 0,
    cartridge_mass  = 0,
    type_name       = "shell",
})

safe_declare_weapon({
    category        = CAT_SHELLS,
    name            = "PTO_127mm_Ho103",
    user_name       = _("12.7mm Ho-103 AP-T"),
    model_name      = "tracer_bullet_yellow",
    v0              = 780.0,
    Dv0             = 0.0080,
    Da0             = 0.0004,
    Da1             = 0.0,
    mass            = 0.038,
    round_mass      = 0.085,
    explosive       = 0.0018,
    life_time       = 5.5,
    caliber         = 12.7,
    s               = 0.0,
    j               = 0.0,
    l               = 0.0,
    charTime        = 0,
    cx              = {0.5, 1.27, 0.70, 0.200, 2.30},
    k1              = 2.2e-08,
    tracer_off      = 3.0,
    tracer_on       = tracer_on_time,
    cartridge       = 0,
    cartridge_mass  = 0,
    type_name       = "shell",
})

safe_declare_weapon({
    category        = CAT_SHELLS,
    name            = "PTO_20mm_Type99_HE",
    user_name       = _("20mm Type 99 HE"),
    model_name      = "tracer_bullet_red",
    v0              = 600.0,
    Dv0             = 0.0080,
    Da0             = 0.0004,
    Da1             = 0.0,
    mass            = 0.128,
    round_mass      = 0.200,
    explosive       = 0.010,
    life_time       = 6.0,
    caliber         = 20.0,
    s               = 0.0,
    j               = 0.0,
    l               = 0.0,
    charTime        = 0,
    cx              = {1.3, 0.93, 0.55, 0.36, 1.80},
    k1              = 3.6e-08,
    tracer_off      = 3.0,
    tracer_on       = tracer_on_time,
    cartridge       = 0,
    cartridge_mass  = 0,
    type_name       = "shell",
})

safe_declare_weapon({
    category        = CAT_SHELLS,
    name            = "PTO_20mm_Ho5_HE",
    user_name       = _("20mm Ho-5 HEI-T"),
    model_name      = "tracer_bullet_crimson",
    v0              = 705.0,
    Dv0             = 0.0080,
    Da0             = 0.0004,
    Da1             = 0.0,
    mass            = 0.115,
    round_mass      = 0.220,
    explosive       = 0.009,
    life_time       = 7.0,
    caliber         = 20.0,
    s               = 0.0,
    j               = 0.0,
    l               = 0.0,
    charTime        = 0,
    cx              = {0.0, 0.77, 0.80, 0.23, 2.30},
    k1              = 2.0e-08,
    tracer_off      = 3.0,
    tracer_on       = tracer_on_time,
    cartridge       = 0,
    cartridge_mass  = 0,
    type_name       = "shell",
})

-- Ki-45 KAIc Toryu Shells (37mm Ho-203 HE & 7.92mm Type 98 Flexible MG)
safe_declare_weapon({
    category             = CAT_SHELLS,
    name                 = "Ki45_37mm_Ho203_HE",
    user_name            = _("37mm HE Ho-203"),
    model_name           = "tracer_bullet_red",
    mass                 = 0.475,
    round_mass           = 0.940,
    cartridge_mass       = 0.465,
    explosive            = 0.040,
    v0                   = 570.0,
    Dv0                  = 0.0080,
    Da0                  = 0.0006,
    Da1                  = 0.0,
    life_time            = 8.0,
    caliber              = 37.0,
    s                    = 0.0,
    j                    = 0.0,
    l                    = 0.0,
    charTime             = 0,
    cx                   = {1.3, 0.93, 0.55, 0.36, 1.8},
    k1                   = 2.1e-08,
    tracer_off           = 3.0,
    tracer_on            = 0.01,
    smoke_tail_life_time = 0.5,
    scale_tracer         = 1.5,
    cartridge            = 0,
    scale_smoke          = 0.8,
    smoke_opacity        = 0.8,
    type_name            = "shell",
})

safe_declare_weapon({
    category       = CAT_SHELLS,
    name           = "Ki45_792_Type98_T",
    user_name      = _("7.92mm Type 98 tracer"),
    model_name     = "tracer_bullet_white",
    mass           = 0.0118,
    round_mass     = 0.025,
    cartridge_mass = 0.013,
    explosive      = 0.0,
    v0             = 755.0,
    Dv0            = 0.0060,
    Da0            = 0.0009,
    Da1            = 0.0,
    life_time      = 5.0,
    caliber        = 7.92,
    s              = 0.0,
    j              = 0.0,
    l              = 0.0,
    charTime       = 0,
    cx             = {0.5, 0.61, 0.70, 0.12, 1.6},
    k1             = 6.0e-08,
    tracer_off     = 2.0,
    tracer_on      = 0.01,
    scale_tracer   = 1,
    cartridge      = 0,
    type_name      = "shell",
})

safe_declare_weapon({
    category       = CAT_SHELLS,
    name           = "Ki45_792_Type98_AP",
    user_name      = _("7.92mm Type 98 AP"),
    model_name     = "tracer_bullet_white",
    mass           = 0.0128,
    round_mass     = 0.026,
    cartridge_mass = 0.013,
    explosive      = 0.0,
    v0             = 745.0,
    Dv0            = 0.0060,
    Da0            = 0.0009,
    Da1            = 0.0,
    life_time      = 5.0,
    caliber        = 7.92,
    s              = 0.0,
    j              = 0.0,
    l              = 0.0,
    charTime       = 0,
    cx             = {0.5, 0.61, 0.70, 0.12, 1.6},
    k1             = 6.0e-08,
    tracer_off     = -1,
    tracer_on      = 0.01,
    scale_tracer   = 0,
    cartridge      = 0,
    type_name      = "shell",
})

-- ============================================================================================================
-- 2. ALLIED BOMBS, TORPEDOES & DROP TANKS
-- ============================================================================================================

safe_declare_loadout({
    category    = CAT_BOMBS,
    CLSID       = "PTO_US_ANM30_100LB",
    Picture     = "an_m30.png",
    displayName = _("AN-M30 100 lb GP Bomb"),
    Weight      = 52.0,
    attribute   = core_ws(AN_M30A1) or {wsType_Weapon, wsType_Bomb, wsType_Bomb_A, AN_M64},
    Cx_pil      = 0.0007,
    Count       = 1,
    Elements    = {{ ShapeName = "AN-M30" }},
})

safe_declare_loadout({
    category    = CAT_BOMBS,
    CLSID       = "PTO_US_ANM64_500LB",
    Picture     = "an_m64.png",
    displayName = _("AN-M64 500 lb GP Bomb"),
    Weight      = 227.0,
    attribute   = {wsType_Weapon, wsType_Bomb, wsType_Bomb_A, AN_M64},
    Cx_pil      = 0.0012,
    Count       = 1,
    Elements    = {{ ShapeName = "AN-M64" }},
})

safe_declare_loadout({
    category    = CAT_BOMBS,
    CLSID       = "PTO_US_ANM65_1000LB",
    Picture     = "an_m65.png",
    displayName = _("AN-M65 1000 lb GP Bomb"),
    Weight      = 454.0,
    attribute   = core_ws(AN_M65) or {wsType_Weapon, wsType_Bomb, wsType_Bomb_A, AN_M64},
    Cx_pil      = 0.0016,
    Count       = 1,
    Elements    = {{ ShapeName = "AN-M65" }},
})

safe_declare_loadout({
    category    = CAT_TORPEDOES,
    CLSID       = "PTO_US_MK13_TORPEDO",
    Picture     = "mk13_torpedo.png",
    displayName = _("Mark 13 Aerial Torpedo"),
    Weight      = 1005.0,
    attribute   = core_ws(LTF_5B),  -- no Mk13 weapon declared: stock aerial torpedo, own shape
    Cx_pil      = 0.0025,
    Count       = 1,
    Elements    = {{ ShapeName = "mk13" }}, -- Uses mk13.edm in Shapes/
})

safe_declare_loadout({
    category    = CAT_FUEL_TANKS,
    CLSID       = "PTO_US_TANK_150GAL",
    Picture     = "droptank_150gal.png",
    displayName = _("150 Gallon Drop Tank"),
    Weight      = 415.0,
    attribute   = {wsType_Air, wsType_Free_Fall, wsType_FuelTank, WSTYPE_PLACEHOLDER},
    Cx_pil      = 0.0015,
    Elements    = {{ ShapeName = "Drop_Tank_300_Liter" }},
})

-- ============================================================================================================
-- 3. AXIS BOMBS, TORPEDOES & DROP TANKS
-- ============================================================================================================

-- Type 97 30 kg Bomb (Uses 30KGBOMB.EDM in Shapes/)
safe_declare_weapon({
    category         = CAT_BOMBS,
    name             = "PTO_JP_TYPE97_30KG",
    user_name        = _("Type 97 30 kg Bomb"),
    model            = "30KGBOMB",
    wsTypeOfWeapon   = {wsType_Weapon, wsType_Bomb, wsType_Bomb_A, WSTYPE_PLACEHOLDER},
    scheme           = "bomb-common",
    type             = 0,
    mass             = 30.0,
    hMin             = 100.0,
    hMax             = 12000.0,
    Cx               = 0.00041,
    VyHold           = -100.0,
    Ag               = -1.23,
    fm               = {mass = 30.0, caliber = 0.147, cx_coeff = {1.0, 0.39, 0.38, 0.236, 1.31}, L = 0.70, I = 4.5, Ma = 0.14, Mw = 2.2, wind_sigma = 5, cx_factor = 100},
    warhead          = {mass = 12.0, expl_mass = 12.0, other_factors = {1,1,1}, obj_factors = {1,1}, concrete_factors = {1,1,1}, cumulative_factor = 1, concrete_obj_factor = 1.0, cumulative_thickness = 1.0, piercing_mass = 1.0, caliber = 147},
    shape_table_data = {{name = "PTO_JP_TYPE97_30KG", file = "30KGBOMB", life = 1, fire = {0, 1}, username = "Type 97 30 kg", index = WSTYPE_PLACEHOLDER}},
    targeting_data   = {char_time = 20.57}
})

safe_declare_loadout({
    category    = CAT_BOMBS,
    CLSID       = "PTO_JP_TYPE97_30KG",
    Picture     = "german_SC50.png",
    displayName = _("Type 97 30 kg Bomb"),
    Weight      = 30.0,
    attribute   = ws_of("PTO_JP_TYPE97_30KG"),
    Cx_pil      = 0.0004,
    Count       = 1,
    Elements    = {{ ShapeName = "30KGBOMB" }},
})

-- Type 97 60 kg Bomb (Uses 60KGBOMB.EDM in Shapes/)
safe_declare_weapon({
    category         = CAT_BOMBS,
    name             = "PTO_JP_TYPE97_60KG",
    user_name        = _("Type 97 60 kg Bomb"),
    model            = "60KGBOMB",
    wsTypeOfWeapon   = {wsType_Weapon, wsType_Bomb, wsType_Bomb_A, WSTYPE_PLACEHOLDER},
    scheme           = "bomb-common",
    type             = 0,
    mass             = 60.0,
    hMin             = 100.0,
    hMax             = 12000.0,
    Cx               = 0.00124,
    VyHold           = -100.0,
    Ag               = -1.23,
    fm               = {mass = 60.0, caliber = 0.200, cx_coeff = {1.0, 0.39, 0.60, 0.168, 1.31}, L = 1.05, I = 4.5, Ma = 0.14, Mw = 2.2, wind_sigma = 5, cx_factor = 100},
    warhead          = {mass = 25.0, expl_mass = 25.0, other_factors = {1,1,1}, obj_factors = {1,1}, concrete_factors = {1,1,1}, cumulative_factor = 1, concrete_obj_factor = 1.0, cumulative_thickness = 1.0, piercing_mass = 1.0, caliber = 200},
    shape_table_data = {{name = "PTO_JP_TYPE97_60KG", file = "60KGBOMB", life = 1, fire = {0, 1}, username = "Type 97 60 kg", index = WSTYPE_PLACEHOLDER}},
    targeting_data   = {char_time = 20.60}
})

safe_declare_loadout({
    category    = CAT_BOMBS,
    CLSID       = "PTO_JP_TYPE97_60KG",
    Picture     = "ijn_type97_60kg.png",
    displayName = _("Type 97 60 kg Bomb"),
    Weight      = 60.0,
    attribute   = ws_of("PTO_JP_TYPE97_60KG"),
    Cx_pil      = 0.0008,
    Count       = 1,
    Elements    = {{ ShapeName = "60KGBOMB" }},
})

-- Type 98 250 kg Bomb (Backed by LB_250.EDM / SC-250 for visible geometry)
safe_declare_weapon({
    category         = CAT_BOMBS,
    name             = "PTO_JP_TYPE98_250KG",
    user_name        = _("Type 98 250 kg Land Bomb"),
    model            = "LB_250",
    wsTypeOfWeapon   = {wsType_Weapon, wsType_Bomb, wsType_Bomb_A, WSTYPE_PLACEHOLDER},
    scheme           = "bomb-common",
    type             = 0,
    mass             = 250.0,
    hMin             = 100.0,
    hMax             = 12000.0,
    Cx               = 0.00124,
    VyHold           = -100.0,
    Ag               = -1.23,
    fm               = {mass = 250.0, caliber = 0.368, cx_coeff = {1.0, 0.39, 0.38, 0.236, 1.31}, L = 1.64, I = 43.07, Ma = 0.141, Mw = 2.24, wind_sigma = 30, cx_factor = 100},
    warhead          = {mass = 135.0, expl_mass = 135.0, other_factors = {1,1,1}, obj_factors = {1,1}, concrete_factors = {1,1,1}, cumulative_factor = 1, concrete_obj_factor = 1.0, cumulative_thickness = 1.0, piercing_mass = 1.0, caliber = 368},
    shape_table_data = {{name = "PTO_JP_TYPE98_250KG", file = "LB_250", life = 1, fire = {0, 1}, username = "Type 98 250 kg", index = WSTYPE_PLACEHOLDER}},
    targeting_data   = {char_time = 20.60}
})

safe_declare_loadout({
    category    = CAT_BOMBS,
    CLSID       = "PTO_JP_TYPE98_250KG",
    Picture     = "ijn_type98_250kg.png",
    displayName = _("Type 98 250 kg Land Bomb"),
    Weight      = 250.0,
    attribute   = ws_of("PTO_JP_TYPE98_250KG"),
    Cx_pil      = 0.0013,
    Count       = 1,
    Elements    = {{ ShapeName = "LB_250" }},
})

-- G4M multi-bomb fits (one station, several bombs drawn and dropped)
safe_declare_loadout({
    category    = CAT_BOMBS,
    CLSID       = "PTO_JP_G4M_4X250KG",
    Picture     = "ijn_type98_250kg.png",
    displayName = _("4 x Type 98 250 kg"),
    Weight      = 1000.0,
    attribute   = ws_of("PTO_JP_TYPE98_250KG"),
    Cx_pil      = 0.0045,
    Count       = 4,
    Elements    = {
        { Position = { 0.95, 0, -0.25}, ShapeName = "LB_250" },
        { Position = { 0.95, 0,  0.25}, ShapeName = "LB_250" },
        { Position = {-0.95, 0, -0.25}, ShapeName = "LB_250" },
        { Position = {-0.95, 0,  0.25}, ShapeName = "LB_250" },
    },
})

local pto_g4m_60 = {}
for _, x in ipairs({1.30, 0.0, -1.30}) do
    for _, z in ipairs({-0.39, -0.13, 0.13, 0.39}) do
        pto_g4m_60[#pto_g4m_60 + 1] = { Position = {x, 0, z}, ShapeName = "60KGBOMB" }
    end
end
safe_declare_loadout({
    category    = CAT_BOMBS,
    CLSID       = "PTO_JP_G4M_12X60KG",
    Picture     = "ijn_type97_60kg.png",
    displayName = _("12 x Type 97 60 kg"),
    Weight      = 720.0,
    attribute   = ws_of("PTO_JP_TYPE97_60KG"),
    Cx_pil      = 0.0060,
    Count       = 12,
    Elements    = pto_g4m_60,
})

-- Type 2 500 kg Bomb (Backed by LB_500.EDM / SC-500 for visible geometry)
safe_declare_weapon({
    category         = CAT_BOMBS,
    name             = "PTO_JP_TYPE2_500KG",
    user_name        = _("Type 2 500 kg Bomb"),
    model            = "LB_500",
    wsTypeOfWeapon   = {wsType_Weapon, wsType_Bomb, wsType_Bomb_A, WSTYPE_PLACEHOLDER},
    scheme           = "bomb-common",
    type             = 0,
    mass             = 500.0,
    hMin             = 200.0,
    hMax             = 12000.0,
    Cx               = 0.00133,
    VyHold           = -100.0,
    Ag               = -1.23,
    fm               = {mass = 500.0, caliber = 0.470, cx_coeff = {1.0, 0.39, 0.60, 0.168, 1.31}, L = 2.01, I = 246.03, Ma = 0.324, Mw = 3.13, wind_sigma = 100, cx_factor = 300},
    warhead          = {mass = 260.0, expl_mass = 260.0, other_factors = {1,1,1}, obj_factors = {1,1}, concrete_factors = {1,1,1}, cumulative_factor = 1, concrete_obj_factor = 1.0, cumulative_thickness = 1.0, piercing_mass = 1.0, caliber = 470},
    shape_table_data = {{name = "PTO_JP_TYPE2_500KG", file = "LB_500", life = 1, fire = {0, 1}, username = "Type 2 500 kg", index = WSTYPE_PLACEHOLDER}},
    targeting_data   = {char_time = 20.35}
})

safe_declare_loadout({
    category    = CAT_BOMBS,
    CLSID       = "PTO_JP_TYPE2_500KG",
    Picture     = "ijn_type2_500kg.png",
    displayName = _("Type 2 500 kg Bomb"),
    Weight      = 500.0,
    attribute   = ws_of("PTO_JP_TYPE2_500KG"),
    Cx_pil      = 0.0017,
    Count       = 1,
    Elements    = {{ ShapeName = "LB_500" }},
})

-- Type 91 Mod 2 Aerial Torpedo (Uses type91.edm in Shapes/)
-- Own weapon declaration, ported from the Community PTO Pack (PTO_Torps.lua, Pikey): the old
-- loadout borrowed the stock LTF_5B wsType, which is nil here, so the torpedo never registered.
local pto_type91_mass = 838.0
local pto_type91_warhead = {
    mass = 276.5, caliber = 450, expl_mass = 204, piercing_mass = 50, fantom = 0,
    other_factors = {4.0, 4.0, 4.0}, concrete_factors = {8.0, 8.0, 20.0}, concrete_obj_factor = 8.0,
    obj_factors = {8.0, 8.0}, cumulative_factor = 4.0, cumulative_thickness = 0.5, time_self_destruct = 300,
}
safe_declare_weapon({
    category        = CAT_TORPEDOES,
    name            = "PTO_JP_TYPE91",
    user_name       = _("Type 91 Aerial Torpedo"),
    display_name_short = "Type91",
    scheme          = "unguided_stab_torpedo",
    class_name      = "wAmmunition",
    model           = "type91",
    mass            = pto_type91_mass,
    wsTypeOfWeapon  = {wsType_Weapon, wsType_Torpedo, wsType_A_Torpedo, WSTYPE_PLACEHOLDER},
    Head_Type = 0, Diam = 450.0, D_max = 3500.0, D_min = 100.0, V_min = -1.0, V_max = 320.0,
    H_max = 3.0, H_min = -100.0, Life_Time = 600.0, Nr_max = 4.0, v_mid = 21.6,
    shape_table_data = {{ name = "PTO_JP_TYPE91", file = "type91", life = 1, fire = {0, 1},
                          username = "Type 91 Aerial Torpedo", index = WSTYPE_PLACEHOLDER }},
    fm = {
        mass = pto_type91_mass, caliber = 0.450, cx_coeff = {1, 0.39, 0.38, 0.236, 1.31}, L = 5.270,
        I = 1 / 12 * pto_type91_mass * 5.270 * 5.270, Ma = 0.2, Mw = 0.4, wind_sigma = 0.0, wind_time = 0.0,
        Sw = 0.96, dCydA = {0.07, 0.036}, A = 0.96, maxAoa = 0.3, finsTau = 0.02, Ma_x = 0.1, Kw_x = 0.0005,
        calcAirFins = 0, fins_val_div = 10000, rho_w = 515, int_rho_y = 1.8, Sww = 0.96,
        splash_time = 1.4, splash_dt = 0.004,
    },
    autopilot = {
        delay = 2.0, Kpv = 0.03, Kdv = 0.0, Kiv = 0.00002, Kph = 20.5, Kdh = 3.0, Kih = 0.0,
        steady_depth = 3.0, hKp_err_croll = 0.0, roll_diff_correction = 1, fins_limit = 0.25,
        x_fins_limit = 0.0, vel_proj_div = 10.0, v_vel_limit = 25.0,
        hor_spir_on_time = 350, hor_spir_period = 30, hor_spir_power = 0.4,
    },
    air_stab_autopilot = {
        x_channel_delay = 0.6, delay = 1.2, op_time = 50, stab_dive_value = math.rad(2), Kconv = 300.0,
        Knv = 0.005, Kd = 0.4, Ki = 0.25, Kout = 1.0, Kx = 0.1, Krx = 2.0, fins_limit = math.rad(20),
        fins_limit_x = math.rad(5), Areq_limit = 10, max_side_N = 10, max_signal_Fi = math.rad(12),
        rotate_fins_output = 0, null_roll = math.rad(0),
    },
    engine = { thrust = 8600 },
    warhead = pto_type91_warhead,
    warhead_water = pto_type91_warhead,
})

safe_declare_loadout({
    category    = CAT_TORPEDOES,
    CLSID       = "PTO_JP_TYPE91_TORPEDO",
    Picture     = "type91_torpedo.png",
    displayName = _("Type 91 Aerial Torpedo"),
    Weight      = pto_type91_mass,
    attribute   = ws_of("PTO_JP_TYPE91"),
    Cx_pil      = 0.0018,
    Count       = 1,
    Elements    = {{ ShapeName = "type91" }},
})

-- Ki-44 200L Wing Drop Tank (Uses ki_44_hei_drop_tank.edm in aircraft folder)
safe_declare_loadout({
    category     = CAT_FUEL_TANKS,
    CLSID        = "ki_44_hei_drop_tank",
    Picture      = "ki_44_hei_drop_tank.png",
    displayName  = _("Ki-44 200L Drop Tank"),
    Weight_Empty = 20.0,
    Weight       = 20.0 + (200.0 * 0.72),
    attribute    = {wsType_Air, wsType_Free_Fall, wsType_FuelTank, WSTYPE_PLACEHOLDER},
    Cx_pil       = 0.00055,
    Elements     = {{ Position = {0, 0, 0}, ShapeName = "ki_44_hei_drop_tank" }},
})

-- Zero 330L Belly Drop Tank (Uses REISEN52-TANK.EDM in Shapes/)[cite: 9]
safe_declare_loadout({
    category     = CAT_FUEL_TANKS,
    CLSID        = "PTO_JP_TANK_330L",
    Picture      = "droptank_zero_330l.png",
    displayName  = _("330 Liter Drop Tank"),
    Weight_Empty = 25.0,
    Weight       = 25.0 + (330.0 * 0.72),
    attribute    = {wsType_Air, wsType_Free_Fall, wsType_FuelTank, WSTYPE_PLACEHOLDER},
    Cx_pil       = 0.0012,
    -- REISEN52-TANK is not shipped in the modpack: use the A6M3's own tank (Shapes/aircraft/A6M3_DropTank.edm)
    -- register the shape, as the F6F tank does (without this the tank was selectable but invisible)
    shape_table_data = {{ name = "A6M3_DropTank", file = "A6M3_DropTank", life = 1, fire = {0, 1},
                          username = "A6M3_DropTank", index = WSTYPE_PLACEHOLDER }},
    Elements     = {{ Position = {0, 0, 0}, ShapeName = "A6M3_DropTank" }},
})