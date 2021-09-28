import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      if #available(iOS 13.0, *) {
          if let window = self.window {
              let controller : FlutterViewController = window.rootViewController as! FlutterViewController
              let  methodChannel : FlutterMethodChannel =  FlutterMethodChannel.init(name: "helloworld.flutter.io/info", binaryMessenger: controller as! FlutterBinaryMessenger)
              methodChannel.setMethodCallHandler ({(call : FlutterMethodCall, result:FlutterResult) -> Void in
                  if("getInfomationFromNative" == call.method) {
                      getInfo(result: result)
                  }else {
                      result(FlutterMethodNotImplemented)
                  }
              })
          }
      } else {
          // Fallback on earlier versions
      }

    
      
      
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

private func getInfo(result :  FlutterResult) {
//    let device = UIDevice.current
//    device.isBatteryMonitoringEnabled = true
//    if(device.batteryState == UIDevice.BatteryState.unknown) {
//        result("there is an error")
//    } else {
        result("value from iOS")
//    }
}


extension UIApplication {
    @available(iOS 13.0, *)
    var keyWindow: UIWindow? {
        let activeScenes =  self.connectedScenes
            .filter { $0.activationState == .foregroundActive }
        let windowScenes = activeScenes.compactMap { $0 as? UIWindowScene }
        return  windowScenes.first?.windows
            .filter { $0.isKeyWindow }.first
    }
}

