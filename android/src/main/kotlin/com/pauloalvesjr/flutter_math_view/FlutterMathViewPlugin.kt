package com.pauloalvesjr.flutter_math_view

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class FlutterMathViewPlugin : MethodCallHandler {
    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            registrar
                    .platformViewRegistry()
                    .registerViewFactory(
                            "flutter_math_view", FlutterMathViewFactory(registrar.messenger()))

            val channel = MethodChannel(registrar.messenger(), "flutter_math_view")
            channel.setMethodCallHandler(FlutterMathViewPlugin())
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else {
            result.notImplemented()
        }
    }
}