/*
*    TWC public sevrer
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/
_boxClass = "ACE_Box_Ammo";

_box = _boxClass createVehicle (getPos ammoCrateSpawnPad);

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

//Weapons
_box AddWeaponCargoGlobal ["CUP_glaunch_M32",2];


//supplies
_box AddMagazineCargoGlobal ["CUP_6Rnd_HE_M203",10];
_box AddMagazineCargoGlobal ["CUP_6Rnd_SmokeGreen_M203",10];

_box AddMagazineCargoGlobal ["CUP_6Rnd_Smoke_M203",10];
//_box AddMagazineCargoGlobal ["CUP_6Rnd_SmokeRed_M203",10];

[player, _box] call ace_cargo_fnc_startLoadIn;