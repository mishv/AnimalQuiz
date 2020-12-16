//
//  FinalViewController.swift
//  AnimalQuiz
//
//  Created by Екатерина Батеева on 10.12.2020.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var textLabel: UILabel!
    
    
    // MARK: Properties
    var answers: [Answer] = []
    
    
    // MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        
        var animalDictionary: [AnimalType: Int] = [:]
    
        var dogCount = 0
        var catCount = 0
        var rabbitCount = 0
        var turtleCount = 0
        
        var winner: AnimalType?
        
        
        for answer in answers {
            switch answer.type {
            case AnimalType.dog:
                dogCount += 1
                animalDictionary[AnimalType.dog] = dogCount
            case AnimalType.cat:
                catCount += 1
                animalDictionary[AnimalType.cat] = catCount
            case AnimalType.rabbit:
                rabbitCount += 1
                animalDictionary[AnimalType.rabbit] = rabbitCount
            case AnimalType.turtle:
                turtleCount += 1
                animalDictionary[AnimalType.turtle] = turtleCount
            }
        
        }
        
        for animal in animalDictionary {
            if animal.value == animalDictionary.values.max() {
                winner = animal.key
            }
        }
        
        switch winner {
        case .dog:
            showDog()
        case .cat:
            showCat()
        case .rabbit:
            showRabbit()
        case .turtle:
            showTurtle()
        default:
            return
        }
        
    }
    
    
    // MARK: Functions
    private func showDog() {
        animalLabel.text = "Вы - 🐶"
        textLabel.text = AnimalType.dog.definition
    }
    
    private func showCat() {
        animalLabel.text = "Вы - 🐱"
        textLabel.text = AnimalType.cat.definition
    }
    
    private func showRabbit() {
        animalLabel.text = "Вы - 🐰"
        textLabel.text = AnimalType.rabbit.definition
    }
    
    private func showTurtle() {
        animalLabel.text = "Вы - 🐢"
        textLabel.text = AnimalType.turtle.definition
    }

}
