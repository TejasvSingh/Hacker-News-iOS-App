//
//  ArticleListCell.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 9/8/25.
//
import UIKit
class ArticleListCell: UITableViewCell {
    static let reuseIdentifier = "ArticleListCell"
    var authorLabel = UILabel()
    var descriptionLabel = UILabel()
    var imageLabel = UIImageView()
    var publishedDateLabel = UILabel()
    
    let shareIcon = UIImageView(image: UIImage(systemName: "square.and.arrow.up"))

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let imageSize: CGFloat = 88
        shareIcon.tintColor = .systemBlue
                shareIcon.contentMode = .scaleAspectFit
                shareIcon.translatesAutoresizingMaskIntoConstraints = false

                contentView.addSubview(shareIcon)
        imageLabel.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        imageLabel.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
        imageLabel.contentMode = .scaleAspectFill
        imageLabel.clipsToBounds = true
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        publishedDateLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.numberOfLines = 0
        authorLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        publishedDateLabel.numberOfLines = 0
        authorLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        authorLabel.textColor = .blue
        descriptionLabel.font = .systemFont(ofSize: 10, weight: .semibold)
        descriptionLabel.textColor = .label
        publishedDateLabel.font = .systemFont(ofSize: 10, weight: .regular)
        publishedDateLabel.textColor = .label
        contentView.addSubview(authorLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(publishedDateLabel)
        contentView.addSubview(imageLabel)
        NSLayoutConstraint.activate([imageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                                     shareIcon.centerYAnchor.constraint(equalTo: publishedDateLabel.centerYAnchor),
                                                shareIcon.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
                                                shareIcon.widthAnchor.constraint(equalToConstant: 18),
                                                shareIcon.heightAnchor.constraint(equalToConstant: 18),
                                     imageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                                     imageLabel.widthAnchor.constraint(equalToConstant: 88),
                                     imageLabel.heightAnchor.constraint(equalToConstant: 88),
                                     imageLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -12),

                                    
                                     authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                                     authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                                     authorLabel.trailingAnchor.constraint(equalTo: imageLabel.leadingAnchor, constant: -12),

                        
                                     descriptionLabel.leadingAnchor.constraint(equalTo: authorLabel.leadingAnchor),
                                     descriptionLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 4),
                                     descriptionLabel.trailingAnchor.constraint(equalTo: imageLabel.leadingAnchor, constant: -12),

                                     
                                     publishedDateLabel.leadingAnchor.constraint(equalTo: shareIcon.trailingAnchor, constant: 6),
                                     publishedDateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6),
                                     publishedDateLabel.trailingAnchor.constraint(equalTo: authorLabel.trailingAnchor),
                                     publishedDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
                                    ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with viewModel: ArticleList) {
        imageLabel.image = UIImage(systemName: "photo") // placeholder

           if let urlString = viewModel.urlToImage,
              let url = URL(string: urlString) {
               URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                   guard let self = self,
                         let data = data,
                         error == nil,
                         let img = UIImage(data: data) else { return }
                   DispatchQueue.main.async {
                       self.imageLabel.image = img
                   }
               }.resume()
           }
        //publishedDateLabel.text = viewModel.publishedAt
        let fullDate = viewModel.publishedAt
        let onlyDate = fullDate.split(separator: "T").first.map(String.init) ?? fullDate
        publishedDateLabel.text = onlyDate
        descriptionLabel.text = viewModel.description
        authorLabel.text = viewModel.author
    }
}
