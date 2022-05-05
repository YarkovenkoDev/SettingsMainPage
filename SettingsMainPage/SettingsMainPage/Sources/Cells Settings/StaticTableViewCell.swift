//
//  StaticTableViewCell.swift
//  SettingsMainPage
//
//  Created by Daniil Yarkovenko on 06.05.2022.
//

import UIKit

class StaticTableViewCell: UITableViewCell {

    static let identifier = "StaticTableViewCell"

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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
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

    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
    }

    public func configure(with model: SettingsStaticOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
    }

}

extension UITableViewCell {
    enum Metric {
        static let iconCornerRadius: CGFloat = 8
    }
}


