//
//  ThirdScreenNeedle.swift
//  NeedleApp
//
//  Created by Vasiliy Fedotov on 26.11.2024.
//

import NeedleFoundation
import UIKit

protocol ThirdScreenDependency: Dependency {
    var loggerService: LoggerServiceInterface { get }
    var networkService: NetworkServiceInterface { get }
    var themeProvider: ThemeProvider { get }
}


final class ThirdScreenNeedle: Component<ThirdScreenDependency>, ThirdScreenFactory {

    var networkService: NetworkServiceInterface {
        NetworkServiceImpl()
    }

    var persistenceService: PersistenceServiceInterface {
        PersistenceServiceImpl()
    }

    func makeThirdScreen(with theme: UIUserInterfaceStyle) -> UIViewController {
        let router = ThirdScreenRouter()
        let presenter = ThirdScreenPresenterImpl(
            router: router,
            loggerService: dependency.loggerService,
            networkService: dependency.networkService
        )

        let vc = ThirdScreenViewController(themeProvider: dependency.themeProvider, presenter: presenter)
        router.fromVC = vc
        presenter.view = vc

        return vc
    }
}
