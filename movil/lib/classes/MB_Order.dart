import 'package:intl/intl.dart';

import 'SB_Object.dart';
import 'MB_OrderItem.dart';
import 'MB_Cart.dart';


class MB_Order extends SB_Object
{
	String		id;
	int				order_id;
	String		code;
	String		name;
	int				store_id = 1;
	int				sequence;
	double		subtotal = 0;
	double		shipping_cost = 0;
	double		total = 0;
	String		details;
	String		status;
	String		payment_status;
	int				user_id;
	int				customer_id;
	String		order_date;
	String		delivery_date;
	String		type;
	String		creation_date;
	List<MB_OrderItem>			items;
	Map<String, dynamic>		meta = {};
	
	/// Customer field for order capture
	String		customer_phone;
	String		customer_email;
	String		nit_ruc_nif;
	String		billing_name;
	int				driver_id;
	int				driver_accepted;
	String		store_name;
	
	MB_Order()
	{
		this.items = [];
	}
	
	MB_Order.fromMap(Map<String, dynamic> json) 
	{
		this.items = [];
		try
		{
			this.id						= json['id'] != null ? json['id'].toString() : '';
			this.order_id 		= json['order_id'];
			this.code					= json['code'] ?? '';
			this.name				= json['name'] ?? '';
			this.store_id		= json['store_id'] ?? 0;
			this.sequence		= json['sequence'] ?? 0;
			this.subtotal		= json['subtotal'] ?? 0;
			this.total			= json['total'] ?? 0;
			this.details		= json['comment'] ?? '';
			this.status			= json['status'] ?? '';
			this.payment_status	= json['payment_status'] ?? '';
			this.user_id		= json['user_id'] ?? 0;
			this.customer_id	= json['customer_id'] ?? 0;
			this.order_date		= json['date'] ?? '';
			this.type					= json['type'] ?? '';
			//this.creation_date		= json['creation_date'];
			//this.driver_id			= json['driver_id'] ?? 0;
			//this.driver_accepted	= json['driver_accepted'] ?? 0;
			//this.store_name			= json['store_name'] ?? '';

			if( json['items'] != null )
			{
				json['items'].forEach( (item)
				{
					var oitem = MB_OrderItem.fromJson(item);
					this.items.add( oitem );
				});
			}
			if( json['meta'] != null )
			{
				(json['meta'] as List).forEach( (meta)
				{
					this.meta[meta['meta_key']] = meta['meta_value'];
				});
			}
		}
		catch(e)
		{
			print('LOAD ORDER DATA ERROR: $e');
		}
	}
	MB_Order.fromCart(MB_Cart cart)
	{
		this.items = [];
		this.details = '';
		this.payment_status = 'pending';
		cart.getItems().forEach( (item) 
		{
			var oitem = MB_OrderItem.fromCartItem(item);
			this.items.add(oitem);
		});
		this.subtotal	= cart.getTotals();
		this.total		= cart.getTotals();
	}
	Map<String, dynamic> toMap()
	{
		var data = {
			'order_id': this.order_id,
			'code': this.code,
			'name': this.name,
			'store_id': this.store_id,
			'sequence': this.sequence,
			'subtotal': this.subtotal,
			'total': this.total,
			'details': this.details,
			'status': this.status,
			'payment_status': this.payment_status,
			'user_id': this.user_id,
			'customer_id': this.customer_id,
			'order_date': this.order_date,
			'type': this.type,
			'creation_date': this.creation_date,
			'items': [],
			'meta': [],
			'customer_phone': this.customer_phone,
			'customer_email': this.customer_email,
			'nit_ruc_nif': this.nit_ruc_nif,
			'billing_name': this.billing_name,
			'driver_id': this.driver_id
		};
		this.items.forEach((item) 
		{
			(data['items'] as List).add( item.toMap() );
		});
		this.meta.forEach((key, val) 
		{
			(data['meta'] as List).add({'meta_key': key, 'meta_value': val});
		});
		return data;
	}
	String getStatus()
	{
		return this.getStatuses(this.status);
	}
	String getPaymentStatus()
	{
		return this.payment_status != 'paid' ? 'Pendiente' : 'Pagado';
	}
	dynamic getStatuses([String status = null])
	{
		var statuses = {
			'COMPLETE': 'Completado',
			'DRAFT': 'Borrador',
			'PENDING': 'Pendiente',
			'REVERSED': 'Revertido',
			'CANCELLED': 'Cancelado',
			'VOID': 'Anulado',
			'PROCESSING': 'En Proceso',
			'ON_THE_WAY': 'En camino',
			'DELIVERED': 'Entregado'
		};
		if( status != null )
			return statuses[status];
			
		return statuses;
	}
	DateTime getDate()
	{
		return DateTime.parse(this.order_date);
	}
	String getDateString()
	{
		final f = new DateFormat('dd-MM-yyyy hh:mm');
		
		return f.format(this.getDate());
	}
}
