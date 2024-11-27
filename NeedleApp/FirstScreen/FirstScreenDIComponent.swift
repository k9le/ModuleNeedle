//
//  FirstScreenDIComponent.swift
//  NeedleApp
//
//  Created by Vasiliy Fedotov on 26.11.2024.
//

import NeedleFoundation

protocol FirstScreenDependency: Dependency {
    var loggerService: ILoggerService { get }
    var themeContainer: IThemeContainer { get }
    var secondScreenAssembly: ISecondScreenAssembly { get }
}

protocol IFirstScreenDIComponent: FirstScreenDependency {
    var firstScreenAppearance: IFirstScreenAppearance { get }
}

final class FirstScreenDIComponent: Component<FirstScreenDependency> {}

extension FirstScreenDIComponent: IFirstScreenDIComponent {

    public var loggerService: ILoggerService {
        dependency.loggerService
    }

    var themeContainer: IThemeContainer {
        dependency.themeContainer
    }

    var firstScreenAppearance: IFirstScreenAppearance {
        FirstScreenAppearance1()
    }

    var secondScreenAssembly: ISecondScreenAssembly {
        dependency.secondScreenAssembly
    }
}
