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

        table.register(StaticTableViewCell.self, forCellReuseIdentifier: StaticTableViewCell.identifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)

        return table
    }()

    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupHieracly()
        setupLayout()
        configure()
        tableView.delegate = self
        tableView.dataSource = self
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

    func configure() {
        models.append(Section(options: [
            .switchCell(model: SettingsSwitchOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .orange, isOn: true)),
            .staticCell(model: SettingsStaticOption(title: "Cellular", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen)),
            .staticCell(model: SettingsStaticOption(title: "Personal Hotspot", icon: UIImage(systemName: "personalhotspot"), iconBackgroundColor: .systemGreen)),
            .switchCell(model: SettingsSwitchOption(title: "VPN", icon: UIImage(named: "vpn"), iconBackgroundColor: .systemBlue, isOn: true)),
                           ]))

        models.append(Section(options: [
            .staticCell(model: SettingsStaticOption(title: "Notifications", icon: UIImage(systemName: "bell.badge.fill"), iconBackgroundColor: .systemRed)),
            .staticCell(model: SettingsStaticOption(title: "Sounds & Haptics", icon: UIImage(systemName: "speaker.wave.3.fill"), iconBackgroundColor: .systemPink)),
            .staticCell(model: SettingsStaticOption(title: "Focus", icon: UIImage(systemName: "moon.fill"), iconBackgroundColor: .systemIndigo)),
            .staticCell(model: SettingsStaticOption(title: "Screen Time", icon: UIImage(systemName: "hourglass"), iconBackgroundColor: .systemIndigo)),
                        ]))

        models.append(Section(options: [
            .staticCell(model: SettingsStaticOption(title: "General", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemGray)),
            .staticCell(model: SettingsStaticOption(title: "Control Center", icon: UIImage(systemName: "switch.2"), iconBackgroundColor: .systemGray)),
            .staticCell(model: SettingsStaticOption(title: "Display & Brightness", icon: UIImage(systemName: "textformat.size"), iconBackgroundColor: .systemBlue)),
            .staticCell(model: SettingsStaticOption(title: "Home Screen", icon: UIImage(named: "home.screen"), iconBackgroundColor: .systemBlue)),
            .staticCell(model: SettingsStaticOption(title: "Accessibility", icon: UIImage(named: "human"), iconBackgroundColor: .systemBlue)),
            .staticCell(model: SettingsStaticOption(title: "Wallpaper", icon: UIImage(named: "wallpaper"), iconBackgroundColor: .systemCyan)),
            .staticCell(model: SettingsStaticOption(title: "Siri & Search", icon: UIImage(named: "siri"), iconBackgroundColor: .black)),
            .staticCell(model: SettingsStaticOption(title: "Face ID & Passcode", icon: UIImage(systemName: "faceid"), iconBackgroundColor: .systemGreen)),
                        ]))
        }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    enum Strings {
        static let tabBarLabel = "Settings"
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let model = models[indexPath.section].options[indexPath.row]

        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: StaticTableViewCell.identifier,
                for: indexPath
            ) as? StaticTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell

        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath
            ) as? SwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: model)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //предполагаю, что тут должен быть метод, который выводит тайтл ячейки, но я так и не смог достучаться до тайтла
    }

}

