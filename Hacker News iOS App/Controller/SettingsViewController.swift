import UIKit



final class SettingsViewController: UIViewController, UITableViewDataSource {
     let tableView = UITableView(frame: .zero, style: .insetGrouped)
    let objSettings = SettingsSection.getSettingsList()
    // MARK: Helper Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.backgroundColor = .black
        tableView.contentInset.top = 40
        configureTable()
        configureNavBar()
    }


    // MARK: Table View Datasource and Delegate Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return objSettings.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objSettings[section].rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = objSettings[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseID, for: indexPath) as! SettingsCell
        cell.configure(with: item)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

