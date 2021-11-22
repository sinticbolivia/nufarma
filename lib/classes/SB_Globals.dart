import 'package:flutter/material.dart';
import 'dart:collection';

class SB_Globals
{
	static HashMap<String, dynamic>	_vars = HashMap();
	
	/// Get global variable
	static dynamic getVar(String key, [dynamic defVal = null])
	{
		if( _vars[key] == null )
			return defVal;
		
		return _vars[key];
	}
	static void setVar(String key, dynamic val)
	{
		_vars[key] = val;
	}
}