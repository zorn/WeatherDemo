import UIKit

class LaunchMenuViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var launchMenu: LaunchMenu?
    
    // MARK - UIViewController
    
    override func viewDidLoad() {
        self.title = "Menu"
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
        if let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell") as? UITableViewCell {
            configureCell(cell, indexPath: indexPath)
            return cell
        } else {
            let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MenuCell")
            configureCell(cell, indexPath: indexPath)
            return cell
        }
    }
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) {
        if let item = launchMenu?.sections[indexPath.section].items[indexPath.row] {
            cell.textLabel?.text = item.title
            cell.detailTextLabel?.text = item.details
            cell.accessoryType = .DisclosureIndicator
        } else {
            println("ERROR: Could not find menu item to configure cell with.")
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let item = launchMenu?.sections[indexPath.section].items[indexPath.row] {
            item.runAction()
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let section = launchMenu?.sections[section] {
            return section.title
        } else {
            return nil
        }
    }

    
}