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
_box AddWeaponCargoGlobal ["launch_NLAW_F",2];



if (["USMC", typeof player] call BIS_fnc_inString) then {

_box AddWeaponCargoGlobal ["UK3CB_BAF_Javelin_Slung_Tube",1];
};





[player, _box] call ace_cargo_fnc_startLoadIn;
};
