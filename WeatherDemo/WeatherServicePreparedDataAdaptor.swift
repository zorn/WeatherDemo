import Foundation

class WeatherServicePreparedDataAdaptor : WeatherServiceDataSource {
    
    func fetchWeatherReport(#latitude: Double, longitude: Double, completion: (result: WeatherServiceFetchResult) -> Void) {
        let report = WeatherReport(date: NSDate(), summary: "Mostly Cloudy", temperature: 21.43, icon: WeatherReportIcon.Snow)
        completion(result: WeatherServiceFetchResult.Success(report))
    }
    
}