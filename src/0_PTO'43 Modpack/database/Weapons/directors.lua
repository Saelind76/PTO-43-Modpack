-- ============================================================================
-- IJN Cruiser Mogami / Kumano — Fire Control Directors (Type 94 Hoishiki)
-- Standardized DCS GT_t.WS_t Director Templates (JP_*)
-- ============================================================================

GT_t = GT_t or {}
GT_t.WS_t = GT_t.WS_t or {}
GT_t.LN_t = GT_t.LN_t or {}

-- ============================================================================
-- 1. Main Battery Optical & Radar Director: Type 94 Hoishiki (Bridge Top)
-- ============================================================================
-- 6-meter stereoscopic rangefinder & Type 22 surface search / gunnery director.
-- Controls 203mm Main Battery turrets and 610mm Torpedo lead solutions.
GT_t.WS_t.JP_DCT_Type94_Main = {
    name = "JP_DCT_Type94_Main",
    omegaY = 0.40,
    omegaZ = 0.40,
    pidY = {p=50, i=1, d=8},
    pidZ = {p=50, i=1, d=8},
    moveable = true,
    LN = {
        [1] = {
            type = wsType_Radar_MissGun or 103,
            frequencyRange = {0.5e9, 0.6e9},
            distanceMin = 100,
            distanceMax = 45000,
            reactionTime = 0.5,
            reflection_limit = 0.05,
            ECM_K = 0.5,
            min_trg_alt = -1,
            max_trg_alt = 10000,
            max_number_of_missiles_channels = 24,
            beamWidth = math.rad(90),
            sensor = {},
        }
    }
}
set_recursive_metatable(GT_t.WS_t.JP_DCT_Type94_Main.LN[1].sensor, GT_t.WSN_t[SN_NAVAL_STANDARD or 0])

-- ============================================================================
-- 2. High-Angle Anti-Aircraft Director: Type 94 Kosha Sochi (Aft Mast)
-- ============================================================================
-- Stabilized AA fire-control computer for 127mm/40 Type 89 DP battery.
GT_t.WS_t.JP_DCT_Type94_AA = {
    name = "JP_DCT_Type94_AA",
    omegaY = 0.65,
    omegaZ = 0.65,
    pidY = GT_t.AAA_PIDY or {p=70, i=1, d=9},
    pidZ = GT_t.AAA_PIDZ or {p=70, i=1, d=9},
    moveable = true,
    LN = {
        [1] = {
            type = wsType_Radar_MissGun or 103,
            frequencyRange = {0.5e9, 0.6e9},
            distanceMin = 50,
            distanceMax = 25000,
            distanceMaxAir = 18000,
            reactionTime = 0.3,
            reflection_limit = 0.05,
            ECM_K = 0.5,
            min_trg_alt = -1,
            max_trg_alt = 12000,
            max_number_of_missiles_channels = 32,
            beamWidth = math.rad(90),
            sensor = {},
        }
    }
}
set_recursive_metatable(GT_t.WS_t.JP_DCT_Type94_AA.LN[1].sensor, GT_t.WSN_t[SN_AA_FAST or 3])
