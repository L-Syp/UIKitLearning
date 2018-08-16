//
// Created by Łukasz Sypniewski on 15/08/2018.
// Copyright (c) 2018 Łukasz Sypniewski. All rights reserved.
//

import UIKit

class MyFirstView: UIView {
    private var titleButton: UIButton!
    private var goToFirstViewButton: UIButton!
    weak var delegate: MyFirstViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubviews()
        setConstraints()
        setControls()
        setActions()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        titleButton = UIButton(frame: .zero)
        goToFirstViewButton = UIButton(frame: .zero)
        let viewsToAdd: [UIView] = [titleButton, goToFirstViewButton]

        viewsToAdd.forEach { view in
            self.addSubview(view)
        }
    }

    private func setActions() {
        goToFirstViewButton.addTarget(self, action: #selector(goToRoot), for: .touchUpInside)
    }

    private func setControls() {
        setTitleButton()
        setGoToFirstViewButton()
    }

    private func setTitleButton() {
        titleButton.setTitle("ThirdView", for: .normal)
        titleButton.setTitleColor(UIColor.black, for: .normal)
        titleButton.contentHorizontalAlignment = .center
    }

    private func setGoToFirstViewButton() {
        goToFirstViewButton.setTitle("Go back to the first view!", for: .normal)
        goToFirstViewButton.setTitleColor(UIColor.black, for: .normal)
    }

    private func setConstraints() {
        setGoToFirstViewButtonConstraints()
        setTitleButtonConstraints()
    }

    private func setGoToFirstViewButtonConstraints() {
        goToFirstViewButton.translatesAutoresizingMaskIntoConstraints = false
        goToFirstViewButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        goToFirstViewButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        goToFirstViewButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        goToFirstViewButton.heightAnchor.constraint(equalToConstant: 200).isActive = true

        goToFirstViewButton.sizeToFit()
    }

    private func setTitleButtonConstraints() {
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        titleButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 200).isActive = true
        titleButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

    @objc private func goToRoot() {
        delegate?.didTapBackToRoot(self)
    }
}
