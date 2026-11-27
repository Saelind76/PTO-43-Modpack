-- ==============================================================================
-- [PTO '43] USS INDEPENDENCE CVL-22 - RUNWAYS, TAXI AND TAKE-OFF ROUTES
-- Every figure is measured off the exported model (INDEPENDENCE_F18.blend, deck top 13.8726 m):
--   flight deck plateau X -92.52 .. +74.66 (round-downs beyond to -94.46 / +77.68),
--   deck half-width 11.20 m; island inboard face at z +9.80, X +21.21 .. +33.01;
--   stacks inboard face at z +9.80, X -15.75 .. +20.83.
--   Aft lift X -62.83 .. -50.25, |z| <= 6.44; forward lift X +21.67 .. +34.25, |z| <= 6.44.
--   Wires 1..9 X -82.40 .. -24.20 (6.20 m / ~20.3 ft spacing, 4 aft + 5 fwd of the aft lift);
--   wire supports raise/lower on arg 150, per-wire visibility on args 400..408.
-- ==============================================================================

local deck_level  = 13.87
local deck_centre =  0.00

GT.RunWays =
{
-- Landing strip: the TOUCHDOWN AIM POINT is the middle of the strip; start -92.0 and length
-- 31.6 put it on wire 2 (X -76.20). Width 19.0 m, inside the 22.4 m deck everywhere.
	{
		{ -92.0, deck_level, deck_centre },
		360.0,
		31.6,
		19.0,
		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5
	},
-- Take-off run: -45.0 .. +72.0 (117.0 m), ends short of the deck's forward plateau (+74.66).
-- Taxi ends 4.5 m before the start (-49.5).
	{{ -45.0, deck_level, deck_centre }, 360, 117.0, 15.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 },
};
GT.RunWays.RunwaysNumber = #GT.RunWays

-- Parking after landing (Attacker/Bogue pattern): up the centreline, out to the rows at z +-6.8,
-- clear of the forward lift (X +21.67..+34.25, |z| <= 6.44), island (z >= +9.80) and stacks.
GT.TaxiRoutes =
{
	{ {{  0.000, deck_level, deck_centre}, 3.0}, {{ 38.000, deck_level,  5.50}, 2.0}, {{ 64.000, deck_level,  6.80}, 2.0, 30.0}, },
	{ {{  0.000, deck_level, deck_centre}, 3.0}, {{ 38.000, deck_level, -5.50}, 2.0}, {{ 64.000, deck_level, -6.80}, 2.0, 30.0}, },
	{ {{  0.000, deck_level, deck_centre}, 3.0}, {{ 38.000, deck_level,  5.50}, 2.0}, {{ 54.000, deck_level,  6.80}, 2.0, 30.0}, },
	{ {{  0.000, deck_level, deck_centre}, 3.0}, {{ 38.000, deck_level, -5.50}, 2.0}, {{ 54.000, deck_level, -6.80}, 2.0, 30.0}, },
	{ {{  0.000, deck_level, deck_centre}, 3.0}, {{ 38.000, deck_level,  5.50}, 2.0}, {{ 44.000, deck_level,  6.80}, 2.0, 30.0}, },
	{ {{  0.000, deck_level, deck_centre}, 3.0}, {{ 38.000, deck_level, -5.50}, 2.0}, {{ 44.000, deck_level, -6.80}, 2.0, 30.0}, },
	{ {{  0.000, deck_level, deck_centre}, 3.0}, {{ 10.000, deck_level,  5.50}, 2.0}, {{ 14.000, deck_level,  6.80}, 2.0, 30.0}, },
	{ {{  0.000, deck_level, deck_centre}, 3.0}, {{ 10.000, deck_level, -5.50}, 2.0}, {{ 14.000, deck_level, -6.80}, 2.0, 30.0}, },
}
GT.TaxiRoutes.RoutesNumber = #GT.TaxiRoutes
GT.numParking = #GT.TaxiRoutes

-- Take-off spawn spots: aft of the aft lift on the plateau (tailwheel well inside -92.52),
-- 9 m apart (>= 8.5); first leg 2.5 m straight, one long leg <= 40 deg, short last leg onto
-- the centreline 4.5 m before the run start (-49.5). RunwayIdx is 0-based: 1 = the take-off run.
GT.TaxiForTORoutes =
{
	{ RunwayIdx = 1, Points = {	-- spot 1, port
		{{ -72.0, deck_level, -4.5}, 1.0, 20.0},
		{{ -69.5, deck_level, -4.5}, 4.0},
		{{ -52.5, deck_level, -0.5}, 4.0},
		{{ -49.5, deck_level, deck_centre}, 1.0},
	}},
	{ RunwayIdx = 1, Points = {	-- spot 2, starboard
		{{ -72.0, deck_level,  4.5}, 1.0, 20.0},
		{{ -69.5, deck_level,  4.5}, 4.0},
		{{ -52.5, deck_level,  0.5}, 4.0},
		{{ -49.5, deck_level, deck_centre}, 1.0},
	}},
}
GT.TaxiForTORoutes.RoutesForTONumber = #GT.TaxiForTORoutes

GT.HelicopterSpawnTerminal = {}
GT.HelicopterSpawnTerminal.TerminalNumber = #GT.HelicopterSpawnTerminal

-- Arresting gear: the model's POINT_TROS_01..09_01/02 connectors (wire ends at the deck sheaves).
-- Raise/lower on arg 150 (flight_deck_fences); visibility per gear on args 400..408 (uss_independence.lua).
GT.ArrestingGears = {
	{ -- wire 1, arg 400
		Left  = { pos = { -82.400,  13.930, -10.550} },
		Right = { pos = { -82.400,  13.930,  10.550} }
	},
	{ -- wire 2, arg 401
		Left  = { pos = { -76.200,  13.918, -10.550} },
		Right = { pos = { -76.200,  13.918,  10.550} }
	},
	{ -- wire 3, arg 402
		Left  = { pos = { -70.000,  13.918, -10.550} },
		Right = { pos = { -70.000,  13.918,  10.550} }
	},
	{ -- wire 4, arg 403
		Left  = { pos = { -63.800,  13.918, -10.550} },
		Right = { pos = { -63.800,  13.918,  10.550} }
	},
	{ -- wire 5, arg 404
		Left  = { pos = { -49.000,  13.918, -10.550} },
		Right = { pos = { -49.000,  13.918,  10.550} }
	},
	{ -- wire 6, arg 405
		Left  = { pos = { -42.800,  13.918, -10.550} },
		Right = { pos = { -42.800,  13.918,  10.550} }
	},
	{ -- wire 7, arg 406
		Left  = { pos = { -36.600,  13.918, -10.550} },
		Right = { pos = { -36.600,  13.918,  10.550} }
	},
	{ -- wire 8, arg 407
		Left  = { pos = { -30.400,  13.918, -10.550} },
		Right = { pos = { -30.400,  13.918,  10.550} }
	},
	{ -- wire 9, arg 408
		Left  = { pos = { -24.200,  13.918, -10.550} },
		Right = { pos = { -24.200,  13.918,  10.550} }
	},
}
GT.ArrestingGears.ArrestingGearsNumber = #GT.ArrestingGears

GT.Elevators = {}
GT.Elevators.ElevatorsNumber = #GT.Elevators
