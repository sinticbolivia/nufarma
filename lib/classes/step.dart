import 'package:flutter/material.dart';

class StepObj
{
  int     index = 0;
  String  name = '';
  Size    size;
  double  containerOffsetEnd = 0;
  double  offsetMiddle = 0;

  StepObj({this.index, this.name, this.size});

  void setSize(Size size)
  {
    this.size = size;
  }
  void setOffsetEnd(double end)
  {
    this.containerOffsetEnd = end;
    this.offsetMiddle = this.containerOffsetEnd - ( this.size.width / 2 );
  }
}