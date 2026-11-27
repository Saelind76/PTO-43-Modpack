-- Zuikaku runways, taxiways (v2)
-- Un solo nivel de cubierta, 2 aviones por fila (carril de babor y de estribor),
-- una pista de despegue por carril (sin puntos de espera compartidos) y rutas dentro de la cubierta.
-- Ejes locales: x proa (+), y arriba, z estribor (+).
-- Se carga con dofile desde Zuikaku.lua, despues de definir GT.

local deck_level = (GT and GT.DeckLevel) or 14.14

-- ---------------------------------------------------------------------------
-- PARAMETROS (medidos a ojo sobre la planta de Blender: verificar en el modelo)
-- ---------------------------------------------------------------------------
local DECK_BOW   =  110.0   -- borde de proa de la cubierta (medido ~110.7)
local DECK_STERN = -125.0   -- borde de popa (medido ~-125.4)
local LANE_Z     =    7.6   -- carriles en z = -LANE_Z (babor) y +LANE_Z (estribor)
                            -- Judy (11.5 m de envergadura): separacion entre puntas ~3.7 m
                            -- Jill (14.9 m): casi se tocan; con Jill sube LANE_Z a 8.0

-- Despegue (spots de popa)
local TO_ROWS         = 8      -- filas -> 2 aviones por fila
local TO_FIRST_START  = -10.0  -- inicio de pista de la fila 1
local TO_ROW_SPACING  = 14.0   -- separacion entre filas (avion ~11 m)
local TO_HOLD_BACK    = 5.0    -- punto de espera = inicio de pista - 5
local TO_CREEP        = 2.0    -- avance corto desde el spawn hasta el punto de espera
local RUNWAY_WIDTH    = 14.0   -- ancho de la pista de cada carril

-- Estacionamiento tras aterrizar (proa)
local PARK_ROWS        = 4
local PARK_FIRST_X     = 90.0  -- la cubierta se estrecha hacia proa; no pasar de ~90
local PARK_ROW_SPACING = 13.0
local PARK_ENTRY_X     = 34.0  -- punto de entrada, sobre la crujia

local lanes = {
	{ z = -LANE_Z },   -- babor
	{ z =  LANE_Z },   -- estribor
}

-- datos de senda de planeo (iguales a la version anterior)
local function runway_entry(x, y, z, length, width)
	return { {x, y, z}, 0.0, length, width, 0, 2.5, 2.8, 3.0, 3.0, 3.2, 3.5 }
end

-- ---------------------------------------------------------------------------
-- PISTAS
-- Primera entrada = franja de aterrizaje. RunwayIdx=1 es la entrada siguiente.
-- Orden: fila 1 babor, fila 1 estribor, fila 2 babor, fila 2 estribor, ...
-- ---------------------------------------------------------------------------
GT.RunWays = {
	runway_entry(-40.0, deck_level + 0.05, 0.0, 140.0, 20.0),
}

for r = 1, TO_ROWS do
	local start_x = TO_FIRST_START - (r - 1) * TO_ROW_SPACING
	local length  = (DECK_BOW - 2.0) - start_x
	for _, lane in ipairs(lanes) do
		table.insert(GT.RunWays, runway_entry(start_x, deck_level, lane.z, length, RUNWAY_WIDTH))
	end
end
GT.RunWays.RunwaysNumber = #GT.RunWays

-- ---------------------------------------------------------------------------
-- RUTAS DE ESTACIONAMIENTO (despues de aterrizar)
-- El primero en aterrizar va a la fila mas adelantada.
-- ---------------------------------------------------------------------------
GT.TaxiRoutes = {}
for r = 1, PARK_ROWS do
	local x = PARK_FIRST_X - (r - 1) * PARK_ROW_SPACING
	for _, lane in ipairs(lanes) do
		table.insert(GT.TaxiRoutes, {
			{{ PARK_ENTRY_X, deck_level, 0.0      }, 5.0},
			{{ x - 12.0,     deck_level, lane.z   }, 3.0},
			{{ x,            deck_level, lane.z   }, 1.5, 30.0},
		})
	end
end
GT.TaxiRoutes.RoutesNumber = #GT.TaxiRoutes

-- ---------------------------------------------------------------------------
-- RUTAS DE DESPEGUE (desde los spots de popa)
-- Cada avion tiene su propio carril y su propia pista: sin cruces ni puntos compartidos.
-- Los de una fila salen despues que los de la fila de delante en su mismo carril.
-- ---------------------------------------------------------------------------
GT.TaxiForTORoutes = {}
for r = 1, TO_ROWS do
	local start_x = TO_FIRST_START - (r - 1) * TO_ROW_SPACING
	local hold_x  = start_x - TO_HOLD_BACK
	local spawn_x = hold_x - TO_CREEP
	for l, lane in ipairs(lanes) do
		table.insert(GT.TaxiForTORoutes, {
			RunwayIdx = (r - 1) * 2 + l,
			Points = {
				{{ spawn_x, deck_level, lane.z }, 1.0, 20},
				{{ hold_x,  deck_level, lane.z }, 2.0},
			},
		})
	end
end
GT.TaxiForTORoutes.RoutesForTONumber = #GT.TaxiForTORoutes

GT.HelicopterSpawnTerminal = {}
GT.HelicopterSpawnTerminal.TerminalNumber = #GT.HelicopterSpawnTerminal
