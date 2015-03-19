import UIKit

struct WeatherDemoLaunchMenuFactory {
    
    // TODO: Move API key to more reasonable location
    let forcastIOAPIKey = "d40ec55206d45f90b1bfe8b40e4c7520"
    var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func launchMenu() -> LaunchMenu {
        let section1 = launchMenuMainSection1()
        let section2 = launchMenuMainSection2()
        return LaunchMenu(sections: [section1, section2])
    }
    
    func launchMenuMainSection1() -> LaunchMenuSection {
        let item1 = LaunchMenuItem(title: "Network", details: "Using the real Forcast.io service") { () -> () in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateInitialViewController() as WeatherDisplayViewController
            let dataSource = WeatherServiceForcastIODataSource(APIKey: self.forcastIOAPIKey)
            vc.weatherService = WeatherService(dataSource: dataSource)
            
            self.window?.rootViewController = vc
        }
        return LaunchMenuSection(title: "Live", items: [item1])
    }
    
    func launchMenuMainSection2() -> LaunchMenuSection {
        let report1 = WeatherReport(date: NSDate(), summary: "Mostly Cloudy", temperature: 21.43, icon: WeatherReportIcon.PartlyCloudyDay)
        let item1 = launchMenuItemForReport(report1, details: "Using a prepared data source")
        let report2 = WeatherReport(date: NSDate(), summary: "Snow", temperature: 21.43, icon: WeatherReportIcon.Snow)
        let item2 = launchMenuItemForReport(report2, details: "Using a prepared data source")
        let report3 = WeatherReport(date: NSDate(), summary: "Rain", temperature: 21.43, icon: WeatherReportIcon.Rain)
        let item3 = launchMenuItemForReport(report3, details: "Using a prepared data source")
        return LaunchMenuSection(title: "Demo Scenarios", items: [item1, item2, item3])
    }
    
    func launchMenuItemForReport(report: WeatherReport, details: String) -> LaunchMenuItem {
        let item = LaunchMenuItem(title: report.summary, details: details) { () -> () in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateInitialViewController() as WeatherDisplayViewController
            let dataSource = WeatherServicePreparedDataSource(fetchWeatherReportResponse: WeatherServiceFetchResult.Success(report))
            vc.weatherService = WeatherService(dataSource: dataSource)
            self.window?.rootViewController = vc
        }
        return item
    }
    
}