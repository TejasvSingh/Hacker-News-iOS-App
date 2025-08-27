//
//  ContactsViewController.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 8/26/25.
//

import UIKit
struct ContactItems {
    let name: String
    let role: String
    let avatar: String
    let flag: String
}

class ContactsViewController: UIViewController, UITableViewDataSource {
    let tableView = UITableView()
    let Contacts: [ContactItems] = [
        .init(name: "Mohammad Hussain", role: "SEO Specialist", avatar: "mAvatar", flag: "mFlag"),
        .init(name: "John Young", role: "Interactive Designer", avatar: "jAvatar", flag: "jFlag"),
        .init(name: "Tamilarasi Mohan", role: "Architect", avatar: "tAvatar", flag: "tFlag"),
        .init(name: "Kim Yu", role: "Economist", avatar: "kAvatar", flag: "kFlag"),
        .init(name: "Derek Fowler", role: "Web Strategist", avatar: "dAvatar", flag: "dFlag"),
        .init(name: "Shreya Nithin", role: "Product Designer", avatar: "sAvatar", flag: "sFlag"),
        .init(name: "Emily Adams", role: "Editor", avatar: "eAvatar", flag: "eFlag"),
    ]
    let searchController = UISearchController(searchResultsController: nil)
    var filteredList : [ContactItems] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        title = "Contacts"
        let appearance = UINavigationBarAppearance()
        //appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemBlue
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        //navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        tableView.frame = view.bounds
        tableView.dataSource = self
        searchController.searchBar.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 68
        tableView.register(ContactsListCell.self, forCellReuseIdentifier: ContactsListCell.reuseIdentifier)
        searchController.searchResultsUpdater = nil
        searchController.searchBar.placeholder = "Search"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.searchTextField.backgroundColor = .systemGray6
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return filteredList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactsListCell.reuseIdentifier, for: indexPath) as! ContactsListCell
        cell.configure(with: filteredList[indexPath.row])
        return cell
    }
}

extension ContactsViewController: UISearchBarDelegate{
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool{
        print("staretedEditing")
            return true
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("search:",searchText)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        filteredList=[]
        for contact in Contacts{
            if contact.name.lowercased().contains(searchBar.text!.lowercased()){
                filteredList.append(contact)
            }
        }
        tableView.reloadData()
        print("clicked:",searchBar.text ?? "nil")
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("Ended:",searchBar.text ?? "nil")
    }
}
