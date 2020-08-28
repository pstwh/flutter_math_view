//
//  FlutterMathFactory.swift
//  flutter_math_view
//
//  Created by Paulo Alves on 27/08/20.
//

import Flutter
import UIKit

import iosMath

public class FlutterMathViewFactory : NSObject, FlutterPlatformViewFactory {
    
    var messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }
    
    public func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        let channel = FlutterMethodChannel(
          name: "flutter_math_view\(viewId)",
          binaryMessenger: messenger
        )
        
        return FlutterMathView(frame, viewId: viewId, channel: channel, args: args)
    }
}
