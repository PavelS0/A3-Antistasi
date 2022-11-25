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
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_groups"];

player globalChat "merge group";

private _units = [];
{
	player hcRemoveGroup _x;
	private _u = units _x;
	_units append _u;
} forEach _groups;

_units joinSilent player;
true