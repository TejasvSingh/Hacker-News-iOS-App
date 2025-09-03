//
//  ContactsViewController.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 8/26/25.
//

import UIKit


class ContactsViewController: UIViewController, UITableViewDataSource {
    let tableView = UITableView()
    let objContacts = ContactItems.getContactsList()
    let searchController = UISearchController(searchResultsController: nil)
    var filteredList : [ContactItems] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        title = "Contacts"
        configureSearchController()
        configureTableView()
    }

// MARK: Table View Datasource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  searchController.isActive && !searchController.searchBar.text!.isEmpty{
            return filteredList.count
        }
        else {
            return objContacts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactsListCell.reuseIdentifier, for: indexPath) as! ContactsListCell
        if  searchController.isActive && !searchController.searchBar.text!.isEmpty{
            cell.configure(with:  filteredList[indexPath.row])
        }
        else {
            cell.configure(with:  objContacts[indexPath.row])
        }
        return cell
    }
}
