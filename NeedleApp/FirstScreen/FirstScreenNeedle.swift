//
//  FirstScreenNeedle.swift
//  NeedleApp
//
//  Created by Vasiliy Fedotov on 26.11.2024.
//

import NeedleFoundation
import UIKit

final class FirstScreenNeedleAssembly: BootstrapComponent {

    public var loggerService: LoggerServiceInterface {
        shared {
            LoggerService()
        }
    }

    public var themeProvider: ThemeProvider {
        themeContainer
    }

    private var themeContainer: ThemeContainer {
        shared {
            ThemeContainerImpl()
        }
    }

    var firstScreenAppearance: FirstScreenAppearance {
        FirstScreenAppearanceImpl1()
    }

    var secondScreenFactory: SecondScreenFactory {
        SecondScreenNeedle(parent: self)
    }

    func createFirstScreen() -> UIViewController {
        let router = FirstScreenRouter(secondScreenFactory: secondScreenFactory)
        let presenter = FirstScreenPresenterImpl(router: router, logger: loggerService, themeContainer: themeContainer)

        let vc = FirstScreenViewController(
            appearance: firstScreenAppearance,
            presenter: presenter
        )

        presenter.view = vc
        router.fromVC = vc

        return vc
    }
}
