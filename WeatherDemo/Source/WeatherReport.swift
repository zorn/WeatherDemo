import Foundation

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
    case Unknwon = "unknown"
}

struct WeatherReport {
    
    let time: NSDate
    let summary: String
    let temperature: Double
    let icon: WeatherReportIcon
    
}