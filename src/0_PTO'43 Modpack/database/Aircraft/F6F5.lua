-- ============================================================================================================
-- DCS WORLD COMPLETE AIRCRAFT DEFINITION & SFM SPECIFICATION (Master Suite v2.45)
-- GENERATED FOR: F6F-3 Hellcat
-- ARCHITECTURE: Canonical SFM Standard
-- ============================================================================================================
local _ = _ or function(s) return s end
local tracer_on_time = tracer_on_time or 0.01
local barrel_smoke_level = barrel_smoke_level or 1.0
local barrel_smoke_opacity = barrel_smoke_opacity or 0.1
_G.PTO_Weapons_Declared = _G.PTO_Weapons_Declared or {}
_G.PTO_Loadouts_Declared = _G.PTO_Loadouts_Declared or {}

if not _G.PTO_Loadouts_Declared["{F6F5 TANK}"] then
	declare_loadout({
		category		 = CAT_FUEL_TANKS,
		CLSID			 = "{F6F5 TANK}",
		attribute		 =  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPE_PLACEHOLDER},
		Picture			 = "F6F5.png",
		displayName		 = _("F6F5 TANK"),
		Weight_Empty	 = 1,
		Weight			 = 1 +  0.00775 * 2300,
		Cx_pil			 = 0.002,
		shape_table_data = 
		{
			{
				name 	= "F6F5 TANK",
				file	= "F6F5 TANK";
				life	= 1;
				fire	= { 0, 1};
				username	= "F6F5 TANK";
				index	= WSTYPE_PLACEHOLDER;
			},
		},
		Elements	= 
		{
			{
				ShapeName	= "F6F5 TANK",
			}, 
		}, 
	})
	_G.PTO_Loadouts_Declared["{F6F5 TANK}"] = true
end




   -- Hispano Mk. II
    -- (1) = Cartridge, Hispano_Mk_II_20x80AP
    if not _G.PTO_Weapons_Declared["Hispano_Mk_II_20x80AP"] then
        declare_weapon({category = CAT_SHELLS, name = "Hispano_Mk_II_20x80AP", user_name = _("Hispano_Mk_II_20x80AP"),
            model_name      = "tracer_bullet_yellow",
            mass            = 0.115, -- Bullet mass
            round_mass      = 0.283, -- Assembled shell + link
            cartridge_mass  = 0.056, -- Empty shell (+ link if links are stored as well)
            explosive       = 0.0000,
            v0              = 880.0,
            Dv0             = 0.0080,
            Da0             = 0.0006,
            Da1             = 0.0,
            life_time       = 6.0,
            caliber         = 20,
            s               = 0.0,
            j               = 0.0,
            l               = 0.0,
            charTime        = 0,
            cx              = {1.3, 0.93, 0.55, 0.36, 1.8},
            k1              = 3.6e-08,
            tracer_off      = -1,
            tracer_on       = tracer_on_time,
            smoke_tail_life_time = 0,
            scale_tracer    = 0,
            cartridge       = 0,
            scale_smoke     = barrel_smoke_level,
            smoke_opacity   = barrel_smoke_opacity,
        })
        _G.PTO_Weapons_Declared["Hispano_Mk_II_20x80AP"] = true
    end

    -- (2) = Cartridge, Hispano_Mk_II_20x80HET
    if not _G.PTO_Weapons_Declared["Hispano_Mk_II_20x80HET"] then
        declare_weapon({category = CAT_SHELLS, name = "Hispano_Mk_II_20x80HET", user_name = _("Hispano_Mk_II_20x80HET"),
            model_name      = "tracer_bullet_red",
            mass            = 0.092, -- Bullet mass
            round_mass      = 0.283, -- Assembled shell + link
            cartridge_mass  = 0.056, -- Empty shell (+ link if links are stored as well)
            explosive       = 0.0190, -- of Amatol / Concussion
            v0              = 840.0,
            Dv0             = 0.0080,
            Da0             = 0.0006,
            Da1             = 0.0,
            life_time       = 6.0,
            caliber         = 20,
            s               = 0.0,
            j               = 0.0,
            l               = 0.0,
            charTime        = 0,
            cx              = {1.3, 0.93, 0.55, 0.36, 1.8},
            k1              = 3.6e-08,
            tracer_off      = 1.7,
            tracer_on       = tracer_on_time,
            smoke_tail_life_time = 1.7,
            scale_tracer    = 1,
            cartridge       = 0,
            scale_smoke     = barrel_smoke_level,
            smoke_opacity   = barrel_smoke_opacity,
        })
        _G.PTO_Weapons_Declared["Hispano_Mk_II_20x80HET"] = true
    end

    -- (3) = Cartridge, Hispano_Mk_II_20x80HE
    if not _G.PTO_Weapons_Declared["Hispano_Mk_II_20x80HE"] then
        declare_weapon({category = CAT_SHELLS, name = "Hispano_Mk_II_20x80HE", user_name = _("Hispano_Mk_II_20x80HE"),
            model_name      = "tracer_bullet_red",
            mass            = 0.092, -- Bullet mass
            round_mass      = 0.283, -- Assembled shell + link
            cartridge_mass  = 0.056, -- Empty shell (+ link if links are stored as well)
            explosive       = 0.0190, -- of Amatol / Concussion
            v0              = 860.0,
            Dv0             = 0.0080,
            Da0             = 0.0006,
            Da1             = 0.0,
            life_time       = 6.0,
            caliber         = 20,
            s               = 0.0,
            j               = 0.0,
            l               = 0.0,
            charTime        = 0,
            cx              = {1.3, 0.93, 0.55, 0.36, 1.8},
            k1              = 3.6e-08,
            tracer_off      = -1,
            tracer_on       = tracer_on_time,
            smoke_tail_life_time = 0,
            scale_tracer    = 0,
            cartridge       = 0,
            scale_smoke     = barrel_smoke_level,
            smoke_opacity   = barrel_smoke_opacity,
        })
        _G.PTO_Weapons_Declared["Hispano_Mk_II_20x80HE"] = true
    end
    -- end of Hispano Mk. II   
    local function M3 ( tbl )
        tbl.category = CAT_GUN_MOUNT 
        -- Historical F6F-5: 6x .50 cal M2 Browning, 400 rpg (was 20 mm Hispano, not standard fit)
        tbl.name = tbl.name or "PTO_F6F_M2_50"
        tbl.supply = {
            shells = {"PTO_50BMG_AP"},
            mixes = {{1}},
            count = 400,
        }
        tbl.mixes = nil
        if tbl.mixes then
            tbl.supply.mixes = tbl.mixes
            tbl.mixes = nil
        end
        if tbl.count then
            tbl.supply.count = tbl.count
            tbl.count = nil
        end
        tbl.gun = {
            max_burst_length = 60,
            rates = {650}, -- unsynchronized mount
            recoil_coeff = 1.0,
            barrels_count = 1,
        }
        if tbl.rates then
            tbl.gun.rates = tbl.rates
            tbl.rates = nil
        end
        tbl.ejector_pos = tbl.ejector_pos or {0.0, 0.05, 0.0}
        tbl.ejector_dir = tbl.ejector_dir or {0, -1, 0}
        tbl.supply_position = tbl.supply_position or {0, -0.3, -1.5}
        tbl.aft_gun_mount = false
        tbl.effective_fire_distance = 1000
        --tbl.drop_cartridge = 204
        tbl.muzzle_pos = tbl.muzzle_pos or {0, 0, 0}
        tbl.azimuth_initial = tbl.azimuth_initial or 0
        tbl.elevation_initial = tbl.elevation_initial or 0
        --tbl.effects = {
        --    synchronizer,
        --    {name = "FireEffect", arg = tbl.effect_arg_number or 436},
        --    {name = "HeatEffectExt", shot_heat = 20.9, barrel_k = 0.462 * 16.6, body_k = 0.462 * 35.4},
        --    {name = "SmokeEffect"}
        --}

        return declare_weapon(tbl)
    end
    -- end of Hispano Mk. II
    -- Hispano Mk. II

-- ============================================================================================================
-- MAIN AIRCRAFT METADATA & WORLD ATTRIBUTES
-- ============================================================================================================
	
F6F5_Hellcat =  {
        
	Name 				=   'F6F5',
	DisplayName			= _('[PTO43] Grumman F6F-3 Hellcat'),
	
	HumanCockpit 		= false,
	-- HumanCockpitPath    = current_mod_path..'/Cockpit/Scripts',
	
	Picture 			= "F6F5.png",
	Rate 				= 40, -- RewardPoint in Multiplayer
	Shape 				= "F6F5",
	XRayShape           = "f6f_X-Ray",
	propellorShapeType  = "3ARG_PROC_BLUR",
	propellorShapeName  = "f6f_blade.FBX",   -- one blade, +Y radial; drawn on PROP_LOCATOR_0
	propellorShapeBlurX = 1.0,
	
	shape_table_data 	= 
	{
		{
			file  	 = 'F6F5';
			life  	 = 18; -- lifebar
			vis   	 = 3; -- visibility gain.
			desrt    = 'N3D-crush109a'; -- Name of destroyed object file name
			fire  	 = { 300, 2}; -- Fire on the ground after destoyed: 300sec 2m
			username = 'F6F5';
			index    =  WSTYPE_PLACEHOLDER;
-------- From MS_500			
			classname 	= "lLandPlane";
			positioning = "BYNORMAL";
			drawonmap 	= true;
		},
		{
			name  = "N3D-crush109a";
			file  = "N3D-crush109a";
			fire  = { 240, 2};
		},

	},
--	mapclasskey 		= "P0091000025",
	mapclasskey 		= "P0091000024",
--	attribute  			= {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER ,"Battleplanes",},
	attribute  			= {wsType_Air, wsType_Airplane, wsType_Fighter, FA_18C,
        "Multirole fighters", "Refuelable",},
	Categories 			= {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor",},	
-------------------------------
---- Primo valore    : avanti/indietro (x)
---- Secondo valore: alto/basso        (Z)
---- Terzo Valore    : destra/sinistra (y)	



	ViewSettings = {
	Cockpit = {
	[1] = {-- player slot 1
		CockpitLocalPoint      = {0.0, -0.3, 0.0},
		CameraViewAngleLimits  = {20.000000,120.000000},
		CameraAngleRestriction = {false,60.000000,0.400000},
		CameraAngleLimits      = {140.000000,-75.000000,90.000000},
		EyePoint               = {0.000000,0.000000,0.000000},
		limits_6DOF            = {x = {-0.050000,0.450000},y ={-0.200000,0.200000},z = {-0.220000,0.220000},roll = 90.000000},
	},
	}, -- Cockpit 
	Chase = {
		LocalPoint      = {4.259000,3.819000,0.000000},
		AnglesDefault   = {180.000000,-8.000000},
	}, -- Chase 
	Arcade = {
		LocalPoint      = {-12.041000,6.419000,0.000000},
		AnglesDefault   = {0.000000,-8.000000},
	}, -- Arcade 
},		
	M_empty                  = 4190,
    M_nominal                = 5570,
    M_max                    = 6990,
    M_fuel_max               = 965,
    wing_area                = 31.03,
    wing_span                = 13.06,
    wing_type                = 0,
    length                   = 10.24,
    height                   = 3.89,
    V_max_sea_level          = 145.8,
    V_max_h                  = 170.0,
    V_max_altitude           = 170.0,
    V_opt                    = 94.8,
    V_take_off               = 53.7,
    V_land                   = 58.1,
    Vy_max                   = 16.5,
    H_max                    = 11400,
    Mach_max                 = 0.72,
    thrust_sum_max           = 1817,
    thrust_sum_ab            = 1817,
    CAS_min                  = 40.0,
    Ny_min                   = -3.5,
    Ny_max                   = 7.0,
    wing_root_chord          = 2.90,
    wing_tip_chord           = 1.60,
    wing_sweep               = 0.0,
    AOA_take_off             = 0.16,
    bank_angle_max           = 65,
    has_afteburner           = false,
    has_speedbrake           = true,
    flaps_maneuver           = 0.3,
    range                    = 1521,
    RCS                      = 2.5,
    IR_emission_coeff        = 0.2,
    IR_emission_coeff_ab     = 0,
    -- wing_tip_pos             = {-1.2, 0.25, 6.2},
    brakeshute_name          = 0,
    is_tanker                = false,
    -- air_refuel_receptacle_pos = {6.731, 0.825, 0.492},
    tand_gear_max            = 0.577,
   
	--[[nose_gear_pos            = {-4.846, -1.240, 0.000},
    nose_gear_wheel_diameter = 0.328,
    main_gear_pos            = {0.030, -2.200, 1.779},
    main_gear_wheel_diameter = 0.76,]]-- REVISE!
---- Primo valore    : avanti/indietro (x)  --- forward - backward
---- Secondo valore: alto/basso        (Z)  --- high - Low
---- Terzo Valore    : destra/sinistra (y)	--- right - left
-------- Posizione rispetto al suolo ----- Position relative to the ground -----------------------	


	 nose_gear_pos            = {-5.704, -0.940,  0.000}, -- tail wheel contact point from F6F5.edm, +0.06 after in-game check
	 nose_gear_amortizer_direct_stroke   		         =  0,  -- down from nose_gear_pos !!!
	 nose_gear_amortizer_reversal_stroke  		=  0,  -- up 
	 nose_gear_amortizer_normal_weight_stroke 	=  0,   -- up 
	 nose_gear_wheel_diameter 	               			 = 0.328, -- in m
	
--	 main_gear_pos 				= 	{ 1.071,	-2.348, 2.28}, -- main gear coords 0.072,	-2.374,	2.341
	 main_gear_pos            = { 0.684, -2.245,  1.656}, -- tyre contact point from F6F5.edm, +0.10 after in-game check
	 main_gear_amortizer_direct_stroke	 	    =   0, --  down from main_gear_pos !!!
	 main_gear_amortizer_reversal_stroke  	    = 	0, --  up 
	 main_gear_amortizer_normal_weight_stroke    =   0,-- down from main_gear_pos
	 main_gear_wheel_diameter 				    =   0.76, -- in m

	tanker_type 				= 0, -- Tanker type if the plane is airrefuel capable
	crew						= 1,
	wing_tip_pos 				= {-0.5,	0.25,	5.5}, -- REVIEW !!!
	brakeshute_name 			= 0, -- Landing - brake chute visual shape after separation
	engines_count				= 1, -- Engines count
	engines_nozzles = {
		[1] = 
		{
			pos 		=  {0.6,-0.8, 0}, -- nozzle coords
			elevation   =  0, -- AFB cone elevation
			diameter	 = 0.3, -- AFB cone diameter
			exhaust_length_ab   = 0.631, -- lenght in m
			exhaust_length_ab_K = 0.56, -- AB animation
			smokiness_level = 0.04,
			engine_number  = 1, --both to first engine
		}, -- end of [1]
	}, -- end of engines_nozzles
	
	crew_members = 
	{
		[1] =                                                                          
		{
			pilot_name		  	 = "pilot_p51",
			ejection_seat_name	 = 0,
			drop_canopy_name 	 = "F6F5_Canopy",
			pos					 =  {-0.603,	0.9,	0},
			canopy_pos = {0,0,0},
		}, -- end of [1]
	}, -- end of crew_members
	

---- Primo valore    : avanti/indietro (x)  --First  value: forward / backward
---- Secondo valore: alto/basso        (Z)  --second value: up / down
---- Terzo Valore    : destra/sinistra (y)	---- Terzo Valore    : destra/sinistra (y)

	fires_pos = 
	{
		[1] = 	{-2.117,	-0.9,	0},
		[2] = 	{0.500,	0.213,	0},
		[3] = 	{0.500,	0.213,	-2.182},
		[4] = 	{-0.82,	0.265,	2.774},
		[5] = 	{-0.82,	0.265,	-2.774},
		[6] = 	{-0.82,	0.255,	2.7274},
		[7] = 	{-0.82,	0.255,	-2.7274},
		[8] = 	{0.5,	-0.5,	2.7578},
		[9] = 	{0.5,	-0.5,	-2.578},
		[10] = 	{0.50,	0.084,	2.754},
		[11] = 	{0.50,	0.084,	-2.7534},
	}, -- end of fires_pos

----------------------------------------------------------------
-- Dati per appontaggi
-----------------------------------------------------------------
                 LandRWCategories = 
        {
            [1] = 
            {
                Name = "AircraftCarrier",
            }, -- end of [1]
        }, -- end of LandRWCategories

		        TakeOffRWCategories = 
        {
            [1] = 
            {
                Name = "AircraftCarrier With Catapult",
            }, -- end of [1]
			[2] = 
            {
				Name = "AircraftCarrier With Tramplin",
            }, -- end of [2]
        }, -- end of TakeOffRWCategories		
-----------------------------------------------------------------		
	
	-- Countermeasures
	SingleChargeTotal	 	= 0,
	CMDS_Incrementation 	= 0,
	ChaffDefault 			= 0, 
	ChaffChargeSize 		= 0,
	FlareDefault 			= 0, 
	FlareChargeSize 		= 0,
	CMDS_Edit 				= false,

	--sensors
	
	detection_range_max		 = 0,
	radar_can_see_ground 	 = false, -- this should be examined (what is this exactly?)
	CanopyGeometry = {
		azimuth   = {-160.0, 160.0}, -- pilot view horizontal (AI)
		elevation = {-50.0, 90.0} -- pilot view vertical (AI)
	},
	Sensors = {},
	HumanRadio = {
		frequency = 127.5,  -- Radio Freq
		editable = true,
		minFrequency = 100.000,
		maxFrequency = 156.000,
		modulation = MODULATION_AM
	},
	
---- Primo valore    : avanti/indietro (x)
---- Secondo valore: alto/basso        (Z)
---- Terzo Valore    : destra/sinistra (y)		
	Guns =  {
			M3({muzzle_pos_connector	= "Gun_point_1",
			    rates = {800},
				effect_arg_number = 350,
				azimuth_initial =  -0.379,
				elevation_initial = 0.364,
				supply_position = {1.1104,-0.263, -2.727}}), --R outer
				ejector_pos = {0.152, -0.407, -0.23},
            M3({muzzle_pos_connector	= "Gun_point_2",
			    rates = {800},
				effect_arg_number = 350,
				azimuth_initial =  -0.379,
				elevation_initial = 0.364,
				supply_position = {1.195, -0.288, -2.52}}), --L center
			M3({muzzle_pos_connector	= "Gun_point_3",
			    rates = {800},
				effect_arg_number = 350,
				azimuth_initial =  -0.379,
				elevation_initial = 0.364,
				supply_position = {1.287, -0.317, -2.306}}), --L outer
			M3({muzzle_pos_connector	= "Gun_point_4",
			    rates = {800},
				effect_arg_number = 350,
				azimuth_initial =  0.379,
				elevation_initial = 0.364,
				supply_position = {1.287, -0.381, 2.318}}), --R inner					
            M3({muzzle_pos_connector	= "Gun_point_5",
			    rates = {800},
				effect_arg_number = 350,
				azimuth_initial =  0.379,
				elevation_initial = 0.364,
				supply_position = {1.194, -0.292, 2.532}}), --R center							
            M3({muzzle_pos_connector	= "Gun_point_6",
			    rates = {800},
				effect_arg_number = 350,
				azimuth_initial =  0.379,
				elevation_initial = 0.364,
				supply_position = {1.104, 2.748, -0.268}}), --R outer	
			},



--------------------------------------------------------------------------------------------


	-- The connectors this block used ("Point Pilon", "Rocket_Point_7/22") do not exist in the modpack's
	-- F6F5.edm (it has PYLON_1..12 / PylonL/R / Pilone_5..8 instead), so every store was invisible.
	-- Stations are now placed by coordinates measured on f6f_collision_v2.1.blend (DCS axes, metres):
	-- belly under the wing centre section, and 3 HVAR stations under each outer wing (F6F-5 fit).
 	Pylons =  {
		-- x calibrated from Mission Editor screenshots (the collision model origin sits ~1.8 m off in x)
		pylon(1, 0, -0.40, -0.53, -4.20, {DisplayName = "HVAR L3"}, { { CLSID = "{HVAR}" } }),
		pylon(2, 0, -0.40, -0.61, -3.70, {DisplayName = "HVAR L2"}, { { CLSID = "{HVAR}" } }),
		pylon(3, 0, -0.40, -0.70, -3.20, {DisplayName = "HVAR L1"}, { { CLSID = "{HVAR}" } }),
		-- Station at the model origin: the F6F5 TANK mesh carries its own offset and sits right there.
		-- Bomb meshes are centred on their origin, so they get pushed down to the belly.
		pylon(4, 0, 0.00, 0.00,  0.00, {DisplayName = "Centerline"},
		{
			-- Historical F6F-5 centerline: 150 gal drop tank or one 1,000 / 500 lb bomb
			{ CLSID = "{F6F5 TANK}" },
			{ CLSID = "PTO_US_ANM65_1000LB", attach_point_position = {0.0, -1.00, 0.0} },
			{ CLSID = "PTO_US_ANM64_500LB",  attach_point_position = {0.0, -0.98, 0.0} },
		}),
		pylon(5, 0, -0.40, -0.70,  3.20, {DisplayName = "HVAR R1"}, { { CLSID = "{HVAR}" } }),
		pylon(6, 0, -0.40, -0.61,  3.70, {DisplayName = "HVAR R2"}, { { CLSID = "{HVAR}" } }),
		pylon(7, 0, -0.40, -0.53,  4.20, {DisplayName = "HVAR R3"}, { { CLSID = "{HVAR}" } }),
    },
 	
--------------------------------------------------------------------------------------------------------------------------	
	Tasks = {
			aircraft_task(CAP),
			aircraft_task(Escort),
			aircraft_task(FighterSweep),
			aircraft_task(GroundAttack),
			aircraft_task(CAS),
			aircraft_task(AFAC),
			aircraft_task(RunwayAttack),
			aircraft_task(AntishipStrike),
    },	
	DefaultTask = aircraft_task(FighterSweep),

-- ------------------------------------------------------------------------------------------------------------
-- 2. STANDARD FLIGHT MODEL (SFM) AERODYNAMICS (SFM_Data.aerodynamics) v2.45
-- ------------------------------------------------------------------------------------------------------------
SFM_Data = {
    aerodynamics = {
        -- Control authority & stability derivatives (DCS convention)
        Cy0         = 0.1463, -- Zero-AoA 3D Wing Lift Coefficient (Rigorous Formulation)
        Mzalfa      = 4.5500, -- Pitch moment stability derivative (positive in DCS)
        Mzalfadt    = 1.0693, -- Pitch rate damping factor (positive in DCS)
        kjx         = 1.7192, -- Roll inertia factor
        kjz         = 0.0012, -- Yaw directional stability factor
        Czbe        = -0.0134, -- Directional weathercock side force derivative

        -- Drag & high-lift coefficients
        cx_gear     = 0.0150, -- Landing gear parasite drag increment
        cx_flap     = 0.0511, -- Landing flaps parasite drag increment
        cy_flap     = 0.4278, -- Landing flaps maximum lift increment
        cx_brk      = 0.0000, -- Airbrake / dive flap parasite drag increment

        table_data = {
            --      M     Cx0      Cya      B       B4     Omxmax  Aldop  Cymax
            [1]  = {0.00, 0.02748, 0.069, 0.08399, 0.27039, 0.047, 12.10, 1.028}, -- Static / Taxi
            [2]  = {0.08, 0.02748, 0.069, 0.08453, 0.18927, 0.328, 14.77, 1.206}, --Clean Stall Speed (Vs) / Deep Dogfight
            [3]  = {0.15, 0.02683, 0.070, 0.08592, 0.16223, 0.703, 16.39, 1.315}, -- Zoom Climb Threshold / Final Approach
            [4]  = {0.24, 0.02608, 0.071, 0.08913, 0.09464, 1.031, 16.40, 1.370}, -- Corner Speed / Optimal Sustained Turn
            [5]  = {0.34, 0.02540, 0.073, 0.09497, 0.07030, 1.172, 16.40, 1.343}, -- High Energy Combat / Peak Roll Rate
            [6]  = {0.44, 0.02498, 0.077, 0.10416, 0.05408, 0.867, 14.60, 1.165}, -- Max Level Speed (Vmax) / Fast Cruise
            [7]  = {0.55, 0.02498, 0.078, 0.12042, 0.10815, 0.524, 10.88, 0.891}, -- Dive Entry (Vne) / Heavy Control Stiffening
            [8]  = {0.65, 0.02504, 0.073, 0.14544, 0.27039, 0.308, 8.44, 0.658}, -- Wave Drag Onset (M_CR) / Roll Lockout
            [9]  = {0.75, 0.03319, 0.057, 0.19198, 1.08155, 0.164, 7.19, 0.438}, -- Transonic Drag Divergence (M_DD)
            [10] = {0.85, 0.09397, 0.038, 0.30267, 4.32619, 0.062, 5.96, 0.247}, -- Terminal Structural Shock / Safety Limit
        }, -- end of table_data
    }, -- end of aerodynamics

    -- --------------------------------------------------------------------------------------------------------
    -- 3. PISTON ENGINE & SUPERCHARGER SPECIFICATION (SFM_Data.engine, typeng = 2)
    -- --------------------------------------------------------------------------------------------------------
    engine = {
        Nominal_RPM           = 2700.0, -- Full Throttle Rated Crankshaft RPM
        Nmg                   = 24.0, -- [%] Idle RPM Percentage
        MinRUD                = 0, -- Minimum throttle state
        MaxRUD                = 1, -- Maximum throttle state
        MaksRUD               = 1.00, -- 100% Military Dry Power Position
        ForsRUD               = 1.00, -- Emergency War Power (WEP) Position
        typeng                = 2, -- [enum] 2 = Piston engine with propeller dynamics
        type                  = "Piston", -- Canonical DCS SFM piston engine type
        Startup_Prework       = 12, -- Cranking duration before ignition
        Startup_RPMs          = { {0, 0}, {1, 66}, {4.6, 66}, {5, 300}, {5.5, 450}, {7, 500}, {9, 800}, {12, 900} },
        Startup_Ignition_Time = 7, -- Seconds to cylinder firing catch
        Shutdown_Duration     = 6.8, -- Spindown duration in seconds
        cylinder_firing_order = {1, 12, 5, 16, 9, 2, 13, 6, 17, 10, 3, 14, 7, 18, 11, 4, 15, 8},

        -- Mechanical & Thermodynamic Engine Dimensions
        Displ                 = 45.90, -- [L] Engine displacement in liters
        Stroke                = 0.152, -- [m] Piston stroke in meters
        V_pist_0              = 13.68, -- [m/s] Mean linear piston velocity at nominal METO RPM
        k_Eps                 = 6.65, -- Geometric cylinder compression ratio
        k_gearbox             = 2.00, -- Engine/propeller gearbox reduction ratio

        -- Supercharger & Intake Manifold Pressure Regulation
        hMaxEng               = 6.7, -- [km] Critical full-throttle altitude
        k_boost               = 1.95, -- Supercharger boost stage multiplier
        k_cfug                = 0.0015, -- Centrifugal compressor pressure rise factor
        k_vel                 = 0.016, -- Intake ram air recovery factor
        k_adiab_1             = 0.0379, -- Supercharger Stage 1 charge heating coefficient
        k_adiab_2             = 0.0562, -- Supercharger Stage 2 charge heating coefficient
        k_after_cool          = 0.750, -- Engine intercooling booster efficiency
        MAX_Manifold_P_1      = 145000, -- [Pa] Max continuous/METO manifold pressure
        MAX_Manifold_P_2      = 182865, -- [Pa] Military dry takeoff manifold pressure
        MAX_Manifold_P_3      = 182865, -- [Pa] WEP wet emergency manifold pressure

        -- Deactivation of Linear Power Derivatives (Dynamic Simulation Enforcement)
        dpdh_m                = 1800, -- [Pa/m] 
        dpdh_f                = 1800, -- [Pa/m] 
        cemax                 = 0.37, -- [kg/s] Fuel consumption parameter
        cefor                 = 0.37, -- [kg/s] WEP fuel consumption parameter

        -- Thrust Table (Mach vs Available Thrust Pmax/Pfor in Newtons)
        table_data = {
            --      M     Pmax (N)   
            [1]  = {0.00, 17827.4}, -- Static Takeoff Thrust
            [2]  = {0.08, 16952.1}, -- Takeoff Roll
            [3]  = {0.15, 16044.7}, -- Climb Accel
            [4]  = {0.24, 14939.4}, -- Combat Climb
            [5]  = {0.34, 13816.2}, -- Fast Cruise
            [6]  = {0.44, 12710.9}, -- Near Vne
            [7]  = {0.55, 11730.4}, -- High Speed Dive
            [8]  = {0.65, 11070.8}, -- Dive Compressibility
            [9]  = {0.75, 10643.0}, -- Transonic Buffeting
            [10] = {0.85, 8432.4}, -- Propeller Windmilling Limit
        }, -- end of engine table_data

        -- Cooling, Friction & Governor Dynamics
        dcx_eng               = 0.025, -- Engine cooling and momentum intake drag
        Nu_0                  = 1.20, -- Propeller static thrust coefficient at V=0
        Nu_1                  = 0.89, -- Propeller advance ratio (J) decay coefficient
        Nu_2                  = 0.0011, -- Helical tip Mach shock loss coefficient
        N_indic_0             = 1580000, -- [W] Indicated thermodynamic power
        N_fr_0                = 0.040, -- Static mechanical friction mean effective pressure
        N_fr_1                = 0.001, -- Viscous friction decay with piston speed
        P_oil                 = 495438, -- [Pa] Engine oil operating pressure
        k_oil                 = 0.00004, -- Oil viscosity shearing resistance
        k_piston              = 3000, -- IMEP piston velocity scaler
        k_reg                 = 0.0050, -- Constant-speed governor tracking gain
        prop_direction        = 1, -- Propeller rotation direction from Engine_Database
        Init_Mom              = 220, -- [N*m] Starter cranking torque
        D_prop                = 3.99, -- [m] Propeller disc tip-to-tip diameter
        MOI_prop              = 48.0, -- [kg*m^2] Propeller polar mass moment of inertia
        prop_pitch_min        = 23.0, -- [deg] Fine pitch limit for takeoff
        prop_pitch_max        = 65.0, -- [deg] Coarse pitch limit for dive/cruise
        prop_pitch_feather    = 85.0, -- [deg] Feathered streamlined pitch angle
        prop_blades_count     = 3, -- Propeller blade count

    }, -- end of engine
}, -- end of SFM_Data

-- ============================================================================================================
    -- GRUMMAN F6F-3 / F6F-5 "HELLCAT" - CANONICAL DAMAGE MODEL (34 COLLISION SHELLS + 32 INNARDS)
    -- "Grumman Iron Works": High structural durability, heavy cockpit/engine armor & self-sealing fuel cells
    -- Fully crash-proof configuration: args = {-1} on all collision cells (zero missing debris assertions)
    -- ============================================================================================================

    Damage = verbose_to_dmg_properties({
        -- =====================================================================
        -- 1. NOSE, ENGINE & PROPELLER (PRATT & WHITNEY R-2800-10W DOUBLE WASP)
        -- =====================================================================
        ["NOSE_BOTTOM"] = {
            critical_damage = 3.5,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.0, skin = "Aluminum", thickness = 0.0012},
            children = {"ENGINE"},
            radiator = {critical_damage = 1.8, volume = 0.35},
            innards = {
                { id = "XEng0OilRadiator0", skin = "Steel", wall = 0.003 },
            },
        },
        ["NOSE_LEFT_SIDE"] = {
            critical_damage = 3.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.8, skin = "Aluminum", thickness = 0.0010},
        },
        ["NOSE_RIGHT_SIDE"] = {
            critical_damage = 3.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.8, skin = "Aluminum", thickness = 0.0010},
        },
        ["ENGINE"] = {
            critical_damage = 9.5,
            args = {-1},
            damage_boundary = 0.10,
            droppable = false,
            refractory = false,
            construction = {durability = 4.5, skin = "Steel", thickness = 0.008, spar = "Rod"},
            children = {"ROTOR"},
            failures = {
                { "ENG0_OIL_RADIATOR_0_PIERCED", 0.60 },
                { "ENG0_OIL_HOSE_0_LEAK",        0.40 },
                { "ENG0_JAMMED",                 0.15 },
            },
            innards = {
                { id = "XEng0Case",         skin = "CastIron", wall = 0.025 },
                { id = "XEng0OilTank0",     skin = "Aluminum", wall = 0.005 },
                { id = "XEng0Supercharger", skin = "Steel",    wall = 0.008 },
            },
        },
        ["ROTOR"] = {
            critical_damage = 3.0,
            args = {-1},
            droppable = false,
            construction = {durability = 2.0, skin = "Steel", thickness = 0.0040},
        },

        -- =====================================================================
        -- 2. COCKPIT, CABIN & FUSELAGE STATIONS (GRUMMAN HEAVY ARMOR PROTECTION)
        -- =====================================================================
        ["COCKPIT"] = {
            critical_damage = 5.0,
            args = {-1},
            damage_boundary = 0.25,
            droppable = false,
            construction = {durability = 2.8, skin = "Glass", thickness = 0.0040, spar = "Truss"},
            innards = {
                { id = "XCrew0" },
                { id = "XCrew0H" },
                { id = "XCtrlCrew0Stick", skin = "Steel", wall = 0.025 },
                { id = "XArmor00",        skin = "Steel", wall = 0.0127 }, -- 1/2 inch (12.7mm) pilot seat armor plate
                { id = "XArmor01",        skin = "Glass", wall = 0.0380 }, -- 1.5 inch (38mm) bullet-resistant windscreen
            },
        },
        ["CABIN_LEFT_SIDE"] = {
            critical_damage = 8.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 3.5, skin = "Aluminum", thickness = 0.0015, spar = "Truss"},
            children = {"NOSE_LEFT_SIDE", "COCKPIT"},
            innards = {
                { id = "XArmor02",          skin = "Steel", wall = 0.008 }, -- Forward firewall armor plate
                { id = "XCtrlLineElevator", skin = "Steel", wall = 0.002, plenum = 0.001 },
                { id = "XCtrlLineRudder",   skin = "Steel", wall = 0.002, plenum = 0.001 },
            },
        },
        ["CABIN_RIGHT_SIDE"] = {
            critical_damage = 8.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 3.5, skin = "Aluminum", thickness = 0.0015, spar = "Truss"},
            children = {"NOSE_RIGHT_SIDE"},
        },
        ["FUSELAGE_BOTTOM"] = {
            critical_damage = 11.0,
            args = {-1},
            damage_boundary = 0.25,
            droppable = false,
            construction = {durability = 4.0, skin = "Aluminum", thickness = 0.0018, spar = "Truss"},
            children = {"CABIN_LEFT_SIDE", "CABIN_RIGHT_SIDE", "WING_L_IN", "WING_R_IN", "TAIL_LEFT_SIDE", "TAIL_RIGHT_SIDE"},
            -- Main Fuselage Self-Sealing Fuel Cell (250 US gal / ~946 L)
            fuel_tank = {critical_damage = 3.5, volume = 946.0, integrity_loss_rate = 0.35},
            failures = {
                { "FUEL_TANK_00_MINOR_LEAK",  0.30 },
                { "FUEL_TANK_00_MEDIUM_LEAK", 0.20 },
                { "FUEL_TANK_00_MAJOR_LEAK",  0.10 },
                { "FUEL_TANK_00_FIRE",        0.15 },
                { "FUEL_TANK_00_EXPLODED",    0.03 },
            },
            innards = {
                { id = "XFuelTank0", skin = "Rubber", wall = 0.036, lining = "FoamFilledRubber", plenum = 0.70 },
            },
        },

        -- =====================================================================
        -- 3. PORT (LEFT) WING & CONTROL SURFACES
        -- =====================================================================
        ["WING_L_IN"] = {
            critical_damage = 10.5,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 4.2, skin = "Aluminum", thickness = 0.0016, spar = "FlangeBeam"},
            children = {"WING_L_CENTER", "FLAP_L_IN", "WHEEL_L"},
            -- Port Wing Root Self-Sealing Fuel Cell (87.5 US gal / ~331 L)
            fuel_tank = {critical_damage = 2.5, volume = 331.0, integrity_loss_rate = 0.35},
            failures = {
                { "FUEL_TANK_01_MINOR_LEAK",  0.30 },
                { "FUEL_TANK_01_MEDIUM_LEAK", 0.20 },
                { "FUEL_TANK_01_MAJOR_LEAK",  0.10 },
                { "FUEL_TANK_01_FIRE",        0.15 },
                { "FUEL_TANK_01_EXPLODED",    0.03 },
            },
            innards = {
                { count = 2, durability = 1.40, id = "XSparWLHIn", plenum = 0.25, skin = "Aluminum", wall = 0.014 },
                { id = "XFuelTank1", skin = "Rubber", wall = 0.036, lining = "FoamFilledRubber", plenum = 0.70 },
            },
        },
        ["WING_L_CENTER"] = {
            critical_damage = 8.5,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 3.8, skin = "Aluminum", thickness = 0.0014, spar = "FlangeBeam"},
            children = {"WING_L_OUT"},
            innards = {
                { count = 2, durability = 1.20, id = "XSparWLHMid", plenum = 0.22, skin = "Aluminum", wall = 0.012 },
                { id = "XGun-100",     skin = "Steel",    wall = 0.008 }, -- Port inner .50 cal Browning M2
                { id = "XGun-101",     skin = "Steel",    wall = 0.008 }, -- Port mid .50 cal Browning M2
                { id = "XGun-102",     skin = "Steel",    wall = 0.008 }, -- Port outer .50 cal Browning M2
                { id = "XAmmoBox-100", skin = "Aluminum", wall = 0.003 }, -- Port ammunition tray & feed chute
            },
        },
        ["WING_L_OUT"] = {
            critical_damage = 6.0,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 2.8, skin = "Aluminum", thickness = 0.0012, spar = "FlangeBeam"},
            children = {"AILERON_L"},
            innards = {
                { count = 2, durability = 0.95, id = "XSparWLHOut", plenum = 0.18, skin = "Aluminum", wall = 0.008 },
            },
        },
        ["AILERON_L"] = {
            critical_damage = 2.2,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 1.0, skin = "Fabric", thickness = 0.0006, spar = "Truss"},
        },
        ["FLAP_L_IN"] = {
            critical_damage = 3.0,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0012},
        },

        -- =====================================================================
        -- 4. STARBOARD (RIGHT) WING & CONTROL SURFACES
        -- =====================================================================
        ["WING_R_IN"] = {
            critical_damage = 10.5,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 4.2, skin = "Aluminum", thickness = 0.0016, spar = "FlangeBeam"},
            children = {"WING_R_CENTER", "FLAP_R_IN", "WHEEL_R"},
            -- Starboard Wing Root Self-Sealing Fuel Cell (87.5 US gal / ~331 L)
            fuel_tank = {critical_damage = 2.5, volume = 331.0, integrity_loss_rate = 0.35},
            failures = {
                { "FUEL_TANK_02_MINOR_LEAK",  0.30 },
                { "FUEL_TANK_02_MEDIUM_LEAK", 0.20 },
                { "FUEL_TANK_02_MAJOR_LEAK",  0.10 },
                { "FUEL_TANK_02_FIRE",        0.15 },
                { "FUEL_TANK_02_EXPLODED",    0.03 },
            },
            innards = {
                { count = 2, durability = 1.40, id = "XSparWRHIn", plenum = 0.25, skin = "Aluminum", wall = 0.014 },
                { id = "XFuelTank2", skin = "Rubber", wall = 0.036, lining = "FoamFilledRubber", plenum = 0.70 },
            },
        },
        ["WING_R_CENTER"] = {
            critical_damage = 8.5,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 3.8, skin = "Aluminum", thickness = 0.0014, spar = "FlangeBeam"},
            children = {"WING_R_OUT"},
            innards = {
                { count = 2, durability = 1.20, id = "XSparWRHMid", plenum = 0.22, skin = "Aluminum", wall = 0.012 },
                { id = "XGun-103",     skin = "Steel",    wall = 0.008 }, -- Starboard inner .50 cal Browning M2
                { id = "XGun-104",     skin = "Steel",    wall = 0.008 }, -- Starboard mid .50 cal Browning M2
                { id = "XGun-105",     skin = "Steel",    wall = 0.008 }, -- Starboard outer .50 cal Browning M2
                { id = "XAmmoBox-101", skin = "Aluminum", wall = 0.003 }, -- Starboard ammunition tray & feed chute
            },
        },
        ["WING_R_OUT"] = {
            critical_damage = 6.0,
            args = {-1},
            damage_boundary = 0.15,
            droppable = false,
            construction = {durability = 2.8, skin = "Aluminum", thickness = 0.0012, spar = "FlangeBeam"},
            children = {"AILERON_R"},
            innards = {
                { count = 2, durability = 0.95, id = "XSparWRHOut", plenum = 0.18, skin = "Aluminum", wall = 0.008 },
            },
        },
        ["AILERON_R"] = {
            critical_damage = 2.2,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 1.0, skin = "Fabric", thickness = 0.0006, spar = "Truss"},
        },
        ["FLAP_R_IN"] = {
            critical_damage = 3.0,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0012},
        },

        -- =====================================================================
        -- 5. TAIL UNIT & EMPENNAGE SURFACES
        -- =====================================================================
        ["TAIL_LEFT_SIDE"] = {
            critical_damage = 6.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.8, skin = "Aluminum", thickness = 0.0012},
            children = {"TAIL"},
        },
        ["TAIL_RIGHT_SIDE"] = {
            critical_damage = 6.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.8, skin = "Aluminum", thickness = 0.0012},
        },
        ["TAIL"] = {
            critical_damage = 7.5,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 3.2, skin = "Aluminum", thickness = 0.0014, spar = "Truss"},
            children = {"FIN_L_BOTTOM", "STABILIZER_L_IN", "STABILIZER_R_IN", "WHEEL_REAR"},
        },
        ["FIN_L_BOTTOM"] = {
            critical_damage = 4.5,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.2, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
            children = {"FIN_L_TOP"},
            innards = {
                { id = "XSparKeelIn", plenum = 0.22, skin = "Aluminum", wall = 0.006 },
            },
        },
        ["FIN_L_TOP"] = {
            critical_damage = 3.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.8, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"RUDDER"},
        },
        ["RUDDER"] = {
            critical_damage = 2.0,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.9, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },
        ["STABILIZER_L_IN"] = {
            critical_damage = 4.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.2, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
            children = {"STABILIZER_L_OUT"},
            innards = {
                { id = "XSparStabLHIn", skin = "Aluminum", wall = 0.006 },
            },
        },
        ["STABILIZER_L_OUT"] = {
            critical_damage = 3.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"ELEVATOR_L"},
        },
        ["ELEVATOR_L"] = {
            critical_damage = 2.0,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.9, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },
        ["STABILIZER_R_IN"] = {
            critical_damage = 4.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 2.2, skin = "Aluminum", thickness = 0.0010, spar = "FlangeBeam"},
            children = {"STABILIZER_R_OUT"},
            innards = {
                { id = "XSparStabRHIn", skin = "Aluminum", wall = 0.006 },
            },
        },
        ["STABILIZER_R_OUT"] = {
            critical_damage = 3.0,
            args = {-1},
            damage_boundary = 0.20,
            droppable = false,
            construction = {durability = 1.6, skin = "Aluminum", thickness = 0.0008, spar = "FlangeBeam"},
            children = {"ELEVATOR_R"},
        },
        ["ELEVATOR_R"] = {
            critical_damage = 2.0,
            args = {-1},
            damage_boundary = 0.50,
            droppable = false,
            construction = {durability = 0.9, skin = "Fabric", thickness = 0.0005, spar = "Truss"},
        },

        -- =====================================================================
        -- 6. UNDERCARRIAGE (LANDING GEAR)
        -- =====================================================================
        ["WHEEL_L"] = {
            critical_damage = 3.8,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 2.5, skin = "Steel", thickness = 0.0060, spar = "Rod"},
        },
        ["WHEEL_R"] = {
            critical_damage = 3.8,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 2.5, skin = "Steel", thickness = 0.0060, spar = "Rod"},
        },
        ["WHEEL_REAR"] = {
            critical_damage = 2.5,
            args = {-1},
            damage_boundary = 1.0,
            droppable = false,
            refractory = true,
            construction = {durability = 1.8, skin = "Steel", thickness = 0.0040, spar = "Rod"},
        },
    }),

    DamageParts = {},
	
		lights_data = {
	typename = "collection",
	lights = {
    [1] = { typename = "collection",
						lights = {-- Left Anticollision Light
								  {typename = "natostrobelight",
								   connector = "WHITE_BEACON L",
								   argument_1 = 195,
								   period = 1.2,
								   phase_shift = 0
								  },
								  -- Right Anticollision Light
								  {typename = "natostrobelight",
								   connector = "WHITE_BEACON R",
								   argument_1 = 196,
								   period = 1.2,
								   phase_shift = 0
								  },
								  -- Tail Anticollision Light
								  {typename = "natostrobelight",
								   connector = "BANO_0_BACK",
								   argument_1 = 192,
								   period = 1.2,
								   phase_shift = 0
								  }
								 }
									  },
	[2] = { typename = "collection",
							lights = {-- Landing light
									  {typename = "spotlight",
									   connector = "MAIN_SPOT_PTR_02",
									   argument = 209,
									   dir_correction = {elevation = math.rad(-1)}
									  },
									  {-- Landing/Taxi light
									   typename = "spotlight",
									   connector = "MAIN_SPOT_PTR_01",
									   argument = 208,
									   dir_correction = {elevation = math.rad(3)}
									  }
									 }
						},
    [3]	= {	typename = "collection",
						lights = {-- Left Position Light (red)
								  {typename = "omnilight",
								   connector = "BANO_1",
								   color = {0.99, 0.11, 0.3},
								   pos_correction  = {0, 0, 0},
								   argument  = 190
								  },
								  -- Right Position Light (green)
								  {typename = "omnilight",
								   connector = "BANO_2",
								   color = {0, 0.894, 0.6},
								   pos_correction = {0, 0, 0},
								   argument  = 191
								  },
								  -- Tail Position Light (white)
								  {typename = "omnilight",
								   connector = "BANO_0_BACK",
								   color = {1, 1, 1},
								   pos_correction  = {0, 0, 0},
								   argument  = 203
								  }}
									},
[4] = { typename = "collection", -- white strobe upper
	lights = {
				{typename = "natostrobelight",connector = "WHITE_TOP",argument_1 = 192,period = 1.0,color = {0.8, 0.8, 1.0},phase_shift = 0.0},
			 }
		},
	[5]	= {typename = "collection",
			lights = {
						{typename = "collection",
						lights = {{
								-- Right Nacelle Floodlight
								typename = "spotlight",
								position  = {0.5, 1.2, 0},
								color = {1.0, 1.0, 1.0},
								intensity_max = 6.0,
								angle_max = 0.45,
								direction = {azimuth = math.rad(150), elevation = math.rad(5)},
								dont_change_color = false,
								angle_change_rate = 0
							   },
							   {
								-- Left Nacelle Floodlight
								typename = "spotlight",
								position  = {0.5, 1.2, 0},
								color = {1.0, 1.0, 1.0},
								intensity_max = 6.0,
								angle_max = 0.45,
								direction = {azimuth = math.rad(-150), elevation = math.rad(5)},
								dont_change_color = false,
								angle_change_rate = 0
							   },
							   {typename  = "argumentlight", argument = 212},
						},
					},
						{typename = "collection",
						lights = {{
								-- Left Nose Floodlight
								typename  = "spotlight",
								position  = {0, -0.3, -5.80},
								color = {1.0, 1.0, 1.0},
								intensity_max = 6.0, angle_max = 0.45,
								direction = {azimuth = math.rad(45)},
								argument = 211,
								dont_change_color = false,
								angle_change_rate = 0
							   },
							   {
								-- Right Nose Floodlight
								typename = "spotlight",
								position  = {0, -0.3, 5.80},
								color = {1.0, 1.0, 1.0},
								intensity_max = 6.0,
								angle_max = 0.45,
								direction = {azimuth = math.rad(-45)},
								argument = 210,
								dont_change_color = false,
								angle_change_rate = 0
							   }
						}
					},
		 [6]	= {typename = "collection",
								lights = {-- red recognotion light 
								{typename = "omnilight",
								 connector = "FORM_LIGHTS_1",
								 color = {0.99, 0.11, 0.3},
								 pos_correction  = {0, 0, 0},
								 argument  = 200
								},
								 -- amber recognotion light 
								{typename = "omnilight",
								connector = "FORM_LIGHTS_2",
								color = {1.0, 0.5, 0.0},
								pos_correction = {0, 0, 0},
								argument  = 202
								},
								-- green recognotion light 
								{typename = "omnilight",
								connector = "FORM_LIGHTS_3",
								color = {0, 0.894, 0.6},
								pos_correction  = {0, 0, 0},
								argument  = 201
								}}
							},
					-- UARRSI light
					{
						typename = "omnilight", position  = {6.5, 0.4, 0}, color = {1, 1, 1}
					}
				  },
			}
		}
	},



	
	ViewSettings = ViewSettings,
	SnapViews	 = SnapViews,	
	
Countries = {"USA", "UK"},
}

add_aircraft(F6F5_Hellcat)
