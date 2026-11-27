-- ============================================================================
-- PTO'43 Modpack — IJN Naval Artillery, AA & Torpedo Mount Templates (JP_*)
-- ============================================================================

GT_t = GT_t or {}
GT_t.WS_t = GT_t.WS_t or {}
GT_t.LN_t = GT_t.LN_t or {}

-- ============================================================================
-- 1. Main Battery: 20.3cm (203mm/50) 3rd Year Type No. 2 Twin Turret
-- ============================================================================
GT_t.WS_t.JP_203mm_Type3_Twin = {
    name = "JP_203mm_Type3_Twin",
    type = 6,
    omegaY = math.rad(6.0),
    omegaZ = math.rad(12.0),
    pidY = {p=35, i=0.8, d=7},
    pidZ = {p=35, i=0.8, d=7},
    moveable = true,
    reference_angle_Z = 0,
    LN = {
        [1] = {
            type = 6,
            distanceMin = 400,
            distanceMax = 29400,
            reactionTime = 1.5,
            reflection_limit = 0.22,
            connectorFire = false,
            min_trg_alt = -1,
            max_trg_alt = 8000,
            beamWidth = math.rad(90),
            sensor = {},
            PL = {
                [1] = {
                    ammo_capacity = 240,
                    shell_name = {"JP_203mm_Type0_HE", "JP_203mm_Type91_AP"},
                    shot_delay = 7.5,
                    reload_time = 25.0,
                    barrels_reload_type = (GT_t.BarrelsReloadTypes and GT_t.BarrelsReloadTypes.ORDINARY) or 1,
                    shot_sound = {
                        { "Weapons/Cannons/Cannon_Large_Fire", 0.0, 1.0, 1500 }
                    },
                }
            }
        }
    }
}
set_recursive_metatable(GT_t.WS_t.JP_203mm_Type3_Twin.LN[1].sensor, GT_t.WSN_t[10])

-- ============================================================================
-- 2. Heavy Dual-Purpose Battery: 12.7cm (127mm/40) Type 89 Twin Mount
-- ============================================================================
GT_t.WS_t.JP_127mm_Type89_Twin = {
    name = "JP_127mm_Type89_Twin",
    type = 3,
    omegaY = math.rad(16.0),
    omegaZ = math.rad(16.0),
    pidY = GT_t.AAA_PIDY or {p=60, i=1, d=9},
    pidZ = GT_t.AAA_PIDZ or {p=60, i=1, d=9},
    moveable = true,
    reference_angle_Z = 0,
    LN = {
        [1] = {
            type = 3,
            distanceMin = 200,
            distanceMax = 14800,
            distanceMaxAir = 9400,
            reactionTime = 1.2,
            reflection_limit = 0.18,
            connectorFire = false,
            min_trg_alt = -1,
            max_trg_alt = 9400,
            beamWidth = math.rad(90),
            sensor = {},
            PL = {
                [1] = {
                    ammo_capacity = 400,
                    shell_name = {"IJN_127mm_Type89_AA_T12", "IJN_127mm_Type89_AA_T8", "IJN_127mm_Type89_AA_T5"},   -- AA time-fuze belt (IJN_127mm_AA_fuze_belt.lua)
                    shot_delay = 2.14,
                    reload_time = 15.0,
                    barrels_reload_type = (GT_t.BarrelsReloadTypes and GT_t.BarrelsReloadTypes.ORDINARY) or 1,
                    shot_sound = {
                        { "Weapons/Cannons/Cannon_Medium_Fire", 0.0, 1.0, 800 }
                    },
                }
            }
        }
    }
}
set_recursive_metatable(GT_t.WS_t.JP_127mm_Type89_Twin.LN[1].sensor, GT_t.WSN_t[SN_AA_FAST or 3])

-- ============================================================================
-- 3. Light AA Battery: 25mm/60 Type 96 Series (Single, Twin, Triple)
-- ============================================================================
local function create_25mm_type96(name, shot_delay, ammo_capacity, omega_deg)
    local mount = {
        name = name,
        type = 3,
        omegaY = math.rad(omega_deg),
        omegaZ = math.rad(omega_deg),
        pidY = GT_t.AAA_PIDY or {p=80, i=1, d=10},
        pidZ = GT_t.AAA_PIDZ or {p=80, i=1, d=10},
        moveable = true,
        reference_angle_Z = 0,
        LN = {
            [1] = {
                type = 3,
                distanceMin = 20,
                distanceMax = 3800,
                distanceMaxAir = 3500,
                reactionTime = 0.3,
                reflection_limit = 0.22,
                connectorFire = false,
                min_trg_alt = -1,
                max_trg_alt = 3500,
                beamWidth = math.rad(90),
                sensor = {},
                PL = {
                    [1] = {
                        ammo_capacity = ammo_capacity,
                        shell_name = {"IJN_25mm_Type96_HE"},
                        shot_delay = shot_delay,
                        reload_time = 12.0,
                        shot_sound = {
                            { "Weapons/Cannons/Cannon_Small_Fire", 0.0, 1.0, 450 }
                        },
                    }
                }
            }
        }
    }
    set_recursive_metatable(mount.LN[1].sensor, GT_t.WSN_t[SN_AA_FAST or 3])
    return mount
end

GT_t.WS_t.JP_25mm_Type96_Single = create_25mm_type96("JP_25mm_Type96_Single", 0.272,  900, 60.0) -- ~220 rpm
GT_t.WS_t.JP_25mm_Type96_Twin   = create_25mm_type96("JP_25mm_Type96_Twin",   0.136, 1200, 45.0) -- ~440 rpm combined
GT_t.WS_t.JP_25mm_Type96_Triple = create_25mm_type96("JP_25mm_Type96_Triple", 0.091, 2400, 45.0) -- ~660 rpm combined

-- ============================================================================
-- 4. Torpedo Battery: 610mm Type 92 Quadruple Revolving Torpedo Tube
-- ============================================================================
local jp_type93_ammo = "weapons.torpedoes.JP_610mm_Type93"

GT_t.WS_t.JP_610mm_Type92_Torp_Quad = {
    name = "JP_610mm_Type92_Torp_Quad",
    type = WS_TORPEDO or 32,
    omegaY = math.rad(15.0),
    omegaZ = math.rad(10.0),
    pidY = {p=40, i=1, d=7},
    pidZ = {p=40, i=1, d=7},
    moveable = true,
    drawArgument2 = -1,
    canSetTacticalDir = true,
    LN = {
        [1] = {
            type = WS_TORPEDO or 32,
            distanceMin = 250,
            distanceMax = 15000,
            reactionTime = 1.0,
            launch_delay = 1.0,
            maxShootingSpeed = 25.0,
            barrels_reload_type = (GT_t.BarrelsReloadTypes and GT_t.BarrelsReloadTypes.ORDINARY) or 1,
            min_trg_alt = -10,
            max_trg_alt = 25,
            max_number_of_missiles_channels = 1,
            show_external_missile = false,
            sensor = {},
            PL = {
                [1] = {
                    name_ammunition = "JP_610mm_Type93",
                    type_ammunition = jp_type93_ammo,
                    ammo_capacity = 4,
                    shot_delay = 2.0,
                    reload_time = 1000000,
                }
            }
        }
    }
}
set_recursive_metatable(GT_t.WS_t.JP_610mm_Type92_Torp_Quad.LN[1].sensor, GT_t.WSN_t[SN_AA_FAST or 3])

-- ============================================================================
-- IJN Haruna: 35.6cm/45 Twin Turret & 15.2cm/50 Type 41 Single Casemate
-- ============================================================================
GT_t.WS_t.JP_356mm_Type41_Twin = {
    name = "JP_356mm_Type41_Twin",
    type = 6,
    omegaY = math.rad(4.0),
    omegaZ = math.rad(6.0),
    pidY = {p=30, i=0.6, d=8},
    pidZ = {p=30, i=0.6, d=8},
    moveable = true,
    reference_angle_Z = 0,
    LN = {
        [1] = {
            type = 6,
            distanceMin = 600,
            distanceMax = 35450,
            reactionTime = 2.0,
            reflection_limit = 0.22,
            connectorFire = false,
            min_trg_alt = -1,
            max_trg_alt = 150,
            beamWidth = math.rad(90),
            sensor = {},
            PL = {
                [1] = {
                    ammo_capacity = 200,
                    shell_name = {"IJN_356mm_Type0_HE", "IJN_356mm_Type91_AP"},
                    shot_delay = 28.0,
                    reload_time = 35.0,
                    barrels_reload_type = (GT_t.BarrelsReloadTypes and GT_t.BarrelsReloadTypes.ORDINARY) or 1,
                    shot_sound = {
                        { "Weapons/Cannons/Cannon_Large_Fire", 0.0, 1.0, 2500 }
                    },
                }
            }
        }
    }
}
set_recursive_metatable(GT_t.WS_t.JP_356mm_Type41_Twin.LN[1].sensor, GT_t.WSN_t[10])

GT_t.WS_t.JP_152mm_Type41_Single = {
    name = "JP_152mm_Type41_Single",
    type = 6,
    omegaY = math.rad(10.0),
    omegaZ = math.rad(12.0),
    pidY = {p=40, i=1.0, d=6},
    pidZ = {p=40, i=1.0, d=6},
    moveable = true,
    reference_angle_Z = 0,
    LN = {
        [1] = {
            type = 6,
            distanceMin = 300,
            distanceMax = 21000,
            reactionTime = 1.2,
            reflection_limit = 0.22,
            connectorFire = false,
            min_trg_alt = -1,
            max_trg_alt = 200,
            beamWidth = math.rad(90),
            sensor = {},
            PL = {
                [1] = {
                    ammo_capacity = 150,
                    shell_name = {"IJN_152mm_Type41_HE"},
                    shot_delay = 10.0,
                    reload_time = 15.0,
                    shot_sound = {
                        { "Weapons/Cannons/Cannon_Large_Fire", 0.0, 1.0, 1200 }
                    },
                }
            }
        }
    }
}
set_recursive_metatable(GT_t.WS_t.JP_152mm_Type41_Single.LN[1].sensor, GT_t.WSN_t[10])
