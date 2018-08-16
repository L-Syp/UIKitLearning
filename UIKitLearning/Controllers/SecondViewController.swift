//
//  ViewController.swift
//  UIKitLearning
//
//  Created by Łukasz Sypniewski on 15/08/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var showThirdViewControllerButton: UIButton!

    @IBAction func buttonClicked() {
        let thirdVC = ThirdViewController(nibName: nil, bundle: nil)
        self.navigationController?.pushViewController(thirdVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setControls()
        setConstraints()
    }

    private func setControls() {
        setTitleLabel()
    }

    private func setTitleLabel() {
        titleLabel.text = "SecondViewController"
    }

    private func setConstraints() {
        setTitleLabelConstraints()
        setShowThirdViewControllerButtonConstaints()
    }

    private func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 300)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    }

    private func setShowThirdViewControllerButtonConstaints() {
        showThirdViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        showThirdViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showThirdViewControllerButton.widthAnchor.constraint(equalToConstant: 300)
        showThirdViewControllerButton.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 20).isActive = true
    }

}

