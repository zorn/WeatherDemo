import UIKit

class WeatherDisplayViewController : UIViewController {

    var weatherService: WeatherService?
    var currentReport: WeatherReport?
    var dateFormatter: NSDateFormatter?
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        weatherService = WeatherService()
        dateFormatter = NSDateFormatter()
        dateFormatter?.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter?.timeStyle = NSDateFormatterStyle.NoStyle
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        if let service = weatherService {
            service.fetchWeatherReport(latitude: 1.1, longitude: 1.1) { (result: WeatherServiceFetchResult) in
                switch result {
                case .Success(let report):
                    self.currentReport = report
                    self.updateUI()
                case .Failure(let error):
                    println("Fetch failed with error: \(error.localizedDescription)")
                }
            }
        }
        super.viewWillAppear(animated)
    }
    
    // MARK: - Private
    
    func updateUI() {
        if let report = currentReport {
            dispatch_async(dispatch_get_main_queue(), {
                let displayTemp = String(format: "%.0f", report.temperature)
                self.temperatureLabel.text = "\(displayTemp)°"
                self.summaryLabel.text = report.summary
                self.dateLabel.text = self.dateFormatter?.stringFromDate(report.time)
            })
        }
    }
    
}

