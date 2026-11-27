-- ============================================================================
-- USN WWII cruiser guns (PTO'43, 2026-11-25) - shared by the Cleveland-class and
-- Baltimore mods. Identical copies ship with each mod; the global guards make every
-- shell / template exist once, whichever mod loads first.
--
--   6"/47 Mk 16 (Cleveland)      HC Mk 34 47.6 kg 812 m/s | AP Mk 35 59 kg 762 m/s
--   8"/55 Mk 15 (Baltimore)      HC Mk 25 118 kg 823 m/s  | AP Mk 21 152 kg 762 m/s
--   5"/38 Mk 12 (DP twins)       AAC Mk 35 25 kg 792 m/s, time-fuze belt 12 / 8 / 5 s
--   40 mm Bofors Mk 1/2          HE-T 0.9 kg 881 m/s
--   20 mm Oerlikon Mk 4          HE-T / AP-T 0.123 kg 835 m/s
--
-- Model rig convention (both mods): traverse arg 0 = bow, +1 = +180 deg (port),
-- elevation arg 0 = horizontal, +1 = +90 deg. DCS writes the absolute ship-relative
-- azimuth; reference_angle_Y is only the parking direction.
-- connectorFire = false: shells leave from the mount position (pos), so a missing or
-- misplaced muzzle connector can never stop a gun from firing.
-- ============================================================================
local _ = _ or function(s) return s end
local CAT_SHELLS = CAT_SHELLS or 6
_G.USN_Cruiser_Declared = _G.USN_Cruiser_Declared or {}

local function shell(t)
    if _G.USN_Cruiser_Declared[t.name] then return end
    t.category = CAT_SHELLS
    t.s, t.j, t.charTime, t.cartridge = t.s or 0.0, 0.0, 0, 0
    t.l = t.l or 0.0
    t.type_name = "shell"
    t.aiming_table = { { init_vel = t.v0 }, precalculateAimingTable = true,
                       precalculateAirDefenceAimingTable = t.aa and true or false }
    t.aa = nil
    if declare_weapon then declare_weapon(t) end
    _G.USN_Cruiser_Declared[t.name] = true
end

-- ---------------- main battery ----------------
shell({ name = "USN_6in47_HC_Mk34", user_name = _("6in/47 HC Mk 34"), model_name = "tracer_bullet_yellow",
        v0 = 812.0, Dv0 = 0.0025, Da0 = 0.0006, Da1 = 0.0003, mass = 47.6, round_mass = 47.6, explosive = 3.6,
        piercing_mass = 9.5, life_time = 80.0, caliber = 152.4, cx = { 1.0, 0.74, 0.60, 0.27, 1.8 }, k1 = 1.4e-09,
        tracer_off = -1, scale_tracer = 0, rotation_freq = 8, smoke_tail_life_time = -1 })
shell({ name = "USN_6in47_AP_Mk35", user_name = _("6in/47 AP Mk 35"), model_name = "tracer_bullet_yellow",
        v0 = 762.0, Dv0 = 0.0024, Da0 = 0.0006, Da1 = 0.0003, mass = 59.0, round_mass = 59.0, explosive = 0.9,
        piercing_mass = 50.0, life_time = 80.0, caliber = 152.4, cx = { 1.0, 0.70, 0.58, 0.26, 1.8 }, k1 = 1.3e-09,
        tracer_off = -1, scale_tracer = 0, rotation_freq = 8, smoke_tail_life_time = -1 })
shell({ name = "USN_8in55_HC_Mk25", user_name = _("8in/55 HC Mk 25"), model_name = "tracer_bullet_yellow",
        v0 = 823.0, Dv0 = 0.0024, Da0 = 0.00055, Da1 = 0.00025, mass = 118.0, round_mass = 118.0, explosive = 9.7,
        piercing_mass = 24.0, life_time = 95.0, caliber = 203.2, cx = { 1.0, 0.72, 0.58, 0.28, 1.8 }, k1 = 1.6e-09,
        tracer_off = -1, scale_tracer = 0, rotation_freq = 6, smoke_tail_life_time = -1 })
shell({ name = "USN_8in55_AP_Mk21", user_name = _("8in/55 AP Mk 21"), model_name = "tracer_bullet_yellow",
        v0 = 762.0, Dv0 = 0.0024, Da0 = 0.00055, Da1 = 0.00025, mass = 152.0, round_mass = 152.0, explosive = 2.3,
        piercing_mass = 125.0, life_time = 95.0, caliber = 203.2, cx = { 1.0, 0.70, 0.56, 0.27, 1.8 }, k1 = 1.6e-09,
        tracer_off = -1, scale_tracer = 0, rotation_freq = 6, smoke_tail_life_time = -1 })

-- ---------------- 5"/38 AAC time-fuze belt ----------------
for _i, f in ipairs({ 12, 8, 5 }) do
    shell({ name = "USN_5in38_AAC_T" .. f, user_name = _("5in/38 AAC (fuze " .. f .. " s)"), model_name = "tracer_bullet_yellow",
            v0 = 792.0, Dv0 = 0.0030, Da0 = 0.0008, Da1 = 0.0004, mass = 25.0, round_mass = 25.0, explosive = 3.3,
            piercing_mass = 5.0, life_time = f, silent_self_destruction = false, caliber = 127.0,
            cx = { 0.6, 0.45, 0.65, 0.15, 1.5 }, k1 = 1.1e-09, tracer_on = 0.01, tracer_off = f, scale_tracer = 1.0,
            rotation_freq = 12, smoke_tail_life_time = 2.0, aa = true })
end
USN_5in38_AA_BELT = { "USN_5in38_AAC_T12", "USN_5in38_AAC_T8", "USN_5in38_AAC_T5" }

-- ---------------- light AA ----------------
shell({ name = "USN_40mm_Mk2_HE", user_name = _("40mm Mk 2 HE-T"), model_name = "tracer_bullet_red",
        v0 = 881.0, Dv0 = 0.0025, Da0 = 0.00036, Da1 = 0.0002, mass = 0.9, round_mass = 2.15, explosive = 0.25,
        piercing_mass = 0.9, life_time = 12.0, caliber = 40.0, cx = { 0.50, 0.60, 0.75, 0.18, 1.65 }, k1 = 7.5e-08,
        tracer_off = 10.0, smoke_tail_life_time = 1.5, scale_tracer = 2, rotation_freq = 20, aa = true })
shell({ name = "USN_20mm_Mk4_HE", user_name = _("20mm Oerlikon HE-T"), model_name = "tracer_bullet_yellow",
        v0 = 835.0, Dv0 = 0.0028, Da0 = 0.0005, Da1 = 0.0003, mass = 0.123, round_mass = 0.24, explosive = 0.045,
        piercing_mass = 0.1, life_time = 7.0, caliber = 20.0, cx = { 0.30, 0.61, 0.70, 0.16, 1.60 }, k1 = 2.0e-08,
        tracer_off = 6.0, smoke_tail_life_time = 0.8, scale_tracer = 1.5, rotation_freq = 20, aa = true })
shell({ name = "USN_20mm_Mk4_AP", user_name = _("20mm Oerlikon AP-T"), model_name = "tracer_bullet_yellow",
        v0 = 835.0, Dv0 = 0.0028, Da0 = 0.0005, Da1 = 0.0003, mass = 0.123, round_mass = 0.24, explosive = 0.0,
        piercing_mass = 0.123, life_time = 7.0, caliber = 20.0, cx = { 0.30, 0.61, 0.70, 0.16, 1.60 }, k1 = 2.0e-08,
        tracer_off = 6.0, smoke_tail_life_time = 0.8, scale_tracer = 1.5, rotation_freq = 20, aa = true })

-- ============================================================================
-- Mount templates (global names are USN_CA_* / USN_CL_* - unique to these mods)
-- ============================================================================
local function proto(p)
    local w = {
        name = p.name, omegaY = math.rad(p.omega), omegaZ = math.rad(p.omegaZ or p.omega),
        pidY = p.pid or { p = 100, i = 0.05, d = 9.0, inn = 50 }, pidZ = p.pid or { p = 100, i = 0.05, d = 9.0, inn = 50 },
        reference_angle_Z = 0, moveable = true,
        LN = { [1] = {
            type = p.ln, distanceMin = p.dmin, distanceMax = p.dmax, min_trg_alt = p.altmin, max_trg_alt = p.altmax,
            reactionTime = p.react, reflection_limit = 0.22, connectorFire = false, beamWidth = math.rad(90),
            sensor = {},
            PL = { [1] = { ammo_capacity = p.ammo, portionAmmoCapacity = p.portion, shell_name = p.shells,
                           shot_delay = p.delay, reload_time = p.reload, switch_on_delay = 0.5 } },
        } },
    }
    set_recursive_metatable(w.LN[1].sensor, GT_t.WSN_t[p.sensor])
    return w
end

if not _G.USN_Cruiser_Declared.__templates then
    -- surface guns: LN 6 + optics sensor 10 (as the IJN battleships that do fire)
    GT_t.WS_t.USN_CL_6in47_Triple = proto({ name = "6in/47 Mk 16 triple", ln = 6, sensor = 10, omega = 10, pid = { p = 40, i = 1.0, d = 6 },
        dmin = 300, dmax = 23000, altmin = -1, altmax = 200, react = 2.0, ammo = 600, portion = 600,
        shells = { "USN_6in47_HC_Mk34", "USN_6in47_AP_Mk35" }, delay = 60 / 24, reload = 30 })   -- 3 guns x 8 rpm
    GT_t.WS_t.USN_CA_8in55_Triple = proto({ name = "8in/55 Mk 15 triple", ln = 6, sensor = 10, omega = 5, pid = { p = 30, i = 0.6, d = 8 },
        dmin = 400, dmax = 27000, altmin = -1, altmax = 200, react = 2.0, ammo = 450, portion = 450,
        shells = { "USN_8in55_HC_Mk25", "USN_8in55_AP_Mk21" }, delay = 60 / 12, reload = 35 })   -- 3 guns x 4 rpm
    -- 5"/38 dual purpose: AA launcher type 3 (the type that engages aircraft in these mods)
    GT_t.WS_t.USN_5in38_Twin = proto({ name = "5in/38 Mk 32 twin", ln = 3, sensor = 3, omega = 25, omegaZ = 15,
        dmin = 50, dmax = 14000, altmin = -5, altmax = 11000, react = 2.0, ammo = 700, portion = 700,
        shells = USN_5in38_AA_BELT, delay = 60 / 30, reload = 20 })                               -- 2 guns x 15 rpm
    GT_t.WS_t.USN_40mm_Quad = proto({ name = "40mm Bofors Mk 2 quad", ln = 3, sensor = 3, omega = 35,
        dmin = 10, dmax = 5000, altmin = -5, altmax = 4000, react = 1.2, ammo = 4000, portion = 4000,
        shells = { "USN_40mm_Mk2_HE" }, delay = 60 / 480, reload = 15 })
    GT_t.WS_t.USN_40mm_Twin = proto({ name = "40mm Bofors Mk 1 twin", ln = 3, sensor = 3, omega = 40,
        dmin = 10, dmax = 5000, altmin = -5, altmax = 4000, react = 1.2, ammo = 2400, portion = 2400,
        shells = { "USN_40mm_Mk2_HE" }, delay = 60 / 240, reload = 15 })
    GT_t.WS_t.USN_20mm_Single = proto({ name = "20mm Oerlikon Mk 4", ln = 3, sensor = 3, omega = 65,
        dmin = 10, dmax = 2500, altmin = -5, altmax = 2000, react = 0.8, ammo = 1800, portion = 1800,
        shells = { "USN_20mm_Mk4_HE", "USN_20mm_Mk4_AP" }, delay = 60 / 450, reload = 15 })
    _G.USN_Cruiser_Declared.__templates = true
end

-- Standard traverse arcs (ship-relative, MAX -> MIN, CCW positive: 90 = port, -90 = stbd)
USN_ARCS = {
    fwd  = function(e0, e1) return { { math.rad(150), math.rad(-150), math.rad(e0), math.rad(e1) } } end,
    aft  = function(e0, e1) return { { math.rad(180), math.rad(30), math.rad(e0), math.rad(e1) },
                                     { math.rad(-30), math.rad(-180), math.rad(e0), math.rad(e1) } } end,
    port = function(e0, e1) return { { math.rad(175), math.rad(5), math.rad(e0), math.rad(e1) } } end,
    stbd = function(e0, e1) return { { math.rad(-5), math.rad(-175), math.rad(e0), math.rad(e1) } } end,
}

-- Adds one WS per mount. m = { pos = {x,y,z}, az = arg, el = arg, arcs = {...}, refY = deg, area = "...",
--                              barrels = n, spacing = m (lateral), length = m (muzzle offset),
--                              conn = "fmt with %d" (optional, muzzle connector per barrel - the model has
--                              these as POINT_GUN_<caliber>_<mount>_<barrel> empties, see cleveland_class_common.lua),
--                              recoil_arg = int (optional, one arg per mount, drives the barrel slide 0=in
--                              battery / 1=full recoil rigged in the .blend), recoil_time = seconds (optional) }
function USN_add_mounts(GT, list, proto_ws)
    for _, m in ipairs(list) do
        local ws = GT_t.inc_ws()
        GT.WS[ws] = {}
        set_recursive_metatable(GT.WS[ws], proto_ws)
        GT.WS[ws].pos               = m.pos
        GT.WS[ws].area              = m.area
        GT.WS[ws].drawArgument1     = m.az
        GT.WS[ws].drawArgument2     = m.el
        GT.WS[ws].angles            = m.arcs
        GT.WS[ws].reference_angle_Y = math.rad(m.refY or 0)
        GT.WS[ws].LN = { [1] = {} }                        -- own LN table per mount (no metatable aliasing)
        set_recursive_metatable(GT.WS[ws].LN[1], proto_ws.LN[1])
        local n, br = m.barrels or 1, {}
        for k = 1, n do
            local off = (k - (n + 1) / 2) * (m.spacing or 0.6)
            br[k] = { pos = { m.length or 3.0, 0, off } }
            if m.conn then br[k].connector_name = string.format(m.conn, k) end
            if m.recoil_arg then
                br[k].recoilArgument = m.recoil_arg
                br[k].recoilTime     = m.recoil_time or 0.3
            end
        end
        GT.WS[ws].LN[1].BR = br
    end
end
