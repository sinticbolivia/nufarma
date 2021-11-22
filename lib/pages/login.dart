import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../colors.dart' as colors;

class Login extends StatefulWidget
{
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login>
{
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 50,
              child: TextFormField(
                decoration: this.getFieldStyle().copyWith(
                    prefixIcon: Container(
                      padding: EdgeInsets.all(10),
                      child: FaIcon(FontAwesomeIcons.user, color: colors.mainColors['primary'])
                    ),
                    hintText: 'Usuario'
                ),
              )
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: TextFormField(
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
            ),
            SizedBox(height: 15),
            TextButton(
              child: Text('Olvidaste tu contraseña?', style: TextStyle(color: colors.mainColors['primary']))
            )
          ]
      )
    );
  }
}
