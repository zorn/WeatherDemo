import UIKit

class LaunchMenuViewController: UITableViewController {
    
    // MARK - UIViewController
    
    override func viewDidLoad() {
        self.title = "Menu"
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Basic")
        super.viewDidLoad()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Basic", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = "IndexPath: \(indexPath)"
        return cell
    }
    
}