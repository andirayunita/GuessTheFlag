//
//  ViewController.swift
//  GuessTheFlag
//
//  Created by Andira Yunitha on 18/08/21.
//  30-1.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var scoreLabel: UIBarButtonItem!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var numberOfQuestions = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia", "france", "germany", "indonesia", "ireland", "italy", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
    }
    
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }
    
    func restartGame(action: UIAlertAction) {
        score = 0
        correctAnswer = 0
        numberOfQuestions = 0
        askQuestion()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var explanations: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            explanations = "You have gained one point."
        } else {
            title = "Wrong"
            score -= 1
            explanations = "That's the flag of \(countries[sender.tag].uppercased())." + "\nYou lost one point."
        }
        numberOfQuestions += 1
        
        if numberOfQuestions < 10 {
            let ac = UIAlertController(title: title, message: explanations, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            present(ac, animated: true)
        }
        else {
            let alert = UIAlertController(title: "Game Over", message: "Your final score is \(score).", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: restartGame))
            present(alert, animated: true)
        }
        
    }

    
    @IBAction func scoreTapped(_ sender: UIBarButtonItem) {
        let anotherAC = UIAlertController(title: "Total Score", message: "Your current score is: \(score)", preferredStyle: .alert)
        anotherAC.addAction(UIAlertAction(title: "Continue", style: .default))
        present(anotherAC, animated: true)
    }
    
    
}

