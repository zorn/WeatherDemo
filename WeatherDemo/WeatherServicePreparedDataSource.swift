import Foundation

struct WeatherServicePreparedDataSource : WeatherServiceDataSource {
    
    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.7 * Double(NSEC_PER_SEC)))
    var fetchWeatherReportResponse: WeatherServiceFetchResult?
    
    init(fetchWeatherReportResponse: WeatherServiceFetchResult) {
        self.fetchWeatherReportResponse = fetchWeatherReportResponse
    }
    
    func fetchWeatherReport(#latitude: Double, longitude: Double, completion: (result: WeatherServiceFetchResult) -> Void) {
        dispatch_after(delayTime, dispatch_get_main_queue()) { () -> Void in
            if let response = self.fetchWeatherReportResponse {
                completion(result: response)
            } else {
                completion(result: WeatherServiceFetchResult.Failure(NSError.weatherServiceNoPreparedResponse()))
            }
        }
    }
    
}