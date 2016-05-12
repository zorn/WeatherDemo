import UIKit

class WeatherDisplayViewController : UIViewController {

    var weatherService: WeatherService?
    var currentReport: WeatherReport?
    var dateFormatter: NSDateFormatter?
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        configureDateFormatter()
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        loadFreshWeatherReport()
        super.viewWillAppear(animated)
    }
    
    // MARK: - Actions
    
    @IBAction func buttonAction(sender: AnyObject) {
        loadFreshWeatherReport()
    }
    
    // MARK: - Private
    
    func configureDateFormatter() {
        dateFormatter = NSDateFormatter()
        dateFormatter?.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter?.timeStyle = NSDateFormatterStyle.MediumStyle
    }
    
    func loadFreshWeatherReport() {
        if let service = weatherService {
            self.updateUI(true)
            service.fetchWeatherReport(1.1, longitude: 1.1) { (result: WeatherServiceFetchResult) in
                switch result {
                case .Success(let report):
                    self.currentReport = report
                    self.updateUI(false)
                case .Failure(let error):
                    print("Fetch failed with error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func updateUI(showLoadingText: Bool) {
        if showLoadingText {
            self.temperatureLabel.text = "Loading..."
            self.summaryLabel.text = nil
            self.dateLabel.text = nil
            return // bail
        }
        
        if let report = currentReport {
            dispatch_async(dispatch_get_main_queue(), {
                let displayTemp = String(format: "%.0f", report.temperature)
                self.temperatureLabel.text = "\(displayTemp)"
                self.summaryLabel.text = report.summary
                self.dateLabel.text = self.dateFormatter?.stringFromDate(report.date)
                if let image = report.iconImage() {
                    self.imageView.image = image
                }
            })
        }
    }
    
}

