import UIKit

final class SettingsCell: UITableViewCell {
    static let reuseID = "SettingsCell"

    let iconContainer = UIView()
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    let valueLabel = UILabel()
    var toggleSwitch: UISwitch?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    func setupUI() {
        selectionStyle = .default

       
        backgroundColor = .secondarySystemGroupedBackground
        contentView.backgroundColor = .secondarySystemGroupedBackground

        
        iconContainer.translatesAutoresizingMaskIntoConstraints = false
        iconContainer.layer.cornerRadius = 6
        iconContainer.clipsToBounds = true

        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.tintColor = .white
        iconImageView.contentMode = .scaleAspectFit

        titleLabel.font = .systemFont(ofSize: 17)
        titleLabel.textColor = .label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        valueLabel.font = .systemFont(ofSize: 15)
        valueLabel.textColor = .secondaryLabel
        valueLabel.textAlignment = .right
        valueLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false      

        
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)

        
        NSLayoutConstraint.activate([
            iconContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconContainer.widthAnchor.constraint(equalToConstant: 28),
            iconContainer.heightAnchor.constraint(equalToConstant: 28),

            iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 18),
            iconImageView.heightAnchor.constraint(equalToConstant: 18),

            titleLabel.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            valueLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            valueLabel.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 8),

            // Ensure a reasonable minimum row height
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 44)
        ])
    }

    func configure(with item: SettingsItem) {
        accessoryView = nil
        accessoryType = .disclosureIndicator
        toggleSwitch = nil

        switch item {
        case let .toggle(icon, color, title, isOn):
            iconContainer.backgroundColor = color
            iconImageView.image = UIImage(systemName: icon)?.withRenderingMode(.alwaysTemplate)
            titleLabel.text = title
            valueLabel.text = nil

            let sw = UISwitch()
            sw.isOn = isOn
            accessoryView = sw
            accessoryType = .none
            toggleSwitch = sw

        case let .link(icon, color, title, value):
            iconContainer.backgroundColor = color
            iconImageView.image = UIImage(systemName: icon)?.withRenderingMode(.alwaysTemplate)
            titleLabel.text = title
            valueLabel.text = value
        }
    }
}
