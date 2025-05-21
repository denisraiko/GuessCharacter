//
//  CharacterManager.swift
//  GuessCharacter
//
//  Created by Denis Raiko on 20.05.25.
//

import Foundation

protocol ICharacterManager {
    func getRandomCharacters(_ count: Int) -> [Character]
}

final class CharacterManager: ICharacterManager {
    
    private var characters: [Character] = []
    
    init() {
        characters = [Character(name: "Кот Матроскин", imageName: "Cat"),
                      Character(name: "Чебурашка", imageName: "Cheburashka"),
                      Character(name: "Шарик", imageName: "Dog"),
                      Character(name: "Дядя Фёдор", imageName: "Fedor"),
                      Character(name: "Крокодил Гена", imageName: "Gena"),
                      Character(name: "Пятачок", imageName: "Pig"),
                      Character(name: "Вини-Пух", imageName: "ViniPuh")
        ]
    }
    
    func getRandomCharacters(_ count: Int) -> [Character] {
        Array(characters.shuffled().prefix(count))
    }
    
}
