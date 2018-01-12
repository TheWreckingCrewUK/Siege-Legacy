/*
*    TWC public sevrer
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/

if ((twc_ammotime-time+600) > 0) then {
	hint format ["The spawner is on cooldown currently and this is a special crate. %2 seconds remaining until this crate can be spawned.", twc_ammotime_amount, ceil (twc_ammotime-time+600)];
	waituntil {(twc_ammotime-time+600) < 0};
	hint "Special Ammunition Is Now Available From The Spawner";
	
	} else {

twc_ammotime=time+twc_ammotime_amount;
publicVariable "twc_ammotime";

_players = ( count(allPlayers - entities "HeadlessClient_F"));
_low = (_players * 0.3);
_mid = _players;
_high = (_players * 2);

_boxClass = "Box_NATO_AmmoOrd_F";

_box = _boxClass createVehicle (getPos AmmoBoxSpawner);

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

//Weapons

//supplies

_box addItemCargoGlobal ["ClaymoreDirectionalMine_Remote_Mag",5 - _low max 1];
_box addItemCargoGlobal ["ACE_Clacker",3 - _low max 1];

[player, _box] call ace_cargo_fnc_startLoadIn;
};