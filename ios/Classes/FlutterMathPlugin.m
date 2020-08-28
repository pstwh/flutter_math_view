#import "FlutterMathPlugin.h"
#if __has_include(<flutter_math_view/flutter_math_view-Swift.h>)
#import <flutter_math_view/flutter_math_view-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_math_view-Swift.h"
#endif

@implementation FlutterMathViewPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterMathViewPlugin registerWithRegistrar:registrar];
}
@end
