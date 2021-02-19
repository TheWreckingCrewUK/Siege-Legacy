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
_boxClass = "ACE_Box_Ammo";


_box = _boxClass createVehicle (getPos AmmoBoxSpawner);

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

//Weapons

//supplies



_box AddMagazineCargoGlobal ["CUP_30Rnd_762x39_AK47_M",30];
_box AddMagazineCargoGlobal ["CUP_30Rnd_762x39_AK47_M",10];


_box AddMagazineCargoGlobal ["CUP_PG7VL_M",3];
_box AddMagazineCargoGlobal ["CUP_TBG7V_M",2];


_box AddMagazineCargoGlobal ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M",5];
_box AddMagazineCargoGlobal ["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Red_M",2];

_box AddMagazineCargoGlobal ["CUP_1Rnd_HE_GP25_M",15];
_box AddMagazineCargoGlobal ["CUP_1Rnd_SMOKE_GP25_M",5];

_box AddMagazineCargoGlobal ["ACE_SpareBarrel",1];

_box addItemCargoGlobal ["ACE_fieldDressing",20];
_box addItemCargoGlobal ["ACE_elasticBandage",20];
_box addItemCargoGlobal ["ACE_quikclot",20];
_box addItemCargoGlobal ["ACE_packingBandage",20];
_box addItemCargoGlobal ["ACE_personalAidKit",5];
_box addItemCargoGlobal ["ACE_salineIV_500",2];
_box addItemCargoGlobal ["ACE_atropine",5];
_box addItemCargoGlobal ["ACE_epinephrine",5];
_box addItemCargoGlobal ["ACE_morphine",5];
_box addItemCargoGlobal ["HandGrenade",5];
_box addItemCargoGlobal ["SmokeShell",5];
_box addItemCargoGlobal ["SmokeShellRed",2];

};