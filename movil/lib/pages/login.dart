import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nufarma/services/service-users.dart';
import 'package:nufarma/widgets/widget-loading.dart';
import 'package:provider/provider.dart';

import '../Providers/SessionProvider.dart';
import '../classes/exceptions/ExceptionLogin.dart';
import '../colors.dart' as colors;

class Login extends StatefulWidget
{
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login>
{
  TextEditingController _ctrlUsername = TextEditingController();
  TextEditingController _ctrlPwd = TextEditingController();
  GlobalKey<FormState>  _keyForm = GlobalKey();
  bool showPass = false;
  
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
                controller: this._ctrlUsername,
                keyboardType: TextInputType.emailAddress,
                decoration: this.getFieldStyle().copyWith(
                    prefixIcon: Container(
                      padding: EdgeInsets.all(10),
                      child: FaIcon(FontAwesomeIcons.user, color: colors.mainColors['primary'])
                    ),
                    hintText: 'Usuario'
                ),
                validator: (str)
                {
                  if( str.isEmpty )
                    return 'Debe ingresar su nombre de usuario';
                },
              )
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: TextFormField(
                controller: this._ctrlPwd,
                obscureText: this.showPass ? false : true,
                decoration: this.getFieldStyle().copyWith(
                    prefixIcon: Container(
                      padding: EdgeInsets.all(10),
                      child: FaIcon(FontAwesomeIcons.lock, color: colors.mainColors['primary'])
                    ),
                    suffixIcon: Container(
                        padding: EdgeInsets.all(10),
                        child: InkWell(
                          child:  FaIcon(
                              this.showPass ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                              color: Color(0xffd7d7d7),
                          ),
                          onTap: ()
                          {
                            this.showPass = !this.showPass;
                            this.setState((){});
                          },
                        )
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
      String username = this._ctrlUsername.text.trim();
      String password = this._ctrlPwd.text.trim();
      WidgetLoading.show(context, key, 'Validando credenciales..');
      var user = await ServiceUsers().login(username, password);
      var session = Provider.of<SessionProvider>(this.context, listen: false);
      session.authenticated = true;
      session.user = user;
      WidgetLoading.hide(key);
      Navigator.of(this.context).pushNamedAndRemoveUntil('/', (route) => false);
    }
    on ExceptionLogin catch(e)
    {
      print(e);
      if( key.currentContext != null )
        WidgetLoading.hide(key);
      ScaffoldMessenger.of(this.context).showSnackBar(SnackBar(
        content: Text(e.getError()),
        backgroundColor: Colors.redAccent,
      ));
    }
    catch(e)
    {
      print(e);
      if( key.currentContext != null )
        WidgetLoading.hide(key);
    }
  }
}
