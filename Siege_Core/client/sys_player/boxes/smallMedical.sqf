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
publicVariable "twc_ammotime";

_boxClass = "ACE_medicalSupplyCrate_advanced";

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

//Medical supplies
_box addItemCargoGlobal ["ACE_fieldDressing",20 + _high];
_box addItemCargoGlobal ["ACE_elasticBandage",30 + _mid];
_box addItemCargoGlobal ["ACE_quikclot",20 + _mid];
_box addItemCargoGlobal ["ACE_packingBandage",30 + _mid];
_box addItemCargoGlobal ["ACE_personalAidKit",1];
_box addItemCargoGlobal ["ACE_salineIV_500",10 + _low];
_box addItemCargoGlobal ["ACE_salineIV_250",10 + _low];
_box addItemCargoGlobal ["ACE_atropine",15 + _low];
_box addItemCargoGlobal ["ACE_epinephrine",15 + _low];
_box addItemCargoGlobal ["ACE_morphine",15 + _low];

//Respawn/Despawn Script

_trg = createTrigger ["EmptyDetector", getPos AmmoBoxSpawner];
_trg setTriggerArea [5,5,0,false];
_trg setTriggerActivation ["WEST", "NOT PRESENT", false];
_trg setTriggerTimeout [1800,1800,1800,true];
_trg setTriggerStatements ["this", "_box = (getPos thisTrigger) nearestObject 'ACE_medicalSupplyCrate_advanced'; deleteVehicle _box;",""];
_trg attachTo [_box];

[player, _box] call ace_cargo_fnc_startLoadIn;
};