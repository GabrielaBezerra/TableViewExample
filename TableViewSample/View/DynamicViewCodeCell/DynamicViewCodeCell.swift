//
//  DynamicViewCodeCell.swift
//  TableViewSample
//
//  Created by Gabriela Bezerra on 22/08/21.
//  Copyright © 2021 sharkberry. All rights reserved.
//

import Foundation
import UIKit

class DynamicViewCodeCell: UITableViewCell {

    lazy var topImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemRed
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let headingLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 0
        return label
    }()

    let bodyLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        return label
    }()

    let cardView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        view.layer.cornerRadius = 11
        view.applyShadow()
        return view
    }()

    init(heading: String, body: String, image: UIImage? = nil) {
        super.init(style: .default, reuseIdentifier: nil)
        self.selectionStyle = .none
        
        setupLayout()

        self.headingLabel.text = heading
        self.bodyLabel.text = body

        if let image = image {
            topImageView.image = image
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        self.backgroundColor = .clear

        cardView.addSubview(topImageView)
        cardView.addSubview(headingLabel)
        cardView.addSubview(bodyLabel)
        cardView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        self.contentView.addSubview(cardView)
        self.contentView.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 15),
            cardView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            cardView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),

            topImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            topImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            topImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),

            headingLabel.topAnchor.constraint(equalTo: topImageView.bottomAnchor, constant: 10),
            headingLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            headingLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -20),

            bodyLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 10),
            bodyLabel.leadingAnchor.constraint(equalTo: headingLabel.leadingAnchor),
            bodyLabel.trailingAnchor.constraint(equalTo: headingLabel.trailingAnchor),
            bodyLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -20),
        ])
    }

}
