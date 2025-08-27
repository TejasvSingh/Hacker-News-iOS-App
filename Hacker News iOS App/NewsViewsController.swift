import UIKit

struct Story {
    let title: String
    let points: Int
    let comments: Int
    let author: String
    let hoursAgo: Int
}

final class NewsViewController: UIViewController {
    private let tableView = UITableView(frame: .zero, style: .plain)

    private let items: [Story] = [
        .init(title: "Show HN: Draw a fish and watch it swim with the others", points: 813, comments: 211, author: "halifax", hoursAgo: 6),
        .init(title: "At 17, Hannah Cairo solved a major math mystery", points: 742, comments: 98, author: "tanchel", hoursAgo: 12),
        .init(title: "Cerebras Code", points: 206, comments: 42, author: "clint", hoursAgo: 7),
        .init(title: "I couldn't submit a PR, so I got hired and fixed it myself", points: 389, comments: 126, author: "ayush", hoursAgo: 16),
        .init(title: "Google white-glove policy: tracking links unchecked, echo leaks preserved", points: 205, comments: 66, author: "nadi", hoursAgo: 20)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        view.backgroundColor = .black
        configureNavBar()
        configureTable()
    }

    private func configureNavBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let ap = UINavigationBarAppearance()
        ap.configureWithOpaqueBackground()
        ap.backgroundColor = .black
        ap.titleTextAttributes = [.foregroundColor: UIColor.white]
        ap.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = ap
        navigationController?.navigationBar.scrollEdgeAppearance = ap
        navigationController?.navigationBar.tintColor = .white
    }

    private func configureTable() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.backgroundColor = .black
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 72

        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.reuseID)
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { items.count }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseID, for: indexPath) as! NewsCell
        cell.configure(with: items[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
