//
//  NewsViewModel.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 9/3/25.
//
import UIKit


// MARK: Table View Datasource and Delegate Methods
extension NewsViewController: UITableViewDataSource, UITableViewDelegate {

    func configureNavBar() {
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

     func configureTable() {
        //view.addSubview(tableView)
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

