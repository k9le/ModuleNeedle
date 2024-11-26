//
//  SecondScreenDIComponent.swift
//  NeedleApp
//
//  Created by Vasiliy Fedotov on 26.11.2024.
//

import NeedleFoundation

protocol SecondScreenDependency: Dependency {
    var loggerService: ILoggerService { get }
    var themeProvider: IThemeProvider { get }
}

protocol ISecondScreenDIComponent: SecondScreenDependency {
    var networkService: INetworkService { get }
    var persistenceService: IPersistenceService { get }
    var thirdScreenAssembly: IThirdScreenAssembly { get }
}

final class SecondScreenDIComponent: Component<SecondScreenDependency> {}

extension SecondScreenDIComponent: ISecondScreenDIComponent {
    public var networkService: INetworkService {
        NetworkService()
    }

    var persistenceService: IPersistenceService {
        PersistenceService()
    }

    var thirdScreenAssembly: IThirdScreenAssembly {
        ThirdScreenAssembly {
            ThirdScreenDIComponent(parent: self)
        }
    }

    var loggerService: ILoggerService {
        dependency.loggerService
    }

    var themeProvider: IThemeProvider {
        dependency.themeProvider
    }
}

