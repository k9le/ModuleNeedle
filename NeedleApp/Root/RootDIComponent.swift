//
//  RootDIComponent.swift
//  NeedleApp
//
//  Created by Vasiliy Fedotov on 27.11.2024.
//

import Foundation
import NeedleFoundation

protocol IRootComponent {
    var loggerService: ILoggerService { get }
    var themeContainer: IThemeContainer { get }
    var firstScreenAssembly: IFirstScreenAssembly { get }
    var secondScreenAssembly: ISecondScreenAssembly { get }
}


final class RootComponent: BootstrapComponent {}

extension RootComponent: IRootComponent {

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

    var firstScreenAssembly: IFirstScreenAssembly {
        FirstScreenAssembly {
            FirstScreenDIComponent(parent: self)
        }
    }

    var secondScreenAssembly: ISecondScreenAssembly {
        SecondScreenAssembly {
            SecondScreenDIComponent(parent: self)
        }
    }
}
