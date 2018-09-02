//
// Created by Łukasz Sypniewski on 15/08/2018.
// Copyright (c) 2018 Łukasz Sypniewski. All rights reserved.
//

import UIKit

class MyFirstView: UIView {
    private var titleButton = UIButton()
    private var goToFirstViewButton = UIButton()
    private var showTableViewButton = UIButton()
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
        let viewsToAdd: [UIView] = [titleButton, goToFirstViewButton, showTableViewButton]

        viewsToAdd.forEach { view in
            self.addSubview(view)
        }
    }

    private func setActions() {
        goToFirstViewButton.addTarget(self, action: #selector(goToRoot), for: .touchUpInside)
        showTableViewButton.addTarget(self, action: #selector(showTableView), for: .touchUpInside)
    }

    private func setControls() {
        setTitleButton()
        setGoToFirstViewButton()
        setShowTableViewButton()
    }

    private func setTitleButton() {
        titleButton.setTitle("ThirdView", for: .normal)
        titleButton.setTitleColor(UIColor.black, for: .normal)
        titleButton.backgroundColor = UIColor.cyan
        titleButton.contentHorizontalAlignment = .center
    }
    
    private func setShowTableViewButton() {
        showTableViewButton.setTitle("Show Table View", for: .normal)
        showTableViewButton.setTitleColor(UIColor.blue, for: .normal)
        showTableViewButton.setTitle("Showing Table View....", for: .highlighted)
        showTableViewButton.setTitleColor(UIColor.darkGray, for: .highlighted)
        showTableViewButton.contentHorizontalAlignment = .center
        showTableViewButton.backgroundColor = UIColor.green
    }

    private func setGoToFirstViewButton() {
        goToFirstViewButton.setTitle("Go back to the first view!", for: .normal)
        goToFirstViewButton.titleLabel?.numberOfLines = 0
        goToFirstViewButton.contentHorizontalAlignment = .center
        goToFirstViewButton.setTitleColor(UIColor.black, for: .normal)
        goToFirstViewButton.backgroundColor = UIColor.magenta
    }

    private func setConstraints() {
        setGoToFirstViewButtonConstraints()
        setTitleButtonConstraints()
        setShowTableViewButtonConstraints()
    }

    private func setGoToFirstViewButtonConstraints() {
         let guide = self.safeAreaLayoutGuide
        
        goToFirstViewButton.translatesAutoresizingMaskIntoConstraints = false
        goToFirstViewButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true
        goToFirstViewButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }

    private func setTitleButtonConstraints() {
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        titleButton.topAnchor.constraint(equalTo: showTableViewButton.bottomAnchor, constant: 50).isActive = true
        titleButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func setShowTableViewButtonConstraints() {
        showTableViewButton.translatesAutoresizingMaskIntoConstraints = false
        showTableViewButton.topAnchor.constraint(equalTo: goToFirstViewButton.bottomAnchor, constant: 50).isActive = true
        showTableViewButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }

    @objc private func goToRoot() {
        delegate?.didTapBackToRoot(self)
    }
    
    @objc private func showTableView() {
        delegate?.showTableView(self)
    }
}
