import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        
        let launchMenuVC = LaunchMenuViewController(style: .Grouped)
        launchMenuVC.launchMenu = WeatherDemoLaunchMenuFactory(window: window!).launchMenu()
        let navVC = UINavigationController(rootViewController: launchMenuVC)
        
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        return true
        
    }
    
}

