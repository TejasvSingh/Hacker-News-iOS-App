//
//  PostViewCell.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 9/5/25.
//

import UIKit

class PostViewController: UIViewController {
    private let tableView = UITableView()
    private let viewModel = PostViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        view.backgroundColor = .white
        setupTableView()

        viewModel.getDataFromServer { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    private func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.reuseID)
    }
}

extension PostViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count()
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseID) as? PostCell else {
            return UITableViewCell()
        }

        let post = viewModel.post(at: indexPath.row)
        cell.configure(with: post)
        return cell
    }
}
