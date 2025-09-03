//
//  ContactsListCell.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 8/26/25.
//

import UIKit
class ContactsListCell: UITableViewCell {
    static let reuseIdentifier = "ContactsListCell"
    let titleLabel = UILabel()
    let badgeContainer = UIView()
    let badgeLabel = UILabel()
    let avatarImageView = UIImageView()
    let flagImageView = UIImageView()
   

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .blue
        let selectedBG = UIView()
        selectedBG.backgroundColor = .systemTeal
        self.selectedBackgroundView = selectedBG
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.contentMode = .scaleAspectFit
        avatarImageView.clipsToBounds = true
        let avatarSize: CGFloat = 44
        avatarImageView.widthAnchor.constraint(equalToConstant: avatarSize).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: avatarSize).isActive = true
        contentView.addSubview(avatarImageView)
        
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        flagImageView.contentMode = .scaleAspectFit
        flagImageView.clipsToBounds = true
        let flagSize: CGFloat = 24
        flagImageView.widthAnchor.constraint(equalToConstant: flagSize).isActive = true
        flagImageView.heightAnchor.constraint(equalToConstant: flagSize).isActive = true
        contentView.addSubview(flagImageView)
        
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        badgeContainer.layer.cornerRadius = 8
        badgeContainer.backgroundColor = .systemTeal
        badgeContainer.translatesAutoresizingMaskIntoConstraints = false
        
        badgeLabel.font = .systemFont(ofSize: 13, weight: .regular)
        badgeLabel.textColor = .white
        badgeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(badgeContainer)
        badgeContainer.addSubview(badgeLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            
            flagImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            flagImageView.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12),
            //titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: flagImageView.leadingAnchor, constant: -12),
            
            badgeContainer.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            badgeContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            badgeContainer.trailingAnchor.constraint(lessThanOrEqualTo: flagImageView.leadingAnchor, constant: -12),
            badgeContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        
            badgeLabel.topAnchor.constraint(equalTo: badgeContainer.topAnchor, constant: 6),
            badgeLabel.bottomAnchor.constraint(equalTo: badgeContainer.bottomAnchor, constant: -6),
            badgeLabel.leadingAnchor.constraint(equalTo: badgeContainer.leadingAnchor, constant: 10),
            badgeLabel.trailingAnchor.constraint(equalTo: badgeContainer.trailingAnchor, constant: -10)
        ]
        )
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.width / 2
        flagImageView.layer.cornerRadius = flagImageView.bounds.width / 2
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        badgeLabel.text = nil
        titleLabel.text = nil
        avatarImageView.image = nil
        flagImageView.image = nil
    }
    func configure(with viewModel: ContactItems) {
        titleLabel.text = viewModel.name
        badgeLabel.text = viewModel.role
        avatarImageView.image = UIImage(named: viewModel.avatar)
        flagImageView.image = UIImage(named:viewModel.flag)
    }
}
