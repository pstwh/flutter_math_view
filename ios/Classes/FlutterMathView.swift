//
//  FlutterMathView.swift
//  flutter_math_view
//
//  Created by Paulo Alves on 27/08/20.
//

import Flutter
import UIKit

import iosMath

public class FlutterMathView : NSObject, FlutterPlatformView {
    let frame: CGRect
    let viewId: Int64
    let channel: FlutterMethodChannel
    let mathView: MTMathUILabel
    var isInitialized: Bool = false

    init(_ frame: CGRect, viewId: Int64, channel: FlutterMethodChannel, args: Any?) {
        self.frame = frame
        self.viewId = viewId
        self.channel = channel
        self.mathView = MTMathUILabel(frame: frame)
        
        super.init()
        
        channel.setMethodCallHandler({ (methodCall: FlutterMethodCall, result: FlutterResult) -> Void in
            switch methodCall.method {
            case "setLatex":
                self.setLatex(methodCall: methodCall, result: result)
            case "setFontSize":
                self.setFontSize(methodCall: methodCall, result: result)
            case "setColor":
                self.setColor(methodCall: methodCall, result: result)
            default:
                result(FlutterMethodNotImplemented)
            }
        })
    }
    
    private func setLatex(methodCall: FlutterMethodCall, result: FlutterResult) {
        let latex = methodCall.arguments as? String
        self.mathView.latex = latex
    }
    
    private func setFontSize(methodCall: FlutterMethodCall, result: FlutterResult) {
        let fontSize = methodCall.arguments as? Double
        self.mathView.fontSize = CGFloat(fontSize!)
    }
    
    private func setColor(methodCall: FlutterMethodCall, result: FlutterResult) {
        let colorString = methodCall.arguments as! String
        self.mathView.textColor = UIColor(hex: colorString)!
    }
    
    public func view() -> UIView {
        let height = self.mathView.intrinsicContentSize.height
        let width = self.mathView.intrinsicContentSize.width
        
        if(!isInitialized && height != 0 && width != 0) {
            isInitialized = true
            channel.invokeMethod("size", arguments: [
                "height": self.mathView.intrinsicContentSize.height,
                "width": self.mathView.intrinsicContentSize.width
            ])
        }
        
        return self.mathView
    }
    
    
}
