//
//  ContactsViewModel.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 9/3/25.
//
import UIKit
// MARK: Helper Methods
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
        for contact in objContacts{
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
    func configureSearchController() {
        //searchController.searchResultsUpdater = nil
        searchController.searchBar.placeholder = "Search"
        //searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.searchTextField.backgroundColor = .systemGray6
        navigationItem.searchController = searchController
        //navigationItem.hidesSearchBarWhenScrolling = false
        //definesPresentationContext = true
        navigationController?.navigationBar.prefersLargeTitles = true
        //navigationItem.largeTitleDisplayMode = .always
    }
    func configureTableView() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemTeal
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        tableView.frame = view.bounds
        tableView.dataSource = self
        searchController.searchBar.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        //tableView.estimatedRowHeight = 68
        tableView.register(ContactsListCell.self, forCellReuseIdentifier: ContactsListCell.reuseIdentifier)
    }
}
