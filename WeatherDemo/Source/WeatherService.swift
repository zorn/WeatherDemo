import Foundation

protocol WeatherServiceDataSource {
    
    func fetchWeatherReport(#latitude: Double, longitude: Double) -> WeatherReport
    
}

// https://api.forecast.io/forecast/d40ec55206d45f90b1bfe8b40e4c7520/39.950869,-75.145728

struct WeatherService : WeatherServiceDataSource {
    
    func fetchWeatherReport(#latitude: Double, longitude: Double) -> WeatherReport {
        return WeatherReport(time: NSDate(), summary: "Mostly Cloudy", temperature: 21.43, icon: "partly-cloudy-day")
    }
    
}