import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../services/service-users.dart';
import '../colors.dart' as colors;
import '../widgets/widget-loading.dart';

class Register extends StatefulWidget
{
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register>
{
  TextEditingController _ctrlName = TextEditingController();
  TextEditingController _ctrlLastname = TextEditingController();
  TextEditingController _ctrlEmail = TextEditingController();
  TextEditingController _ctrlPhone = TextEditingController();
  TextEditingController _ctrlPwd = TextEditingController();
  TextEditingController _ctrlRPwd = TextEditingController();
  GlobalKey<FormState>  _keyForm  = GlobalKey();
  @override
  void initState()
  {
    super.initState();
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        body: SafeArea(
          child: Container(
              child: Column(
                  children: [
                    Container(height: 40, color: colors.mainColors['primary']),
                    SizedBox(height: 35),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.only(top: 20, bottom: 20, left: 35, right: 35),
                            child: ListView(
                              //shrinkWrap: true,
                                children: [
                                  Center(child: Image.asset('assets/images/logo01.png', fit: BoxFit.cover,)),
                                  SizedBox(height: 50),
                                  this._getForm(),
                                ]
                            )
                        )
                    )
                  ]
              )
          ),
        )
    );
  }
  InputDecoration getFieldStyle()
  {
    return InputDecoration(
        hintText: 'Contraseña',
        hintStyle: TextStyle(color: Color(0xff595858)),
        border: OutlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Color(0xffd7d7d7).withOpacity(1)
            ),
            borderRadius: BorderRadius.circular(10)
        )
    );
  }
  Widget _getForm()
  {
    return Form(
      key: this._keyForm,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  height: 50,
                  child: TextFormField(
                    controller: this._ctrlName,
                    decoration: this.getFieldStyle().copyWith(
                        prefixIcon: Container(
                            padding: EdgeInsets.all(10),
                            child: FaIcon(FontAwesomeIcons.user, color: colors.mainColors['primary'])
                        ),
                        hintText: 'Nombre'
                    ),
                    validator: (str)
                    {
                      if( str.isEmpty )
                        return 'Debe ingresar su nombre';
                    },
                  )
              ),
              SizedBox(height: 10),
              Container(
                  height: 50,
                  child: TextFormField(
                    controller: this._ctrlLastname,
                    decoration: this.getFieldStyle().copyWith(
                        prefixIcon: Container(
                            padding: EdgeInsets.all(10),
                            child: FaIcon(FontAwesomeIcons.user, color: colors.mainColors['primary'])
                        ),
                        hintText: 'Apellido'
                    ),
                    validator: (str)
                    {
                      if( str.isEmpty )
                        return 'Debe ingresar su apellido';
                    },
                  )
              ),
              SizedBox(height: 10),
              Container(
                  height: 50,
                  child: TextFormField(
                    controller: this._ctrlEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: this.getFieldStyle().copyWith(
                        prefixIcon: Container(
                            padding: EdgeInsets.all(10),
                            child: FaIcon(FontAwesomeIcons.at, color: colors.mainColors['primary'])
                        ),
                        hintText: 'Email'
                    ),
                    validator: (str)
                    {
                      if( str.isEmpty )
                        return 'Debe ingresar su email';
                    },
                  )
              ),
              SizedBox(height: 10),
              Container(
                  height: 50,
                  child: TextFormField(
                    controller: this._ctrlPhone,
                    decoration: this.getFieldStyle().copyWith(
                        prefixIcon: Container(
                            padding: EdgeInsets.all(10),
                            child: FaIcon(FontAwesomeIcons.phone, color: colors.mainColors['primary'])
                        ),
                        hintText: 'Phone'
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (str)
                    {
                      if( str.isEmpty )
                        return 'Debe ingresar su teléfono';
                    },
                  )
              ),
              SizedBox(height: 10),
              Container(
                  //height: 50,
                  child: TextFormField(
                    controller: this._ctrlPwd,
                    obscureText: true,
                    decoration: this.getFieldStyle().copyWith(
                        prefixIcon: Container(
                            padding: EdgeInsets.all(10),
                            child: FaIcon(FontAwesomeIcons.lock, color: colors.mainColors['primary'])
                        ),
                        suffixIcon: Container(
                            padding: EdgeInsets.all(10),
                            child: FaIcon(FontAwesomeIcons.eye, color: Color(0xffd7d7d7))
                        ),
                        hintText: 'Contraseña'
                    ),
                    validator: (str)
                    {
                      if( str.isEmpty )
                        return 'Debe ingresar su contraseña';
                    },
                  )
              ),
              SizedBox(height: 20),
              Container(
                  height: 50,
                  child: TextFormField(
                    controller: this._ctrlRPwd,
                    obscureText: true,
                    decoration: this.getFieldStyle().copyWith(
                        prefixIcon: Container(
                            padding: EdgeInsets.all(10),
                            child: FaIcon(FontAwesomeIcons.lock, color: colors.mainColors['primary'])
                        ),
                        suffixIcon: Container(
                            padding: EdgeInsets.all(10),
                            child: FaIcon(FontAwesomeIcons.eye, color: Color(0xffd7d7d7))
                        ),
                        hintText: 'Repetir Contraseña'
                    ),
                    validator: (str)
                    {
                      if( str.isEmpty )
                        return 'Debe repetir su contraseña';
                    },
                  )
              ),
              SizedBox(height: 20),
              TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                    backgroundColor: MaterialStateProperty.all(colors.mainColors['secondary']),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: colors.mainColors['secondary'])
                        )
                    )
                ),
                child: Text('ENTRAR', style: TextStyle(color: Colors.white)),
                onPressed: this._login,
              ),
              SizedBox(height: 15),
              TextButton(
                  child: Text('Olvidaste tu contraseña?', style: TextStyle(color: colors.mainColors['primary']))
              )
            ]
        )
    );
  }
  void _login() async
  {
    var key = GlobalKey();
    try
    {
      if( !this._keyForm.currentState.validate() )
        return;
      var data = {
        'firstname': this._ctrlName.text.trim(),
        'lastname': this._ctrlLastname.text.trim(),
        'phone': this._ctrlPhone.text.trim(),
        'email': this._ctrlPhone.text.trim(),
        'pwd': this._ctrlPwd.text.trim(),
        'rpwd': this._ctrlRPwd.text.trim(),
      };
      WidgetLoading.show(context, key, 'Procesando su registro...');
      var res = await ServiceUsers().register(data);
      WidgetLoading.hide(key);
      print(res);
      showDialog(builder: (_)
      {
        return AlertDialog(
          title: Text('Registro completado'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Center(
                  child: Icon(Icons.check_circle_outline,color: Colors.green, size: 40),
                ),
                Text('Su registro fue completado correctamente, ahora puede iniciar sesión en la aplicación')
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: ()
              {
                Navigator.of(this.context).pop();
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              },
              child: Text('Cerrar')
            )
          ],
        );
      });
    }
    catch(e)
    {
      print(e);
      if( key.currentState != null )
        WidgetLoading.hide(key);
    }
  }
}