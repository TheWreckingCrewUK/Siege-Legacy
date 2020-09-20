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



	_boxaction = ["deleteCreate","Destroy Crate","",{deleteVehicle this;},{true}] call ace_interact_menu_fnc_createAction;
	[_box,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;


//supplies
//_box AddMagazineCargoGlobal ["ACE_CUP_30Rnd_105mmHE_M119_M",5];
//_box AddMagazineCargoGlobal ["ACE_CUP_30Rnd_105mmSMOKE_M119_M",2];
_box AddMagazineCargoGlobal ["ACE_CUP_30Rnd_105mmILLUM_M119_M",5];

[player, _box] call ace_cargo_fnc_startLoadIn;
};