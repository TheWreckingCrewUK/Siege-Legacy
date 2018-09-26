/*
*    TWC public sevrer
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/

if ((twc_ammotime-time) > 0) then {
	hint format ["The spawner is on cooldown currently. %2 seconds remaining.", twc_ammotime_amount, ceil (twc_ammotime-time)];
	waituntil {(twc_ammotime-time) < 0};
	hint "More Ammunition Is Now Available From The Spawner";
	
	} else {

twc_ammotime=time+twc_ammotime_amount;
publicVariable "twc_ammotime";

_boxClass = "ACE_Box_Ammo";

_box = _boxClass createVehicle (getPos AmmoBoxSpawner);

//simple dynamic numbers system. Assign cost of each tier and then assign a tier to an item if you want that item's amount to scale with the player count.
_players = ( count(allPlayers - entities "HeadlessClient_F"));
_low = (_players * 0.3);
_mid = _players;
_high = (_players * 2);

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

//Weapons
_box AddWeaponCargoGlobal ["UK3CB_BAF_AT4_CS_AP_Launcher",2];
_box AddWeaponCargoGlobal ["twc_L5A4_white",1 + _low];
_box AddWeaponCargoGlobal ["twc_L5A4_red",1 + _low];
_box AddWeaponCargoGlobal ["twc_L5A4_green",1 + _low];



if (twc_heavymode == 1) then {

_box AddWeaponCargoGlobal ["UK3CB_BAF_AT4_CS_AP_Launcher",1 + _low];

};


//supplies

_box AddMagazineCargoGlobal ["twc_l5a4_w",4 + _low];
_box AddMagazineCargoGlobal ["twc_l5a4_r",4 + _low];
_box AddMagazineCargoGlobal ["twc_l5a4_g",4 + _low];

_box AddMagazineCargoGlobal ["rhsusf_100Rnd_762x51_m62_tracer",1 + _low];
_box AddMagazineCargoGlobal ["rhsusf_100Rnd_762x51",4 + _low];

_box AddMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855_Stanag",20];
_box AddMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855_Stanag_Tracer_Red",10];

_box AddMagazineCargoGlobal ["UGL_FlareWhite_F",10];
_box AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",10];
_box AddMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",10];

_box AddMagazineCargoGlobal ["rhs_200rnd_556x45_M_SAW",3 + _low];
_box AddMagazineCargoGlobal ["rhsusf_200Rnd_556x45_soft_pouch",5 + _low];

_box AddMagazineCargoGlobal ["rhsusf_mag_7x45acp_MHP",10 + _low];
_box AddMagazineCargoGlobal ["rhsusf_8Rnd_00Buck",8];
_box AddMagazineCargoGlobal ["rhsusf_8Rnd_Slug",8];

_box AddMagazineCargoGlobal ["rhsusf_10Rnd_762x51_m118_special_Mag",5 + _low];

_box AddMagazineCargoGlobal ["rhsusf_mag_6Rnd_M441_HE",2];

_box addItemCargoGlobal ["ACE_fieldDressing",5 + _mid];
_box addItemCargoGlobal ["ACE_elasticBandage",5 + _mid];
_box addItemCargoGlobal ["ACE_quikclot",5 + _mid];
_box addItemCargoGlobal ["ACE_packingBandage",5 + _mid];
_box addItemCargoGlobal ["ACE_personalAidKit",1];
_box addItemCargoGlobal ["ACE_salineIV_500",4 + _low];
_box addItemCargoGlobal ["ACE_atropine",5];
_box addItemCargoGlobal ["ACE_epinephrine",5 + _low];
_box addItemCargoGlobal ["ACE_morphine",5 + _low];

_box addItemCargoGlobal ["HandGrenade",3 - _low];
_box addItemCargoGlobal ["SmokeShell",2];
_box addItemCargoGlobal ["SmokeShellRed",2];

_box addItemCargoGlobal ["ACRE_PRC343",2 + _mid];
_box addItemCargoGlobal ["ACE_EarPlugs",2 + _mid];
_box addItemCargoGlobal ["rhsusf_ANPVS_14",2 + _mid];

[player, _box] call ace_cargo_fnc_startLoadIn;
};