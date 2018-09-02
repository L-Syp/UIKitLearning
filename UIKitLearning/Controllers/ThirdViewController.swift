//
//  ThirdViewController.swift
//  UIKitLearning
//
//  Created by Łukasz Sypniewski on 15/08/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import Foundation
import UIKit

protocol MyFirstViewDelegate: class {
    func didTapBackToRoot(_ view: MyFirstView)
    func showTableView(_ view: MyFirstView)
}

class ThirdViewController: UIViewController {
    private var mainView: MyFirstView!
    private var messagesToShowInTable: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setMainView()
        setConstraints()
    }

    private func setMainView() {
        mainView = MyFirstView(frame: self.view.frame)
        mainView.backgroundColor = UIColor.yellow
        mainView.delegate = self
        view.addSubview(mainView)
    }

    private func setConstraints() {
        setMainViewConstraints()
    }

    private func setMainViewConstraints() {
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension ThirdViewController: MyFirstViewDelegate {
    func showTableView(_ view: MyFirstView) {

        messagesToShowInTable.append("First cell message quite long, so it probably won't fit in one row")
        messagesToShowInTable.append("Second a little bit shorter message")
        messagesToShowInTable.append("Third message")

        let messagesVC = MessagesTableViewController(messages: messagesToShowInTable)
        self.navigationController?.pushViewController(messagesVC, animated: true)
    }
    
    func didTapBackToRoot(_ view: MyFirstView) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
