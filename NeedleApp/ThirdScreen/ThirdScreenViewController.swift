//
//  ThirdScreenViewController.swift
//  ThirdScreenImpl
//
//  Created by Vasiliy Fedotov on 17.11.2024.
//

import UIKit

protocol ThirdScreenViewInterface: AnyObject {}

final class ThirdScreenViewController: UIViewController {

    private let theme: UIUserInterfaceStyle
    private let presenter: ThirdScreenPresenterInterface

    private let logButton = UIButton()
    private let requestButton = UIButton()
    private let popbackButton = UIButton()

    init(
        themeProvider: ThemeProvider,
        presenter: ThirdScreenPresenterInterface
    ) {
        self.theme = themeProvider.theme
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()

        view?.backgroundColor = theme.backgroundColor

        setupButtons()
        layoutButtons()
    }

    @objc func buttonTapped(_ sender: UIButton) {
        if sender === logButton {
            presenter.logButtonTapped()
        } else if sender === requestButton {
            presenter.requestButtonTapped()
        } else {
            presenter.backButtonTapped()
        }
    }
}

extension ThirdScreenViewController: ThirdScreenViewInterface {

}

private extension ThirdScreenViewController {

    func setupButtons() {
        logButton.setTitle("log something", for: .normal)
        logButton.setTitleColor(theme.buttonTextColor, for: .normal)
        logButton.translatesAutoresizingMaskIntoConstraints = false
        logButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        requestButton.setTitle("make network request", for: .normal)
        requestButton.setTitleColor(theme.buttonTextColor, for: .normal)
        requestButton.translatesAutoresizingMaskIntoConstraints = false
        requestButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        popbackButton.setTitle("pop back", for: .normal)
        popbackButton.setTitleColor(theme.buttonTextColor, for: .normal)
        popbackButton.translatesAutoresizingMaskIntoConstraints = false
        popbackButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        view.addSubview(logButton)
        view.addSubview(requestButton)
        view.addSubview(popbackButton)
    }

    func layoutButtons() {

        logButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        requestButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popbackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        requestButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        requestButton.topAnchor.constraint(equalTo: logButton.bottomAnchor, constant: 20).isActive = true
        popbackButton.topAnchor.constraint(equalTo: requestButton.bottomAnchor, constant: 20).isActive = true

    }

}

private extension UIUserInterfaceStyle {
    var backgroundColor: UIColor {
        switch self {
        case .dark: return .black
        default: return .white
        }
    }

    var buttonTextColor: UIColor {
        switch self {
        case .dark: return .white
        default: return .black
        }
    }
}
