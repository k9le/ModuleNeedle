

import Foundation
import NeedleFoundation
import UIKit

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class ThirdScreenDependency6a9302d262bd51c26a01Provider: ThirdScreenDependency {
    var loggerService: ILoggerService {
        return secondScreenDIComponent.loggerService
    }
    var networkService: INetworkService {
        return secondScreenDIComponent.networkService
    }
    var themeProvider: IThemeProvider {
        return secondScreenDIComponent.themeProvider
    }
    private let secondScreenDIComponent: SecondScreenDIComponent
    init(secondScreenDIComponent: SecondScreenDIComponent) {
        self.secondScreenDIComponent = secondScreenDIComponent
    }
}
/// ^->RootComponent->SecondScreenDIComponent->ThirdScreenDIComponent
private func factory2b7b2055da55e64afb6fd40058910c2b637dafa6(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ThirdScreenDependency6a9302d262bd51c26a01Provider(secondScreenDIComponent: parent1(component) as! SecondScreenDIComponent)
}
private class FirstScreenDependencye88e0e1cb5014a20383dProvider: FirstScreenDependency {
    var loggerService: ILoggerService {
        return rootComponent.loggerService
    }
    var themeContainer: IThemeContainer {
        return rootComponent.themeContainer
    }
    var secondScreenAssembly: ISecondScreenAssembly {
        return rootComponent.secondScreenAssembly
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->FirstScreenDIComponent
private func factory34033c84ca722fcd1187b3a8f24c1d289f2c0f2e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FirstScreenDependencye88e0e1cb5014a20383dProvider(rootComponent: parent1(component) as! RootComponent)
}
private class SecondScreenDependency2658d773e87e411d8238Provider: SecondScreenDependency {
    var loggerService: ILoggerService {
        return rootComponent.loggerService
    }
    var themeProvider: IThemeProvider {
        return rootComponent.themeProvider
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->SecondScreenDIComponent
private func factory1e6950f089cb360950deb3a8f24c1d289f2c0f2e(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SecondScreenDependency2658d773e87e411d8238Provider(rootComponent: parent1(component) as! RootComponent)
}

#else
extension ThirdScreenDIComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\ThirdScreenDependency.loggerService] = "loggerService-ILoggerService"
        keyPathToName[\ThirdScreenDependency.networkService] = "networkService-INetworkService"
        keyPathToName[\ThirdScreenDependency.themeProvider] = "themeProvider-IThemeProvider"
    }
}
extension FirstScreenDIComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\FirstScreenDependency.loggerService] = "loggerService-ILoggerService"
        keyPathToName[\FirstScreenDependency.themeContainer] = "themeContainer-IThemeContainer"
        keyPathToName[\FirstScreenDependency.secondScreenAssembly] = "secondScreenAssembly-ISecondScreenAssembly"
    }
}
extension RootComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["loggerService-ILoggerService"] = { [unowned self] in self.loggerService as Any }
        localTable["themeProvider-IThemeProvider"] = { [unowned self] in self.themeProvider as Any }
    }
}
extension SecondScreenDIComponent: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\SecondScreenDependency.loggerService] = "loggerService-ILoggerService"
        keyPathToName[\SecondScreenDependency.themeProvider] = "themeProvider-IThemeProvider"
        localTable["networkService-INetworkService"] = { [unowned self] in self.networkService as Any }
    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->RootComponent->SecondScreenDIComponent->ThirdScreenDIComponent", factory2b7b2055da55e64afb6fd40058910c2b637dafa6)
    registerProviderFactory("^->RootComponent->FirstScreenDIComponent", factory34033c84ca722fcd1187b3a8f24c1d289f2c0f2e)
    registerProviderFactory("^->RootComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->RootComponent->SecondScreenDIComponent", factory1e6950f089cb360950deb3a8f24c1d289f2c0f2e)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
