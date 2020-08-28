package com.pauloalvesjr.flutter_math_view

import android.content.Context
import android.view.View
import android.view.ViewTreeObserver

import android.graphics.Color

import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

import com.agog.mathdisplay.MTMathView

class FlutterMathView(context: Context, messenger: BinaryMessenger, id: Int) : PlatformView, MethodCallHandler {
    private val mathView: MTMathView
    private val methodChannel: MethodChannel

    override fun getView(): View {
        return mathView
    }

    init {
        mathView = MTMathView(context)

        methodChannel = MethodChannel(messenger, "flutter_math_view$id")
        methodChannel.setMethodCallHandler(this)

        mathView.viewTreeObserver.addOnGlobalLayoutListener(object : ViewTreeObserver.OnGlobalLayoutListener {
            override fun onGlobalLayout() {
                methodChannel.invokeMethod(
                        "size",
                        hashMapOf("height" to mathView.height, "width" to mathView.width)
                )
            }
        })

    }

    override fun onMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
        when (methodCall.method) {
            "setLatex" -> setLatex(methodCall, result)
            "setFontSize" -> setFontSize(methodCall, result)
            "setColor" -> setColor(methodCall, result)
            else -> result.notImplemented()
        }

    }

    private fun setLatex(methodCall: MethodCall, result: Result) {
        val latex = methodCall.arguments as String
        mathView.latex = latex
        result.success(null)
    }

    private fun setFontSize(methodCall: MethodCall, result: Result) {
        val fontSize = methodCall.arguments as Double
        mathView.fontSize = MTMathView.convertDpToPixel(fontSize.toFloat())
        result.success(null)
    }

    private fun setColor(methodCall: MethodCall, result: Result) {
        val colorString = methodCall.arguments as String
        mathView.textColor = Color.parseColor(colorString)
        result.success(null)
    }

    override fun dispose() {
        // TODO dispose actions if needed
    }
}