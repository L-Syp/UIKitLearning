//
//  ViewController.swift
//  UIKitLearning
//
//  Created by Łukasz Sypniewski on 15/08/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var showSecondViewControllerButton: UIButton!
    
    @IBAction func showSecondViewController() {
        let secondVC = SecondViewController(nibName: "SecondView", bundle: nil)
        self.navigationController?.pushViewController(secondVC, animated: true)
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
        titleLabel.text = "Hello world"
    }

    private func setConstraints() {
        setTitleLabelConstraints()
        showSecondViewControllerButtonConstraints()
    }

    private func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 300)
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    }
    
    private func showSecondViewControllerButtonConstraints() {
        showSecondViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        showSecondViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showSecondViewControllerButton.widthAnchor.constraint(equalToConstant: 300)
        showSecondViewControllerButton.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 20).isActive = true
    }
}

