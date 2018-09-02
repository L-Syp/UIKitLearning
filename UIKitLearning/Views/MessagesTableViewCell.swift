//
// Created by Łukasz Sypniewski on 02/09/2018.
// Copyright (c) 2018 Łukasz Sypniewski. All rights reserved.
//

import Foundation
import UIKit

class MessagesTableViewCell: UITableViewCell {

    private var messageLabel = UILabel()
    private var bubbleBackgroundView = UIView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubviews()

        setMessageLabel()
        setBubbleBackgroundView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        self.addSubview(bubbleBackgroundView)
        self.addSubview(messageLabel)
    }

    private func setBubbleBackgroundView() {

        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([bubbleBackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -8),
                                     bubbleBackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 8),
                                     bubbleBackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -8),
                                     bubbleBackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 8)])

        bubbleBackgroundView.backgroundColor = .purple
        bubbleBackgroundView.clipsToBounds = true
        bubbleBackgroundView.layer.cornerRadius = 20
    }

    private func setMessageLabel() {

        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([messageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                                     messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
                                     messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 32),
                                     messageLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.65)])

        messageLabel.backgroundColor = .clear
        messageLabel.textColor = .white
    }


    func configureCell(message: String) -> MessagesTableViewCell {
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        return self
    }

}