import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final colorList = <Color>[
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.teal,
    Colors.indigo,
    Colors.black,
  ];

  int i=0;

  final strok = <Path>[];

  void startStrok(double x, double y)
  {
      strok.add(Path()..moveTo(x, y));
  }

  void moveStrok(double x, double y)
  {
   setState(() {
     strok.last.lineTo(x, y);
   });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        title: const Text("Painter App",style: TextStyle(letterSpacing: 1,fontSize: 25,color: Colors.white),),
        actions: [
          IconButton(onPressed: () {
            setState(() {
              strok.clear();
            });
          }, icon: const Icon(Icons.delete))
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
              setState(() {
                i=0;
              });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorList[0]
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  i=1;
                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorList[1]
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  i=2;
                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorList[2]
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  i=3;
                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorList[3]
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  i=4;
                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorList[4]
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  i=5;
                });
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorList[5]
                ),
              ),
            ),
          ],
        ),
      ),
      body: GestureDetector(
        onPanDown: (details) => startStrok(details.localPosition.dx, details.localPosition.dy),
        onPanUpdate: (details) => moveStrok(details.localPosition.dx, details.localPosition.dy),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: CustomPaint(
            painter: DrawingPainter(strok,colorList[i]),
          ),
        ),
      ),

    ));
  }
}

class DrawingPainter extends CustomPainter
{
  final List<Path> strokes;
  Color colorValue ;

  DrawingPainter(this.strokes,this.colorValue);
  @override
  void paint(Canvas canvas, Size size) {
    for(final stroke in strokes)
      {
        final paint = Paint()
          ..strokeWidth = 10
          ..color = colorValue
          ..style = PaintingStyle.stroke;
        canvas.drawPath(stroke, paint);

      }
    }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}