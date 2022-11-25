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
params ["_target"];

private _index = mobileHQ findIf { _x == _target };
if (_index > -1) then {
	mobileHQ deleteAt _index;
	publicVariable "mobileHQ";
	deleteVehicle _target;
	[0, 1000] remoteExec ["A3A_fnc_resourcesFIA", 2];
};

true