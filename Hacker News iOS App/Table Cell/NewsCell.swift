import UIKit

final class NewsCell: UITableViewCell {
    static let reuseID = "NewsCell"

    private let titleLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 17, weight: .semibold)
        l.textColor = .white
        l.numberOfLines = 2
        return l
    }()

    private let metaLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 13, weight: .medium)
        l.textColor = .systemGray2
        return l
    }()

    private let pointsIcon: UIImageView = {
        let iv = NewsCell.icon(systemName: "clock")
        iv.tintColor = .systemBlue
        return iv
    }()

    private let commentsIcon: UIImageView = {
        let iv = NewsCell.icon(systemName: "text.bubble")
        iv.tintColor = .systemOrange
        return iv
    }()
    private let pointsLabel = NewsCell.metaStatLabel(color: .systemBlue)
    private let commentsLabel = NewsCell.metaStatLabel(color: .systemOrange)

    private let vstack = UIStackView()
    private let statsRow = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .default
        accessoryType = .disclosureIndicator
        backgroundColor = .black
        contentView.backgroundColor = .black
       

        vstack.axis = .vertical
        vstack.spacing = 6
        vstack.translatesAutoresizingMaskIntoConstraints = false

        statsRow.axis = .horizontal
        statsRow.spacing = 12
        statsRow.alignment = .center

        contentView.addSubview(vstack)
        vstack.addArrangedSubview(titleLabel)
        vstack.addArrangedSubview(metaLabel)

        
        let pointsStack = UIStackView(arrangedSubviews: [pointsIcon, pointsLabel])
        pointsStack.axis = .horizontal
        pointsStack.spacing = 6
        let commentsStack = UIStackView(arrangedSubviews: [commentsIcon, commentsLabel])
        commentsStack.axis = .horizontal
        commentsStack.spacing = 6
        let totalStack = UIStackView(arrangedSubviews: [pointsStack, commentsStack])
        totalStack.axis = .horizontal
        totalStack.spacing = 6

        statsRow.addArrangedSubview(pointsStack)
        statsRow.addArrangedSubview(commentsStack)
        statsRow.addArrangedSubview(totalStack)
        vstack.addArrangedSubview(statsRow)

        NSLayoutConstraint.activate([
            vstack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            vstack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            vstack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            vstack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    func configure(with story: Story) {
        titleLabel.text = story.title
        metaLabel.text = "\(String(describing: story.author)) · \(String(describing: story.hoursAgo))h ago · by \(String(describing: story.author))"
        pointsLabel.text = "\(String(describing: story.points))"
        commentsLabel.text = "\(String(describing: story.comments))"
    }

    private static func icon(systemName: String) -> UIImageView {
        let iv = UIImageView(image: UIImage(systemName: systemName))
        iv.tintColor = .systemGray2
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iv.widthAnchor.constraint(equalToConstant: 14),
            iv.heightAnchor.constraint(equalToConstant: 14)
        ])
        return iv
    }

    private static func metaStatLabel(color: UIColor) -> UILabel {
        let l = UILabel()
        l.font = .systemFont(ofSize: 13, weight: .medium)
        l.textColor = color
        return l
    }
}

