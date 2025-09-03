//
//  SettingsViewModel.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 9/3/25.
//
import UIKit
extension SettingsViewController: UITableViewDelegate{
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
     func configureNavBar() {
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
}
