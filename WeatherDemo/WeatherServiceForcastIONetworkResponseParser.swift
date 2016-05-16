import Foundation

extension NSError {
    class func parserUnknownError() -> NSError {
        return NSError(domain: "WeatherServiceForacstIONetworkResponseParser", code: 1001, userInfo: [NSLocalizedDescriptionKey: "Could not parse response. Unknown error."])
    }
}

enum WeatherServiceParseResult {
    case Success(WeatherReport)
    case Failure(ErrorType)
}

struct WeatherServiceForacstIONetworkResponseParser {
    
    static func parseResponseData(data: NSData) -> WeatherServiceParseResult {
        do {
            if let jsonObject = try? NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject] {
                
                if let jsonObject = jsonObject, currentInfo = jsonObject["currently"] as? [String:AnyObject] {
                    // TODO: This style of JSON parsing is error prone, would use BNR's Freddy in production
                    let date = NSDate(timeIntervalSince1970: currentInfo["time"] as! NSTimeInterval)
                    let summary = currentInfo["summary"] as! String
                    let temperature = currentInfo["temperature"] as! Double
                    let icon = WeatherReportIcon(rawValue: currentInfo["icon"] as! String)
                    let newReport = WeatherReport(date: date, summary: summary, temperature: temperature, icon: icon)
                    return WeatherServiceParseResult.Success(newReport)
                }
                
            } else {
                WeatherServiceParseResult.Failure(NSError.parserUnknownError())
            }
        } catch {
            return WeatherServiceParseResult.Failure(error)
        }
    }

}
