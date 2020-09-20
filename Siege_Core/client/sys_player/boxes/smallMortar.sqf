/*
*    TWC public server
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


_boxClass = "UK3CB_BAF_Box_M6";

_box = _boxClass createVehicle (getPos AmmoBoxSpawner);

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

//1 Mortar and Tripod
_box AddWeaponCargoGlobal ["UK3CB_BAF_M6",1];

//Ammo

_box addItemCargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Shells",20];
_box addItemCargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Flare_White",10];
_box addItemCargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White",10];

//Respawn/Despawn Script

_trg = createTrigger ["EmptyDetector", getPos AmmoBoxSpawner];
_trg setTriggerArea [5,5,0,false];
_trg setTriggerActivation ["WEST", "NOT PRESENT", false];
_trg setTriggerTimeout [1800,1800,1800,true];
_trg setTriggerStatements ["this", "_box = (getPos thisTrigger) nearestObject 'ACE_BOX_82MM_Mo_HE'; deleteVehicle _box;",""];
_trg attachTo [_box];


[player, _box] call ace_cargo_fnc_startLoadIn;

};