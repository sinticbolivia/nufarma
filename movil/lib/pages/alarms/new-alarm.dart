import 'package:flutter/material.dart';
import '../../widgets/widget-bottom-menu.dart';
import '../../colors.dart' as colors;

class NewAlarm extends StatefulWidget
{
  @override
  _NewAlarmState  createState() => _NewAlarmState();
}
class _NewAlarmState extends State<NewAlarm>
{
  GlobalKey<FormState>  _keyForm = GlobalKey();
  TextEditingController _ctrlDate = TextEditingController();
  TextEditingController _ctrlHour = TextEditingController();
  TextEditingController _ctrlTitle  = TextEditingController();
  TextEditingController _ctrlRepeat = TextEditingController();
  TextEditingController _ctrlSound  = TextEditingController();

  @override
  void initState()
  {
    super.initState();
  }
  @override
  Widget build(BuildContext)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva alarma'),
        actions: []
      ),
      bottomNavigationBar: WidgetBottomMenu(),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Form(
                key: this._keyForm,
                child: this._buildForm(),
              )
            ),
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
              ),
            )
          ],
        )
      )
    );
  }
  Widget _buildForm()
  {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextFormField(
                controller: this._ctrlDate,
                decoration: InputDecoration(
                  labelText: 'Fecha',
                  suffixIcon: Icon(Icons.calendar_today, size: 20, ),
                  enabled: true,
                  //icon: Icon(Icons.calendar_today, size: 20, ),
                ),
              )
            ),
            SizedBox(width: 5),
            Expanded(
              child: TextFormField(
                controller: this._ctrlDate,
                decoration: InputDecoration(
                  labelText: 'Hora',
                  suffixIcon: Icon(Icons.alarm, size: 20,)
                ),
              ),
            )
          ]
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: this._ctrlTitle,
          decoration: InputDecoration(
          labelText: 'Titulo',

          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: this._ctrlRepeat,
          decoration: InputDecoration(
            labelText: 'Repetir',

          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          controller: this._ctrlSound,
          decoration: InputDecoration(
            labelText: 'Sonido y vibración',

          ),
        ),
      ],
    );
  }
}