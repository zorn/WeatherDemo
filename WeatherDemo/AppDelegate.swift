import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        let menu = launchMenu()
        let launchMenuVC = LaunchMenuViewController(launchMenu: menu)
        let navVC = UINavigationController(rootViewController: launchMenuVC)
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func launchMenu() -> LaunchMenu {
        let section1 = launchMenuMainSection()
        return LaunchMenu(sections: [section1])
    }
    
    func launchMenuMainSection() -> LaunchMenuSection {
        let item1 = LaunchMenuItem(title: "Network", details: "Using the real network service") { () -> () in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateInitialViewController() as WeatherDisplayViewController
            self.window?.rootViewController = vc
        }
        return LaunchMenuSection(title: "Main", items: [item1])
    }

}

