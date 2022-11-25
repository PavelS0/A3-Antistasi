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
params [];

_vehType = "I_E_Van_02_transport_MP_F";
_resourcesFIA = server getVariable "resourcesFIA";
if (_resourcesFIA < 1000) exitWith {["Создать штаб", "Недостаточно денег, требуется 1000"] call A3A_fnc_customHint};
_targetPos = position player;
_spawnPos = _targetPos findEmptyPosition [5, 50, _vehType];
private _veh = createVehicle [_vehType, _spawnPos, [], 0, "NONE"];
_veh addAction ["Удалить передвижной штаб", {[(_this select 0)] call A3A_fnc_mobileHQdelete}]; 

mobileHQ pushBack _veh;
publicVariable "mobileHQ";

[0, -1000] remoteExec ["A3A_fnc_resourcesFIA", 2];

true