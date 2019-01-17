/*
* Author(s): [TWC] Hobbs
* Mortar Spawner

* Arguments:
* <Array> Position
*
* Return Value:
* <NONE>
*
* Example:
* [getMarkerPos "spawn",[100,200],p1] spawn twc_fnc_spawnAIUnits;
*
* Public: No
*/

//Recieved Parameters
params ["_pos"];

if (mortarcount < 1) exitwith {};

//commented out because ace's ammo handling system is breaking this and also they keep falling over for no reason
//systemchat "spawning mortar";

mortarcount = mortarcount - 1;
publicvariable "mortarcount";

//Spawning mortar
_spawnPos = [_pos,[100,100], random 360, 0, [0,100]] call SHK_pos;
//for "_i" from 1 to _total do{
_mortartruck = "RHS_Ural_Open_MSV_01" createvehicle _spawnPos;

_mortar = "Rhs_2b14_82mm_ins" createvehicle _spawnPos;
_mortar attachto [_mortartruck, [-0.053,-2.7,0.6]];

_box = "ACE_Box_82mm_Mo_HE" createvehicle _spawnPos;
_box attachto [_mortartruck, [0.45,-0.1,0]];


_group = createGroup East;
_unit = _group createUnit [(townSpawn select (floor random (count townspawn))), _spawnPos,[], 0.3, "NONE"];
_unit moveIngunner _mortar;

_unit disableai "AUTOTARGET";
_unit disableai "TARGET";

twc_currentenemy = twc_currentenemy + 1;
publicVariable "twc_currentenemy";

_unit addEventHandler ["Killed",{
	[(_this select 0)] call twc_fnc_deleteDead;
	
	twc_currentenemy= twc_currentenemy - 1;
	publicVariable "twc_currentenemy";
	["TWC_Insurgency_adjustPoints", 1] call CBA_fnc_serverEvent;
	
}];

	_trg = createTrigger ["EmptyDetector", getmarkerpos "base"];
	_trg setTriggerArea [150, 150, 0, false];
	_trg setTriggerActivation ["East", "PRESENT", true];
	_trg setTriggerTimeout[1, 1, 1, true];
	_trg setTriggerStatements ["this","twc_mortar_baseclear = 0","twc_mortar_baseclear = 1"];

sleep 20;

[_mortar] spawn twc_mortarattack;
	/*
	_mortar addEventHandler ["Fired", {
		[_this select 6, _this select 7] call twc_fnc_mortarwalk; }];
*/
sleep 20;

if ((random 1) < 0.3) then {
twc_mortar_targetlist pushback (twc_basepos);
publicVariable "twc_mortar_targetlist";
};

for "_i" from 1 to 10 do {
sleep (100 + random 2000);
for "_i" from 1 to (random 3) do {
twc_mortar_targetlist pushback (getpos (allplayers call bis_fnc_selectrandom));
publicVariable "twc_mortar_targetlist";
};
};

