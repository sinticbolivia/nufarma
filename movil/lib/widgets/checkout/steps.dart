import 'package:flutter/material.dart';
import 'package:nufarma/widgets/checkout/widget-step.dart';
import '../../colors.dart' as colors;
import '../../classes/step.dart';


class Steps extends StatefulWidget
{
  final int step;

  Steps({@required this.step});

  @override
  _StepsState createState() => _StepsState();
}
class _StepsState extends State<Steps>
{
  final List steps = <StepObj>[
    StepObj(index: 0, name: 'Dirección'),
    StepObj(index: 1, name: 'Forma de entrega'),
    StepObj(index: 2, name: 'Facturación'),
    StepObj(index: 3, name: 'Pago'),
  ];
  double incrementSize = 0;
  bool stepsBuilt = false;
  int step;
  StepObj   currentStep;

  @override
  void initState()
  {
    this.step = this.widget.step;
    this.currentStep = (this.steps[this.step] as StepObj);
    super.initState();

  }
  @override
  Widget build(BuildContext context)
  {
    print('steps.build');
    this.incrementSize = 0;

    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: CustomPaint(
          //willChange: true,
          painter: this.stepsBuilt ? StepPainter(
            offsetStart:  (this.steps[0] as StepObj).size.width / 2,
            offsetEnd: currentStep.containerOffsetEnd - (currentStep.size.width / 2),
            totalWidth:  (this.steps.last as StepObj).offsetMiddle,
          ) : null,
          child: Container(
            //key: this._stepsKey,
            //color: Colors.blue,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: this.steps.map((stepObj) => Expanded(
                child: WidgetStep(
                    stepObj: stepObj,
                    isActive: stepObj.index <= this.step,
                    onBuilt: (size)
                    {
                      print('Step built');
                      this.incrementSize += size.width;
                      stepObj.setOffsetEnd(this.incrementSize);
                      if( stepObj.index == this.steps.length - 1 )
                        this.onStepsBuilt();
                    }
                )
              )).toList(),
            )
          )
        )
    );
  }

  void onStepsBuilt()
  {
    if( this.stepsBuilt )
      return;
    //print('Steps built');
    //RenderBox renderBox = this._stepsKey.currentContext?.findRenderObject();
    //print('width: ${renderBox.size.width} height: ${renderBox.size.height}');
    //print((this.steps[this.step] as StepObj).containerOffsetEnd);
    this.stepsBuilt = true;
    this.setState(() {});
  }
}
class StepPainter extends CustomPainter
{
  double offsetStart = 0;
  double offsetEnd = 0;
  double  totalWidth = 0;
  double  middle = 0;

  StepPainter({
    this.offsetStart,
    this.offsetEnd,
    this.totalWidth,
  })
  {
  }

  @override
  void paint(Canvas canvas, Size size)
  {
    var ipaint = Paint();
    ipaint.color = Color(0xffd9d9d9);
    ipaint.strokeWidth = 5;
    ipaint.strokeCap = StrokeCap.round;

    this.middle = size.height / 3.6;
    canvas.drawLine(Offset(this.offsetStart, this.middle), Offset(this.totalWidth, this.middle), ipaint);

    var paint = Paint();
    paint.color = colors.mainColors['secondary'];// : Color(0xffd9d9d9);
    paint.strokeWidth = 5;
    paint.strokeCap = StrokeCap.round;
    Map offset = this._buildPoint(size);

    canvas.drawLine(offset['start'], offset['end'], paint);
  }
  Map<String, Offset> _buildPoint(Size size)
  {
    Offset startOffset;
    Offset endOffset;

    startOffset = Offset(this.offsetStart, this.middle);
    endOffset = Offset(this.offsetEnd, this.middle);

    return {'start': startOffset, 'end': endOffset};
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate)
  {
    return !false;
  }
}