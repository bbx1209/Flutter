#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.

    FlutterMethodChannel *methodChannel = [FlutterMethodChannel methodChannelWithName:@"helloworld.flutter.io/info" binaryMessenger:((FlutterViewController *)self.window.rootViewController).binaryMessenger];
    [methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"getInfomationFromNative"]) {
            result(@"value from iOS");
        }
    }];

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
