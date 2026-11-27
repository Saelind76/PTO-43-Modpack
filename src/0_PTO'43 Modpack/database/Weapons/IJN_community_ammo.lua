-- ============================================================================================================
-- PTO '43 MODPACK - COMMUNITY IJN NAVAL AMMUNITION & 25MM MOUNT TEMPLATE
-- Unified & deduplicated for Zuikaku CV and Akizuki DD (replaces Zuikaku.lua inline shells + Akizuki/Weapons)
-- ============================================================================================================

local _ = _ or function(str) return str end
local CAT_SHELLS = CAT_SHELLS or 6

-- 100mm Type 98 HE (Akizuki DD)
declare_weapon({
    category = CAT_SHELLS,
    name = "HE_100",
    user_name = _("100mm HE"),
    aiming_table = {
        precalculateAirDefenceAimingTable = false,
        precalculateAimingTable = true,
        [1] = { init_vel = 1000.0 },
    },
    mass = 13.0,
    round_mass = 13.0,
    explosive = 2.6,
    v0 = 1000.0,
    silent_self_destruction = 0,
    Dv0 = 2.5e-04,
    Da0 = 4.0e-05,
    Da1 = 1.5e-05,
    cx = {0.2, 0.6, 0.7, 0.2, 1.67},
    k1 = 2.0e-10,
    life_time = 30.0,
    caliber = 100.0,
    display_name = "100mm HE",
    damage_factor = 3.0,
    model_name = "tracer_bullet_white",
    scale_tracer = 0.1,
    tracer_on = 0.1,
    tracer_off = 1.0,
    smoke_tail_life_time = 1.0,
    s = 0.0, j = 0.0, l = 0.0, charTime = 0,
    rotation_freq = 20,
    cartridge = 0,
    visual_effect_correction = 2.0,
    type_name = "shell",
    warhead = {
        mass = 13.0,
        expl_mass = 2.6,
        type = 1,
        caliber = 100,
    },
})

-- 127mm Type 89 AA (Zuikaku CV)
declare_weapon({
    category = CAT_SHELLS,
    name = "127mm_Type89_AA",
    user_name = _("127mm Type 89 AA"),
    aiming_table = {
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = false,
        [1] = { init_vel = 720.0 },
    },
    model_name = "tracer_bullet_yellow",
    scale_tracer = 0.1,
    tracer_on = 0.1,
    tracer_off = 1.0,
    smoke_tail_life_time = 1.0,
    mass = 23.0,
    round_mass = 23.0,
    explosive = 1.6,
    v0 = 720.0,
    Da0 = 1.10e-04,
    Da1 = 3.00e-05,
    Dv0 = 1.10e-04,
    k1  = 1.10e-10,
    damage_factor = 90,
    life_time = 18.0,
    caliber = 127.0,
    display_name = "127mm AA Type 89",
    cx = {0.0, 0.20, 0.48, 0.12, 1.10},
    s = 0.0, j = 0.0, l = 0.0, charTime = 0,
    rotation_freq = 0,
    cartridge = 0,
    type_name = "shell",
    warhead = {
        mass = 23.0,
        expl_mass = 1.6,
        piercing_mass = 5.0,
        type = 1,
        caliber = 127,
    },
})

-- Japanese 25mm AAA (Ball)
declare_weapon({
    Da0 = 0.0007,
    Da1 = 0.0,
    Dv0 = 0.005,
    _unique_resource_name = "weapons.shells.25mm_AA_JAP_ball",
    aiming_table = {
        { init_vel = 820 },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = false,
    },
    caliber = 25,
    cartridge = 0,
    cartridge_mass = 0,
    category = CAT_SHELLS,
    charTime = 0,
    cumulative_mass = 0,
    cumulative_thickness = 0,
    cx = { 1, 0.74, 0.65, 0.15, 1.78 },
    damage_factor = 319.5,
    display_name = "25mm AA ball",
    explosive = 0.15,
    full_scale_time = -1,
    j = 0,
    k1 = 2.3e-08,
    l = 0,
    life_time = 8,
    manualWeaponFlag = 21,
    mass = 0.27,
    model_name = "pula",
    name = "25mm_AA_JAP_ball",
    payload = 0.02769060,
    payload_type = 0,
    piercing_mass = 0.054,
    rebound_concrete = {
        angle0 = 50,
        angle100 = 75,
        cx_factor = 5,
        deviation_angle = 30,
        velocity_loss_factor = 0.5,
    },
    rebound_ground = {
        angle0 = 55,
        angle100 = 73,
        cx_factor = 5,
        deviation_angle = 30,
        velocity_loss_factor = 0.5,
    },
    rebound_object = {
        angle0 = 65,
        angle100 = 83,
        cx_factor = 5,
        deviation_angle = 30,
        velocity_loss_factor = 0.5,
    },
    rebound_water = {
        angle0 = 65,
        angle100 = 83,
        cx_factor = 5,
        deviation_angle = 30,
        velocity_loss_factor = 0.5,
    },
    rotation_freq = 7,
    round_mass = 0.69,
    s = 0,
    scale_tracer = 0.25,
    silent_self_destruction = 0,
    smoke_tail_life_time = 0.2,
    subcalibre = false,
    tracer_off = 5.5,
    tracer_on = 0.2,
    type_name = "shell",
    user_name = "25mm AA ball",
    v0 = 820,
    visual_effect_correction = 0,
    visual_effect_correction_rebound = 0.1,
})

-- Japanese 25mm AAA (White Tracer)
declare_weapon({
    Da0 = 0.0007,
    Da1 = 0.0,
    Dv0 = 0.005,
    silent_self_destruction = 0,
    _unique_resource_name = "weapons.shells.25mm_AA_JAP_WHITE",
    aiming_table = {
        { init_vel = 820 },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = false,
    },
    caliber = 25,
    cartridge = 0,
    cartridge_mass = 0,
    category = CAT_SHELLS,
    charTime = 0,
    cumulative_mass = 0,
    cumulative_thickness = 0,
    cx = { 1, 0.74, 0.65, 0.15, 1.78 },
    damage_factor = 319.5,
    display_name = "25mm AA White Tracer",
    explosive = 0.15,
    full_scale_time = -1,
    j = 0,
    k1 = 2.3e-08,
    l = 0,
    life_time = 8,
    manualWeaponFlag = 21,
    mass = 0.27,
    model_name = "tracer_bullet_white",
    name = "25mm_AA_JAP_WHITE",
    payload = 0.02769060,
    payload_type = 0,
    piercing_mass = 0.054,
    rotation_freq = 7,
    round_mass = 0.69,
    s = 0,
    scale_tracer = 0.25,
    smoke_tail_life_time = 0.2,
    subcalibre = false,
    tracer_off = 5.5,
    tracer_on = 0.2,
    type_name = "shell",
    user_name = "25mm AA White Tracer",
    v0 = 820,
    visual_effect_correction = 0,
    visual_effect_correction_rebound = 0.1,
})

-- Japanese 25mm AAA (Yellow Tracer)
declare_weapon({
    Da0 = 0.0007,
    Da1 = 0.0,
    Dv0 = 0.005,
    silent_self_destruction = 0,
    _unique_resource_name = "weapons.shells.25mm_AA_JAP_YELLOW2",
    aiming_table = {
        { init_vel = 820 },
        precalculateAimingTable = true,
        precalculateAirDefenceAimingTable = false,
    },
    caliber = 25,
    cartridge = 0,
    cartridge_mass = 0,
    category = CAT_SHELLS,
    charTime = 0,
    cumulative_mass = 0,
    cumulative_thickness = 0,
    cx = { 1, 0.74, 0.65, 0.15, 1.78 },
    damage_factor = 319.5,
    display_name = "25mm AA Yellow Tracer",
    explosive = 0.15,
    full_scale_time = -1,
    j = 0,
    k1 = 2.3e-08,
    l = 0,
    life_time = 10,
    manualWeaponFlag = 21,
    mass = 0.27,
    model_name = "tracer_bullet_yellow",
    name = "25mm_AA_JAP_Yellow2",
    payload = 0.02769060,
    payload_type = 0,
    piercing_mass = 0.054,
    rebound_concrete = {
        angle0 = 50,
        angle100 = 75,
        cx_factor = 5,
        deviation_angle = 30,
        velocity_loss_factor = 0.5,
    },
    rebound_ground = {
        angle0 = 55,
        angle100 = 73,
        cx_factor = 5,
        deviation_angle = 30,
        velocity_loss_factor = 0.5,
    },
    rebound_object = {
        angle0 = 65,
        angle100 = 83,
        cx_factor = 5,
        deviation_angle = 30,
        velocity_loss_factor = 0.5,
    },
    rebound_water = {
        angle0 = 65,
        angle100 = 83,
        cx_factor = 5,
        deviation_angle = 30,
        velocity_loss_factor = 0.5,
    },
    rotation_freq = 7,
    round_mass = 0.69,
    s = 0,
    scale_tracer = 0.02,
    smoke_tail_life_time = 1.0,
    subcalibre = false,
    tracer_off = 4.5,
    tracer_on = 0.0,
    type_name = "shell",
    user_name = "25mm AA Yellow",
    v0 = 820,
    visual_effect_correction = 0,
    visual_effect_correction_rebound = 0.1,
})

-- Akizuki DD 25mm Type 96 template (Zuikaku uses its own GT_t.WS_t.Zuikaku_Mgun_25mm)
GT_t.WS_t.Mgun_25mm = { name = "25mm Machine gun", display_name = _("25mm Type 96") }
GT_t.WS_t.Mgun_25mm.omegaY = math.rad(13)
GT_t.WS_t.Mgun_25mm.omegaZ = math.rad(9)
GT_t.WS_t.Mgun_25mm.angles = {{math.rad(130), math.rad(-130), math.rad(-5.5), math.rad(85)}}
GT_t.WS_t.Mgun_25mm.pidY = {p = 50.0, i = 0.0, d = 6.0, inn = 120}
GT_t.WS_t.Mgun_25mm.pidZ = {p = 30.0, i = 0.0, d = 6.0, inn = 120}
GT_t.WS_t.Mgun_25mm.LN = {}
GT_t.WS_t.Mgun_25mm.LN[1] = {}
GT_t.WS_t.Mgun_25mm.LN[1].distanceMax = 2500
GT_t.WS_t.Mgun_25mm.LN[1].distanceMin = 100
GT_t.WS_t.Mgun_25mm.LN[1].max_trg_alt = 2000
GT_t.WS_t.Mgun_25mm.LN[1].type = 3
GT_t.WS_t.Mgun_25mm.LN[1].reload_time = 3
GT_t.WS_t.Mgun_25mm.LN[1].automaticLoader = false
GT_t.WS_t.Mgun_25mm.LN[1].sensor = {
    deviation_error_azimuth      = 0.00943,
    deviation_error_elevation    = 0.00943,
    deviation_error_speed_sensor = 0.00038,
    deviation_error_stability    = 0.00600,
    deviation_error_distance     = 0.00038,
}
GT_t.WS_t.Mgun_25mm.LN[1].PL = {}
GT_t.WS_t.Mgun_25mm.LN[1].PL[1] = {}
GT_t.WS_t.Mgun_25mm.LN[1].PL[1].portionAmmoCapacity = 15
GT_t.WS_t.Mgun_25mm.LN[1].PL[1].createMuzzleFlashEffect = true
GT_t.WS_t.Mgun_25mm.LN[1].PL[1].ammo_capacity = 3000
GT_t.WS_t.Mgun_25mm.LN[1].PL[1].reload_time = 5
GT_t.WS_t.Mgun_25mm.LN[1].PL[1].shot_delay = 0.15
GT_t.WS_t.Mgun_25mm.LN[1].PL[1].shell_name = {"25mm_AA_JAP_ball", "25mm_AA_JAP_Yellow2", "25mm_AA_JAP_ball", "25mm_AA_JAP_ball"}
GT_t.WS_t.Mgun_25mm.LN[1].BR = {
    {pos = {0.8, 0.0,  0.15}},
    {pos = {0.8, 0.0,  0.00}},
    {pos = {0.8, 0.0, -0.15}},
}
