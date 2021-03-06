// GMS_fnc_time.sqf
// by Ghostrider-DBD_
// Last Updated 12/21/16
// Creds to AWOL, A3W, LouD and Creampie for insights.

if (!isServer) exitWith {};

/*
	blck_timeAcceleration = true; // When true, time acceleration will be periodically updated based on amount of daylight at that time according to the values below 
								  // which can be set using the corresponding variables in the config file for that mod.
	
	blck_timeAccelerationDay = 1;  // Daytime time accelearation
	blck_timeAccelerationDusk = 3; // Dawn/dusk time accelearation
	blck_timeAccelerationNight = 6;  // Nighttim time acceleration
*/
private ["_arr","_sunrise","_sunset","_time"];
_arr = date call BIS_fnc_sunriseSunsetTime;
_sunrise = _arr select 0;
_sunset = _arr select 1;
_time = dayTime;
//diag_log format["_fnc_Time::  -- > _sunrise = %1 | _sunset = %2 | _time = %3",_sunrise,_sunset,_time];

// Night
if (_time > (_sunset + 0.5) || _time < (_sunrise - 0.5)) exitWith {setTimeMultiplier blck_timeAccelerationNight; diag_log format["NIGHT TIMGE ADJUSTMENT:: time accel updated to %1; time of day = %2",timeMultiplier,dayTime];};

// Day
if (_time > (_sunrise + 0.5) && _time < (_sunset - 0.5)) exitWith {setTimeMultiplier blck_timeAccelerationDay; diag_log format["DAYTIME ADJUSTMENT:: time accel updated to %1; time of day = %2",timeMultiplier,dayTime];};

// default
setTimeMultiplier blck_timeAccelerationDusk; diag_log format["DUSK ADJUSTMENT:: time accel updated to %1; time of day = %2",timeMultiplier,dayTime];


