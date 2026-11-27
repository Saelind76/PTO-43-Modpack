-- ============================================================================
-- IJN heavy AA - time-fuze "belts" (PTO'43, 2026-11-25)
-- Real IJN 12.7cm Type 89 / 10cm Type 98 HE used time fuzes set before loading from the
-- director's computed range. DCS AI can't set a fuze per shot, so the guns cycle 3 preset
-- fuze times instead (a barrage at 3 distances). Each shell bursts VISIBLY when its fuze
-- (life_time) runs out; a direct hit still detonates on impact.
--   127mm: T12 / T8 / T5 s      100mm: T12 / T8 / T5 s (faster shell -> farther bursts)
-- Longest fuze first: the AI seems to judge its reach from the first shell in the list.
-- Unique names on purpose (JP_/IJN_127mm_Type89_HE, HE_100... are shared by other mods).
-- Identical copies ship with every IJN mod; the global guard declares each shell once.
-- ============================================================================
local _ = _ or function(s) return s end
_G.IJN_Weapons_Declared = _G.IJN_Weapons_Declared or {}

local function shell(t, name, label, fuze_s)
    local s = {
        category       = CAT_SHELLS or 6,
        name           = name,
        user_name      = _(label),
        model_name     = "tracer_bullet_yellow",
        life_time      = fuze_s,                 -- time fuze
        silent_self_destruction = false,         -- burst visibly when the fuze runs out
        s = 0.0, j = 0.0, l = 0.0, charTime = 0,
        tracer_on      = 0.01, tracer_off = fuze_s, scale_tracer = 1.0,
        smoke_tail_life_time = 2.0,
        cartridge      = 0,
        type_name      = "shell",
    }
    for k, v in pairs(t) do
        if type(v) == "table" then local c = {} for i, x in pairs(v) do c[i] = x end s[k] = c else s[k] = v end
    end
    -- fresh aiming table per shell: DCS consumes it on declaration
    s.aiming_table = { { init_vel = t.v0 }, precalculateAimingTable = true, precalculateAirDefenceAimingTable = true }
    return s
end

local T89 = { v0 = 720.0, mass = 23.0, round_mass = 23.0, cartridge_mass = 11.3, explosive = 1.95, piercing_mass = 4.6,
              caliber = 127.0, Da0 = 0.0008, Da1 = 0.0004, Dv0 = 0.0032, cx = { 0.6, 0.45, 0.65, 0.15, 1.5 }, k1 = 1.1e-09, rotation_freq = 12 }
local T98 = { v0 = 1000.0, mass = 13.0, round_mass = 13.0, cartridge_mass = 0, explosive = 0.95,
              caliber = 100.0, Da0 = 0.00025, Da1 = 0.00045, Dv0 = 0.0035, cx = { 0.5, 0.40, 0.60, 0.14, 1.4 }, k1 = 1.0e-09, rotation_freq = 0 }

for _, s in ipairs({
    shell(T89, "IJN_127mm_Type89_AA_T12", "127mm Type 89 AA (fuze 12 s)", 12.0),
    shell(T89, "IJN_127mm_Type89_AA_T8",  "127mm Type 89 AA (fuze 8 s)",   8.0),
    shell(T89, "IJN_127mm_Type89_AA_T5",  "127mm Type 89 AA (fuze 5 s)",   5.0),
    shell(T98, "IJN_100mm_Type98_AA_T12", "100mm Type 98 AA (fuze 12 s)", 12.0),
    shell(T98, "IJN_100mm_Type98_AA_T8",  "100mm Type 98 AA (fuze 8 s)",   8.0),
    shell(T98, "IJN_100mm_Type98_AA_T5",  "100mm Type 98 AA (fuze 5 s)",   5.0),
}) do
    if not _G.IJN_Weapons_Declared[s.name] then
        if declare_weapon then declare_weapon(s) end
        _G.IJN_Weapons_Declared[s.name] = true
    end
end

IJN_127mm_AA_BELT = { "IJN_127mm_Type89_AA_T12", "IJN_127mm_Type89_AA_T8", "IJN_127mm_Type89_AA_T5" }
IJN_100mm_AA_BELT = { "IJN_100mm_Type98_AA_T12", "IJN_100mm_Type98_AA_T8", "IJN_100mm_Type98_AA_T5" }
