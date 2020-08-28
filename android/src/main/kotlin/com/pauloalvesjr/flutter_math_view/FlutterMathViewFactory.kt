package com.pauloalvesjr.flutter_math_view

import android.content.Context

import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory


public class FlutterMathViewFactory(private val messenger: BinaryMessenger) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    override fun create(context: Context, id: Int, o: Any?): PlatformView {
        return FlutterMathView(context, messenger, id)
    }
}