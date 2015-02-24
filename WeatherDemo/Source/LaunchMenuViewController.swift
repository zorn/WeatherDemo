import UIKit

class LaunchMenuViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var launchMenu: LaunchMenu?
    
    // MARK - UIViewController
    
    override func viewDidLoad() {
        self.title = "Menu"
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Basic")
        super.viewDidLoad()
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let menu = launchMenu {
            return menu.sections.count
        } else {
            return 0;
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let menu = launchMenu {
            return menu.sections[section].items.count;
        } else {
            return 0;
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var returnCell: UITableViewCell?
        if let item = launchMenu?.sections[indexPath.section].items[indexPath.row] {
            if let cell = tableView.dequeueReusableCellWithIdentifier("Basic", forIndexPath: indexPath) as? UITableViewCell {
                cell.textLabel?.text = item.title
                cell.detailTextLabel?.text = item.details
                cell.accessoryType = .DisclosureIndicator
                return cell
            }
        }
        
        if returnCell == nil {
            returnCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Bug")
            returnCell?.textLabel?.text = "Could not build cell for item at indexPath: \(indexPath)"
        }
        return returnCell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let item = launchMenu?.sections[indexPath.section].items[indexPath.row] {
            item.runAction()
        }
    }
    
}