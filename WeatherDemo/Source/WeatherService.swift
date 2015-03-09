import Foundation

enum WeatherServiceFetchResult {
    case Success(WeatherReport)
    case Failure(NSError)
}

protocol WeatherServiceDataSource {
    func fetchWeatherReport(#latitude: Double, longitude: Double, completion: (result: WeatherServiceFetchResult) -> Void)
}

struct WeatherService : WeatherServiceDataSource {
    
    let dataSource: WeatherServiceDataSource
    
    init(dataSource: WeatherServiceDataSource) {
        self.dataSource = dataSource
    }
    
    func fetchWeatherReport(#latitude: Double, longitude: Double, completion: (result: WeatherServiceFetchResult) -> Void) {
        self.dataSource.fetchWeatherReport(latitude: latitude, longitude: longitude, completion: completion)
    }
    
}