/*
* Author: [TWC] Bosenator
* Server controller for handling point increases/decreases, and their eventual completion screen (or failure)
*
* Arguments:
* 0: "TWC_Insurgency_adjustPoints" <String>
* 1: Integer
*
* Return Value:
* <NONE>
*
* Example:
* ["TWC_Insurgency_adjustPoints", -5] call CBA_fnc_serverEvent;
*
* Public: No
*/

if(isNil "pointLimit") then{
pointLimit = 70;
publicVariable "pointLimit"; // init once
};
[] spawn {
	sleep 600;
	if ((count allplayers) < 5) then {
	
		_mult = 0.6 + ((5 - (count allplayers)) / 2);
		pointLimit = (((floor ((pointLimit / _mult) / 10))* 10) max 20) min 150;
		publicVariable "pointLimit";
	};
};

	if(isNil "totalPoints") then{
totalPoints = 0;
publicVariable "totalPoints"; // init once
};

highestPlayerCountReached = 0; // the highest count reached of total connected players

["TWC_Insurgency_adjustPoints", {
	totalPoints = totalPoints + _this;
	
	if (totalPoints >= pointLimit) then {
		execVM "Siege_Core\server\sys_controllers\missionsuccess.sqf";
	};
	
	if(totalPoints < 0)then{totalPoints = 0};
	
	publicVariable "totalPoints";
}] call CBA_fnc_addEventHandler;

["playerConnectedEHandler", "onPlayerConnected", {
	_playerCount = count (allPlayers - entities "HeadlessClient_F");
	
	if (_playerCount > highestPlayerCountReached) then {
		highestPlayerCountReached = _playerCount;
		
		if (highestPlayerCountReached > 8) then {
			pointLimit = (pointLimit + 50) min 150;
		};
	};
	publicVariable "pointLimit";
}] call BIS_fnc_addStackedEventHandler;
