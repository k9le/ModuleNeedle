//
//  SecondScreenNeedle.swift
//  NeedleApp
//
//  Created by Vasiliy Fedotov on 26.11.2024.
//

import NeedleFoundation
import UIKit

protocol SecondScreenDependency: Dependency {
    var loggerService: LoggerServiceInterface { get }
    var themeProvider: ThemeProvider { get }
}

final class SecondScreenNeedle: Component<SecondScreenDependency>, SecondScreenFactory {

    public var networkService: NetworkServiceInterface {
        NetworkServiceImpl()
    }

    var persistenceService: PersistenceServiceInterface {
        PersistenceServiceImpl()
    }

    var thirdScreenFactory: ThirdScreenFactory {
        ThirdScreenNeedle(parent: self)
    }

    func makeSecondScreen() -> UIViewController {
        let router = SecondScreenRouter(thirdScreenFactory: thirdScreenFactory)

        let presenter = SecondScreenPresenterImpl(
            router: router,
            networkService: networkService,
            persistenceService: persistenceService,
            loggerService: dependency.loggerService
        )

        let vc = SecondScreenViewController(themeProvider: dependency.themeProvider, presenter: presenter)
        router.fromVC = vc
        presenter.view = vc

        return vc
    }
}
