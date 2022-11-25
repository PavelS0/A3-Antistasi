/*
	Author: Karel Moricky

	Description:
		Ends mission with specific ending.

	Parameter(s):
		0: can be one of:
			STRING - (Optional, default "end1") end name
			ARRAY in format [endName, ID] - will be assembled as "endName_ID" string
		1: BOOLEAN - (Optional, default true) true to end mission, false to fail mission
		2: (Optional, default true) can be one of:
			BOOLEAN - true for signature closing shot (default: true)
			NUMBER - duration of a simple fade out to black

	Returns:
		BOOLEAN

	Example:
		[] call BIS_fnc_endMission
*/
vehicleBox addAction ["Купить передвижной штаб", {player call A3A_fnc_mobileHQspawn},nil,0,false,true,"","true", 4];
flagX addAction ["Преместиться в штаб", {[] call A3A_fnc_mobileHQgoto}];

{
	_x addAction ["Удалить передвижной штаб", {[(_this select 0)] call A3A_fnc_mobileHQdelete}]; 
} forEach mobileHQ;

addMissionEventHandler ["Map", {
	params ["_mapIsOpened", "_mapIsForced"];
	{
		if (_mapIsOpened == true) then {
		private _m = createMarkerLocal [format ["MobileHQ%1", _forEachIndex], _x];
		_m setMarkerType "hd_end"; // Visible.
		} else {
			deleteMarkerLocal format ["MobileHQ%1", _forEachIndex];
		};
	} forEach mobileHQ;
}];

true