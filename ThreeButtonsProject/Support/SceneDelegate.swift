//
//  SceneDelegate.swift
//  ThreeButtonsProject
//
//  Created by Роман Крендясов on 06.11.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = ThreeButtonsVC()
        window?.makeKeyAndVisible()
    }
}
