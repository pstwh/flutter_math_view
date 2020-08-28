import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_math_view/flutter_math_view.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_math_view');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

//  test('getPlatformVersion', () async {
//    expect(await FlutterMath.platformVersion, '42');
//  });
}
