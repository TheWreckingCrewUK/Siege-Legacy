/*
        Different Ammobox v 1.0
        by Demonized.

        1: place a marker named DMZ_DA anywhere you want the players to see their ammobox, all will see their box in same position.
        2: place this in init line of any unit.
                _null = this execVM "DMZ_DA.sqf";
        3: save this script as DMZ_DA.sqf and place it in your mission folder.

        For more classnames on ammoboxes or weapons and magazines go here:
                http://forums.bistudio.com/showthread.php?t=73241&page=2
				edited by FakeMatty
				edited by jayman to make it reload on box close animation.
				This reduces players lag as it no longer fills every 240 seconds.
*/

_weapons = [];
_magazines = [["SmokeShell",5], ["SmokeShellYellow",5], ["SmokeShellRed",5], ["SmokeShellGreen",5], ["SmokeShellPurple",5], ["SmokeShellBlue",5], ["SmokeShellOrange",5], ["Chemlight_green",5], ["Chemlight_yellow",5], ["Chemlight_red",5], ["Chemlight_blue",5],["ACE_Chemlight_IR",5]];
_items = [["ACE_EarPlugs",1],["ACE_MapTools",1],["CUP_NVG_PVS14",1],["ACE_Flashlight_KSF1", 1],["ACE_HandFlare_White",5],["ACE_HandFlare_Green",5],["ACE_CableTie",2],["ACE_fieldDressing",10],["ACE_morphine",10],["ACE_elasticBandage",10],["ACE_quikclot",10],["ACE_packingBandage",10], ["ACE_tourniquet", 2],["ACE_SpraypaintGreen",1],["ACE_DefusalKit",1],["ACE_EntrenchingTool",1],["twc_l5a4_w",5],["twc_l5a4_r",5],["twc_l5a4_g",5]];

_backpacks = [];
_tmp_weapons = [];
_tmp_magazines = [];
_tmp_items = [];
_tmp_backpacks = [];

//BAF Section Leader
if (typeOf vehicle player == "Modern_British_Squadleader") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
        ["ACE_Vector",1],
		["CUP_hgun_Glock17",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
        ["CUP_17Rnd_9x19_glock17",15],
		["B_IR_Grenade",2],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",1],
		["ACRE_PRC117F",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["itemCTAB",1],
		["ACE_wirecutter", 1],
		["ACE_IR_Strobe_Item",1]
    ];
				_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
	
};

//BAF Rifleman Pointman
 if (typeOf vehicle player == "Modern_British_Pointman") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["UK3CB_BAF_L128A1_Eotech",1],
		["CUP_hgun_Glock17",1],
		["ACE_VMH3",1],
		["CUP_launch_M72A6",4],
		["CUP_launch_M136",2],
		["launch_NLAW_F",3]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		["UK3CB_BAF_12G_Pellets",10],
		["UK3CB_BAF_12G_Slugs",10],
		["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",5]
	];

	_tmp_items = 
	[
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["UK3CB_BAF_Eotech",1],
		["ACRE_PRC343",1],
		["UK3CB_BAF_LLM_IR_Black",1]
	];

	_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//BAF Grenadier
 if (typeOf vehicle player == "Modern_British_Grenadier_COIN") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_UGL_ELCAN3D",1],
        ["ACE_Vector",1],
		["CUP_hgun_Glock17",1],
		["CUP_launch_M136",2],
		["CUP_launch_M72A6",4]
	];

    _tmp_magazines =
    [           
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		["CUP_17Rnd_9x19_glock17",15],
		["1Rnd_HE_Grenade_shell", 40],
		["1Rnd_Smoke_Grenade_shell", 10],
		["1Rnd_SmokeRed_Grenade_shell", 10],
		["1Rnd_SmokeGreen_Grenade_shell", 10],
		["1Rnd_SmokeYellow_Grenade_shell", 10],
		["1Rnd_SmokePurple_Grenade_shell", 10],
		["UGL_FlareWhite_F", 10],
		["1Rnd_SmokeBlue_Grenade_shell", 10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["ACRE_PRC343",1],
		["UK3CB_BAF_LLM_IR_Black",1]
	];

	_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//BAF Automatic Rifleman
 if (typeOf vehicle player == "Modern_British_Autorifleman_COIN") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L110A2_ELCAN3D",1],
		["CUP_hgun_Glock17",1],
		["CUP_launch_M72A6",4]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_200Rnd",20],
		["UK3CB_BAF_556_200Rnd_T",10],
        ["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["UK3CB_BAF_Kite",1],
		["ACRE_PRC343",1]
	];

	_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//BAF 2IC
 if (typeOf vehicle player == "Modern_British_2IC_COIN") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["ACE_Vector",1],
		["CUP_hgun_Glock17",1],
		["CUP_launch_M72A6",4]
    ];

    _tmp_magazines =
    [	
    	//Rifleman
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		//Shotgun
		["UK3CB_BAF_12G_Pellets",10],
		["UK3CB_BAF_12G_Slugs",10],
		//Pistol ammo
		["CUP_17Rnd_9x19_glock17",15],
		//Grenadier
		["1Rnd_HE_Grenade_shell", 40],
		["1Rnd_Smoke_Grenade_shell", 10],
		["1Rnd_SmokeRed_Grenade_shell", 10],
		["1Rnd_SmokeGreen_Grenade_shell", 10],
		["1Rnd_SmokeYellow_Grenade_shell", 10],
		["1Rnd_SmokePurple_Grenade_shell", 10],
		["UGL_FlareWhite_F", 10],
		//Autorifleman
		["UK3CB_BAF_556_200Rnd",20],
		["UK3CB_BAF_556_200Rnd_T",10],
		//GPMG
        ["UK3CB_BAF_762_100Rnd",20],
		["UK3CB_BAF_762_100Rnd_T",10],
		//Marksman
        ["UK3CB_BAF_762_L42A1_20Rnd",25],
		["UK3CB_BAF_762_L42A1_20Rnd_T",10],	
		["HandGrenade",5]
	];

	_tmp_items = 
	[
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["ACRE_PRC343",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["ACE_wirecutter", 1],
		["ACE_IR_Strobe_Item",1]
	];

	_tmp_backpacks = 
	[
		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//BAF Machine Gunner
 if (typeOf vehicle player == "Modern_British_Machinegunner") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L7A2",1],
		["UK3CB_BAF_Tripod",1],
		["CUP_hgun_Glock17",1]
	];
       
    _tmp_magazines =
    [
        ["UK3CB_BAF_762_100Rnd",20],
		["UK3CB_BAF_762_100Rnd_T",10],
		["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",5]
    ];
	
	_tmp_items = 
	[
		["ACRE_PRC343",1]
	];

	_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};
 
//BAF Marksman
 if (typeOf vehicle player == "Modern_British_Marksman_COIN") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L129A1_Grippod_TA648",1],
		["ACE_Vector",1],
		["CUP_hgun_Glock17",1],
		["launch_NLAW_F",3],
		["CUP_launch_M136",2]
	];
       
    _tmp_magazines =
    [
        ["UK3CB_BAF_762_L42A1_20Rnd",25],
		["UK3CB_BAF_762_L42A1_20Rnd_T",10],			
		["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",5]
    ];
		
	_tmp_items = 
	[
		["UK3CB_BAF_TA648_308",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["UK3CB_underbarrel_acc_fgrip_bipod",1],
		["UK3CB_BAF_MaxiKite",1],
		["ACRE_PRC343",1]
	];	

	_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};
 if (typeOf vehicle player == "Modern_British_Medic") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS",1],
		["CUP_hgun_Glock17",1]
	];

    _tmp_magazines =
	[
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
        ["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["ACE_morphine", 50],
		["ACE_epinephrine", 50],
		["ACE_atropine", 50],
		["ACE_salineIV_500", 50],
		["ACE_salineIV_250", 50],
		["ACE_bodyBag", 10],
		["ACE_tourniquet", 10],
		["ACE_personalAidKit", 1],
		["ACRE_PRC343", 1]
	];

	_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//BAF Sniper
 if (typeOf vehicle player == "Modern_British_Sniper_coin") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L115A3_DE",1],
		["ACE_Vector",1],
		["CUP_hgun_Glock17",1]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_338_5Rnd",50],
		["UK3CB_BAF_338_5Rnd_Tracer",50],
		["CUP_17Rnd_9x19_glock17",15],
		["CUP_5Rnd_762x51_M24",15]
	];

	_tmp_items = 
	[
		
		["RKSL_optic_PMII_525",1],
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["STKR_Predator",1],
		["ACRE_PRC343",1],
		["CUP_NVG_PVS14",1],
		["ACE_IR_Strobe_Item",5],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACE_RangeCard",1],
		["UK3CB_BAF_MaxiKite",1],
		["ACE_Tripod",1],
		["HandGrenade",5]
	];

	_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//BAF Spotter
 if (typeOf vehicle player == "Modern_British_Spotter_coin") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS",1],
		["ACE_Vector",1],
		["CUP_hgun_Glock17",1]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_338_5Rnd",50],
		["UK3CB_BAF_338_5Rnd_Tracer",50],
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		["UK3CB_BAF_762_L42A1_20Rnd", 50],
		["UK3CB_BAF_762_L42A1_20Rnd_t", 50],
		["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",5]
	];

	_tmp_items = 
	[
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["RKSL_optic_LDS",1],
		["UK3CB_BAF_LLM_IR",1],
		["UK3CB_BAF_Eotech",1],
		["STKR_Predator",1],
		["CUP_NVG_PVS14",1],
		["ACE_IR_Strobe_Item",1],
		["ACRE_PRC343",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACE_Kestrel4500",1],
		["ACE_RangeCard",1],
		["ACE_SpottingScope",1],
		["ACE_MX2A",1],
		["ACRE_PRC117F_ID_1",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["UK3CB_BAF_MaxiKite",1],
		["ACE_ATragMX",1],
		["ACE_Tripod",1],
		["itemCTAB",1]
	];

	_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};
/*
//BAF Bomb Disposal Team Leader
if (g_class == "BAF_EOD_SL") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_RIS",1],
        ["ACE_Vector",1],
		["CUP_hgun_Glock17",1],
		["ACE_VMM3",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
        ["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
        ["ACE_MapTools",1],
		["ACE_epinephrine",5],
		["RKSL_optic_LDS",1],
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["UK3CB_BAF_LLM_IR",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["ACE_DefusalKit",1],
		["UK3CB_BAF_Eotech",1],
		["STKR_Predator",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACRE_PRC117F",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["itemCTAB",1]
    ];
};

//BAF Bomb Disposal Operator
if (g_class == "BAF_EOD_TECH") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_RIS",1],
        ["ACE_Vector",1],
		["CUP_hgun_Glock17",1],
		["ACE_VMM3",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
        ["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
        ["ACE_MapTools",1],
		["ACE_epinephrine",5],
		["RKSL_optic_LDS",1],
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["UK3CB_BAF_LLM_IR",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["ACE_DefusalKit",1],
		["UK3CB_BAF_Eotech",1],
		["STKR_Predator",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["UK3CB_BAF_LLM_IR_Black",1]
    ];
};
//BAF Bomb Disposal Team Infantry Escort
 if (g_class == "BAF_EOD_ESC") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS",1],
		["UK3CB_BAF_L128A1",1],
		["CUP_hgun_Glock17",1],
		["ACE_VMH3",1],
		["Binocular",1],
		["CUP_launch_M72A6",4],
		["CUP_launch_M136",2],
		["launch_NLAW_F",3],
		["UK3CB_BAF_Javelin_Slung_Tube",3]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		["UK3CB_BAF_12G_Pellets",10],
		["UK3CB_BAF_12G_Slugs",10],
		["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",5]
	];

	_tmp_items = 
	[
		["ACE_MapTools",1],
		["RKSL_optic_LDS",1],
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["UK3CB_BAF_LLM_IR",1],
		["UK3CB_BAF_Eotech",1],
		["STKR_Predator",1],
		["ACRE_PRC343",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["UK3CB_BAF_Javelin_CLU",1],
		["UK3CB_BAF_LLM_IR_Black",1]
	];
};
*/
//FST Commander
if (typeOf vehicle player == "Modern_British_FSTCommander") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
        ["ACE_Vector",1],
		["CUP_hgun_Glock17",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
        ["CUP_17Rnd_9x19_glock17",5],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",1],
		["ACRE_PRC117F",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["itemCTAB",1],
		["ACE_wirecutter", 1],
		["ACE_IR_Strobe_Item",1]
    ];

	_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//FST Forward Observer
 if (typeOf vehicle player == "Modern_British_FSTForwardObserver") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A2_UGL_ELCAN3D",1],
        ["CUP_SOFLAM",1],
		["CUP_hgun_Glock17",1]
	];

    _tmp_magazines =
    [           
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		["CUP_17Rnd_9x19_glock17",5],
		["1Rnd_HE_Grenade_shell", 40],
		["1Rnd_Smoke_Grenade_shell", 10],
		["1Rnd_SmokeRed_Grenade_shell", 10],
		["1Rnd_SmokeGreen_Grenade_shell", 10],
		["1Rnd_SmokeYellow_Grenade_shell", 10],
		["1Rnd_SmokePurple_Grenade_shell", 10],
		["UGL_FlareWhite_F", 10],
		["1Rnd_SmokeBlue_Grenade_shell", 10],
		["HandGrenade",5],
		["Laserbatteries",1],
		["ACE_HandFlare_White",5],
		["B_IR_Grenade",2]
		
    ];

	_tmp_items =
	[
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["ACRE_PRC343",1],
		["ACRE_PRC152",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["ACE_SpottingScope",1]
	];

	_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};

//FST Assistant
 if (typeOf vehicle player == "Modern_British_FSTAssistant") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A2_RIS_ELCAN3D",1],
		["CUP_hgun_Glock17",1],
		["ACE_VMH3",1],
		["UK3CB_BAF_Javelin_Slung_Tube",1],
		["UK3CB_BAF_Javelin_CLU",1],
		["CUP_launch_M72A6",1]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		["CUP_17Rnd_9x19_glock17",5],
		["HandGrenade",5]
	];

	_tmp_items = 
	[
		["UK3CB_BAF_SpecterLDS_Dot",1],
		["UK3CB_BAF_Eotech",1],
		["ACRE_PRC343",1],
		["UK3CB_BAF_LLM_IR_Black",1]
	];

	_tmp_backpacks = 
	[
//		["UK3CB_BAF_B_Bergen_MTP_Rifleman_XL_A",1]
	];
};
//US Section Leader
if (typeOf vehicle player == "TWC_Modern_US_Army_SectionCommander") then {
    _tmp_weapons =
    [
		["CUP_arifle_M4A1",1],
        ["ACE_Vector",1],
		["CUP_hgun_M9",1]
    ];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
        ["CUP_5Rnd_762x51_M24",15],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_MapTools",1],
		["ACE_epinephrine",5],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["UK3CB_BAF_TA31F_3D",1],
		["UK3CB_BAF_TA31F",1],
		["CUP_acc_ANPEQ_15_Black",1],
		["CUP_optic_CompM4",1],
		["UK3CB_BAF_Eotech",1],
		["ACE_DAGR",1],
		["ACRE_PRC117F_ID_1",1],
		["CUP_B_US_IIID_UCP",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACRE_PRC148",1],
		["itemCTAB",1],
		["ACE_wirecutter", 1]
    ];
};

//US Team Leader
if (typeOf vehicle player == "TWC_Modern_US_Army_TeamLeader") then {
    _tmp_weapons =
    [
		["CUP_arifle_M4A1_GL_carryhandle",1],
        ["ACE_Vector",1],
		["CUP_launch_M136",2],
		["CUP_hgun_M9",1],
		["CUP_launch_M72A6",4]
    ];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
        ["CUP_5Rnd_762x51_M24",15],
		["1Rnd_HE_Grenade_shell", 40],
	    ["1Rnd_Smoke_Grenade_shell", 10],
	    ["1Rnd_SmokeRed_Grenade_shell", 10],
	    ["1Rnd_SmokeGreen_Grenade_shell", 10],
	    ["1Rnd_SmokeYellow_Grenade_shell", 10],
	    ["1Rnd_SmokePurple_Grenade_shell", 10],
		["UGL_FlareWhite_F", 10],
        ["1Rnd_SmokeBlue_Grenade_shell", 10],


		["CUP_100Rnd_TE4_Red_Tracer_556x45_M249",20],
		["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",10],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_MapTools",1],
		["UK3CB_BAF_TA31F_3D",1],
		["CUP_acc_ANPEQ_15_Black",1],
		["UK3CB_BAF_TA31F",1],
		["UK3CB_BAF_Eotech",1],
		["ACE_DAGR",1],
		["CUP_B_US_IIID_UCP",1],
		["ACRE_PRC148",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["CUP_optic_CompM4",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["ACE_wirecutter", 1]
    ];
};

//US Rifleman
 if (typeOf vehicle player == "TWC_Modern_US_Army_Rifleman") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1",1],

		["ACE_VMH3",1],
		["Binocular",1],
		["CUP_hgun_M9",1],
		["CUP_launch_M136",4],
		["CUP_launch_MAAWS",1],
		["CUP_launch_M72A6",4]
	];

    _tmp_magazines =
    [
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
        ["CUP_5Rnd_762x51_M24",15],


		["CUP_MAAWS_HEDP_M",2],
		["CUP_MAAWS_HEAT_M",3],
		["HandGrenade",5]
		
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["UK3CB_BAF_TA31F_3D",1],
		["UK3CB_BAF_TA31F",1],
		["UK3CB_BAF_Eotech",1],
		["CUP_acc_ANPEQ_15_BlackA",1],
		["CUP_B_US_IIID_UCP",1],
		["ACRE_PRC148",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["CUP_optic_MAAWS_Scope",1],
		["CUP_optic_CompM4",1]
	];
};

//US Automatic Rifleman
 if (typeOf vehicle player == "TWC_Modern_US_Army_AutomaticRifleman") then {
    _tmp_weapons =
    [
        ["CUP_lmg_m249_pip1",1],
		["CUP_launch_M136",2],
		["Binocular",1],
		["CUP_hgun_M9",1],
		["CUP_launch_M72A6",4]
	];

    _tmp_magazines =
    [
		["CUP_100Rnd_TE4_Red_Tracer_556x45_M249",20],
		["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",10],
		["CUP_5Rnd_762x51_M24",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["CUP_optic_ElcanM145",1],
		["CUP_acc_ANPEQ_15_BlackA",1],
		["UK3CB_BAF_Eotech",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["CUP_B_US_IIID_UCP",1],
		["ACRE_PRC148",1]
	];
};

//US Grenadier
 if (typeOf vehicle player == "TWC_Modern_US_Army_Grenadier") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1_GL_carryhandle",1],
		["ACE_Vector",1],
		["CUP_hgun_M9",1],
		["CUP_launch_M136",2],
		["CUP_launch_M72A6",4]
	];

    _tmp_magazines =
    [
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
		["CUP_5Rnd_762x51_M24",15],
		["1Rnd_HE_Grenade_shell", 40],
	    ["1Rnd_Smoke_Grenade_shell", 10],
	    ["1Rnd_SmokeRed_Grenade_shell", 10],
	    ["1Rnd_SmokeGreen_Grenade_shell", 10],
	    ["1Rnd_SmokeYellow_Grenade_shell", 10],
	    ["1Rnd_SmokePurple_Grenade_shell", 10],
		["UGL_FlareWhite_F", 10],
        ["1Rnd_SmokeBlue_Grenade_shell", 10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["UK3CB_BAF_TA31F_3D",1],
		["UK3CB_BAF_Eotech",1],
		["CUP_acc_ANPEQ_15_BlackA",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["UK3CB_BAF_TA31F",1],
		["CUP_B_US_IIID_UCP",1],
		["CUP_optic_CompM4",1],
		["ACRE_PRC148",1]
	];
};

//US Marksmen
 if (typeOf vehicle player == "TWC_Modern_US_Army_Marksman") then {
    _tmp_weapons =
    [
        ["CUP_srifle_M14_DMR",1],
		["CUP_arifle_M4A1",1],
		["CUP_hgun_M9",1],
		["ACE_Vector",1],
		["CUP_launch_M136",2],
		["UK3CB_BAF_Javelin_Slung_Tube",3],
		["CUP_launch_M72A6",4]	
	];
       
    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
		["CUP_20Rnd_762x51_DMR",25],
        ["CUP_5Rnd_762x51_M24",15],
		["HandGrenade",5]
    ];
		
	_tmp_items = 
	[
		["ACE_MapTools",1],
		["CUP_optic_CompM4",1],
		["CUP_optic_LeupoldMk4",1],
		["CUP_acc_ANPEQ_15_BlackA",1],
		["CUP_B_US_IIID_UCP",1],
		["bipod_01_F_blk",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACRE_PRC148",1],
		["UK3CB_BAF_TA31F_3D",1],
		["UK3CB_BAF_TA31F",1],
		["UK3CB_BAF_Javelin_CLU",1],
		["CUP_acc_ANPEQ_15_BlackA",1]
	
	];
};
//US Medic
 if (typeOf vehicle player == "TWC_Modern_US_Army_Medic") then {
    _tmp_weapons =
    [
		["CUP_arifle_M4A1",1],
		["Binocular",1],
	    ["CUP_hgun_M9", 1]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",20],
        ["CUP_5Rnd_762x51_M24",15],
        ["CUP_5Rnd_762x51_M24",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACE_fieldDressing",50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["ACE_personalAidKit", 50],
		["ACE_morphine",50],
		["ACE_epinephrine",50],
		["ACE_atropine", 50],
		["ACE_salineIV",50],
		["ACE_salineIV_250", 50],
		["ACE_bodyBag",10],
		["ACE_surgicalKit", 50],
		["ACE_tourniquet", 5],
		["UK3CB_BAF_TA31F_3D",1],
		["UK3CB_BAF_Eotech",1],
		["CUP_optic_CompM4",1],
		["CUP_acc_ANPEQ_15_BlackA",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["CUP_B_US_IIID_UCP",1],
		["ACRE_PRC148",1]
	];
};
/*
//US Sniper
 if (g_class == "US_SN") then {
    _tmp_weapons =
    [
		["CUP_srifle_M24_blk",1],
		["ACE_Vector",1],
		["CUP_hgun_M9",1]
    ];

    _tmp_magazines =
    [	
		["CUP_5Rnd_762x51_M24",50],
		["CUP_5Rnd_762x51_M24",15]
	];

	_tmp_items = 
	[
		
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["ACRE_PRC148_ID_1",1],
		["CUP_NVG_PVS14",1],
		["ACE_IR_Strobe_Item",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACE_Kestrel4500",1],
		["ACE_RangeCard",1],
		["CUP_optic_LeupoldMk4",1],
		["ACE_SpottingScope",1],
		["ACE_ATragMX",1],
		["ACE_Tripod",1]
	];
};

//US Spotter
 if (g_class == "US_SP") then {
    _tmp_weapons =
    [
		["CUP_arifle_M4A1",1],
		["ACE_Vector",1],
		["CUP_5Rnd_762x51_M24",1]
    ];

    _tmp_magazines =
    [	
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",50],
		["CUP_5Rnd_762x51_M24",50],
		["CUP_5Rnd_762x51_M24",15]
	];

	_tmp_items = 
	[
		
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["UK3CB_BAF_TA31F_3D",1],
		["UK3CB_BAF_Eotech",1],
		["CUP_NVG_PVS14",1],
		["ACE_IR_Strobe_Item",1],
		["ACRE_PRC148_ID_1",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACE_Kestrel4500",1],
		["ACE_RangeCard",1],
		["ACE_SpottingScope",1],
		["ACE_MX2A",1],
		["ACRE_PRC117F_ID_1",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["ACE_ATragMX",1],
		["ACE_Tripod",1],
		["itemCTAB",1]
	];
};
*/
//USMC Squad Leader
 if (typeOf vehicle player == "Modern_USMC_Squadleader") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1_GL_ACOG_Flashlight",1],
        ["ACE_Vector",1],
		["CUP_hgun_Colt1911",1]
    ];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",20],
        ["CUP_7Rnd_45ACP_1911",15],
		["1Rnd_HE_Grenade_shell", 30],
	    ["1Rnd_Smoke_Grenade_shell", 10],
	    ["1Rnd_SmokeRed_Grenade_shell", 10],
	    ["1Rnd_SmokeGreen_Grenade_shell", 10],
	    ["1Rnd_SmokeYellow_Grenade_shell", 10],
	    ["1Rnd_SmokePurple_Grenade_shell", 10],
        ["1Rnd_SmokeBlue_Grenade_shell", 10],
		["UGL_FlareWhite_F", 10],
		["HandGrenade",5]
	];

    _tmp_items = 
	[
        ["ACE_MapTools",1],
		["ACE_epinephrine",5],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["CUP_optic_ACOG",1],
		["CUP_optic_CompM4",1],
		["CUP_acc_ANPEQ_15_Black",1],
		["CUP_B_US_IIID_OCP",1],
		["ACE_DAGR",1],
		["ACRE_PRC117F",1],
		["ACRE_PRC148",1],
		["itemCTAB",1],
		["ACE_IR_Strobe_Item",1]
	];
};
//USMC Team Leader
 if (typeOf vehicle player == "Modern_USMC_Teamleader") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1_GL_ACOG_Flashlight",1],
        ["ACE_Vector",1],
		["CUP_launch_M136",2],
		["CUP_hgun_Colt1911",1]
    ];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",20],
		["1Rnd_HE_Grenade_shell", 30],
	    ["1Rnd_Smoke_Grenade_shell", 10],
	    ["1Rnd_SmokeRed_Grenade_shell", 10],
	    ["1Rnd_SmokeGreen_Grenade_shell", 10],
	    ["1Rnd_SmokeYellow_Grenade_shell", 10],
	    ["1Rnd_SmokePurple_Grenade_shell", 10],
        ["1Rnd_SmokeBlue_Grenade_shell", 10],
		["UGL_FlareWhite_F", 10],
        ["CUP_7Rnd_45ACP_1911",15],
		["HandGrenade",5]
	];

    _tmp_items = 
	[
        ["ACE_MapTools",1],
		["ACE_microDAGR",1],
		["CUP_optic_ACOG",1],
		["CUP_optic_CompM4",1],
		["CUP_acc_ANPEQ_15_Black_light",1],
		["CUP_B_US_IIID_OCP",1],
		["ACRE_PRC148",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["ACE_IR_Strobe_Item",1]
		
	];
};

//USMC Rifleman
 if (typeOf vehicle player == "Modern_USMC_Rifleman") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1_ACOG_Laser",1],
		["ACE_VMH3",1],
        ["CUP_hgun_Colt1911",1],
		["UK3CB_BAF_Javelin_Slung_Tube",3],
		["CUP_launch_Mk153Mod0",1],

		["CUP_launch_M136",2],
		["CUP_launch_M72A6",2]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10],
        ["CUP_7Rnd_45ACP_1911",15],


		["CUP_SMAW_HEAA_M",3],
		["CUP_SMAW_HEDP_M",3],
		["CUP_SMAW_Spotting",8],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["CUP_optic_ACOG",1],
		["CUP_optic_CompM4",1],
		["CUP_acc_ANPEQ_15_Black_light",1],
		["CUP_B_US_IIID_OCP",1],
		["ACRE_PRC148",1],
		["UK3CB_BAF_Javelin_CLU",1],
		["CUP_optic_SMAW_Scope",1]
	];
};

//USMC Auto Rifleman
if (typeOf vehicle player == "Modern_USMC_Autorifleman") then {
    _tmp_weapons =
    [
        ["twc_CUP_lmg_m249_pip1_L_mgo_lazer",1],
		["CUP_arifle_M27_ACOG",1],
		["CUP_hgun_Colt1911",1]
	];

    _tmp_magazines =
    [
        ["CUP_100Rnd_TE4_Red_Tracer_556x45_M249",20],
		["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",10],
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",20],
        ["CUP_7Rnd_45ACP_1911",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["CUP_optic_ElcanM145",1],
		["CUP_acc_ANPEQ_15_Black",1],
		["CUP_B_US_IIID_OCP",1],
		["bipod_01_F_blk",1],
		["ACRE_PRC148",1]
	];
};

//USMC Auto Rifleman Assistant
if (typeOf vehicle player == "Modern_USMC_AsstAutorifleman") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1_ACOG_Laser",1],     
		["CUP_hgun_Colt1911",1],
		["CUP_launch_M136",2],
		["CUP_launch_M72A6",4]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",20],
		["CUP_100Rnd_TE4_Red_Tracer_556x45_M249",10],
		["CUP_200Rnd_TE4_Red_Tracer_556x45_M249",10],
        ["CUP_7Rnd_45ACP_1911",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["CUP_optic_ACOG",1],
		["CUP_optic_CompM4",1],
		["CUP_acc_ANPEQ_15_Black_light",1],
		["CUP_B_US_IIID_OCP",1],
		["ACRE_PRC148",1]
	];
};
//USMC Machine Gunner
if (typeOf vehicle player == "Modern_USMC_MachineGunner") then {
    _tmp_weapons =
    [
        ["CUP_lmg_M240_ElcanM143",1],
		["CUP_hgun_Colt1911",1]
	];

    _tmp_magazines =
    [
		["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",20],
		["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",10],
        ["CUP_7Rnd_45ACP_1911",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["CUP_optic_ElcanM145",1],
		["CUP_acc_ANPEQ_15_Black",1],
		["CUP_B_US_IIID_OCP",1],
		["ACRE_PRC148",1]
	];
};

//USMC Machine Gunner Assistant
if (typeOf vehicle player == "Modern_USMC_AsstMachineGunner") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1_ACOG_Laser",1],
		["CUP_hgun_Colt1911",1],
		["CUP_launch_M136",2],
		["CUP_launch_M72A6",4]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",20],
		["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",10],
		["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M",10],
        ["CUP_7Rnd_45ACP_1911",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
        ["ACE_MapTools",1],
		["CUP_optic_ACOG",1],
		["CUP_optic_CompM4",1],
		["CUP_acc_ANPEQ_15_Black_light",1],
		["CUP_B_US_IIID_OCP",1],
		["ACRE_PRC148",1]
	];
};

//USMC Medic
 if (typeOf vehicle player == "Modern_USMC_Medic") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1_ACOG_Laser",1],
		["CUP_hgun_Colt1911",1]
	];

    _tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",20],
        ["CUP_7Rnd_45ACP_1911",15],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACE_fieldDressing",50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["ACE_personalAidKit", 1],
		["ACE_morphine",50],
		["ACE_epinephrine",50],
		["ACE_atropine", 50],
		["ACE_salineIV",50],
		["ACE_salineIV_250", 50],
		["ACE_bodyBag",10],
		["ACE_tourniquet", 5],
		["CUP_optic_ACOG",1],
		["CUP_optic_CompM4",1],
		["CUP_acc_ANPEQ_15_Black_light",1],
		["CUP_B_US_IIID_OCP",1],
		["ACRE_PRC148",1]
	];
};
/*
//USMC Sniper
 if (g_class == "USMC_SN") then {
    _tmp_weapons =
    [
		["CUP_srifle_M40A3",1],
		["ACE_Vector",1],
		["CUP_hgun_M9",1]
    ];

    _tmp_magazines =
    [	
		["ACE_10Rnd_762x51_M118LR_Mag",50],
		["CUP_5Rnd_762x51_M24",15]
	];

	_tmp_items = 
	[
		
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["ACRE_PRC148_ID_1",1],
		["CUP_NVG_PVS14",1],
		["ACE_IR_Strobe_Item",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACE_Kestrel4500",1],
		["ACE_RangeCard",1],
		["CUP_optic_LeupoldMk4",1],
		["ACE_SpottingScope",1],
		["ACE_ATragMX",1],
		["ACE_Tripod",1]
	];
};

//USMC Spotter
 if (g_class == "US_SP") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M16A4_Grip",1],
		["CUP_arifle_M4A1",1],
		["ACE_Vector",1],
		["CUP_5Rnd_762x51_M24",1]
    ];

    _tmp_magazines =
    [	
		["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",50],
		["ACE_10Rnd_762x51_M118LR_Mag",50],
		["CUP_5Rnd_762x51_M24",15]
	];

	_tmp_items = 
	[
		
		["ACE_fieldDressing",20],
		["ACE_morphine",10],
		["UK3CB_BAF_TA31F_3D",1],
		["UK3CB_BAF_Eotech",1],
		["CUP_NVG_PVS14",1],
		["ACE_IR_Strobe_Item",1],
		["ACRE_PRC148_ID_1",1],
		["UK3CB_BAF_G_Tactical_Black",1],
		["ACE_Kestrel4500",1],
		["ACE_RangeCard",1],
		["ACE_SpottingScope",1],
		["ACE_MX2A",1],
		["ACRE_PRC117F_ID_1",1],
		["UK3CB_BAF_LLM_IR_Black",1],
		["ACE_ATragMX",1],
		["ACE_Tripod",1],
		["itemCTAB",1]
	];
};

//ANA Section Leader
if (g_class == "ANA_SL") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M16A2",1],
		["binocular",1]
	];
	_tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10]
	];
	_tmp_items = 
	[
		["ACE_MapTools",1],
		["ACE_epinephrine",5],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["ACE_SpraypaintBlack",1],
		["ACE_SpraypaintRed",1],
		["ACE_SpraypaintGreen",1],
		["ACE_SpraypaintBlue",1]
	];
};

//ANA Team Leader
if (g_class == "ANA_TL") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M16A2",1],
		["binocular",1]
	];
	_tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",10]
	];
	_tmp_items = 
	[
		["ACE_MapTools",1],
		["ACE_epinephrine",5],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["ACE_SpraypaintBlack",1],
		["ACE_SpraypaintRed",1],
		["ACE_SpraypaintGreen",1],
		["ACE_SpraypaintBlue",1]
	];
};

//ANA Rifleman
 if (g_class == "ANA_RF") then {
    _tmp_weapons =
    [
		["CUP_arifle_M16A2",1]
    ];
	_tmp_magazines =
    [
		["30Rnd_556x45_Stanag",50]
	];
	_tmp_items = 
	[
		["ACE_MapTools",1]
	];
};

//ANA Grenadier
 if (g_class == "ANA_GRN") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M16A2",1],
		["CUP_launch_RPG7V",1]
	];
	_tmp_magazines =
    [
		["30Rnd_556x45_Stanag",50],
		["CUP_PG7V_M",15]
    ];
	_tmp_items =
	[
		["ACE_MapTools",1]
	];
};

//ANA Grenadier Assistant
 if (g_class == "ANA_GRNASS") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M16A2",1]
	];
	_tmp_magazines =
    [
		["30Rnd_556x45_Stanag",50],
		["CUP_PG7V_M",15]
    ];
	_tmp_items =
	[
		["ACE_MapTools",1]
	];
};

//ANA Machine Gunner
 if (g_class == "ANA_MG") then {
    _tmp_weapons =
    [
        ["CUP_lmg_PKM",1]
	];
	_tmp_magazines =
    [
		["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",10]
    ];
	_tmp_items =
	[
		["ACE_MapTools",1]
	];
};

//ANA Machine Gunner Assistant
 if (g_class == "ANA_MGASS") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M16A2",1]
	];
	_tmp_magazines =
    [
		["30Rnd_556x45_Stanag",50],
		["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M",10]
    ];
	_tmp_items =
	[
		["ACE_MapTools",1]
	];
};

//ANA Medic
 if (g_class == "ANA_MED") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M16A2",1]
	];
	_tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
		["ACE_fieldDressing",50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["ACE_personalAidKit", 50],
		["ACE_morphine",50],
		["ACE_epinephrine",50],
		["ACE_atropine", 50],
		["ACE_salineIV",50],
		["ACE_bodyBag",10],
		["ACE_surgicalKit", 50],
		["ACE_tourniquet", 5]
	];
};
*/
//BAF Pilot
 if (typeOf vehicle player == "Modern_British_heliPilot") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L22A2",1],
		["CUP_hgun_Glock17",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
        ["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
		["ACE_DAGR",1],
        ["ACE_MapTools",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["ACRE_PRC343",1],
		["CUP_NVG_PVS14",1],
		["itemCTAB",1],
		["ACE_microDAGR",1],
		["ACRE_PRC117F",1]
	];
};
/*
 //BAF Crew Cheif
 if (g_class == "PLT_CREW") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L22A2",1],
		["CUP_hgun_Glock17",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
        ["CUP_17Rnd_9x19_glock17",15],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
		["ACE_DAGR",1],
        ["ACE_MapTools",1],
		["ACRE_PRC343",1],
		["CUP_NVG_PVS14",1],
		["ACRE_PRC343",1],
		["CUP_NVG_PVS14",1],
		["itemCTAB",1],
		["ACE_microDAGR",1],
		["UK3CB_BAF_SUSAT",1]
		
	];
};
*/
//US Pilot
 if (typeOf vehicle player == "TWC_Modern_US_Army_HeliPilot") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1",1],
		["CUP_hgun_M9",1]
    ];

	_tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",50],
        ["CUP_15Rnd_9x19_M9",15],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
		["ACE_DAGR",1],
        ["ACE_MapTools",1],
		["ACRE_PRC148",1],
		["CUP_NVG_PVS14",1],
		["ACRE_PRC117F",1],
		["itemCTAB",1],
		["CUP_NVG_PVS14",1],
		["UK3CB_BAF_Eotech",1]
		
	];
};


//90's era kit
if((typeOf player) in ["1990_RM_British_SectionCommander_Mix","1990_British_SectionCommander_Desert"])then{

    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D_Lazer",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",20],
		["UK3CB_BAF_556_30Rnd_T",10],
		["CUP_5Rnd_762x51_M24",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC117F",1],
		["ACRE_PRC343",1]
	];
};

 if (typeOf vehicle player == "1990_British_Rifleman_desert") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",20],
		["UK3CB_BAF_556_30Rnd_T",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};

 if((typeOf player) in ["1990_British_Rifleman_desert","1990_RM_British_Rifleman_Mix"])then{

    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1],
        ["CUP_launch_M72A6",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",20],
		["UK3CB_BAF_556_30Rnd_T",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};

 if((typeOf player) in ["1990_British_Rifleman_AT_desert","1990_RM_British_Rifleman_AT_Mix"])then{

    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1],
        ["CUP_launch_M72A6",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",20],
		["UK3CB_BAF_556_30Rnd_T",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};

 
 if((typeOf player) in ["1990_British_Gunner_Desert","1990_RM_British_Marksman_Mix"])then{
    _tmp_weapons =
    [
		["UK3CB_BAF_L86A1_SUSAT3D",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",20],
		["UK3CB_BAF_556_30Rnd_T",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};


 if((typeOf player) in ["1990_British_2IC_Desert","1990_RM_British_2IC_Mix"])then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",30],
		["UK3CB_BAF_556_30Rnd_T",20],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};



 if((typeOf player) in ["1990_British_Medic_desert","1990_RM_British_Medic_Mix"])then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_30Rnd",30],
		["UK3CB_BAF_556_30Rnd_T",20],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1],
		["ACE_fieldDressing", 50],
		["ACE_elasticBandage", 50],
		["ACE_quikclot", 50],
		["ACE_packingBandage", 50],
		["ACE_morphine", 50],
		["ACE_epinephrine", 50],
		["ACE_atropine", 50],
		["ACE_salineIV_500", 50],
		["ACE_salineIV_250", 50],
		["ACE_bodyBag", 10]
	];
};


 if (typeOf vehicle player == "1990_RM_British_Gunner_Mix") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L110A1",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_556_200Rnd_T",30],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};

 if (typeOf vehicle player == "1990_British_Sniper_desert") then {
    _tmp_weapons =
    [
        ["twc_l96_d",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_L42A1_10Rnd",30],
		["UK3CB_BAF_762_L42A1_10Rnd_T",20],
		["CUP_5Rnd_762x51_M24",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACE_RangeCard",1],
		["ACRE_PRC343",1]
	];
};

 if (typeOf vehicle player == "1990_British_Spotter_desert") then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_L42A1_10Rnd",30],
		["UK3CB_BAF_762_L42A1_10Rnd_T",20],
		["UK3CB_BAF_556_30Rnd",30],
		["UK3CB_BAF_556_30Rnd_T",20],
		["CUP_5Rnd_762x51_M24",10],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1],
		["ACE_RangeCard",1],
		["ACRE_PRC117F",1]
	];
};


 if (typeOf vehicle player == "1990_British_MachineGunner_Desert") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_Tripod",1],
        ["UK3CB_BAF_L7A2",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_200Rnd",30],
		["UK3CB_BAF_762_200Rnd_T",20],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};

 if (typeOf vehicle player == "1990_British_mg_assistant_Desert") then {
    _tmp_weapons =
    [
		["UK3CB_BAF_Tripod",1],
        ["UK3CB_BAF_L85A1_SUSAT3D",1]
	];

	_tmp_magazines =
   [            
		["UK3CB_BAF_762_200Rnd",30],
		["UK3CB_BAF_762_200Rnd_T",20],
		["UK3CB_BAF_556_30Rnd",30],
		["UK3CB_BAF_556_30Rnd_T",20],
		["HandGrenade",5]
    ];

	_tmp_items =
	[
		["ACRE_PRC343",1]
	];
};

//FST Commander (90's)
 if((typeOf player) in ["1990_British_FSTCommander", "1990_British_FSTCommander_Desert"])then {
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1],
        ["binocular",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		["CUP_5Rnd_762x51_M24",10],
		["HandGrenade",5]
    ];

    _tmp_items = 
	[
		["ACE_epinephrine",5],
		["UK3CB_BAF_SUSAT_3D",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["ACE_DAGR",1],
		["ACRE_PRC343",1],
		["ACRE_PRC117F",1],
		["ACE_wirecutter", 1],
		["ACE_IR_Strobe_Item",1]
    ];
};

//FST Forward Observer (90's)
 if((typeOf player) in ["1990_British_FSTForwardObserver", "1990_British_FSTForwardObserver_Desert"]) then{
    _tmp_weapons =
    [
        ["UK3CB_BAF_L85A1_SUSAT3D",1],
        ["CUP_SOFLAM",1]
	];

    _tmp_magazines =
    [           
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		["HandGrenade",5],
		["Laserbatteries",1],
		["ACE_HandFlare_White",5],
		["B_IR_Grenade",2]
    ];

	_tmp_items =
	[
		["UK3CB_BAF_SUSAT_3D",1],
		["ACRE_PRC343",1],
		["ACRE_PRC152",1],
		["ACE_SpottingScope",1]
	];
};

//FST Assistant (90's)
 if((typeOf player) in ["1990_British_FSTAssistant", "1990_British_FSTAssistant_Desert"]) then{
    _tmp_weapons =
    [
		["UK3CB_BAF_L85A1_SUSAT3D",1],
		["CUP_launch_MAAWS",1],
		["CUP_launch_M72A6",1]
    ];

    _tmp_magazines =
    [	
		["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		["CUP_MAAWS_HEDP_M",5],
		["CUP_MAAWS_HEAT_M",5],
		["HandGrenade",5]
	];

	_tmp_items = 
	[
		["UK3CB_BAF_SUSAT_3D",1],
		["CUP_optic_MAAWS_Scope",1],
		["ACRE_PRC343",1]
	];
};


/*
 //US Crew Cheif
 if (g_class == "USPLT_CREW") then {
    _tmp_weapons =
    [
        ["CUP_arifle_M4A1",1],
		["CUP_hgun_M9",1]
    ];

	_tmp_magazines =
    [
        ["30Rnd_556x45_Stanag",50],
		["30Rnd_556x45_Stanag_Tracer_Red",50],
        ["CUP_15Rnd_9x19_M9",15],
		["HandGrenade",5]
    ];
	_tmp_items =
	[
		["ACE_DAGR",1],
        ["ACE_MapTools",1],
		["ACRE_PRC148",1],
		["CUP_NVG_PVS14",1],
		["ACRE_PRC117F",1],
		["itemCTAB",1],
		["CUP_NVG_PVS14",1],
		["UK3CB_BAF_Eotech",1]
		
	];
};

//BAF Armour Commander
 if (g_class == "ARMR_CO") then {
    _tmp_weapons =
	[
        ["UK3CB_BAF_L22A2",1],
        ["ACE_Vector",1],
		["CUP_hgun_Glock17",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
        ["CUP_17Rnd_9x19_glock17",15]
    ];
	_tmp_items =
	[
        ["ACE_MapTools",1],
        ["ACE_fieldDressing",20],
        ["ACE_morphine",10],
		["CUP_NVG_PVS14",1],
		["ACE_IR_Strobe_Item",1],
		["ACRE_PRC343",1],
		["SatchelCharge_Remote_Mag",1],
		["DemoCharge_Remote_Mag",1],
		["ACE_M26_Clacker",1],
		["UK3CB_BAF_SpecterLDS_Dot_3D",1],
		["UK3CB_BAF_LLM_IR",1],
		["itemCTAB",1],
		["CUP_NVG_PVS14",1]
	];
};

//BAF Armour Crew
 if (g_class == "ARMR_CREW") then {
    _tmp_weapons =
	[
        ["UK3CB_BAF_L22A2",1],
        ["ACE_Vector",1],
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
		["CUP_hgun_Glock17",1]
    ];

	_tmp_magazines =
    [
        ["UK3CB_BAF_556_30Rnd",50],
		["UK3CB_BAF_556_30Rnd_T",50],
        ["CUP_17Rnd_9x19_glock17",15]
    ];
	_tmp_items =
	[
		["ACE_MapTools",1],
        ["ACE_fieldDressing",20],
        ["ACE_morphine",10],
		["ACRE_PRC148",1],
		["CUP_NVG_PVS14",1],
		["ACE_IR_Strobe_Item",1],
		["UK3CB_BAF_SpecterLDS_Dot_3D",1],
		["UK3CB_BAF_LLM_IR",1],
		["ACRE_PRC343",1],
		["CUP_NVG_PVS14",1]
	];
};
*/

{
        _weapons set [count _weapons, _x];
} forEach _tmp_weapons;

{
        _magazines set [count _magazines, _x];
} forEach _tmp_magazines;

{
        _items set [count _items, _x];
} forEach _tmp_items;

{
        _backpacks set [count _backpacks, _x];
} forEach _tmp_backpacks;

// empty it.
clearWeaponCargo crateBox;
clearMagazineCargo crateBox;
clearItemCargo crateBox;
clearbackPackCargo crateBox;

if((typeOf player) in ["Modern_British_Sniper_coin", "Modern_British_Spotter_coin","Modern_Artillery_Commander","Modern_Artillery_Gunner"]) then {

if (( count(allPlayers - entities "HeadlessClient_F"))>5) then {// add in all weapons.
{crateBox addWeaponCargo [(_x select 0),(_x select 1)]} foreach _weapons;

// add in all magazines.
{crateBox addMagazineCargo [(_x select 0),(_x select 1)]} foreach _magazines;

{crateBox addItemCargo [(_x select 0),(_x select 1)]} foreach _items;
}
else
{
[5] execVM "Siege_Core\client\sys_restrict\restrictedkit.sqf";};

} else {

// add in all weapons.
{crateBox addWeaponCargo [(_x select 0),(_x select 1)]} foreach _weapons;

// add in all magazines.
{crateBox addMagazineCargo [(_x select 0),(_x select 1)]} foreach _magazines;

{crateBox addItemCargo [(_x select 0),(_x select 1)]} foreach _items;

};