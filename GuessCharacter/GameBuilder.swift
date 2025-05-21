//
//  GameBuilder.swift
//  GuessCharacter
//
//  Created by Denis Raiko on 20.05.25.
//

import Foundation
import UIKit

enum GameModuleBuilder {
    static func build() -> UIViewController {
        let viewController = GameViewController()
        let manager = CharacterManager()
        let presenter = GamePresenter(view: viewController, characterManager: manager)
        viewController.presenter = presenter
        return viewController
    }
}
