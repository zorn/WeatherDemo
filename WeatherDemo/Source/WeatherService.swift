import Foundation

enum WeatherServiceFetchResult {
    case Success(WeatherReport)
    case Failure(NSError)
}

protocol WeatherServiceDataSource {
    func fetchWeatherReport(#latitude: Double, longitude: Double, completion: (result: WeatherServiceFetchResult) -> Void)
}

struct WeatherService : WeatherServiceDataSource {
    
    let dataAdaptor: WeatherServiceDataSource
    
    init(dataAdaptor: WeatherServiceDataSource) {
        self.dataAdaptor = dataAdaptor
    }
    
    func fetchWeatherReport(#latitude: Double, longitude: Double, completion: (result: WeatherServiceFetchResult) -> Void) {
        self.dataAdaptor.fetchWeatherReport(latitude: latitude, longitude: longitude, completion: completion)
    }
    
}