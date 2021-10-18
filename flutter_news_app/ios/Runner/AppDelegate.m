#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import "UIView+toast.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.

    FlutterMethodChannel *methodChannel = [FlutterMethodChannel methodChannelWithName:@"helloworld.flutter.io/MethodChannel" binaryMessenger:((FlutterViewController *)self.window.rootViewController).binaryMessenger];
    __weak AppDelegate *weak_self = self;
    [methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"getInfomationFromNative"]) {
            result(@"value from iOS");
        } else if([call.method isEqualToString:@"toast"]){
            NSString *text =  call.arguments;
            [weak_self.window.rootViewController.view showText:text];
        }
    }];

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
