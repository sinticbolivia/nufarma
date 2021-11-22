import 'package:flutter/material.dart';

class Steps extends StatelessWidget
{
  final int step;
  final List steps = <String>['Dirección', 'Forma de entrega', 'Facturación', 'Pago'];
  Steps({this.step});

  @override
  Widget build(BuildContext context)
  {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for(int i = 0; i < this.steps.length; i++)
            this._buildStep(this.steps[i], i)
        ]
      )
    );
  }
  Widget _buildStep(String stepName, int index)
  {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          if( this.step == index )
            Image.asset('assets/images/circle-step-active.png'),
          if( this.step != index )
            Image.asset('assets/images/circle-step-inactive.png'),
          SizedBox(height: 8),
          Text(stepName, style: TextStyle(fontSize: 11))
        ]
      )
    );
  }
}
