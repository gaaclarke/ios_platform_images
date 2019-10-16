#import "NativeImagesPlugin.h"

#if !__has_feature(objc_arc)
#error ARC must be enabled!
#endif

@interface NativeImagesPlugin ()
@end

@implementation NativeImagesPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar {
  FlutterMethodChannel *channel = [FlutterMethodChannel
      methodChannelWithName:@"plugins.flutter.io/native_images"
            binaryMessenger:[registrar messenger]];

  [channel
      setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
        if ([@"loadImage" isEqualToString:call.method]) {
          NSString* name = call.arguments;
          UIImage* image = [UIImage imageNamed:name];
          NSData* data = UIImagePNGRepresentation(image);
          result([FlutterStandardTypedData typedDataWithBytes:data]);
          return;
        } 
        result(FlutterMethodNotImplemented);
      }];
}

@end