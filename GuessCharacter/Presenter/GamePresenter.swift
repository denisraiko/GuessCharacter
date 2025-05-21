//
//  GamePresenter.swift
//  GuessCharacter
//
//  Created by Denis Raiko on 20.05.25.
//

import Foundation


protocol IGamePresenter: AnyObject {
    func viewDidLoad()
    func getQuestion()
    func checkAnswer(_ character: Character)
}

protocol IGameViewController: AnyObject {
    func showCharacters(_ characters: [Character], questionTitle: String)
    func showResult(message: String, title: String)
}


final class GamePresenter: IGamePresenter {
    
    private weak var view: IGameViewController?
    private let characterManager: CharacterManager
    private var score = 0
    private var correctCharacter: Character?
    
    init(view: IGameViewController, characterManager: CharacterManager = CharacterManager()) {
        self.view = view
        self.characterManager = characterManager
    }
    
    func viewDidLoad() {
        getQuestion()
    }
    
    func getQuestion() {
        let characters = characterManager.getRandomCharacters(3)
        
        guard let correct = characters.randomElement() else { return }
        correctCharacter = correct
        
        let title = "Кто это: \(correct.name)?"
        view?.showCharacters(characters, questionTitle: title)
    }
    
    func checkAnswer(_ character: Character) {
        let isCorrect = character.name == correctCharacter?.name
        score += isCorrect ? 1 : -1
        
        let message = isCorrect ? "Счет: \(score)" : "Счет: \(score)"
        let title = isCorrect ? "Верно!" : "Неправильно"
        
        view?.showResult(message: message, title: title)
    }
}
