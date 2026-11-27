--Dec 2025 - Pikey, Thanks to DCS community members such as Tetet and Quaggles for their conceptual and remote indirect assistance .
-- This is my own work. Share, sell, credit your mother's aunts dog, I don't care. I reserve the right to call you out ;) if I catch it.
--Shared SENSOR file for TF58, TF57 and IJN
--[[
Kongō (fast battleship)
Type 21 air-search
Type 13 early-warning ×2
Type 22 surface/FC ×2

Aoba (CA)
Type 21 air-search (by 1944, visible in postwar photos)
Type 22 surface/FC ×2 (by 1944)
Type 13 air-search (fitted; antenna reportedly lost Oct 23 1944)

Agano (CL)
Type 13 air-warning
Type 22 surface/FC
(plus radar intercept receiver noted for class))

Hatsuharu (DD)
Type 22 surface/FC (late 1943–44)
Type 13 air-warning (1944)

Akizuki (DD)
Early ships: Type 21 air-search
Surviving to 1944: add Type 13 air-warning
Late production: Type 22 surface/FC replaced 21, plus Type 13 (some with two 13s)

Hiryū (CV) — sunk 5 Jun 1942
No radar at Midway; IJN carriers then lacked sets.

Shinano (CV) — completed Nov 1944, sunk 29 Nov 1944
Planned/likely: Type 22 surface/FC and Type 13 air-search (some sources list two 13s + 21s in plans). Installation at time of loss is uncertain.

Zuikaku (CV) — sunk 25 Oct 1944
Type 21 air-search (first fitted to Shōkaku-class from late 1942; Zuikaku received sets post-1942)
Type 13 air-search added before June 1944
]]
-- Type 13 Air-Warning Radar (~100 km vs bomber formations)
--HERE BE DRAGONS.

---------------------------------------------------------
-- SENSOR TYPE CONSTANTS
---------------------------------------------------------
local SENSOR_OPTICAL = 0
local SENSOR_RADAR   = 1
local SENSOR_IRST    = 2
local SENSOR_RWR     = 3

-- RADAR
local RADAR_AS          = 0
local RADAR_SS          = 1
local RADAR_MULTIROLE   = 2

-- ASPECT
local ASPECT_HEAD_ON = 0
local ASPECT_TAIL_ON = 1

-- HEMISPHERE
local HEMISPHERE_UPPER = 0
local HEMISPHERE_LOWER = 1

-- IRST
local ENGINE_MODE_FORSAGE = 0
local ENGINE_MODE_MAXIMAL = 1
local ENGINE_MODE_MINIMAL = 2

-- OPTIC
local OPTIC_SENSOR_TV   = 0
local OPTIC_SENSOR_LLTV = 1
local OPTIC_SENSOR_IR   = 2


IJN_Type13_AS =
{
    Name = "IJN Type 13",
    category = SENSOR_RADAR,
    type = RADAR_AS,
    scan_volume =
    {
        azimuth   = {-180.0, 180.0},
        elevation = {-10.0, 80.0},
    },
    max_measuring_distance = 100000.0,
    detection_distance =
    {
        [HEMISPHERE_UPPER] =
        {
            [ASPECT_HEAD_ON] = 90000.0,
            [ASPECT_TAIL_ON] = 90000.0,
        },
        [HEMISPHERE_LOWER] =
        {
            [ASPECT_HEAD_ON] = 40000.0,
            [ASPECT_TAIL_ON] = 40000.0,
        }
    },
    lock_on_distance_coeff = 0.55,
    velocity_limits =
    {
        radial_velocity_min = 10.0,
    },
    scan_period = 10.0,
}

declare_sensor(IJN_Type13_AS)


IJN_Type21_AS =
{
    Name = "IJN Type 21",
    category = SENSOR_RADAR,
    type = RADAR_AS,
    scan_volume =
    {
        azimuth   = {-180.0, 180.0},
        elevation = {-10.0, 70.0},
    },
    max_measuring_distance = 90000.0,
    detection_distance =
    {
        [HEMISPHERE_UPPER] =
        {
            [ASPECT_HEAD_ON] = 80000.0,
            [ASPECT_TAIL_ON] = 80000.0,
        },
        [HEMISPHERE_LOWER] =
        {
            [ASPECT_HEAD_ON] = 30000.0,
            [ASPECT_TAIL_ON] = 30000.0,
        },
    },
    lock_on_distance_coeff = 0.65,
    velocity_limits =
    {
        radial_velocity_min = 10.0,
    },
    scan_period = 8.0,
}
declare_sensor(IJN_Type21_AS)
-- IJN Type 22 Surface-Search Radar (historical S-band set; typical 17–25 km, upper limit ~30 km)
IJN_Type22_SS =
{
    Name = "IJN Type 22 Surface",
    category = SENSOR_RADAR,
    type = RADAR_SS,
    vehicles_detection = true,
    airborne_radar = false,
    scan_volume =
    {
        azimuth   = {-180.0, 180.0},
        elevation = {-10.0, 60.0},
    },
    max_measuring_distance = 30000.0,
    detection_distance =
    {
        [HEMISPHERE_UPPER] =
        {
            [ASPECT_HEAD_ON] = 30000.0,
            [ASPECT_TAIL_ON] = 30000.0,
        },
        [HEMISPHERE_LOWER] =
        {
            [ASPECT_HEAD_ON] = 30000.0,
            [ASPECT_TAIL_ON] = 30000.0,
        },
    },
    lock_on_distance_coeff = 1.0,
    velocity_limits =
    {
        radial_velocity_min = 5.0,
    },

    scan_period = 6.0,
    RCS = 10.0,
    RBM_detection_distance = 30000.0,
}

declare_sensor(IJN_Type22_SS)

IJN_Type22_Kongo_SS =
{
    Name = "IJN Type 22 Surface Kongo",
    category = SENSOR_RADAR,
    type = RADAR_SS,
    vehicles_detection = true,
    airborne_radar = false,

    scan_volume =
    {
        azimuth   = {-180.0, 180.0},
        elevation = {-10.0, 60.0},
    },

    -- Boosted to match Kongo 14" gun range (~38.4 km)
    max_measuring_distance = 40000.0,

    detection_distance =
    {
        [HEMISPHERE_UPPER] =
        {
            [ASPECT_HEAD_ON] = 40000.0,
            [ASPECT_TAIL_ON] = 40000.0,
        },
        [HEMISPHERE_LOWER] =
        {
            [ASPECT_HEAD_ON] = 40000.0,
            [ASPECT_TAIL_ON] = 40000.0,
        },
    },

    lock_on_distance_coeff = 1.0,

    velocity_limits =
    {
        radial_velocity_min = 5.0,
    },

    scan_period = 6.0,
    RCS = 10.0,
    RBM_detection_distance = 40000.0,
}

declare_sensor(IJN_Type22_Kongo_SS)

---------------------------------
--USN
---------------------------------
--[[
Iowa → SK, SG, Mk8_FC, Mk12_22_FC. 
Baltimore / Brooklyn → SG, SK (or SC/SK mix depending on refit), Mk12_22_FC for DP. 
Fletcher (DD) → SG (on many), SC or SR/SR-variant for air search early; Mk12_22_FC or Mk4 variants for DP directors depending on ship block. Use SC + SG for older fits. 
Enterprise / Princeton (carriers) → SK and SG (plus SC on earlier refits). Carriers also had fighter-direction gear and multiple FC radars (Mk12 for 5" and dedicated director radars). 
]]

--for use on Baltimore and Iowa - combines FC with detection.
-- USN SG Plus Surface-Search Radar (hybrid SG + FC; boosted to Iowa/Baltimore 16"/8" gun range)
USN_SG_Plus_SS =
{
    Name = "USN SG plus",
    category = SENSOR_RADAR,
    type = RADAR_SS,
    vehicles_detection = true,
    airborne_radar = false,
    scan_volume =
    {
        azimuth   = {-180.0, 180.0},
        elevation = {-10.0, 30.0},
    },
    max_measuring_distance = 42000.0,
    detection_distance =
    {
        [HEMISPHERE_UPPER] =
        {
            [ASPECT_HEAD_ON] = 42000.0,
            [ASPECT_TAIL_ON] = 42000.0,
        },
        [HEMISPHERE_LOWER] =
        {
            [ASPECT_HEAD_ON] = 42000.0,
            [ASPECT_TAIL_ON] = 42000.0,
        },
    },
    lock_on_distance_coeff = 1.0,
    velocity_limits =
    {
        radial_velocity_min = 5.0,
    },
    scan_period = 6.0,
    RCS = 10.0,
    RBM_detection_distance = 42000.0,
}
declare_sensor(USN_SG_Plus_SS)



-- SK (USN long-range air-search, introduced 1944; ≈160 km practical range)
USN_SK_AS =
{
    Name = "USN SK",
    category = SENSOR_RADAR,
    type = RADAR_AS,
    scan_volume =
    {
        azimuth   = {-180.0, 180.0},
        elevation = {-10.0, 60.0},
    },
    max_measuring_distance = 160000.0,
    detection_distance =
    {
        [HEMISPHERE_UPPER] =
        {
            [ASPECT_HEAD_ON] = 150000.0,
            [ASPECT_TAIL_ON] = 150000.0,
        },
        [HEMISPHERE_LOWER] =
        {
            [ASPECT_HEAD_ON] = 60000.0,
            [ASPECT_TAIL_ON] = 60000.0,
        },
    },
    lock_on_distance_coeff = 0.70,
    velocity_limits =
    {
        radial_velocity_min = 10.0,
    },
    scan_period = 6.0,
}
declare_sensor(USN_SK_AS)
-- Note: SK = long-range air search used on capital ships and carriers from 1944. 

--SG radar
USN_SG_SS =
{
    Name = "USN SG",
    category = SENSOR_RADAR,
    type = RADAR_SS,
    vehicles_detection = true,
    airborne_radar = false,
    scan_volume =
    {
        azimuth   = {-180.0, 180.0},
        elevation = {-10.0, 30.0},
    },
    max_measuring_distance = 90000.0,
    detection_distance =
    {
        [HEMISPHERE_UPPER] =
        {
            [ASPECT_HEAD_ON] = 85000.0,
            [ASPECT_TAIL_ON] = 85000.0,
        },
        [HEMISPHERE_LOWER] =
        {
            [ASPECT_HEAD_ON] = 45000.0,
            [ASPECT_TAIL_ON] = 45000.0,
        },
    },
    lock_on_distance_coeff = 0.85,
    velocity_limits =
    {
        radial_velocity_min = 5.0,
    },
    scan_period = 4.0,
    RCS = 10.0,
    RBM_detection_distance = 85000.0,
}
declare_sensor(USN_SG_SS)

USN_SC_AS =
{
    Name = "USN SC",
    category = SENSOR_RADAR,
    type = RADAR_AS,
    scan_volume =
    {
        azimuth   = {-180.0, 180.0},
        elevation = {-10.0, 60.0},
    },
    max_measuring_distance = 110000.0,
    detection_distance =
    {
        [HEMISPHERE_UPPER] =
        {
            [ASPECT_HEAD_ON] = 100000.0,
            [ASPECT_TAIL_ON] = 100000.0,
        },
        [HEMISPHERE_LOWER] =
        {
            [ASPECT_HEAD_ON] = 40000.0,
            [ASPECT_TAIL_ON] = 40000.0,
        },
    },
    lock_on_distance_coeff = 0.55,
    velocity_limits =
    {
        radial_velocity_min = 10.0,
    },
    scan_period = 10.0,
}
declare_sensor(USN_SC_AS)


------------------------------------
--BPF units and radars
-----------------------------------
--[[
KGV	Type 281B, Type 277, Type 284, Type 285
Minotaur / Dido	Type 281B or 293, Type 284, Type 285
Battle-class DD	Type 293, Type 285
J/K/N-class DD	Type 291 or 293 (use 293 block), Type 285
Indomitable / Illustrious (carriers)	Type 281B, Type 277, Type 285 (on directors)
]]

-- RN Type 281B Air-Search Radar (long-range fleet EW set; typical detection 100–140 km)
RN_Type281B_AS =
{
    Name = "RN Type 281B",
    category = SENSOR_RADAR,
    type = RADAR_AS,
    scan_volume =
    {
        azimuth   = {-180.0, 180.0},
        elevation = {-10.0, 70.0},
    },
    max_measuring_distance = 140000.0,
    detection_distance =
    {
        [HEMISPHERE_UPPER] =
        {
            [ASPECT_HEAD_ON] = 130000.0,
            [ASPECT_TAIL_ON] = 130000.0,
        },
        [HEMISPHERE_LOWER] =
        {
            [ASPECT_HEAD_ON] = 90000.0,
            [ASPECT_TAIL_ON] = 90000.0,
        },
    },
    lock_on_distance_coeff = 0.75,
    velocity_limits =
    {
        radial_velocity_min = 10.0,
    },
    scan_period = 6.0,
}
declare_sensor(RN_Type281B_AS)


-- RN Type 293 Surface-Search Radar (tactical 10 cm set, effective 20–30 km, upper bound ~40–45 km)
RN_Type293_SS =
{
    Name = "RN Type 293",
    category = SENSOR_RADAR,
    type = RADAR_SS,
    vehicles_detection = true,
    airborne_radar = false,
    scan_volume =
    {
        azimuth   = {-180.0, 180.0},
        elevation = {-10.0, 60.0},
    },
    max_measuring_distance = 45000.0,
    detection_distance =
    {
        [HEMISPHERE_UPPER] =
        {
            [ASPECT_HEAD_ON] = 45000.0,
            [ASPECT_TAIL_ON] = 45000.0,
        },
        [HEMISPHERE_LOWER] =
        {
            [ASPECT_HEAD_ON] = 45000.0,
            [ASPECT_TAIL_ON] = 45000.0,
        },
    },
    lock_on_distance_coeff = 1.0,
    velocity_limits =
    {
        radial_velocity_min = 5.0,
    },
    scan_period = 5.0,
    RCS = 10.0,
    RBM_detection_distance = 45000.0,
}
declare_sensor(RN_Type293_SS)


-- RN Type 285 Surface/Fire-Control Radar (~25 km; carrier/AA director set adapted for surface picture)
RN_Type285_SS =
{
    Name = "RN Type 285",
    category = SENSOR_RADAR,
    type = RADAR_SS,
    vehicles_detection = true,
    airborne_radar = false,
    scan_volume =
    {
        azimuth   = {-180.0, 180.0},
        elevation = {-15.0, 85.0},
    },
    max_measuring_distance = 25000.0,
    detection_distance =
    {
        [HEMISPHERE_UPPER] =
        {
            [ASPECT_HEAD_ON] = 25000.0,
            [ASPECT_TAIL_ON] = 25000.0,
        },
        [HEMISPHERE_LOWER] =
        {
            [ASPECT_HEAD_ON] = 18000.0,
            [ASPECT_TAIL_ON] = 18000.0,
        },
    },
    lock_on_distance_coeff = 0.9,
    velocity_limits =
    {
        radial_velocity_min = 5.0,
    },
    scan_period = 1.5,
    RCS = 10.0,
    RBM_detection_distance = 25000.0,
}
declare_sensor(RN_Type285_SS)


--------------------------------------
--RWR sets for both   
--------------------------------------

-- Generic Naval RWR / ESM (passive radar warning receiver for all fleets)
Generic_WW2_RWR =
{
    Name  = "Generic WW2 RWR",
    category = SENSOR_RWR,

    -- ESM detects emits at roughly radar-range or slightly better
    detection_dist_to_radar_detection_dist_max_ratio = 1.2,
    lock_on_detection = true,
}

declare_sensor(Generic_WW2_RWR)
