//
//  ThirdScreenAssembly.swift
//  NeedleApp
//
//  Created by Vasiliy Fedotov on 27.11.2024.
//

import UIKit

public protocol IThirdScreenAssembly {
    func createThirdScreen() -> UIViewController
}

final class ThirdScreenAssembly {

    private let componentProvider: () -> IThirdScreenDIComponent

    init(componentProvider: @escaping () -> IThirdScreenDIComponent) {
        self.componentProvider = componentProvider
    }
}

extension ThirdScreenAssembly: IThirdScreenAssembly {

    func createThirdScreen() -> UIViewController {
        let component = componentProvider()

        let router = ThirdScreenRouter()
        let presenter = ThirdScreenPresenter(
            router: router,
            loggerService: component.loggerService,
            networkService: component.networkService
        )

        let vc = ThirdScreenViewController(themeProvider: component.themeProvider, presenter: presenter)
        router.fromVC = vc

        return vc
    }
}

