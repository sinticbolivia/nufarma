import 'package:flutter/material.dart';
import '../../classes/step.dart';

class WidgetStep extends StatelessWidget
{
  final StepObj stepObj;
  final bool    isActive;
  //final GlobalKey key = GlobalKey();
  final Function(Size) onBuilt;

  WidgetStep({@required this.stepObj, this.isActive = false, this.onBuilt});

  @override
  Widget build(BuildContext context)
  {
    final GlobalKey key = GlobalKey();
    WidgetsBinding.instance.addPostFrameCallback((frameCallback)
    {
      print('step ${this.stepObj.index} built');
      RenderBox renderBox = key.currentContext?.findRenderObject();

      this.stepObj.setSize(renderBox.size);
      //this.stepObj.setOffsetEnd(this.incrementSize);
      if( this.onBuilt != null )
        this.onBuilt(renderBox.size);
    });

    return Container(
        key: key,
        //color: Colors.red,
        padding: EdgeInsets.all(10),
        child: Column(
            children: [
              if( this.isActive )
                Image.asset('assets/images/circle-step-active.png'),
              if( !this.isActive )
                Image.asset('assets/images/circle-step-inactive.png'),
              SizedBox(height: 8),
              Text(stepObj.name, style: TextStyle(fontSize: 11, color: !this.isActive ? Color(0xffd9d9d9) : Colors.black))
            ]
        )
    );
  }
}
