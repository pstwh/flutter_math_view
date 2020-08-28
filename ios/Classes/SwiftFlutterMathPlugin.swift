import Flutter
import UIKit

import iosMath

public class SwiftFlutterMathViewPlugin: NSObject, FlutterPlugin {

  var messenger: FlutterBinaryMessenger;

  init(messenger: FlutterBinaryMessenger) {
    self.messenger = messenger;
    super.init();
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let flutterMathViewFactory = FlutterMathViewFactory(messenger: registrar.messenger())

    registrar.register(flutterMathViewFactory, withId: "flutter_math_view")
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
