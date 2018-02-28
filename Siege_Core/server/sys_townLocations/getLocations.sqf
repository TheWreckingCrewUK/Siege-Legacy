sleep random 10;

if (twc_currentenemy<twc_maxenemy) then{
//adding in enemy count just to save a bit of overhead
{
// disreguards the towns in the badTown array in initServer
	if(!((text _x) in badTownArray))then{
	
//Calculates how many civilians based on number of houses.
		_houseList = (getPos _x) nearObjects ["House",300]; 
		_count = count _houseList;
		_count = round (_count / 20);
		
_spawnpos = getpos _x;



_flagpos = [_spawnpos,[100,100],random 360,0,[0,100]] call SHK_pos;
//		_flag = "rhs_Flag_Insurgents" createVehicle _flagpos;





if (count(_flagpos nearEntities [["CUP_C_Skoda_Blue_CIV"], 300]) ==0) then {

	_flag = "CUP_C_Skoda_Blue_CIV" createVehicle _flagpos;
_flag allowDamage false;
_flag setVehicleLock "locked";
_flag setVariable ["active",1];
_flag setVariable ["fighting",0];
_flag setVariable ["defended",0];
}; 

_flag = _spawnpos nearEntities [["CUP_C_Skoda_Blue_CIV"], 700] select 0;
if (_flag getvariable "fighting" == 1) then {} else {
		_trg = createTrigger ["EmptyDetector", getPos _x];
		_trg setTriggerArea [1500, 1500, 0, false];
		_trg setTriggerActivation ["West", "PRESENT", False];
		_trg setTriggerTimeout[2, 2, 2, true];
		_trg setTriggerStatements ["this",format["[(getPos thisTrigger),%1,100,[100,200],thisList,_flag] spawn twc_townSetup;",_count],""];

};




// Creates a marker that marks the town
/*
		_markerstr = createMarker [str (random 1000),getPos _x];
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "mil_flag";
		_markerstr setMarkerText (text _x);
*/


	};
}forEach townLocationArray;
};