//
//  SceneDelegate.swift
//  NeedleApp
//
//  Created by Vasiliy Fedotov on 26.11.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let wc = (scene as? UIWindowScene) else { return }

        registerProviderFactories()

        let window = UIWindow(windowScene: wc)
        window.makeKeyAndVisible()
        self.window = window

        let screen1VCFactory = FirstScreenAssembly {
            FirstScreenDIComponent()
        }

        let screen1VC = screen1VCFactory.createFirstScreen()
        window.rootViewController = UINavigationController(rootViewController: screen1VC)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
    
}

