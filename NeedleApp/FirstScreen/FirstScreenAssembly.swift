//
//  FirstScreenAssembly.swift
//  NeedleApp
//
//  Created by Vasiliy Fedotov on 26.11.2024.
//

import UIKit

protocol IFirstScreenAssembly {
    func createFirstScreen() -> UIViewController
}

final class FirstScreenAssembly {

    private let componentProvider: () -> IFirstScreenDIComponent

    init(componentProvider: @escaping () -> IFirstScreenDIComponent) {
        self.componentProvider = componentProvider
    }
}

extension FirstScreenAssembly: IFirstScreenAssembly {

    func createFirstScreen() -> UIViewController {
        let component = componentProvider()

        let secondScreenAssembly = component.secondScreenAssembly
        let loggerService = component.loggerService
        let themeContainer = component.themeContainer
        let firstScreenAppearance = component.firstScreenAppearance

        let router = FirstScreenRouter(secondScreenAssembly: secondScreenAssembly)
        let presenter = FirstScreenPresenter(router: router, logger: loggerService, themeContainer: themeContainer)

        let vc = FirstScreenViewController(appearance: firstScreenAppearance, presenter: presenter)
        router.fromVC = vc

        return vc
    }
}
