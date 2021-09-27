import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      let  controller : FlutterViewController = application.keyWindow?.rootViewController as! FlutterViewController
      let  methodChannel : FlutterMethodChannel =  FlutterMethodChannel.init(name: "helloworld.flutter.io/info", binaryMessenger: controller as! FlutterBinaryMessenger)
      
      methodChannel.setMethodCallHandler ({(call : FlutterMethodCall, result:FlutterResult) -> Void in
          if("getInfomationFromNative" == call.method) {
              getInfo(result: result)
          }else {
              result(FlutterMethodNotImplemented)
          }
      })
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

private func getInfo(result :  FlutterResult) {
    let device = UIDevice.current
    device.isBatteryMonitoringEnabled = true
    if(device.batteryState == UIDevice.BatteryState.unknown) {
        result("there is an error")
    } else {
        result("value from iOS")
    }
}

