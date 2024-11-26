//
//  FirstScreenPresenter.swift
//  FirstScreenImpl
//
//  Created by Vasiliy Fedotov on 22.11.2024.
//

import Foundation

protocol IFirstScreenPresenter: AnyObject {
    func viewDidLoad()
    func button1Tapped()
    func button2Tapped()
}

final class FirstScreenPresenter: IFirstScreenPresenter {

    private let router: IFirstScreenRouter
    private let logger: ILoggerService
    private let themeContainer: IThemeContainer

    init(
        router: IFirstScreenRouter,
        logger: ILoggerService,
        themeContainer: IThemeContainer
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
