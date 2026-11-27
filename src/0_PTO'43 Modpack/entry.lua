-- ============================================================================================================
-- [PTO '43] MASTER ORDNANCE & WEAPONS CORE
-- Theater: Pacific Theater of Operations (1943 Historical Standard)
-- Load Priority: High (Index 0_ - Executes before any dependent modules)
-- ============================================================================================================

local self_ID = "[PTO'43 ModPack]"

declare_plugin(self_ID, {
    installedName     = self_ID,
    dirName           = current_mod_path,
    displayName       = _("[PTO'43 ModPack] Beta"),
    developerName     = "Team PTO'43-Hawkeye60/Saelind76",
    version           = __DCS_VERSION__,
    state             = "installed",
    info              = _("PTO 1943 - Centralized Weapons & Sensors Master Core"),
    encyclopedia_path = current_mod_path .. "/Encyclopedia",
    Skins = {
        { name = _("[PTO'43 ModPack]"), dir = "Theme" },
    },
    Missions = {
        { name = _("[PTO'43 ModPack]"), dir = "Missions" },
    },
})

-- ============================================================================================================
-- 1. VFS SYSTEM DIRECTORY MOUNTS (ORDNANCE, AIRCRAFT & COMMON ASSETS)
-- ============================================================================================================

-- UI & Theme
mount_vfs_texture_path(current_mod_path .. "/Theme/ME")
mount_vfs_texture_path(current_mod_path .. "/Textures/ImagesGUI")

-- 3D Weapons, Aircraft & Naval Shapes
-- mount_vfs_model_path(current_mod_path .. "/Shapes")
mount_vfs_model_path(current_mod_path .. "/Shapes/weapons")
mount_vfs_model_path(current_mod_path .. "/Shapes/aircraft")
mount_vfs_model_path(current_mod_path .. "/Shapes/naval")

-- Textures for Ordnance, Aircraft & Naval
mount_vfs_texture_path(current_mod_path .. "/Textures")
mount_vfs_texture_path(current_mod_path .. "/Textures/Weapons/Weapons.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/aircraft/A6M3_M32.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/aircraft/Kawasaki_Ki_61_pto.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/aircraft/f4f_1942.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/aircraft/F6F5.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/aircraft/douglas_dauntless.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/aircraft/ki43_Kamikaze.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/aircraft/b6n1jill.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/aircraft/P39_PTO.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/aircraft/g4_m2.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/aircraft/Ki45_KAIc.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/naval/uss_independence.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/naval/ca_68_baltimore.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/naval/cleveland_class.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/naval/USS_Cassin_Young.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/naval/ijn_zuiho.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/naval/Zuikaku_CV.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/naval/IJN_Kumano.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/naval/IJN_Haruna.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/naval/Akizuki_DD.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/naval/TypeC_Cargo.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/naval/Cimarron_Oiler.zip")
mount_vfs_texture_path(current_mod_path .. "/Textures/naval/Dale_Tanker.zip")

-- Liveries (DCS 2.9 auto-mounts /Sounds)
mount_vfs_liveries_path(current_mod_path .. "/Liveries/aircraft")
mount_vfs_liveries_path(current_mod_path .. "/Liveries/naval")

-- ============================================================================================================
-- 2. SENSORS & CENTRALIZED ORDNANCE DECLARATION
-- ============================================================================================================
dofile(current_mod_path .. "/database/Sensors/sensors.lua")
dofile(current_mod_path .. "/database/Sensors/PTO_community_sensors.lua")
dofile(current_mod_path .. "/database/Weapons/PTO43_aircraft_ammo.lua")
dofile(current_mod_path .. "/database/Weapons/GB_4_glide_bomb.lua")

-- Master Naval Weapons, Shells, Fuze Belts, Directors & Templates (IJN / USN)
dofile(current_mod_path .. "/database/Weapons/WeaponConstants.lua")
dofile(current_mod_path .. "/database/Weapons/PTO43_ship_ammo.lua")
dofile(current_mod_path .. "/database/Weapons/shells.lua")
dofile(current_mod_path .. "/database/Weapons/torpedoes.lua")
dofile(current_mod_path .. "/database/Weapons/IJN_AA_fuze_belt.lua")
dofile(current_mod_path .. "/database/Weapons/directors.lua")
dofile(current_mod_path .. "/database/Weapons/guns.lua")
dofile(current_mod_path .. "/database/Weapons/USN_cruiser_weapons.lua")
dofile(current_mod_path .. "/database/Weapons/uss_independence_Ammo.lua")
dofile(current_mod_path .. "/database/Weapons/IJN_community_ammo.lua")

-- ============================================================================================================
-- 3. UNITS
-- ============================================================================================================
local function load_naval_unit(lua_rel_path)
    local shipData = dofile(current_mod_path .. "/database/Navy/" .. lua_rel_path)
    if shipData and type(shipData) == "table" then
        add_surface_unit(shipData)
    end
end

-- Aircraft (Beta Batch 1)
dofile(current_mod_path .. "/database/Aircraft/A6M3_M32.lua")
dofile(current_mod_path .. "/database/Aircraft/Kawasaki_Ki_61_pto.lua")
dofile(current_mod_path .. "/database/Aircraft/f4f_1942.lua")
dofile(current_mod_path .. "/database/Aircraft/F6F5.lua")
dofile(current_mod_path .. "/database/Aircraft/douglas_dauntless.lua")
dofile(current_mod_path .. "/database/Aircraft/ki43_II.lua")
dofile(current_mod_path .. "/database/Aircraft/b6n1jill.lua")
dofile(current_mod_path .. "/database/Aircraft/P39.lua")
dofile(current_mod_path .. "/database/Aircraft/g4_m2.lua")
dofile(current_mod_path .. "/database/Aircraft/Ki45_KAIc.lua")

-- Naval Units (Batch 1: 10 hulls)
dofile(current_mod_path .. "/database/Navy/uss_independence.lua")
dofile(current_mod_path .. "/database/Navy/ca_68_baltimore.lua")
dofile(current_mod_path .. "/database/Navy/cleveland_class_common.lua")
dofile(current_mod_path .. "/database/Navy/cleveland_class.lua")
dofile(current_mod_path .. "/database/Navy/uss_montpelier.lua")
dofile(current_mod_path .. "/database/Navy/USSCassinYoung.lua")
load_naval_unit("ijn_zuiho.lua")
dofile(current_mod_path .. "/database/Navy/Zuikaku.lua")
load_naval_unit("IJN_Kumano.lua")
dofile(current_mod_path .. "/database/Navy/IJN_Haruna.lua")
load_naval_unit("Akizuki_DD.lua")

-- Transports / auxiliaries (ported from Community PTO Pack)
load_naval_unit("TypeC_Cargo.lua")
load_naval_unit("Cimarron_Oiler.lua")
load_naval_unit("Dale_Tanker.lua")


-- ============================================================================================================
-- 4. CARRIER CAPABILITY HOOKS
-- ============================================================================================================
make_aircraft_carrier_capable('FW-190A8',        {"AircraftCarrier", "AircraftCarrier With Tramplin"})
make_aircraft_carrier_capable('FW-190D9',        {"AircraftCarrier", "AircraftCarrier With Tramplin"})
make_aircraft_carrier_capable('Bf-109K-4',       {"AircraftCarrier", "AircraftCarrier With Tramplin"})
make_aircraft_carrier_capable('SpitfireLFMkIX',   {"AircraftCarrier", "AircraftCarrier With Tramplin"})
make_aircraft_carrier_capable('SpitfireLFMkIXCW', {"AircraftCarrier", "AircraftCarrier With Tramplin"})

plugin_done()