//
//  FirstScreenPresenter.swift
//  FirstScreenImpl
//
//  Created by Vasiliy Fedotov on 22.11.2024.
//

import Foundation

protocol FirstScreenPresenterInterface: AnyObject {
    func viewDidLoad()
    func button1Tapped()
    func button2Tapped()
}

final class FirstScreenPresenterImpl: FirstScreenPresenterInterface {

    private let router: FirstScreenRouterInterface
    private let logger: LoggerServiceInterface
    private let themeContainer: ThemeContainer
    weak var view: FirstScreenViewInterface?

    init(
        router: FirstScreenRouterInterface,
        logger: LoggerServiceInterface,
        themeContainer: ThemeContainer
    ) {
        self.router = router
        self.logger = logger
        self.themeContainer = themeContainer
    }

    func viewDidLoad() {
        logger.log("First screen was load")
    }

    func button1Tapped() {
        themeContainer.theme = .light
        router.showSecondScreen()
    }

    func button2Tapped() {
        themeContainer.theme = .dark
        router.showSecondScreen()
    }
}
