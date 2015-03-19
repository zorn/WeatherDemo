import Foundation

let weatherServiceDataSourceDomain = "com.mikezornek.WeatherDemo.WeatherServiceDataSource"

extension NSError {
    
    class func weatherServiceErrorWithCode(code: Int, localizedDescription: String) -> NSError {
        return NSError(domain: weatherServiceDataSourceDomain, code: code, userInfo: [NSLocalizedDescriptionKey: localizedDescription])
    }
    
    class func weatherServiceNoDataError() -> NSError {
        return weatherServiceErrorWithCode(1001, localizedDescription: "No data returned.")
    }
    
    class func weatherServiceNoPreparedResponse() -> NSError {
        return weatherServiceErrorWithCode(1002, localizedDescription: "No prepared response for function.")
    }
}