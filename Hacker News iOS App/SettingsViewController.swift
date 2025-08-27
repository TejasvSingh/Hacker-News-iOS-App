import UIKit


enum SettingsItem {
    case toggle(icon: String, iconColor: UIColor, title: String, isOn: Bool)
    case link(icon: String, iconColor: UIColor, title: String, value: String? = nil)
}
struct SettingsSection { let rows: [SettingsItem] }


final class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
     let tableView = UITableView(frame: .zero, style: .insetGrouped)

     let sections: [SettingsSection] = [
        SettingsSection(rows: [
            .toggle(icon: "airplane", iconColor: .systemOrange, title: "Airplane Mode", isOn: false),
            .link(icon: "wifi", iconColor: .systemBlue, title: "Wi-Fi", value: "T-Mobile"),
            .link(icon: "bolt.horizontal", iconColor: .systemBlue, title: "Bluetooth", value: "Not Connected"),
            .link(icon: "antenna.radiowaves.left.and.right", iconColor: .systemGreen, title: "Cellular", value: "Off"),
            .link(icon: "personalhotspot", iconColor: .systemGreen, title: "Personal Hotspot", value: "Off"),
            .link(icon: "battery.100", iconColor: .systemGreen, title: "Battery")
        ]),
        SettingsSection(rows: [
            .link(icon: "gear", iconColor: .systemGray, title: "General"),
            .link(icon: "accessibility", iconColor: .systemBlue, title: "Accessibility"),
            .link(icon: "rectangle.and.hand.point.up.left", iconColor: .systemBlue, title: "Action Button"),
            .link(icon: "brain.head.profile", iconColor: .systemPink, title: "Apple Intelligence & Siri"),
            .link(icon: "camera", iconColor: .systemGray, title: "Camera"),
            .link(icon: "switch.2", iconColor: .systemGray, title: "Control Center"),
            .link(icon: "sun.max", iconColor: .systemBlue, title: "Display & Brightness"),
            .link(icon: "apps.iphone", iconColor: .systemBlue, title: "Home Screen & App Library"),
            .link(icon: "magnifyingglass", iconColor: .systemGray, title: "Search"),
            .link(icon: "bed.double", iconColor: .black, title: "StandBy"),
            .link(icon: "photo.on.rectangle", iconColor: .systemBlue, title: "Wallpaper")
        ]),
        SettingsSection(rows: [.link(icon: "bell.badge.fill", iconColor: .systemRed, title: "Notifications"),
                               .link(icon: "speaker.wave.3.fill", iconColor: .systemRed, title: "Sounds & Haptics"),
                               .link(icon: "moon.fill", iconColor: .systemPurple, title: "Focus"),
                               .link(icon: "hourglass", iconColor: .systemIndigo, title: "Screen Time")]),
        SettingsSection(rows: [.link(icon: "faceid", iconColor: .systemGreen, title: "Face ID & Passcode"),
                               .link(icon: "sos", iconColor: .systemRed, title: "Emergency SOS"),
                               .link(icon: "hand.raised.fill", iconColor: .systemBlue, title: "Privacy & Security")]),
        SettingsSection(rows: [.link(icon: "gamecontroller.fill", iconColor: .systemTeal, title: "Game Center"),
                               .link(icon: "icloud.fill", iconColor: .systemBlue, title: "iCloud"),
                               .link(icon: "wallet.pass.fill", iconColor: .systemGray, title: "Wallet & Apple Pay")]),
        SettingsSection(rows: [.link(icon: "square.grid.2x2.fill", iconColor: .systemPurple, title: "Apps")
                              ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.backgroundColor = .black
        tableView.contentInset.top = 40
        configureTable()
        configureNavBar()
    }

     func configureTable() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
         tableView.backgroundColor = .systemGray5
         tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
         tableView.rowHeight = UITableView.automaticDimension
         tableView.estimatedRowHeight = 72

         tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.reuseID)
         tableView.dataSource = self
         tableView.delegate = self

    }
    private func configureNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let ap = UINavigationBarAppearance()
        ap.configureWithOpaqueBackground()
        ap.backgroundColor = .systemGray5
        ap.titleTextAttributes = [.foregroundColor: UIColor.black]
        ap.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        ap.shadowColor = .clear
        navigationController?.navigationBar.standardAppearance = ap
        navigationController?.navigationBar.scrollEdgeAppearance = ap
        navigationController?.navigationBar.compactAppearance = ap
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseID, for: indexPath) as! SettingsCell
        cell.configure(with: item)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

