import UIKit

enum WeatherReportIcon : String {
    case ClearDay = "clear-day"
    case ClearNight = "clear-night"
    case Rain = "rain"
    case Snow = "snow"
    case Sleet = "sleet"
    case Wind = "wind"
    case Fog = "fog"
    case Cloudy = "cloudy"
    case PartlyCloudyDay = "partly-cloudy-day"
    case PartlyCloudyNight = "partly-cloudy-night"
}

struct WeatherReport {
    
    let date: NSDate
    let summary: String
    let temperature: Double
    let icon: WeatherReportIcon?
    
    func iconImage() -> UIImage? {
        if let icon = icon {
            let filename = "\(icon.rawValue).jpg"
            return UIImage(named: filename)
        }
        return nil
    }
    
}