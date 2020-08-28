import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterMathView extends StatefulWidget {

  Color color;
  String latex;
  double fontSize;
  double height;
  double width;

  FlutterMathView({
    @required this.latex,
    this.fontSize,
    this.width,
    this.height,
    this.color
  });

  @override
  State<StatefulWidget> createState() => _FlutterMathViewState();
}

class _FlutterMathViewState extends State<FlutterMathView>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  MethodChannel channel;

  int height;
  int width;

  void initState() {
    height = widget.height ?? 32;
    width = widget.width ?? 32;
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      final pixelRatio = MediaQuery
          .of(context)
          .devicePixelRatio;

      return SizedBox(
          height: height / pixelRatio,
          width: width / pixelRatio,
          child: AndroidView(
            viewType: 'flutter_math_view',
            onPlatformViewCreated: _onPlatformViewCreated,
          ));
    }

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return SizedBox(
          width: width.toDouble(),
          height: height.toDouble(),
          child: UiKitView(
            viewType: 'flutter_math_view',
            onPlatformViewCreated: _onPlatformViewCreated,
          ));
    }

    return Text(
        '$defaultTargetPlatform is not yet supported by the text_view plugin');
  }

  void _onPlatformViewCreated(int id) {
    channel = MethodChannel('flutter_math_view$id')
      ..invokeMethod('setLatex', widget.latex ?? '')
      ..invokeMethod(
          'setFontSize', widget.fontSize ?? 16.0)
      ..invokeMethod('setColor',
          '#${((widget.color ?? Colors.black).value & 0xFFFFFF).toRadixString(16)
              .padLeft(6, '0')
              .toUpperCase()}')
      ..setMethodCallHandler((call) {
        switch (call.method) {
          case "size":
            setState(() {
              if (widget.height == null)
                height = call.arguments["height"].toInt();

              if (widget.width == null)
                width = call.arguments["width"].toInt();
            });
            break;
        }
      });
  }
}
