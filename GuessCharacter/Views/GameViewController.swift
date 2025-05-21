//
//  ViewController.swift
//  GuessCharacter
//
//  Created by Denis Raiko on 20.05.25.
//

import UIKit

final class GameViewController: UIViewController {
    
    var presenter: IGamePresenter?
    
    private var characters: [Character] = []
    
    private let titleLabel = UILabel()
    private let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        setupTitleLabel()
        setupStackView()
        setupLayout()

    }
    
    private func setupTitleLabel() {
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
    }
    
    private func setupLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),

            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    private func createButtons(for characters: [Character]) {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for character in characters {
            let button = UIButton(type: .custom)
            button.setImage(UIImage(named: character.imageName), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.tag = characters.firstIndex(where: { $0.name == character.name }) ?? 0
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        guard sender.tag < characters.count else { return }
        let selectedCharacter = characters[sender.tag]
        presenter?.checkAnswer(selectedCharacter)
    }
}

// MARK: - GameViewProtocol
extension GameViewController: IGameViewController {
    
    func showCharacters(_ characters: [Character], questionTitle: String) {
        
        self.characters = characters
        titleLabel.text = questionTitle
        createButtons(for: characters)
    }
    
    func showResult(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Продолжить", style: .default) { [weak self] _ in
            self?.presenter?.getQuestion()
        })
        present(alert, animated: true)
    }
}


