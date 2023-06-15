//
//  ViewController.swift
//  Project2
//
//  Created by TwoStraws on 13/08/2016.
//  Copyright © 2016 Paul Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet var button1: UIButton!
	@IBOutlet var button2: UIButton!
	@IBOutlet var button3: UIButton!

	var countries = [String]()
	var correctAnswer = 0
	var score = 0
    var noOfAnswersReceived = 0
    var rightAnswer = ""

	override func viewDidLoad() {
		super.viewDidLoad()

		button1.layer.borderWidth = 1
		button2.layer.borderWidth = 1
		button3.layer.borderWidth = 1

		button1.layer.borderColor = UIColor.lightGray.cgColor
		button2.layer.borderColor = UIColor.lightGray.cgColor
		button3.layer.borderColor = UIColor.lightGray.cgColor

		countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
		askQuestion()
	}

	func askQuestion(action: UIAlertAction! = nil) {
		countries.shuffle()

		button1.setImage(UIImage(named: countries[0]), for: .normal)
		button2.setImage(UIImage(named: countries[1]), for: .normal)
		button3.setImage(UIImage(named: countries[2]), for: .normal)

        correctAnswer = Int.random(in: 0...2)
		title = "\(countries[correctAnswer].uppercased())  - Your score is \(score)"
	}
    
    func  isOver() -> Bool
    {
        return noOfAnswersReceived == 10
    }
    
    
    func trackQuestionAndEndGame(){
        noOfAnswersReceived += 1
        if (isOver()){
            title = "The Game is Over."
            noOfAnswersReceived = 0
            score = 0
        }
    }

	@IBAction func buttonTapped(_ sender: UIButton) {
		var title = ""
        
        func  isAnswerWrong() -> Bool
        {
            return title == "Wrong"
        }
     
     
        if sender.tag == correctAnswer {
                title = "Correct"
                score += 1
            rightAnswer = ""
        } else {
                title = "Oops!! Wrong"
            rightAnswer = "The flag belong to \(countries[sender.tag].uppercased()) "
                score -= 1
        }
        
    
            
        if (noOfAnswersReceived == 9){
            title = "Horray!!"
            let ac = UIAlertController(title: title, message: "Your final score is \(score).", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Start All Over", style: .default, handler: askQuestion))
            present(ac, animated: true)
        } else {
           
           
            
            let ac = UIAlertController(title: title, message: "Your score is \(score). \(rightAnswer)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Continue", style: .default,   handler: askQuestion))
            present(ac, animated: true)
        }
       

        trackQuestionAndEndGame()
	}

}
