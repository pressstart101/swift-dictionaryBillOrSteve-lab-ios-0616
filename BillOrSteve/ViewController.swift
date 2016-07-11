//
//  ViewController.swift
//  BillOrSteve
//
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var steveLabel: UIButton!
    @IBOutlet weak var billLabel: UIButton!
    var fact: (String, String) = ("", "")
    var score = 0

    @IBAction func steveButtonAction(sender: UIButton) {
  
        if fact.0 ==  "Steve Jobs"{
            score += 1
            fact = getRandomFact()!
            showFact((fact.1), person: fact.0)
        }else{
            fact = getRandomFact()!
            showFact((fact.1), person: fact.0)
        }
                scoreLabel.text = "\(score)"
    }
    @IBAction func billButtonAction(sender: UIButton) {
        if fact.0 ==  "Bill Gates"{
            score += 1
            fact = getRandomFact()!
            showFact((fact.1), person: fact.0)
        }else{
            fact = getRandomFact()!
            showFact((fact.1), person: fact.0)
        }
                scoreLabel.text = "\(score)"
    }
    
    var factsDictionary: [String : [String]] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(score)"
        createFacts()
        
        fact = getRandomFact()!
        
        showFact((fact.1), person: fact.0)
    }
    
    func createFacts()  {
        let gates = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.", "He scored 1590 (out of 1600) on his SATs.", "His foundation spends more on global health each year than the United Nation's World Health Organization.", "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.", "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
        let jobs = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.", "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.", "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.", "He was a pescetarian, meaning he ate no meat except for fish."]
        factsDictionary = ["Steve Jobs" : jobs, "Bill Gates" : gates]
            

    }

    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    
    
    func getRandomFact() -> (String, String)? {
       
        let dude = randomPerson()
        var indexX: Int = 0
        var fact: [String] = []
       
        if factsDictionary[dude] != nil{
            
            indexX = randomNumberFromZeroTo((factsDictionary[dude]!.count))
            fact = factsDictionary[dude]!
            return (dude, fact[indexX])
        }
        return (dude, fact[indexX])
    }
    
    func showFact(getFact: String, person: String)  {
        factLabel.text = getFact
    }
}
