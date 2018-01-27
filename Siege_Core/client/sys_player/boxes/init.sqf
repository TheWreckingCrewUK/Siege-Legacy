/*
* Written by [TWC] jayman
*
* Creates the ammo box with an an event handler. This should decrease lag
* while always keeping the box full. Basically it reloads as soon as you close it
*/
twc_ammotime=0;
publicVariable "twc_ammotime";

twc_ammotime_amount=310-(((count(allPlayers - entities "HeadlessClient_F"))*10)min 180);
publicVariable "twc_ammotime_amount";

_marker = "crate";  // marker used to spawn.
_boxType = "CUP_BAF_VehicleBox";  // the type of ammobox used.

// create and fill the box.
crateBox = _boxType createVehicleLocal (getMarkerPos _marker);
crateBox setPosATL (getMarkerPos _marker);
crateBox allowDamage false;

[crateBox] execVM "siege_core\client\sys_player\boxes\main_ammo.sqf";

player addEventHandler ["InventoryClosed", {
	if((_this select 1) == crateBox)then{
		[_this select 1]execVM "siege_core\client\sys_player\boxes\main_ammo.sqf";
	};
}];


	_infaction1 = ["clearbox","Clear Boxes","",{execvm "siege_core\client\sys_player\boxes\clearboxes.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_infaction1,true] call ace_interact_menu_fnc_addActionToClass;
	

	
	
if((typeOf player) in ["Modern_Artillery_Commander","Modern_Artillery_Gunner"])then{
	_infaction2 = ["SpawnAlphaCreate","Spawn 105mm Ammo","",{execvm "siege_core\client\sys_player\boxes\105he.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_infaction2,true] call ace_interact_menu_fnc_addActionToClass;
};

if((typeOf player) in ["Modern_British_HeliPilot","Modern_USMC_HeliPilot"])then{

	_action = ["SpawnAlphaCreate","Spawn Large Alpha Crate","",{"twc_forwardBase_BritishAmmoBox" createVehicle (getPos AmmoBoxSpawner)},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_action,true] call ace_interact_menu_fnc_addActionToClass;
	
	_action1 = ["SpawnCharlieCreate","Spawn Large Charlie Crate","",{"twc_forwardBase_CharlieAmmoBox" createVehicle (getPos AmmoBoxSpawner)},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_action1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hcharlieaction2 = ["SpawnsmallcharlieCreate","Spawn Small Charlie Crate","",{execvm "siege_core\client\sys_player\boxes\smallcrateUSMC.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hcharlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_halphaaction3 = ["SpawnsmallAlphaCreate","Spawn Small Alpha Crate","",{execvm "siege_core\client\sys_player\boxes\smallcrateuk.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_halphaaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction4 = ["SpawnsmallsniperCreate","Spawn Small Sniper Crate","",{execvm "siege_core\client\sys_player\boxes\smallcratesniper.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_haction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_haction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "siege_core\client\sys_player\boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_haction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_hfstaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "siege_core\client\sys_player\boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hfstaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_hfstaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "siege_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hfstaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_hfstaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "siege_core\client\sys_player\boxes\40ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_hfstaction6,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	
};

if((typeOf player) in ["twc_ana_commander","twc_ana_subcommander"])then{

	_anaaction = ["SpawnsmallanaCreate","Spawn Small ANA Crate","",{execvm "siege_core\client\sys_player\boxes\smallcrateANA.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_anaaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_anaaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "siege_core\client\sys_player\boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_anaaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_anaaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "siege_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_anaaction4,true] call ace_interact_menu_fnc_addActionToClass;

	_anaaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "siege_core\client\sys_player\boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_anaaction5,true] call ace_interact_menu_fnc_addActionToClass;	
	
	_anaaction6 = ["SpawnmineCreate","Spawn Claymores","",{execvm "siege_core\client\sys_player\boxes\smallcratemines.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_anaaction6,true] call ace_interact_menu_fnc_addActionToClass;	
};



if((typeOf player) in ["Modern_British_Squadleader","Modern_British_2IC_COIN", "Modern_British_Spotter_coin", "Modern_British_Sniper_coin"])then{

	_alphaaction = ["SpawnsmallAlphaCreate","Spawn Small Alpha Crate","",{execvm "siege_core\client\sys_player\boxes\smallcrateuk.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_alphaaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "siege_core\client\sys_player\boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_alphaaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "siege_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction4,true] call ace_interact_menu_fnc_addActionToClass;

	_alphaaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "siege_core\client\sys_player\boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction5,true] call ace_interact_menu_fnc_addActionToClass;	
	
	_alphaaction6 = ["SpawnmineCreate","Spawn Claymores","",{execvm "siege_core\client\sys_player\boxes\smallcratemines.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_alphaaction6,true] call ace_interact_menu_fnc_addActionToClass;	
};


if((typeOf player) in ["twc_men_1990_us_w_SquadLeader","twc_men_1990_us_w_teamleader"])then{

	_usaction = ["SpawnsmallAlphaCreate","Spawn Small US Crate","",{execvm "siege_core\client\sys_player\boxes\smallCrateUS90.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_usaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_usaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "siege_core\client\sys_player\boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_usaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_usaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "siege_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_usaction4,true] call ace_interact_menu_fnc_addActionToClass;

	_usaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "siege_core\client\sys_player\boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_usaction5,true] call ace_interact_menu_fnc_addActionToClass;	
	
	_usaction6 = ["SpawnmineCreate","Spawn Claymores","",{execvm "siege_core\client\sys_player\boxes\smallcratemines.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_usaction6,true] call ace_interact_menu_fnc_addActionToClass;	
};

if((typeOf player) in ["Modern_USMC_Squadleader","Modern_USMC_Teamleader"])then{

	_charlieaction = ["SpawnsmallcharlieCreate","Spawn Small Charlie Crate","",{execvm "siege_core\client\sys_player\boxes\smallcrateUSMC.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction,true] call ace_interact_menu_fnc_addActionToClass;

	_charlieaction2 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "siege_core\client\sys_player\boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_charlieaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "siege_core\client\sys_player\boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_charlieaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "siege_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_charlieaction5 = ["SpawnmineCreate","Spawn Claymores","",{execvm "siege_core\client\sys_player\boxes\smallcratemines.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_charlieaction5,true] call ace_interact_menu_fnc_addActionToClass;	

		
};

if((typeOf player) in ["Modern_Artillery_Gunner","Modern_Artillery_Commander"])then{

	_artaction = ["SpawnsmallcharlieCreate","Spawn L16 Smoke Rounds","",{execvm "siege_core\client\sys_player\boxes\staticL16_Smoke.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_artaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_artaction1 = ["Spawnheartscrateus","Spawn L16 Ilumination Rounds","",{execvm "siege_core\client\sys_player\boxes\staticL16_Illum.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_artaction1,true] call ace_interact_menu_fnc_addActionToClass;

	_artaction2 = ["SpawnmedCreate","Spawn L16 HE Rounds","",{execvm "siege_core\client\sys_player\boxes\staticL16_HE.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_artaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_artaction3 = ["SpawnrepCreate","Spawn Vehicle Repair Kit","",{execvm "siege_core\client\sys_player\boxes\RepairKit.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_artaction3,true] call ace_interact_menu_fnc_addActionToClass;
	

};

/*
if((typeOf player) in ["Modern_British_Sniper_coin", "Modern_British_Spotter_coin"])then{

	_snaction1 = ["Spawnsnipbox","Spawn Sniper Ammo Box","",{execvm "siege_core\client\sys_player\boxes\smallCratesniper.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
};
?
*/

if((typeOf player) in ["Modern_British_Medic", "1990_British_Medic", "1990_British_Medic_Desert", "1990_RM_British_Medic_Mix", "Modern_USMC_Medic", "twc_ana_medic", ])then{

	_medaction = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "siege_core\client\sys_player\boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_medaction,true] call ace_interact_menu_fnc_addActionToClass;
		
};


if((typeOf player) in ["Modern_British_FSTAssistant","Modern_British_Quartermaster","Modern_British_FSTForwardObserver","Modern_British_FSTCommander"])then{

	_fstaction1 = ["spawnl111","Spawn L111A1 HMG","",{execvm "siege_core\client\sys_player\boxes\staticL111A1.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_fstaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction2 = ["spawnl134","Spawn L134 GMG","",{execvm "siege_core\client\sys_player\boxes\staticL134A1.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_fstaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction21 = ["spawnl7","Spawn L7 GPMG","",{execvm "siege_core\client\sys_player\boxes\staticL7.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_fstaction21,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "siege_core\client\sys_player\boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_fstaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_fstaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "siege_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_fstaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction5 = ["spawnm6","Spawn M6","",{execvm "siege_core\client\sys_player\boxes\smallMortar.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "siege_core\client\sys_player\boxes\40ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_fstaction6,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction7 = ["SpawnsmallAlphaCreate","Spawn Small UK Crate","",{execvm "siege_core\client\sys_player\boxes\smallcrateuk.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;
};

if((typeOf player) in ["Modern_British_Quartermaster","1990_British_quartermaster_Desert"])then{
execVM "siege_core\client\zeus\camera.sqf";

	_action2 = ["Zeus","Spectator On","",{execVM "siege_core\client\zeus\spectator_on.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action2] call ace_interact_menu_fnc_addActionToObject;
	_action3 = ["Zeus","Spectator Off","",{execVM "siege_core\client\zeus\spectator_off.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action3] call ace_interact_menu_fnc_addActionToObject;
	_action4 = ["Zeus","Basemode On","",{execVM "siege_core\client\zeus\basemode_on.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action4] call ace_interact_menu_fnc_addActionToObject;
	_action5 = ["Zeus","Basemode Off","",{execVM "siege_core\client\zeus\basemode_off.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action5] call ace_interact_menu_fnc_addActionToObject;
	
	_action6 = ["Zeus","Enemy Siren","",{execVM "siege_core\server\sys_basedefence\INF_Alarm.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action6] call ace_interact_menu_fnc_addActionToObject;
	
	
	_action7 = ["Zeus","IDF Siren","",{{
	[_x, "TWC_sound_idfsiren"] call CBA_fnc_globalSay3d;
} forEach sirenlist;
},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action7] call ace_interact_menu_fnc_addActionToObject;
	
	_action8 = ["Zeus","Clear Siren","",{execVM "siege_core\server\sys_basedefence\INF_Alarmclear.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions", "base_Interact"], _action8] call ace_interact_menu_fnc_addActionToObject;

};


if((typeOf player) in ["1990_British_quartermaster_Desert"])then{

	_qm90action1 = ["spawnl111","Spawn L111A1 HMG","",{execvm "siege_core\client\sys_player\boxes\staticL111A1.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_qm90action1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_qm90action3 = ["spawn50","Spawn .50 Ammo","",{execvm "siege_core\client\sys_player\boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_qm90action3,true] call ace_interact_menu_fnc_addActionToClass;

	_qm90action4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "siege_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_qm90action4,true] call ace_interact_menu_fnc_addActionToClass;

};

if((typeOf player) in ["1990_British_mg_assistant_Desert"])then{

	_mgaction = ["Spawn762","Spawn 7.62 Ammo","",{execvm "siege_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_mgaction,true] call ace_interact_menu_fnc_addActionToClass;
	
};

if((typeOf player) in ["1990_British_2IC_Desert","1990_British_SectionCommander_Desert"])then{

	
	_90alphaaction = ["Spawnsmall90AlphaCreate","Spawn Ammo Crate","",{execvm "siege_core\client\sys_player\boxes\smallcrateuk90.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90alphaaction,true] call ace_interact_menu_fnc_addActionToClass;
	

	
	_90alphaaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "siege_core\client\sys_player\boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90alphaaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_90alphaaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "siege_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90alphaaction4,true] call ace_interact_menu_fnc_addActionToClass;

	
	_90charlieaction2 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "siege_core\client\sys_player\boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90charlieaction2,true] call ace_interact_menu_fnc_addActionToClass;
		
};

if((typeOf player) in ["1990_RM_British_2IC_Mix","1990_RM_British_SectionCommander_Mix"])then{

	
	_90rmalphaaction = ["Spawnsmall90AlphaCreate","Spawn Ammo Crate","",{execvm "siege_core\client\sys_player\boxes\smallcrateuk90RM.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmalphaaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_90rmalphaaction1 = ["Spawnheartscrate","Spawn Hearts and Minds Kit","",{execvm "siege_core\client\sys_player\boxes\heartsmindsRM.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmalphaaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_90rmalphaaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "siege_core\client\sys_player\boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmalphaaction3,true] call ace_interact_menu_fnc_addActionToClass;

	_90rmalphaaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "siege_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmalphaaction4,true] call ace_interact_menu_fnc_addActionToClass;

	_90rmaction2 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "siege_core\client\sys_player\boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_90rmaction2,true] call ace_interact_menu_fnc_addActionToClass;
		
};
