//
//  MessagesTableViewController.swift
//  UIKitLearning
//
//  Created by Łukasz Sypniewski on 02/09/2018.
//  Copyright © 2018 Łukasz Sypniewski. All rights reserved.
//

import Foundation
import UIKit

class MessagesTableViewController: UIViewController {

    private var tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
    private let messages: [String]
    private let messageCellID = "messageCell"

    init(messages: [String]) {
        self.messages = messages
        super.init(nibName: nil, bundle: nil)
        setTableView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func setTableView() {
        view.addSubview(tableView)

        tableView.dataSource = self
        tableView.separatorStyle = .none

        let layoutGuide = UILayoutGuide()
        layoutGuide.identifier = "ASDFDF"
        view.addLayoutGuide(layoutGuide)

        NSLayoutConstraint.activate([layoutGuide.topAnchor.constraint(equalTo: view.topAnchor),
                                     layoutGuide.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -150),
                                     layoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     layoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor)])

        tableView.contentInset =  UIEdgeInsets(top: 32, left: 0, bottom: 0, right: 0)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)])

        tableView.register(MessagesTableViewCell.self, forCellReuseIdentifier: messageCellID)
    }
}

extension MessagesTableViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: messageCellID, for: indexPath) as? MessagesTableViewCell else {
            return UITableViewCell()
        }
        return cell.configureCell(message: messages[indexPath.row])
    }
}
