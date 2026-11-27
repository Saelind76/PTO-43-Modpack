-- ==============================================================================
-- [PTO '43-'44] IJN ZUIHO (CVL) - RUNWAYS, TAXI AND TAKE-OFF ROUTES
-- Every figure is measured off the exported model (ZUIHO_R_1_2_A.blend, deck top 11.913 m after the +1.0 m raise):
--   flight deck plateau X -101.6 .. +69.4 (round-down aft to -106.3, bow taper +69.4..+72.0),
--   flush-deck carrier (no island on deck); painted centerline measured at Blender Y +0.011 -> DCS z 0.00.
--   Aft lift X -74.0 .. -63.0; forward lift X -19.0 .. -7.0.
--   Wires 1..6 X -89.60 .. -47.00 (~7.0 m / ~23 ft spacing, skipping the aft lift);
--   wire supports raise/lower on arg 150, per-wire visibility on args 400..405.
-- ==============================================================================

local deck_level  = 11.91
local deck_centre =  0.00

GT.RunWays =
{
-- Landing strip: the TOUCHDOWN AIM POINT is the middle of the strip; start -99.0 and length
-- 46.8 put it on wire 3 (X -75.60). Width 18.0 m, inside the aft deck everywhere.
	{
		{ -99.0, deck_level, deck_centre },
		360.0,
		46.8,
		18.0,
		0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5
	},
};

-- Take-off: 8 spots (4 rows x 2 lanes), the same layout as the PTO'43 Modpack Zuiho that the missions
-- were built with (a 4-ship "From Runway" flight needs 4+ spots). One take-off strip per spot, run to
-- the bow (+67.4). Lanes 2.7 m either side of the centreline; rows 12 m apart from X -56.
local TO_ROWS, TO_FIRST_START, TO_ROW_SPACING, TO_HOLD_BACK, TO_CREEP = 4, -56.0, 12.0, 3.0, 2.0
local TO_LANES = { -2.7, 2.7 }
local DECK_BOW_RUN = 67.4
for r = 1, TO_ROWS do
	local start_x = TO_FIRST_START - (r - 1) * TO_ROW_SPACING
	for _, lz in ipairs(TO_LANES) do
		table.insert(GT.RunWays, {{ start_x, deck_level, lz }, 360.0, DECK_BOW_RUN - start_x, 9.0, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 })
	end
end
GT.RunWays.RunwaysNumber = #GT.RunWays

-- Parking after landing (forward deck, clear of the forward lift X -19.0..-7.0):
-- up the centreline past the forward lift (X -2.0), out to rows inside the tapered bow.
GT.TaxiRoutes =
{
	{ {{ -2.000, deck_level, deck_centre}, 3.0}, {{ 46.000, deck_level,  3.50}, 2.0}, {{ 56.000, deck_level,  4.20}, 2.0, 30.0}, },
	{ {{ -2.000, deck_level, deck_centre}, 3.0}, {{ 46.000, deck_level, -3.70}, 2.0}, {{ 56.000, deck_level, -4.40}, 2.0, 30.0}, },
	{ {{ -2.000, deck_level, deck_centre}, 3.0}, {{ 36.000, deck_level,  3.80}, 2.0}, {{ 46.000, deck_level,  4.50}, 2.0, 30.0}, },
	{ {{ -2.000, deck_level, deck_centre}, 3.0}, {{ 36.000, deck_level, -4.00}, 2.0}, {{ 46.000, deck_level, -4.70}, 2.0, 30.0}, },
	{ {{ -2.000, deck_level, deck_centre}, 3.0}, {{ 26.000, deck_level,  3.80}, 2.0}, {{ 36.000, deck_level,  4.50}, 2.0, 30.0}, },
	{ {{ -2.000, deck_level, deck_centre}, 3.0}, {{ 26.000, deck_level, -4.00}, 2.0}, {{ 36.000, deck_level, -4.70}, 2.0, 30.0}, },
	{ {{ -2.000, deck_level, deck_centre}, 3.0}, {{  8.000, deck_level,  4.50}, 2.0}, {{ 12.000, deck_level,  5.50}, 2.0, 30.0}, },
	{ {{ -2.000, deck_level, deck_centre}, 3.0}, {{  8.000, deck_level, -4.70}, 2.0}, {{ 12.000, deck_level, -5.70}, 2.0, 30.0}, },
}
GT.TaxiRoutes.RoutesNumber = #GT.TaxiRoutes
GT.numParking = #GT.TaxiRoutes

-- Take-off spawn spots: spawn 5 m behind each strip start, creep 2 m, hold 3 m, then the strip.
-- RunwayIdx is 0-based: 0 = landing strip, 1..8 = the take-off strips above.
GT.TaxiForTORoutes = {}
for r = 1, TO_ROWS do
	local start_x = TO_FIRST_START - (r - 1) * TO_ROW_SPACING
	local hold_x  = start_x - TO_HOLD_BACK
	local spawn_x = hold_x - TO_CREEP
	for l, lz in ipairs(TO_LANES) do
		table.insert(GT.TaxiForTORoutes, {
			RunwayIdx = (r - 1) * #TO_LANES + l,
			Points = {
				{{ spawn_x, deck_level, lz }, 1.0, 20.0},
				{{ hold_x,  deck_level, lz }, 2.0},
				{{ start_x, deck_level, lz }, 3.0},
			},
		})
	end
end
GT.TaxiForTORoutes.RoutesForTONumber = #GT.TaxiForTORoutes

GT.HelicopterSpawnTerminal = {}
GT.HelicopterSpawnTerminal.TerminalNumber = #GT.HelicopterSpawnTerminal

-- Arresting gear: the model's POINT_TROS_01..06_01/02 connectors (wire ends at the Japanese fairlead hoods).
-- Raise/lower on arg 150 (flight_deck_fences); visibility per gear on args 400..405 (ijn_zuiho.lua).
GT.ArrestingGears = {
	{ -- wire 1, arg 400
		Left  = { pos = { -89.600,  11.958, -10.600} },
		Right = { pos = { -89.600,  11.958,   9.400} }
	},
	{ -- wire 2, arg 401
		Left  = { pos = { -82.600,  11.958, -10.600} },
		Right = { pos = { -82.600,  11.958,   9.400} }
	},
	{ -- wire 3, arg 402
		Left  = { pos = { -75.600,  11.958, -10.600} },
		Right = { pos = { -75.600,  11.958,   9.400} }
	},
	{ -- wire 4, arg 403
		Left  = { pos = { -61.000,  11.958, -10.600} },
		Right = { pos = { -61.000,  11.958,   9.400} }
	},
	{ -- wire 5, arg 404
		Left  = { pos = { -54.000,  11.958, -10.600} },
		Right = { pos = { -54.000,  11.958,   9.400} }
	},
	{ -- wire 6, arg 405
		Left  = { pos = { -47.000,  11.958, -10.600} },
		Right = { pos = { -47.000,  11.958,   9.400} }
	},
}
GT.ArrestingGears.ArrestingGearsNumber = #GT.ArrestingGears

GT.Elevators = {}
GT.Elevators.ElevatorsNumber = #GT.Elevators
