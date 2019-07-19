/*
	_EH_vehicleGetOut
	By Ghostrider [GRG]
	Handles the case where a unit gets out of a vehiclet.

	--------------------------
	License
	--------------------------
	All the code and information provided here is provided under an Attribution Non-Commercial ShareAlike 4.0 Commons License.

	http://creativecommons.org/licenses/by-nc-sa/4.0/
*/
diag_log format["_EH_vehicleGetOut: _this = %1",_this];
if (isServer) then 
{
	_this call blck_fnc_handleVehicleGetOut
};

/* else {
	if ((crew _this) isEqualTo []) then 
	{
		private _veh = _this select 0;
		//_veh lock 1;
		diag_log format["_EH_vehicleGetOut: letting the server handle unit getout event for _vehicle %1",_veh];
	};
};
//_this remoteExec["blck_fnc_handleVehicleGetOut",2];



