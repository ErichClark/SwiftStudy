//
//  ViewController.swift
//  BullsEye
//
//  Created by Erich Clark on 7/3/15.
//  Copyright © 2015 Erich Clark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    let SLIDER_RESET = 50
    let SLIDER_MAX: uint = 100
    let MAX_POINTS = 100
    let PERFECT_SCORE = 0
    let NEAR_PERFECT_SCORE = 1
    let PRETTY_GOOD_SCORE = 10
    let PERFECT_SCORE_BONUS = 100
    let NEAR_PERFECT_BONUS = 50
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
    }

    func startNewRound() {
        round++
        targetValue = 1 + Int(arc4random_uniform(SLIDER_MAX))
        currentValue = SLIDER_RESET
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
            targetLabel.text = String(targetValue)
            scoreLabel.text = String(score)
            roundLabel.text = String(round)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        var points = MAX_POINTS - difference
        let message = "You scored \(points) points"
        
        
        var title: String
        if difference == PERFECT_SCORE {
            title = "Perfect!"
            points += PERFECT_SCORE_BONUS // Bonus for perfect score
        
        } else if difference == NEAR_PERFECT_SCORE {
            title = "You almost had it!"
            points += NEAR_PERFECT_BONUS  // Bonus for one off
        
        } else if difference < PRETTY_GOOD_SCORE {
            title = "Pretty good!"
        
        } else {
            title = "Not even close..."
        }
        
        score += points
        
        let alert = UIAlertController(title: "Hello, World",
            message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: title, style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
        startNewRound()
        updateLabels()
    }

    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
}

