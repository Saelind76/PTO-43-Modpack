--See doc for 3rd party attributions and license information.
-- Ported from Community PTO Pack (Pikey). Values formerly computed by the Community
-- db_units_ships.lua helper (life, handling, shape table) are baked in below.
GT = {};
GT_t.ws = 0;

set_recursive_metatable(GT, GT_t.generic_ship)

GT.visual = {}
GT.visual.shape = "TypeC_Cargo"
GT.visual.shape_dstr = ""
GT.Name = "TypeC_Cargo"
GT.DisplayNameShort = _("TypeC")
GT.DisplayName = _("[PTO43] Type C Japanese Cargo")
GT.Sensors = {  OPTIC = {"long-range naval optics", }, };
GT.Singleton   ="no";
GT.mapclasskey		= "P0091000039"; --map icon for ship symbol
GT.attribute = {wsType_Navy,wsType_Ship,wsType_ArmedShip,wsType_GenericLightArmoredShip,
                    "NonAndLightArmoredUnits",
					"NonArmoredUnits",
				};
GT.riverCraft = true;
GT.Categories = {{name = "Armed Ship"},	};
GT.tags         = {"Support"};
GT.animation_arguments.radar1_rotation = 11;
GT.radar1_period = 3;
GT.animation_arguments.radar2_rotation = -1;
GT.animation_arguments.radar3_rotation = -1;
GT.animation_arguments.luna_lights = -1;
GT.ship_class = "Civil"
GT.life = 620
GT.Rate = 620
GT.mass              = 2.20e+006      -- kg (~2,200 t full load)
GT.max_velocity      = 5.8            -- m/s ~ 11.3 kt
GT.race_velocity     = 5.15           -- m/s ~ 10.0 kt
GT.economy_velocity  = 4.63           -- m/s ~ 9.0 kt
GT.economy_distance  = 6.0e+006       -- m ~ 3,240 nmi @ econ
GT.race_distance     = 3.5e+006       -- m ~ 1,890 nmi @ race
GT.Length = 79
GT.shipLength = 79
GT.Width = 9
GT.Height = 12.8
GT.DeckLevel = 5.5
GT.X_nose = 34.5000
GT.X_tail = -26.000
GT.Tail_Width = 9
GT.R_min = 276.5;
GT.Om = 0.0570;
GT.speedup = 0.1139;
GT.Gamma_max = 0.30;
GT.distFindObstacles = 126.4;
GT.airWeaponDist = 1000
GT.airFindDist = 1500
GT.DetectionRange = GT.airFindDist
GT.ThreatRange = GT.airWeaponDist
GT.Countries = {"Japan"}
GT.exhaust =
{
	[1] = { size = 0.1 , pos = {-10.0 , 12.8, 0.0 } },
}

GT.shape_table_data = {
    {
        file        = GT.visual.shape,
        username    = GT.Name,
        desrt       = GT.visual.shape_dstr,
        classname   = "lLandShip",
        positioning = "BYNORMAL",
    },
}

-- Sensor definition (antenna/mast height, coverage)
GT.sensor = {
	max_range_finding_target = GT.airFindDist,
	min_range_finding_target = 0,
	max_alt_finding_target   = 5000,
	min_alt_finding_target   = 0,
	pos = {  0.0, 11.0, 0.0 },      -- approx mast height above deck
}
GT.DM = {
	{ area_name = "TomGroup_1",         area_arg = 76,	area_life = 60, area_fire = { pos = {-20.0, 3.5, -1.0}, size = 0.2}}, --rear hull
	{ area_name = "TomGroup_2", 		area_arg = 73,	area_life = 60, area_fire = { pos = {30.0, 3.5,- 1.0}, size = 0.1}},--fore hull
	{ area_name = "TomGroup_5",         area_arg = 82,	area_life = 80, area_fire = { pos = {-35.0,3.5, 0.0}, size = 0.3}}, --deck
}

return GT
