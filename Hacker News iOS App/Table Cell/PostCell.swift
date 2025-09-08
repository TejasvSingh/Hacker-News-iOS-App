import UIKit

class PostCell: UITableViewCell {
    static let reuseID = "PostCell"

    private let userIdLabel = UILabel()
    private let idLabel = UILabel()
    private let titleLabel = UILabel()
    private let bodyLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with post: Post) {
        userIdLabel.text = "User ID: \(post.userId)"
        idLabel.text = "Post ID: \(post.id)"
        titleLabel.text = post.title
        bodyLabel.text = post.body
    }

    private func setupViews() {
        [userIdLabel, idLabel, titleLabel, bodyLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.numberOfLines = 0
            contentView.addSubview($0)
        }

        titleLabel.font = .boldSystemFont(ofSize: 16)
        bodyLabel.font = .systemFont(ofSize: 14)
        userIdLabel.font = .systemFont(ofSize: 13)
        idLabel.font = .systemFont(ofSize: 13)
        userIdLabel.textColor = .darkGray
        idLabel.textColor = .darkGray

        NSLayoutConstraint.activate([
            userIdLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            userIdLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            userIdLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            idLabel.topAnchor.constraint(equalTo: userIdLabel.bottomAnchor, constant: 4),
            idLabel.leadingAnchor.constraint(equalTo: userIdLabel.leadingAnchor),
            idLabel.trailingAnchor.constraint(equalTo: userIdLabel.trailingAnchor),

            titleLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: idLabel.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: idLabel.trailingAnchor),

            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bodyLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            bodyLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
}
