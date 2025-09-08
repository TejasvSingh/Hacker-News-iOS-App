//
//  Extensions.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 9/5/25.
//

import UIKit

extension String {
    func upperCasedFirstLetter() -> String {
        guard let firstCharacter = first else {
            return self
        }
        return String(firstCharacter).uppercased() + dropFirst()
    }
}


extension UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
}
