import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        let navVC = UINavigationController(rootViewController: LaunchMenuViewController(style: .Grouped))
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        
        return true
    }

}

