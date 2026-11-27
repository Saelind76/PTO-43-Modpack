--See doc for 3rd party attributions and license information.
-- Ported from Community PTO Pack (Pikey). Values formerly computed by the Community
-- db_units_ships.lua helper (life, handling, shape table) are baked in below.
GT = {};
GT_t.ws = 0;
set_recursive_metatable(GT, GT_t.generic_ship)
GT.animation_arguments.water_propeller = 11
GT.visual = {}
GT.visual.shape = "Dale_Tanker"
GT.visual.shape_dstr = ""
GT.Name 			= "Dale_Tanker"
GT.DisplayName  	= _("[PTO43] Dale Tanker")
GT.DisplayNameShort = _("Dale")
GT.Singleton   		= "no";
GT.mapclasskey		= "P0091000039"; --map icon for ship symbol
GT.Sensors = {  OPTIC = {"long-range naval optics", }, };
GT.attribute 		= {wsType_Navy,wsType_Ship,wsType_ArmedShip,TICONDEROGA,
					 "Cruisers",
					 "RADAR_BAND1_FOR_ARM",
					 "DetectionByAWACS",
					};
GT.Categories 		= {{name = "Armed Ship"},
					};
GT.tags        	 	= {"Support"};
GT.Countries		= {"USA", "UK"};
GT.ship_class = "Civil"
GT.life = 780
GT.Rate = 780
GT.mass               = 1.18e+007      -- kg (~11,800 t full load)
GT.max_velocity       = 7.7            -- m/s ~ 15 kt
GT.race_velocity      = 6.7            -- m/s ~ 13 kt
GT.economy_velocity   = 5.7            -- m/s ~ 11 kt
GT.economy_distance   = 2.2e+007       -- m ~ 12,000 nmi @ 11 kt
GT.race_distance      = 1.4e+007       -- m ~ 7,500 nmi @ 13 kt
GT.Length             = 145.0
GT.shipLength         = 145.0
GT.Width              = 19.5
GT.Height             = 22.0
GT.DeckLevel          = 6.8
GT.X_nose 			  = 71.4
GT.X_tail 			  = -71
GT.Tail_Width         = 25
GT.R_min              = 507.5;
GT.Om                 = 0.0310;
GT.speedup            = 0.0621;
GT.Gamma_max          = 0.30;
GT.distFindObstacles  = 232.0;

GT.shape_table_data = {
    {
        file        = GT.visual.shape,
        username    = GT.Name,
        desrt       = GT.visual.shape_dstr,
        classname   = "lLandShip",
        positioning = "BYNORMAL",
    },
}

--SENSORS
 GT.sensor = {
	max_range_finding_target = GT.airFindDist,
	min_range_finding_target = 0,
	max_alt_finding_target   = 5000,
	min_alt_finding_target   = 0,
	pos = {  0.0, 20.0, 0.0 },      -- approx mast height above deck
}

GT.exhaust =
{[1] = { size = 1.0 , pos = {-52 , 20.0, 0.0 } }, }
GT.DM = {
    { area_name = "BOW", 					area_arg = 74,	area_life = 300, area_fire = { pos = {37.0,  6.0, 0}, size = 0.2}},
    { area_name = "MIDSHIPS", 				area_arg = 75,	area_life = 300, area_fire = { pos = {9, 3.6, 0}, size = 0.1}},
	{ area_name = "STERN",          		area_arg = 77,	area_life = 360,  area_fire = { pos = {-25, 6.0, 0.0}, size = 0.2}},
	{ area_name = "Strutture_Poppa",        area_arg = 82,	area_life = 300, area_fire = { pos = {-49.0, 6.0, 0.0}, size = 0.4}},
	{ area_name = "Sala_Comando",	        area_arg = 83,	area_life = 350, area_fire = { pos = {21.4, 6.0, 0.0}, size = 0.3}},
	{ area_name = "Torre_380_Anton",	    area_arg = 83,	area_life = 350, area_fire = { pos = {62, 6.0, 0.0}, size = 0.3}},
}
--weapons
--none

return GT
