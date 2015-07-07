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
    @IBOutlet weak var Target_number_Label: UILabel!
    @IBOutlet weak var Score_label: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startOver()
        updateLabels()
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizable =
                trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal) }
    }
    
    func startNewRound() {
        round++
        targetValue = 1 + Int(arc4random_uniform(SLIDER_MAX))
        currentValue = SLIDER_RESET
    }
    
    func updateLabels() {
        Target_number_Label.text = String(targetValue)
        Score_label.text = String(score)
        roundLabel.text = String(round)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startOver(){
        score = 0
        round = 0
        startNewRound()
    }
    
    @IBAction func startNewGame() {
        startOver()
        updateLabels()
    }
    
    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        var points = MAX_POINTS - difference
        
        
        
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
        let message = "You scored \(points) points"  // Improvement to RayW code- moving message to this line inludes
        // score bonuses in popup display
        
        let alert = UIAlertController(title: "Your Score",
            message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: title, style: .Default,  // bug in RayW code- they put "OK" instead of
            handler: { action in               // using the self String variable
                self.startNewRound()
                self.updateLabels()
        })
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
}

