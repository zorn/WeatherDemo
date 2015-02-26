import Foundation

extension NSError {
    class func parserUnknownError() -> NSError {
        return NSError(domain: "WeatherServiceForacstIONetworkResponseParser", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Could not parse response. Unknown error."])
    }
}

enum WeatherServiceParseResult {
    case Success(WeatherReport)
    case Failure(NSError)
}

struct WeatherServiceForacstIONetworkResponseParser {
    
    static func parseResponseData(data: NSData) -> WeatherServiceParseResult {
        var jsonError: NSError?
        if let jsonObject = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? [String:AnyObject] {
            
            if let currentInfo = jsonObject["curently"] as? [String:AnyObject] {
                // TODO: This style of JSON parsing feels too risky
                let date = NSDate(timeIntervalSince1970: currentInfo["time"] as NSTimeInterval)
                let summary = currentInfo["summary"] as String
                let temperature = currentInfo["temperature"] as Double
                let icon = WeatherReportIcon(rawValue: currentInfo["icon"] as String)
                let newReport = WeatherReport(date: date, summary: summary, temperature: temperature, icon: icon)
                return WeatherServiceParseResult.Success(newReport)
            }
            
        } else {
            if let e = jsonError {
                return WeatherServiceParseResult.Failure(e)
            }
        }
        
        return WeatherServiceParseResult.Failure(NSError.parserUnknownError())
    }

    
}
