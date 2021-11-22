//import 'dart:mirrors';
import 'dart:convert';

class SB_Object
{
	Map<String, dynamic>	meta 		= {};
	
	void loadData(Map<String, dynamic> data)
	{
		if( data['meta'] != null && data['meta'] is Map )
		{
			this.meta = data['meta'];
		}
	}
	void bind(Map<String, dynamic> obj)
	{
		/*
		var rclass = reflect(this);
		obj.forEach( (key, val) 
		{
			var prop = rclass.getField(Symbol(key));
			if( prop != null )
			{
				rclass.setField(Symbol(key), val);
			}
		});
		*/
	}
	dynamic getMeta(key, [String defVal = ''])
	{
		dynamic meta_value = defVal;
		if( this.meta == null || this.meta.isEmpty )
			return meta_value;
		
		if( !meta.containsKey(key) )
			return meta_value;
		if( this.meta[key] == null )
			return meta_value;
		meta_value = this.meta[key];

		try
		{
			var mixed = json.decode(meta_value);
			if( mixed != null && (mixed is List || mixed is Map) )
				return mixed;
		}
		catch(e)
		{
			
		}
		
		return meta_value; 
	}
}
