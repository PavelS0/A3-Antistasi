
private _possibleMarkers = [];
private _controlsX = [controlsX] FUNC(nearHostileMarkers);
private _nearbyFriendlyMarkers = FUNC(nearFriendlyMarkers);
{
    private _pos = getmarkerPos _x;
    if !(isOnRoad _pos) then {
        if (_nearbyFriendlyMarkers findIf {getMarkerPos _x distance _pos < distanceSPWN} != -1) then {_possibleMarkers pushBack _x};
    };
}forEach _controlsX;

if (_possibleMarkers isEqualTo []) exitWith {false};
_possibleMarkers;
