-- ============================================================================
-- IJN Naval Assets: Global Weapon Constants
-- Compatible with Sneaky_Assets (WWII Kriegsmarine / Royal Navy) & PTO'43
-- ============================================================================

if SNEAKY_WEAPON_CONSTANTS_LOADED then return end
SNEAKY_WEAPON_CONSTANTS_LOADED = true

-- Launcher & Weapon Station Types (GT.WS[ws].type / LN[1].type)
WS_GUN          = 0   -- Small Arms / Machine Guns / Light Auto-weapons (7.62mm - 20mm)
WS_SAM          = 1   -- Surface-to-Air Missile launcher
WS_GUN_HEAVY    = 2   -- Heavy Direct-Fire Naval Artillery
WS_GUN_AA       = 3   -- Fast Anti-Aircraft Gun (20mm, 25mm, 37mm, 40mm)
WS_GUN_GROUND   = 6   -- Hybrid Naval/Ground Gun (Anti-ship + shore bombardment)
WS_ARTILLERY    = 10  -- Pure Artillery
WS_GUN_AA_HEAVY = 11  -- Heavy Dual-Purpose Flak (Timed fuze / Flak bursts, 100mm - 133mm)
WS_CIWS         = 12  -- Close-In Weapon System
WS_TORPEDO      = 32  -- Naval Torpedo Launcher (Single / Multi-tube mounts)

-- Sensor Profile Indices (GT_t.WSN_t[X])
SN_NAVAL_STANDARD   = 0   -- Standard Long-Range Naval Search & Fire Control
SN_INFANTRY_MG      = 1   -- Light Automatic Optic
SN_DIRECT_ARMOR     = 2   -- Direct-Fire Optic
SN_AA_FAST          = 3   -- High-Agility Rapid Reaction (Light AA, Torpedoes)
SN_RADAR_FCS        = 5   -- Radar Fire Control Tracker
SN_GROUND_FIXED     = 6   -- Direct-Fire Shore Artillery
SN_MODERN_FCS       = 7   -- Modern FCS
SN_HOWITZER         = 8   -- Howitzer Ballistic Computer
SN_ARTILLERY        = 10  -- Naval Artillery
SN_AUTOCANNON       = 11  -- Autocannon Sensor
SN_AA_HEAVY_FLAK    = 12  -- Heavy AA Timed-Fuse Altitude Ranging
