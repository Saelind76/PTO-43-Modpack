-- ============================================================================================================
-- PTO '43 MODPACK - NAVAL SENSORS & RADAR DEFINITIONS
-- Custom historical radar parameters for USN and IJN vessels (1942-1944).
-- ============================================================================================================

---------------------------------------------------------
-- DCS SENSOR TYPE CONSTANTS
---------------------------------------------------------
local SENSOR_OPTICAL = 0
local SENSOR_RADAR   = 1
local SENSOR_IRST    = 2
local SENSOR_RWR     = 3

local RADAR_AS          = 0 -- Air Search
local RADAR_SS          = 1 -- Surface Search
local RADAR_MULTIROLE   = 2 -- Dual Purpose / Fire Control

local ASPECT_HEAD_ON = 0
local ASPECT_TAIL_ON = 1

local HEMISPHERE_UPPER = 0
local HEMISPHERE_LOWER = 1

------------------------------------------------======================================
-- IMPERIAL JAPANESE NAVY (IJN) RADARS
------------------------------------------------======================================
PTO43_IJN_Type13_AS = {
    Name = "PTO43 IJN Type 13 Air Search",
    category = SENSOR_RADAR,
    type = RADAR_AS,
    scan_volume = { azimuth = {-180.0, 180.0}, elevation = {-10.0, 80.0} },
    max_measuring_distance = 100000.0,
    detection_distance = {
        [HEMISPHERE_UPPER] = { [ASPECT_HEAD_ON] = 90000.0, [ASPECT_TAIL_ON] = 90000.0 },
        [HEMISPHERE_LOWER] = { [ASPECT_HEAD_ON] = 40000.0, [ASPECT_TAIL_ON] = 40000.0 }
    },
    lock_on_distance_coeff = 0.55,
    velocity_limits = { radial_velocity_min = 10.0 },
    scan_period = 10.0,
}
declare_sensor(PTO43_IJN_Type13_AS)

PTO43_IJN_Type21_AS = {
    Name = "PTO43 IJN Type 21 Air Search",
    category = SENSOR_RADAR,
    type = RADAR_AS,
    scan_volume = { azimuth = {-180.0, 180.0}, elevation = {-10.0, 70.0} },
    max_measuring_distance = 90000.0,
    detection_distance = {
        [HEMISPHERE_UPPER] = { [ASPECT_HEAD_ON] = 80000.0, [ASPECT_TAIL_ON] = 80000.0 },
        [HEMISPHERE_LOWER] = { [ASPECT_HEAD_ON] = 30000.0, [ASPECT_TAIL_ON] = 30000.0 },
    },
    lock_on_distance_coeff = 0.65,
    velocity_limits = { radial_velocity_min = 10.0 },
    scan_period = 8.0,
}
declare_sensor(PTO43_IJN_Type21_AS)

PTO43_IJN_Type22_SS = {
    Name = "PTO43 IJN Type 22 Surface",
    category = SENSOR_RADAR,
    type = RADAR_SS,
    vehicles_detection = true,
    airborne_radar = false,
    scan_volume = { azimuth = {-180.0, 180.0}, elevation = {-10.0, 60.0} },
    max_measuring_distance = 30000.0,
    detection_distance = {
        [HEMISPHERE_UPPER] = { [ASPECT_HEAD_ON] = 30000.0, [ASPECT_TAIL_ON] = 30000.0 },
        [HEMISPHERE_LOWER] = { [ASPECT_HEAD_ON] = 30000.0, [ASPECT_TAIL_ON] = 30000.0 },
    },
    lock_on_distance_coeff = 1.0,
    velocity_limits = { radial_velocity_min = 5.0 },
    scan_period = 6.0,
    RCS = 10.0,
    RBM_detection_distance = 30000.0,
}
declare_sensor(PTO43_IJN_Type22_SS)

PTO43_IJN_Type22_Heavy_SS = {
    Name = "PTO43 IJN Type 22 Heavy Surface",
    category = SENSOR_RADAR,
    type = RADAR_SS,
    vehicles_detection = true,
    airborne_radar = false,
    scan_volume = { azimuth = {-180.0, 180.0}, elevation = {-10.0, 60.0} },
    max_measuring_distance = 45000.0,
    detection_distance = {
        [HEMISPHERE_UPPER] = { [ASPECT_HEAD_ON] = 45000.0, [ASPECT_TAIL_ON] = 45000.0 },
        [HEMISPHERE_LOWER] = { [ASPECT_HEAD_ON] = 45000.0, [ASPECT_TAIL_ON] = 45000.0 },
    },
    lock_on_distance_coeff = 1.0,
    velocity_limits = { radial_velocity_min = 5.0 },
    scan_period = 6.0,
    RCS = 10.0,
    RBM_detection_distance = 45000.0,
}
declare_sensor(PTO43_IJN_Type22_Heavy_SS)

------------------------------------------------======================================
-- UNITED STATES NAVY (USN) RADARS
------------------------------------------------======================================
PTO43_USN_SC_AS = {
    Name = "PTO43 USN SC Air Search",
    category = SENSOR_RADAR,
    type = RADAR_AS,
    scan_volume = { azimuth = {-180.0, 180.0}, elevation = {-10.0, 60.0} },
    max_measuring_distance = 110000.0,
    detection_distance = {
        [HEMISPHERE_UPPER] = { [ASPECT_HEAD_ON] = 100000.0, [ASPECT_TAIL_ON] = 100000.0 },
        [HEMISPHERE_LOWER] = { [ASPECT_HEAD_ON] = 40000.0, [ASPECT_TAIL_ON] = 40000.0 },
    },
    lock_on_distance_coeff = 0.55,
    velocity_limits = { radial_velocity_min = 10.0 },
    scan_period = 10.0,
}
declare_sensor(PTO43_USN_SC_AS)

PTO43_USN_SK_AS = {
    Name = "PTO43 USN SK Heavy Air Search",
    category = SENSOR_RADAR,
    type = RADAR_AS,
    scan_volume = { azimuth = {-180.0, 180.0}, elevation = {-10.0, 60.0} },
    max_measuring_distance = 160000.0,
    detection_distance = {
        [HEMISPHERE_UPPER] = { [ASPECT_HEAD_ON] = 150000.0, [ASPECT_TAIL_ON] = 150000.0 },
        [HEMISPHERE_LOWER] = { [ASPECT_HEAD_ON] = 60000.0, [ASPECT_TAIL_ON] = 60000.0 },
    },
    lock_on_distance_coeff = 0.70,
    velocity_limits = { radial_velocity_min = 10.0 },
    scan_period = 4.0,
}
declare_sensor(PTO43_USN_SK_AS)

PTO43_USN_SG_SS = {
    Name = "PTO43 USN SG Surface Search",
    category = SENSOR_RADAR,
    type = RADAR_SS,
    vehicles_detection = true,
    airborne_radar = false,
    scan_volume = { azimuth = {-180.0, 180.0}, elevation = {-10.0, 30.0} },
    max_measuring_distance = 90000.0,
    detection_distance = {
        [HEMISPHERE_UPPER] = { [ASPECT_HEAD_ON] = 85000.0, [ASPECT_TAIL_ON] = 85000.0 },
        [HEMISPHERE_LOWER] = { [ASPECT_HEAD_ON] = 45000.0, [ASPECT_TAIL_ON] = 45000.0 },
    },
    lock_on_distance_coeff = 0.85,
    velocity_limits = { radial_velocity_min = 5.0 },
    scan_period = 4.0,
    RCS = 10.0,
    RBM_detection_distance = 85000.0,
}
declare_sensor(PTO43_USN_SG_SS)

-- New: Multirole Director for 5-inch DP Guns (Crucial for Air Tracking)
PTO43_USN_Mk37_FC = {
    Name = "PTO43 USN Mark 37 Fire Control",
    category = SENSOR_RADAR,
    type = RADAR_MULTIROLE,
    vehicles_detection = true,
    airborne_radar = true,
    scan_volume = { azimuth = {-180.0, 180.0}, elevation = {-10.0, 85.0} },
    max_measuring_distance = 45000.0,
    detection_distance = {
        [HEMISPHERE_UPPER] = { [ASPECT_HEAD_ON] = 45000.0, [ASPECT_TAIL_ON] = 45000.0 },
        [HEMISPHERE_LOWER] = { [ASPECT_HEAD_ON] = 45000.0, [ASPECT_TAIL_ON] = 45000.0 },
    },
    lock_on_distance_coeff = 1.0,
    velocity_limits = { radial_velocity_min = 5.0 },
    scan_period = 1.0, -- Fast 1-second sweep guarantees instant flak tracking
    RCS = 10.0,
    RBM_detection_distance = 45000.0,
}
declare_sensor(PTO43_USN_Mk37_FC)

PTO43_USN_Mk8_FC = {
    Name = "PTO43 USN Mark 8 Fire Control",
    category = SENSOR_RADAR,
    type = RADAR_SS,
    vehicles_detection = true,
    airborne_radar = false,
    scan_volume = { azimuth = {-180.0, 180.0}, elevation = {-10.0, 30.0} },
    max_measuring_distance = 42000.0,
    detection_distance = {
        [HEMISPHERE_UPPER] = { [ASPECT_HEAD_ON] = 42000.0, [ASPECT_TAIL_ON] = 42000.0 },
        [HEMISPHERE_LOWER] = { [ASPECT_HEAD_ON] = 42000.0, [ASPECT_TAIL_ON] = 42000.0 },
    },
    lock_on_distance_coeff = 1.0,
    velocity_limits = { radial_velocity_min = 5.0 },
    scan_period = 2.0,
    RCS = 10.0,
    RBM_detection_distance = 42000.0,
}
declare_sensor(PTO43_USN_Mk8_FC)

------------------------------------------------======================================
-- GENERIC WARNING RECEIVERS
------------------------------------------------======================================
PTO43_Generic_RWR = {
    Name  = "PTO43 Generic WW2 RWR",
    category = SENSOR_RWR,
    detection_dist_to_radar_detection_dist_max_ratio = 1.2,
    lock_on_detection = true,
}
declare_sensor(PTO43_Generic_RWR)