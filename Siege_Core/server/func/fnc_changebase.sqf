/*If !isnil base then
Create a dummy marker and delete the proper one. 

Change the current trigger’s activation to blufor

waituntil count players == 0 then if there’s still no patrolbase then if there’s no base then end the mission
} else{
Create the proper marker and delete the dummy one
Change the current trigger’s activation to opfor
*/
params ["_thistrigger"];

if (!isServer) exitWith {};

[_thistrigger] spawn {
	 params ["_thistrigger"];
	if (!(getMarkerColor "base" == "")) then { 
		//systemchat "switched base to opfor"; 
		_marker = createmarker ["dummybase", getmarkerpos "base"]; 
		_marker setMarkerShape "ICON";
		_marker setMarkerType "b_hq";
		_marker setMarkerText "Base (ENEMY)";
		_marker setMarkerColor "colorred";

		pointLimit = pointLimit +10;
		publicVariable "pointLimit";

		deletemarker "base"; 
		twc_siege_baseside = 1;
		publicVariable "twc_siege_baseside";

		"CONTACTS IN BASE, RESPAWN DISABLED" remoteExec ["hint"];

		waituntil {({isPlayer _x && alive _x} count allUnits)==0};
		if (getMarkerColor "base" == "") then {
			if ((getMarkerColor "respawn_forwardBase" == "") ) then {
				//systemchat "no base and no backup";
				"baselost" call BIS_fnc_endMissionServer;
			} else {
				//systemchat "got a backup"
			};
		};
	}
	else 
	{ 
		 
		//systemchat "switching base to blufor"; 
		_marker = createmarker ["base", getmarkerpos "dummybase"]; 
		_marker setMarkerShape "ICON";
		_marker setMarkerType "b_hq";
		_marker setMarkerText "Base (FRIENDLY)";
		_marker setMarkerColor "colorBlufor";
		deletemarker "dummybase"; 
		twc_siege_baseside = 0;
		publicVariable "twc_siege_baseside";
		"BASE MADE SAFE, RESPAWN RESTORED" remoteExec ["hint"];
	} 
 
}