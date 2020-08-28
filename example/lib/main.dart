import 'package:flutter/material.dart';
import 'package:flutter_math_view/flutter_math_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FlutterMathView(
                  latex: "\\vec \\bf V_1 \\times \\vec \bf V_2 =  \\begin{vmatrix} \\hat \\imath &\\hat \\jmath &\\hat k \\\\ \\frac{\\partial X}{\\partial u} &  \\frac{\\partial Y}{\\partial u} & 0 \\\\ \\frac{\partial X}{\\partial v} &  \\frac{\\partial Y}{\\partial v} & 0 \\end{vmatrix}",
                  color: Colors.purple,
                  fontSize: 24.0,
              ),
              SizedBox(height: 16.0),
              FlutterMathView(
                latex: "x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}",
              ),
              SizedBox(height: 16.0),
              Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.red,
                  ),
                  child: FlutterMathView(
                    latex: "x = \\frac{-b \\pm \\sqrt{b^2-4ac}}{2a}",
                    fontSize: 32.0,
                    color: Colors.yellow,
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
