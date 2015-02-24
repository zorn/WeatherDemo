import UIKit

class LaunchMenuViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    let launchMenu: LaunchMenu
    
    required init(launchMenu: LaunchMenu) {
        self.launchMenu = launchMenu
        super.init(style: .Grouped)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Need this to prevent runtime error:
    // fatal error: use of unimplemented initializer 'init(nibName:bundle:)'
    // I made this private since users should use the no-argument constructor.
    private override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        self.launchMenu = LaunchMenu(sections: [])
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    // MARK - UIViewController
    
    override func viewDidLoad() {
        self.title = "Menu"
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Basic")
        super.viewDidLoad()
    }
    
    // MARK: - UITableViewDataSource
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return launchMenu.sections.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launchMenu.sections[section].items.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let item = launchMenu.sections[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("Basic", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = item.title
        cell.detailTextLabel?.text = item.details
        return cell
    }
    
}