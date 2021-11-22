import 'package:flutter/material.dart';

class WidgetNumberPicker extends StatefulWidget
{
	final ValueChanged<int> onQuantityChanged;
	final Color	btnColor;
	final initialValue;
	final int	maxNumber;
	
	//WidgetNumberPicker({Key: key, this.onQuantityChanged}) : super(key: key);
	WidgetNumberPicker({this.onQuantityChanged, this.btnColor = const Color(0xff0065ab), this.initialValue = 0, this.maxNumber = -1});
	
	@override
	_WidgetNumberPickerState	createState()
	{
		return _WidgetNumberPickerState();	
	}
}
class _WidgetNumberPickerState extends State<WidgetNumberPicker>
{
	TextEditingController _numberController;
	int _number = 0;
	Function()	onChanged;
	
	@override
	void initState()
	{
		super.initState();
		this._numberController = TextEditingController();
		this._numberController.text = this.widget.initialValue.toString();
		this._number = this.widget.initialValue;
	}
	void dispose()
	{
		this._numberController.dispose();
		super.dispose();
	}
	void _incrementNumber()
	{
		if( this.widget.maxNumber > -1 && this._number >= this.widget.maxNumber )
		{
			this._number = this.widget.maxNumber;
		}
		else
		{
			this._number++;
		}
		
		this.widget.onQuantityChanged(this._number);
		this.setState(() 
		{
			this._numberController.text = this._number.toString();
		});
	}
	void _decrementNumber()
	{
		--this._number;
		if( this._number <= 0 )
			this._number = 0;
		this.widget.onQuantityChanged(this._number);
		this.setState( () 
		{
			this._numberController.text = this._number.toString();
		});
	}
	@override
	Widget build(BuildContext context)
	{
		//this._numberController.text = this._number.toString();
		return Container(
			height: 40,
			decoration: BoxDecoration(
				border: Border.all(
					color: Colors.grey.withOpacity(0.6),
					style: BorderStyle.solid
				)
			),
			child: Row(
				children: [
					Container(
						margin: EdgeInsets.only(right:10),
							decoration: BoxDecoration(
									border: Border(
											right: BorderSide(color: Colors.grey)
									)
							),
						child: this._buildButton(this._decrementNumber, 'Reducir cantidad', Icon(Icons.remove))
					),
					Expanded( 
						child: TextField(
							obscureText: false,
							decoration: InputDecoration(
								border: InputBorder.none,
								contentPadding: EdgeInsets.all(1),
								//labelText: ''//this._number.toString()
							),
							textAlign: TextAlign.center,
							style: TextStyle(fontSize: 30),//Theme.of(context).textTheme.body1,
							keyboardType: TextInputType.number,
							controller: this._numberController,
							onSubmitted: (String value)
							{
								print(value);
							}
						)
					),
					Container(
						margin: EdgeInsets.only(left: 10),
						decoration: BoxDecoration(
							border: Border(
								left: BorderSide(color: Colors.grey)
							)
						),
						child: this._buildButton(this._incrementNumber, 'Incrementar', Icon(Icons.add)),
					),
				]
			)
		);
	}
	Widget _buildButton(Function callback, String tooltip, Widget icon)
	{
		return Container(
			/*
				decoration: ShapeDecoration(
						color: this.widget.btnColor,
						shape: CircleBorder()
				),
			 */
				child: IconButton(
						icon: icon,
						color: Colors.grey,
						tooltip: tooltip,
						onPressed: callback
				)
		);
	}
}
