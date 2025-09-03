//
//  SearchViewController.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 8/29/25.
//

import UIKit
class SearchViewController: UIViewController, UITextFieldDelegate {
    let searchField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchField.frame = CGRect(x: 10, y: 100, width: view.frame.width - 20, height: 50)
        searchField.borderStyle = .roundedRect
        view.addSubview(searchField)
        searchField.delegate = self
        
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 10
    }
}
