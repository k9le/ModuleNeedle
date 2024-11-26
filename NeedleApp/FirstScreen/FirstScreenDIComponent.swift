//
//  FirstScreenDIComponent.swift
//  NeedleApp
//
//  Created by Vasiliy Fedotov on 26.11.2024.
//

import NeedleFoundation

protocol IFirstScreenComponent {
    var loggerService: ILoggerService { get }
    var themeContainer: IThemeContainer { get }
    var firstScreenAppearance: IFirstScreenAppearance { get }
    var secondScreenAssembly: ISecondScreenAssembly { get }
}

final class FirstScreenDIComponent: BootstrapComponent {}

extension FirstScreenDIComponent: IFirstScreenComponent {

    public var loggerService: ILoggerService {
        shared {
            LoggerService()
        }
    }

    public var themeProvider: IThemeProvider {
        themeContainer
    }

    var themeContainer: IThemeContainer {
        shared {
            ThemeContainer()
        }
    }

    var firstScreenAppearance: IFirstScreenAppearance {
        FirstScreenAppearance1()
    }

    var secondScreenAssembly: ISecondScreenAssembly {
        SecondScreenAssembly {
            SecondScreenDIComponent(parent: self)
        }
    }
}
