//
//  ArticleListController.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 9/8/25.
//
import UIKit
class ArticleListController: UIViewController, UITableViewDataSource {
    var tableView = UITableView()
    let viewModel = ArticleListViewModel()
    let searchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchController()
        setupTableView()

        viewModel.getDataFromServer { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        //tableView.delegate = self
        tableView.register(ArticleListCell.self, forCellReuseIdentifier: ArticleListCell.reuseIdentifier)
    }
    
    func configureSearchController() {
        searchController.searchBar.placeholder = "Search"
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.searchTextField.backgroundColor = .systemGray6
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getArticlesCount()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleListCell.reuseIdentifier, for: indexPath) as! ArticleListCell
        cell.configure(with: viewModel.getArticle(at: indexPath.row))
        return cell
    }
    func configureTableView() {
        tableView.dataSource = self
        view.addSubview(tableView)
    }
}
