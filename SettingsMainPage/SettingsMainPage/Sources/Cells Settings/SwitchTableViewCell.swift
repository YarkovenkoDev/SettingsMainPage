//
//  SwitchTableViewCell.swift
//  SettingsMainPage
//
//  Created by Daniil Yarkovenko on 06.05.2022.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    static let identifier = "SwitchTableViewCell"

    private lazy var iconContainer: UIView = {
        let view = UIView()

        view.clipsToBounds = true
        view.layer.cornerRadius = Metric.iconCornerRadius
        view.layer.masksToBounds = true

        return view
    }()

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()

        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    private lazy var label: UILabel = {
        let label = UILabel()

        label.numberOfLines = 1

        return label
    }()

    private lazy var switchButton: UISwitch = {
        let switchButton = UISwitch()

        switchButton.onTintColor = .systemGreen

        return switchButton
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(switchButton)
        contentView.clipsToBounds = true
        accessoryType = .none
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let size = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(
            x: 15,
            y: 6,
            width: size,
            height: size
        )

        let imageSize = size/1.5
        iconImageView.frame = CGRect(
            x: (size - imageSize) / 2 ,
            y: (size - imageSize) / 2,
            width: imageSize,
            height: imageSize
        )

        label.frame = CGRect(
            x: 30 + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 15 - iconContainer.frame.size.width,
            height: contentView.frame.size.height
        )

        switchButton.sizeToFit()
        switchButton.frame = CGRect(
            x: contentView.frame.size.width - switchButton.frame.size.width - 20,
            y: (contentView.frame.size.height - switchButton.frame.size.height) / 2,
            width: switchButton.frame.size.width,
            height: switchButton.frame.size.height
        )
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        switchButton.isOn = false
    }

    public func configure(with model: SettingsSwitchOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        switchButton.isOn = model.isOn
    }

}

