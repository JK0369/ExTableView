//
//  MyCollectionViewCell.swift
//  ExTableView
//
//  Created by 김종권 on 2021/10/20.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    let myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.autoresizingMask = [.flexibleTopMargin, .flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin]

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .lightGray

        contentView.addSubview(myLabel)

        myLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            myLabel.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}
