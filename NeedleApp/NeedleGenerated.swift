

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

private class ThirdScreenDependencyfcb97afcf7ee78a0cc28Provider: ThirdScreenDependency {
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
/// ^->FirstScreenDIComponent->SecondScreenDIComponent->ThirdScreenDIComponent
private func factory0654947c66ecbf31aa81d40058910c2b637dafa6(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ThirdScreenDependencyfcb97afcf7ee78a0cc28Provider(secondScreenDIComponent: parent1(component) as! SecondScreenDIComponent)
}
private class SecondScreenDependencya0e67d7b4d679524ae39Provider: SecondScreenDependency {
    var loggerService: ILoggerService {
        return firstScreenDIComponent.loggerService
    }
    var themeProvider: IThemeProvider {
        return firstScreenDIComponent.themeProvider
    }
    private let firstScreenDIComponent: FirstScreenDIComponent
    init(firstScreenDIComponent: FirstScreenDIComponent) {
        self.firstScreenDIComponent = firstScreenDIComponent
    }
}
/// ^->FirstScreenDIComponent->SecondScreenDIComponent
private func factory508a254d8b222fbd0046583ce0fb2485c2d4f561(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SecondScreenDependencya0e67d7b4d679524ae39Provider(firstScreenDIComponent: parent1(component) as! FirstScreenDIComponent)
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
    registerProviderFactory("^->FirstScreenDIComponent->SecondScreenDIComponent->ThirdScreenDIComponent", factory0654947c66ecbf31aa81d40058910c2b637dafa6)
    registerProviderFactory("^->FirstScreenDIComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->FirstScreenDIComponent->SecondScreenDIComponent", factory508a254d8b222fbd0046583ce0fb2485c2d4f561)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
