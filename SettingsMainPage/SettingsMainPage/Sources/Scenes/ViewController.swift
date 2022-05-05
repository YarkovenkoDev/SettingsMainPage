//
//  ViewController.swift
//  SettingsMainPage
//
//  Created by Daniil Yarkovenko on 06.05.2022.
//

import UIKit

class ViewController: UIViewController {

    private lazy var navigationBar: UINavigationBar = {
        var navigation = UINavigationBar()
        return navigation
    }()

    private lazy var tableView: UITableView = {
        var table = UITableView(frame: .zero, style: .grouped)

        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupHieracly()
        setupLayout()
    }

    private func setupNavigationBar() {
        let navItem = UINavigationItem(title: Strings.tabBarLabel)
        navigationBar.setItems([navItem], animated: false)
    }

    private func setupHieracly() {
        view.addSubview(navigationBar)
        view.addSubview(tableView)
    }

    private func setupLayout() {
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        navigationBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        navigationBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }

}

extension ViewController {
    enum Strings {
        static let tabBarLabel = "Settings"
    }
}

