import Foundation

// Sample: https://api.forecast.io/forecast/d40ec55206d45f90b1bfe8b40e4c7520/39.950869,-75.145728

struct WeatherServiceForcastIODataAdaptor : WeatherServiceDataSource {
    
    let APIKey: String
    
    init(APIKey: String) {
        self.APIKey = APIKey
    }
    
    func fetchWeatherReport(#latitude: Double, longitude: Double, completion: (result: WeatherServiceFetchResult) -> Void) {
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let escapedAPIKey = APIKey.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
        let url = NSURL(string: "https://api.forecast.io/forecast/\(escapedAPIKey)/\(latitude),\(longitude)")
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
                println("No data was retuend from the request.")
            }
        }

        
        //
        
//        let report = WeatherReport(time: NSDate(), summary: "Mostly Cloudy", temperature: 21.43, icon: WeatherReportIcon.Snow)
//        completion(result: WeatherServiceFetchResult.Success(report))
    }
    
        
}