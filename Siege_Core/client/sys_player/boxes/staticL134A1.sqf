/*
*    TWC public server
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/
if ((twc_ammotime-time+300) > 0) then {
	hint format ["The spawner is on cooldown currently and this is a special crate. %2 seconds remaining until this crate can be spawned.", twc_ammotime_amount, ceil (twc_ammotime-time+300)];
	waituntil {(twc_ammotime-time+300) < 0};
	hint "Special Ammunition Is Now Available From The Spawner";
	
	} else {




_boxClass = "UK3CB_BAF_Box_L134A1";

_box = _boxClass createVehicle (getPos AmmoBoxSpawner);

twc_ammotime=time+twc_ammotime_amount;
publicVariable "twc_ammotime";

//clearWeaponCargoGlobal _box;
//clearBackpackCargoGlobal _box;
//clearMagazineCargoGlobal _box;
//clearitemCargoGlobal _box;

//1 Mortar and Tripod
//_box AddWeaponCargoGlobal ["UK3CB_BAF_M6",1];

//Ammo

//_box addItemCargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Shells",50];
//_box addItemCargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Flare_White",10];
//_box addItemCargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White",10];

//Respawn/Despawn Script

_trg = createTrigger ["EmptyDetector", getPos AmmoBoxSpawner];
_trg setTriggerArea [5,5,0,false];
_trg setTriggerActivation ["WEST", "NOT PRESENT", false];
_trg setTriggerTimeout [1800,1800,1800,true];
_trg setTriggerStatements ["this", "_box = (getPos thisTrigger) nearestObject 'UK3CB_BAF_Box_L134A1'; deleteVehicle _box;",""];
_trg attachTo [_box];


[player, _box] call ace_cargo_fnc_startLoadIn;
};