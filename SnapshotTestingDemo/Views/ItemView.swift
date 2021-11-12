//
//  ItemView.swift
//  SnapshotTestingDemo
//
//  Created by Miguel de Elias on 12/11/21.
//

import Foundation
import UIKit

final class ItemView: UIView {

    private
    enum Constants {
        static let margin: CGFloat = 24.0
    }

    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let bodyLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white

        imageView.contentMode = .scaleAspectFit

        titleLabel.font = .preferredFont(forTextStyle: .headline)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0

        bodyLabel.font = .preferredFont(forTextStyle: .footnote)
        bodyLabel.textColor = .black
        bodyLabel.numberOfLines = 0

        let vStackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
        vStackView.axis = .vertical

        let hStackView = UIStackView(arrangedSubviews: [imageView, vStackView])
        hStackView.axis = .horizontal
        hStackView.spacing = 24
        hStackView.alignment = .top
        hStackView.distribution = .fillProportionally

        addSubview(hStackView)
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hStackView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.margin),
            hStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.margin),
            hStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.margin),
            hStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -Constants.margin)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bind(_ viewModel: ItemViewModel) {
        imageView.image = viewModel.image
        titleLabel.text = viewModel.title
        bodyLabel.text = viewModel.body
    }
}
