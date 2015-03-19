import Foundation



// Sample: https://api.forecast.io/forecast/d40ec55206d45f90b1bfe8b40e4c7520/39.950869,-75.145728

struct WeatherServiceForcastIODataSource : WeatherServiceDataSource {
    
    let APIKey: String
    
    init(APIKey: String) {
        self.APIKey = APIKey
    }
    
    func fetchWeatherReport(#latitude: Double, longitude: Double, completion: (result: WeatherServiceFetchResult) -> Void) {
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let escapedAPIKey = APIKey.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
        // TODO: Honor incomming lat and lon, for now hardcode to IndyHall
        let url = NSURL(string: "https://api.forecast.io/forecast/\(escapedAPIKey!)/39.950869,-75.145728")
        let request = NSURLRequest(URL: url!)
        let dataTask = session.dataTaskWithRequest(request) { (data, response, error) in
            if data != nil {
                let parseResponse = WeatherServiceForacstIONetworkResponseParser.parseResponseData(data)
                switch parseResponse {
                case .Success(let parseReport):
                    completion(result: WeatherServiceFetchResult.Success(parseReport))
                case .Failure(let parseError):
                    completion(result: WeatherServiceFetchResult.Failure(parseError))
                }
            } else {
                completion(result: WeatherServiceFetchResult.Failure(NSError.weatherServiceNoDataError()))
            }
        }
        dataTask.resume()
    }
    
}