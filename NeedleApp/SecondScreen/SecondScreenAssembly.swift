//
//  SecondScreenNeedle.swift
//  NeedleApp
//
//  Created by Vasiliy Fedotov on 26.11.2024.
//

import UIKit

protocol ISecondScreenAssembly {
    func createSecondScreen() -> UIViewController
}

final class SecondScreenAssembly {

    private let componentProvider: () -> ISecondScreenDIComponent

    init(componentProvider: @escaping () -> ISecondScreenDIComponent) {
        self.componentProvider = componentProvider
    }
}

extension SecondScreenAssembly: ISecondScreenAssembly {

    func createSecondScreen() -> UIViewController {
        let component = componentProvider()

        let router = SecondScreenRouter(thirdScreenAssembly: component.thirdScreenAssembly)

        let presenter = SecondScreenPresenter(
            router: router,
            networkService: component.networkService,
            persistenceService: component.persistenceService,
            loggerService: component.loggerService
        )

        let vc = SecondScreenViewController(themeProvider: component.themeProvider, presenter: presenter)
        router.fromVC = vc

        return vc
    }
}
