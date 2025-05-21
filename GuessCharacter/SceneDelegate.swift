//
//  SceneDelegate.swift
//  GuessCharacter
//
//  Created by Denis Raiko on 20.05.25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let rootVC = GameModuleBuilder.build()
        window?.rootViewController = rootVC
        window?.makeKeyAndVisible()
    }

   

}

