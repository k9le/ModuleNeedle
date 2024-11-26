//
//  ThirdScreenAssembly.swift
//  NeedleApp
//
//  Created by Vasiliy Fedotov on 26.11.2024.
//

import NeedleFoundation
import UIKit

protocol ThirdScreenDependency: Dependency {
    var loggerService: ILoggerService { get }
    var networkService: INetworkService { get }
    var themeProvider: IThemeProvider { get }
}

protocol IThirdScreenDIComponent: ThirdScreenDependency {

}

final class ThirdScreenDIComponent: Component<ThirdScreenDependency> {}

extension ThirdScreenDIComponent: IThirdScreenDIComponent{
    var loggerService: ILoggerService {
        dependency.loggerService
    }

    var networkService: INetworkService {
        dependency.networkService
    }

    var themeProvider: IThemeProvider {
        dependency.themeProvider
    }
}
