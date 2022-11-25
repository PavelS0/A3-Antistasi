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

openMap true;

onMapSingleClick {
	params ["_pos"];
	private _index = mobileHQ findIf { (_x distance2D _pos) < 100 };
	if (_index > -1) then {
		private _hq = mobileHQ select _index;
		if (((crew _hq) findIf {alive _x}) > -1) then {
			private _x = mobileHQ select _index; 
			player setPos ((getPos _x) findEmptyPosition [5, 50]);

			["Дислокация в штаб", "Успешно"] call A3A_fnc_customHint;
		} else {
			["Дислокация в штаб", "Невозможно дислоцироваться в штаб, пока в нём отсутствует живого солдата"] call A3A_fnc_customHint;
		};
	} else {
		["Дислокация в штаб", "Штаб поблизости не найден"] call A3A_fnc_customHint;
	};
	onMapSingleClick "";
};

true