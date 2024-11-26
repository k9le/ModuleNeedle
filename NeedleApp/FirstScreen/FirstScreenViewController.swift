//
//  FirstScreenViewController.swift
//  FirstScreenImpl
//
//  Created by Vasiliy Fedotov on 17.11.2024.
//

import UIKit

protocol FirstScreenViewInterface: AnyObject {}

final class FirstScreenViewController: UIViewController {

    private var appearance: FirstScreenAppearance
    private var presenter: FirstScreenPresenterInterface

    private let button1 = UIButton()
    private let button2 = UIButton()

    init(
        appearance: any FirstScreenAppearance,
        presenter: any FirstScreenPresenterInterface
    ) {
        self.appearance = appearance
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view?.backgroundColor = appearance.backgroundColor

        createSubiews()
        layoutSubiews()

        presenter.viewDidLoad()
    }

    @objc func buttonTapped(_ sender: UIButton) {
        if sender.title(for: .normal) == appearance.button1Title {
            presenter.button1Tapped()
        } else {
            presenter.button2Tapped()
        }
    }
}

extension FirstScreenViewController: FirstScreenViewInterface {

}


private extension FirstScreenViewController {

    func createSubiews() {
        button1.setTitle(appearance.button1Title, for: .normal)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        button2.setTitle(appearance.button2Title, for: .normal)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        view.addSubview(button1)
        view.addSubview(button2)
    }

    func layoutSubiews() {
        button1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        let y1 = button1.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        y1.priority = .defaultHigh
        let y2 = button2.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        y2.priority = .defaultHigh

        y1.isActive = true
        y2.isActive = true

        button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20).isActive = true
    }
}


