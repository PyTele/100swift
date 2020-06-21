//
//  ViewController.swift
//  Project 2
//
//  Created by Hubert Leszkiewicz on 20/06/2020.
//  Copyright © 2020 Hubert Leszkiewicz02. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    
    var countries = [String]()
    var score = 0
    var correctanswer = 0
    
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
        
        correctanswer = Int.random(in: 0...2)
        title = "Score = \(score) Next country = \(countries[correctanswer].uppercased())"
    }
    @IBAction func ButtonTapped(_ sender: UIButton) {
           var title: String

           if sender.tag == correctanswer {
               title = "Correct!"
               score += 1
           } else {
               title = "Wrong"
               score -= 1
           }

           let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
           ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
           present(ac, animated: true)
       }

   }


