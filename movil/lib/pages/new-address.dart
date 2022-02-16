import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../colors.dart' as colors;

class NewAddress extends StatefulWidget
{
  final String type;
  NewAddress({this.type = 'address'})
  {

  }

  @override
  _NewAddressState  createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress>
{
  String    type;
  int _currentStateId;
  int _currentCityId;
  int _currentCountryId;
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController   _ctrlStreet = TextEditingController();
  TextEditingController   _ctrlNroExt = TextEditingController();
  TextEditingController   _ctrlNroInt = TextEditingController();
  TextEditingController   _ctrlZip    = TextEditingController();
  TextEditingController   _ctrlNotes  = TextEditingController();

  @override
  void initState()
  {
    this.type = this.widget.type;
    super.initState();
    this._currentStateId = 1;
    this._currentCityId = 1;
    this._currentCountryId = 1;

  }
  @override
  Widget build(BuildContext context)
  {
    var data = ModalRoute.of(this.context)?.settings.arguments as Map;

    if( data != null )
    {
      this.type = data.containsKey('type') ? data['type'] : this.type;
    }

    return Scaffold(
      appBar: AppBar(
        title: this.type == 'address' ? Text('Nueva dirección') : Text('Nueva dirección facturación'),
        actions: [],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Form(
          key: this._formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView(
                shrinkWrap: true,
                    children: [
                      if( this.type == 'invoice' )
                        TextFormField(
                          decoration: this._inputDecoration().copyWith(
                              labelText: 'Razon Social'
                          ),
                          controller: this._ctrlStreet,
                          validator: (str)
                          {
                            if( str.isEmpty )
                              return 'Razon Social invalida';
                          },
                        ),
                      if( this.type == 'invoice' )
                        Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                                  decoration: this._inputDecoration().copyWith(
                                      labelText: 'RFC'
                                  ),
                                  controller: this._ctrlNroExt,
                                  validator: (str)
                                  {
                                    if( str.isEmpty )
                                      return 'RFC invalido';
                                  },
                                )
                            ),
                            SizedBox(width: 10),
                            Expanded(
                                child: TextFormField(
                                  decoration: this._inputDecoration().copyWith(
                                      labelText: 'Tipo de persona'
                                  ),
                                  controller: this._ctrlNroInt,
                                  validator: (str)
                                  {
                                    if( str.isEmpty )
                                      return 'Tipo de persona invalido';
                                  },
                                )
                            )
                          ]
                        ),
                      TextFormField(
                        decoration: this._inputDecoration().copyWith(
                            labelText: 'Calle'
                        ),
                        controller: this._ctrlStreet,
                        validator: (str)
                        {
                          if( str.isEmpty )
                            return 'Calle invalida';
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                                  decoration: this._inputDecoration().copyWith(
                                      labelText: 'No. Exterior'
                                  ),
                                  controller: this._ctrlNroExt,
                                  validator: (str)
                                  {
                                    if( str.isEmpty )
                                      return 'Número exterior invalido';
                                  },
                                )
                            ),
                            SizedBox(width: 10),
                            Expanded(
                                child: TextFormField(
                                  decoration: this._inputDecoration().copyWith(
                                      labelText: 'No. Interior'
                                  ),
                                  controller: this._ctrlNroInt,
                                  validator: (str)
                                  {
                                    if( str.isEmpty )
                                      return 'Número interior invalido';
                                  },
                                )
                            )
                          ]
                      ),
                      SizedBox(height: 10),
                      DropdownButton(
                        hint: Text('-- estado --'),
                        isExpanded: true,
                        value: this._currentStateId,
                        items: [
                          DropdownMenuItem<int>(value: 1, child: Text('Ciudad de Mexico')),
                          DropdownMenuItem<int>(value: 2, child: Text('Estado 01'))
                        ],
                        onChanged: (id)
                        {
                          this.setState(() {
                            this._currentStateId = id;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      DropdownButton(
                        hint: Text('-- ciudad --'),
                        isExpanded: true,
                        value: this._currentCityId,
                        items: [
                          DropdownMenuItem<int>(value: 1, child: Text('CDMX')),
                          DropdownMenuItem<int>(value: 2, child: Text('Ciudad 01'))
                        ],
                        onChanged: (id)
                        {
                          this.setState(() {
                            this._currentCityId = id;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: this._inputDecoration().copyWith(
                            labelText: 'Código postal'
                        ),
                        controller: this._ctrlZip,
                      ),
                      SizedBox(height: 10),
                      DropdownButton(
                        hint: Text('-- pais --'),
                        isExpanded: true,
                        value: this._currentCountryId,
                        items: [
                          DropdownMenuItem<int>(value: 1, child: Text('México')),
                          DropdownMenuItem<int>(value: 2, child: Text('Bolivia'))
                        ],
                        onChanged: (id)
                        {
                          this.setState(() {
                            this._currentCountryId = id;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      if( this.type == 'address' )
                      TextFormField(
                        decoration: this._inputDecoration().copyWith(
                            labelText: 'Agregar indicaciones (Entre calles, entrega en recepción, etc)'
                        ),
                        controller: this._ctrlNotes,
                      ),
                    ]
                )
              ),
              SizedBox(height: 10),
              Container(
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(colors.mainColors['secondary']),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              side: BorderSide(color: colors.mainColors['secondary'])
                          )
                      )
                  ),
                  child: Text('Agregar', style: TextStyle(color: Colors.white)),
                  onPressed: ()
                  {
                    this._createAddress();
                  },
                )
              )
            ]
          )
        )
      ),
    );
  }
  InputDecoration _inputDecoration()
  {
    return InputDecoration(

    );
  }
  void _createAddress()
  {
    try
    {
      if( !this._formKey.currentState.validate() )
        throw Exception('Datos invalidos');
    }
    catch(e)
    {
      ScaffoldMessenger.of(this.context).showSnackBar(SnackBar(
        content: Text(e.getMessage()),
        backgroundColor: Colors.redAccent,
      ));
    }
  }
}