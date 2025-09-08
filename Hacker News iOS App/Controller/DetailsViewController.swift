//
//  DetailsViewController.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 9/4/25.
//
import UIKit
class DetailsViewController: UIViewController {
    private let story: Story
        
        private let titleLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 20, weight: .bold)
            label.textColor = .white
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let authorLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 16, weight: .medium)
            label.textColor = .systemGray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let pointsLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 16, weight: .medium)
            label.textColor = .systemBlue
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let commentsLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 16, weight: .medium)
            label.textColor = .systemOrange
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        private let timeLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 14, weight: .regular)
            label.textColor = .systemGray2
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        init(story: Story) {
            self.story = story
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            configureContent()
        }
        
        private func setupUI() {
            view.backgroundColor = .black
            title = "Story Details"
            
            // Add all labels to view
            view.addSubview(titleLabel)
            view.addSubview(authorLabel)
            view.addSubview(pointsLabel)
            view.addSubview(commentsLabel)
            view.addSubview(timeLabel)
            
            // Setup constraints
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                
                authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
                authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                
                timeLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
                timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                
                pointsLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 16),
                pointsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                
                commentsLabel.topAnchor.constraint(equalTo: pointsLabel.bottomAnchor, constant: 8),
                commentsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            ])
        }
        
        private func configureContent() {
            titleLabel.text = story.title
            authorLabel.text = "Author: \(story.author)"
            timeLabel.text = "Posted \(story.hoursAgo) hours ago"
            pointsLabel.text = "Points: \(story.points)"
            commentsLabel.text = "Comments: \(story.comments)"
            
          
            print("Configured content:")
            print("Title: \(story.title)")
            print("Author: \(story.author)")
            print("Points: \(story.points)")
            print("Comments: \(story.comments)")
        }
}
