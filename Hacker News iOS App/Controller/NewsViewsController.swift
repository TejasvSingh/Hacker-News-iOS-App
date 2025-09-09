import UIKit

class NewsViewController: UIViewController {
    //var nVM: NewsViewModelProtocol?

    private let tableView = UITableView(frame: .zero, style: .plain)
    private let viewModel = NewsListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        view.backgroundColor = .black
        configureNavBar()
        configureTable()
        viewModel.getDataFromServer {[weak self] in  DispatchQueue.main.async {
            print("📡 Network completion handler called")
            self?.tableView.reloadData()
        }
        }
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Go Back", style: .plain, target: self, action: #selector(handleBackButton))
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
    
    @objc func handleBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}


extension NewsViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getStoryCount()
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: NewsCell.reuseID,
            for: indexPath
        ) as? NewsCell else { return UITableViewCell() }

        let story = viewModel.getStory(at: indexPath.row) 
        cell.configure(with: story)
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let story = viewModel.getStory(at: indexPath.row)
        let detailVC = DetailsViewController(story: story)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

