import 'package:flutter/material.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        height: 110,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 50,
                child: this.isActive ?
                  SvgPicture.asset('assets/icons/Recurso-28.svg', height: 30) :
                  Image.asset('assets/images/circle-step-inactive.png', height: 30),
              ),
              SizedBox(height: 8),
              Text(
                  stepObj.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 11,
                      color: !this.isActive ? Color(0xffd9d9d9) : Colors.black)
              )
            ]
        )
    );
  }
}
