import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // TODO: Move API key to more reasonable locaotion
    let forcastIOAPIKey = "d40ec55206d45f90b1bfe8b40e4c7520"
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        
        let launchMenuVC = LaunchMenuViewController(style: .Grouped)
        launchMenuVC.launchMenu = launchMenu()

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
            let dataSource = WeatherServiceForcastIODataSource(APIKey: self.forcastIOAPIKey)
            vc.weatherService = WeatherService(dataSource: dataSource)
            
            self.window?.rootViewController = vc
        }
        return LaunchMenuSection(title: "Main", items: [item1])
    }

}

