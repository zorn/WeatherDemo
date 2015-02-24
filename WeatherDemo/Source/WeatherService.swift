import Foundation

enum WeatherServiceFetchResult {
    case Success(WeatherReport)
    case Failure(NSError)
}

protocol WeatherServiceDataSource {
    func fetchWeatherReport(#latitude: Double, longitude: Double, completion: (result: WeatherServiceFetchResult) -> Void)
}

// https://api.forecast.io/forecast/d40ec55206d45f90b1bfe8b40e4c7520/39.950869,-75.145728

struct WeatherService : WeatherServiceDataSource {
    
    func fetchWeatherReport(#latitude: Double, longitude: Double, completion: (result: WeatherServiceFetchResult) -> Void) {
        let report = WeatherReport(time: NSDate(), summary: "Mostly Cloudy", temperature: 21.43, icon: "partly-cloudy-day")
        completion(result: WeatherServiceFetchResult.Success(report))
    }
    
}