import UIKit

class WeatherDisplayViewController : UIViewController {

    var weatherService: WeatherService?
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        weatherService = WeatherService()
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        if let service = weatherService {
            let currentReport = service.fetchWeatherReport(latitude: 1.1, longitude: 1.2)
            summaryLabel.text = currentReport.summary
        }
        super.viewWillAppear(animated)
    }
    
}

