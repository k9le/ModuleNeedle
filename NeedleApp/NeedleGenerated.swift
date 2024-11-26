

import NeedleFoundation
import UIKit

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

private func parent2(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class ThirdScreenDependency7368f602604eacc72275Provider: ThirdScreenDependency {
    var loggerService: LoggerServiceInterface {
        return firstScreenNeedleAssembly.loggerService
    }
    var networkService: NetworkServiceInterface {
        return secondScreenNeedle.networkService
    }
    var themeProvider: ThemeProvider {
        return firstScreenNeedleAssembly.themeProvider
    }
    private let firstScreenNeedleAssembly: FirstScreenNeedleAssembly
    private let secondScreenNeedle: SecondScreenNeedle
    init(firstScreenNeedleAssembly: FirstScreenNeedleAssembly, secondScreenNeedle: SecondScreenNeedle) {
        self.firstScreenNeedleAssembly = firstScreenNeedleAssembly
        self.secondScreenNeedle = secondScreenNeedle
    }
}
/// ^->FirstScreenNeedleAssembly->SecondScreenNeedle->ThirdScreenNeedle
private func factoryffe0ee328e7dc0542d09794d51dbda8ecb70f3fc(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ThirdScreenDependency7368f602604eacc72275Provider(firstScreenNeedleAssembly: parent2(component) as! FirstScreenNeedleAssembly, secondScreenNeedle: parent1(component) as! SecondScreenNeedle)
}
private class SecondScreenDependencyb2ab224febbc3009aaffProvider: SecondScreenDependency {
    var loggerService: LoggerServiceInterface {
        return firstScreenNeedleAssembly.loggerService
    }
    var themeProvider: ThemeProvider {
        return firstScreenNeedleAssembly.themeProvider
    }
    private let firstScreenNeedleAssembly: FirstScreenNeedleAssembly
    init(firstScreenNeedleAssembly: FirstScreenNeedleAssembly) {
        self.firstScreenNeedleAssembly = firstScreenNeedleAssembly
    }
}
/// ^->FirstScreenNeedleAssembly->SecondScreenNeedle
private func factoryc7a98a3fe348dd8631d9d86ad5ee029c4cfa48fb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SecondScreenDependencyb2ab224febbc3009aaffProvider(firstScreenNeedleAssembly: parent1(component) as! FirstScreenNeedleAssembly)
}

#else
extension ThirdScreenNeedle: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\ThirdScreenDependency.loggerService] = "loggerService-LoggerServiceInterface"
        keyPathToName[\ThirdScreenDependency.networkService] = "networkService-NetworkServiceInterface"
        keyPathToName[\ThirdScreenDependency.themeProvider] = "themeProvider-ThemeProvider"
    }
}
extension FirstScreenNeedleAssembly: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["loggerService-LoggerServiceInterface"] = { [unowned self] in self.loggerService as Any }
        localTable["themeProvider-ThemeProvider"] = { [unowned self] in self.themeProvider as Any }
    }
}
extension SecondScreenNeedle: NeedleFoundation.Registration {
    public func registerItems() {
        keyPathToName[\SecondScreenDependency.loggerService] = "loggerService-LoggerServiceInterface"
        keyPathToName[\SecondScreenDependency.themeProvider] = "themeProvider-ThemeProvider"
        localTable["networkService-NetworkServiceInterface"] = { [unowned self] in self.networkService as Any }
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
    registerProviderFactory("^->FirstScreenNeedleAssembly->SecondScreenNeedle->ThirdScreenNeedle", factoryffe0ee328e7dc0542d09794d51dbda8ecb70f3fc)
    registerProviderFactory("^->FirstScreenNeedleAssembly", factoryEmptyDependencyProvider)
    registerProviderFactory("^->FirstScreenNeedleAssembly->SecondScreenNeedle", factoryc7a98a3fe348dd8631d9d86ad5ee029c4cfa48fb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
