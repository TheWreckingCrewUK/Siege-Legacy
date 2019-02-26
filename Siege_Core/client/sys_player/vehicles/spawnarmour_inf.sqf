params["_heli"];

if(isNil "_heli")exitWith{hint "No heli was given to the spawn system, please notify management"};


if ((twc_ammotime-time) > 0) then {
	hint format ["The spawner is on cooldown currently. %2 seconds remaining.", twc_ammotime_amount, ceil (twc_ammotime-time)];
	waituntil {(twc_ammotime-time) < 0};
	hint "More Ammunition Is Now Available From The Spawner";
	} else {

twc_ammotime=time+twc_ammotime_amount;
publicVariable "twc_ammotime";
_boxClass = "ACE_Box_Ammo";

_diffincamount = 0.2;

//pre spawn file to change classname to woodland/desert versions if necessary
#include "armourspecifics_prespawn.sqf";

_spawnpos = getpos ammoboxspawner;

if (!(getMarkerColor "twc_armourspawnpos" == "")) then {_spawnpos = getmarkerpos "twc_armourspawnpos"};

_veh = _heli createvehicle _spawnpos;

twc_difficulty = twc_difficulty + _diffincamount;
publicVariable "twc_difficulty";

_veh setvariable ["twc_diffincamount", _diffincamount, true];
	
	if (typeof _veh == "rhsusf_M1117_D") then {
[
	_veh,
	["desert",1], 
	["DUKE_Hide",1]
] call BIS_fnc_initVehicle;
};

clearWeaponCargoGlobal _veh;
/*clearBackpackCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;
*/
_boxaction = ["deleteCreate","Return Vehicle","",{
_amount = this getvariable ["twc_diffincamount", 1];
twc_difficulty = twc_difficulty - _amount;
publicVariable "twc_difficulty";
deleteVehicle this;
},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;


_veh addEventHandler ["Killed",{
params ["_unit", "_killer", "_instigator", "_useEffects"];
_amount = _unit getvariable ["twc_diffincamount", 1];
twc_difficulty = twc_difficulty - _amount;
publicVariable "twc_difficulty";
}];
	

#include "armourspecifics.sqf";
};
