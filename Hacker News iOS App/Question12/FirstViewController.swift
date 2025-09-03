//
//  FirstViewController.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 8/29/25.
//
import UIKit
class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First"
        view.backgroundColor = .systemGreen
        let presentButton = UIButton(type: .system)
        presentButton.setTitle("Click here to change background color to Red", for: .normal)
        presentButton.addTarget(self, action: #selector(Present), for: .touchUpInside)
        view.addSubview(presentButton)
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        
        
//        let pushButton = UIButton(type: .system)
//        pushButton.setTitle("Push", for: .normal)
//        pushButton.backgroundColor = .systemBlue
//        pushButton.setTitleColor(.white, for: .normal)
//        pushButton.layer.cornerRadius = 25
//        pushButton.addTarget(self, action: #selector(Push), for: .touchUpInside)
//        view.addSubview(pushButton)
//        pushButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            presentButton.widthAnchor.constraint(equalToConstant: 400),
        ])
    }
    @objc func Present() {
        let vc = storyboard!.instantiateViewController(withIdentifier: "PresentedVC")
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
//    @objc func Push() {
//        let vc = storyboard!.instantiateViewController(withIdentifier: "PushedVC")
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true)
//    }
}
