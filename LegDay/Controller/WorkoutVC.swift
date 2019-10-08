//
//  WorkoutVC.swift
//  LegDay
//
//  Created by Denis Rakitin on 2019-10-07.
//  Copyright © 2019 Denis Rakitin. All rights reserved.
//

import UIKit
import Intents

class WorkoutVC: UIViewController {

    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var timerLbl: UILabel!
    var timer = Timer()
    var timeFromIntent: Double = 0.0
    var workoutType: String = "WORKOUT"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeLbl.isHidden = true
        timerLbl.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTimeAndType), name: NSNotification.Name("workoutStartedNotification"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(stopWorkout), name: NSNotification.Name("stopWorkoutNotification"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(pauseWorkout), name: NSNotification.Name("pauseWorkoutNotification"), object: nil)
        
         NotificationCenter.default.addObserver(self, selector: #selector(resumeWorkout), name: NSNotification.Name("resumeWorkoutNotification"), object: nil)
        
        
        INPreferences.requestSiriAuthorization { (status) in
            if status == .authorized {
                print("SiriKit: Authorized")
            } else {
                print("SiriKit: UnAuthorized")
            }
        }
    }
    
    @objc func resumeWorkout () {
        typeLbl.text = "RESUME: \(workoutType.capitalized)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func pauseWorkout () {
        timer.invalidate()
        typeLbl.text = "PAUSE"
    }
    
   @objc func stopWorkout()  {
    print("successful stopped")
        timerLbl.isHidden = true
        typeLbl.isHidden = true
    }
    
    @objc func updateTimeAndType () {
        guard let intent = DataService.instance.startWorkoutIntent, let goalValue = intent.goalValue, let workoutType = intent.workoutName?.spokenPhrase  else {
            
            typeLbl.isHidden = true
            timerLbl.isHidden = true
            return
        }
        
        typeLbl.isHidden = false
        timerLbl.isHidden = false
        typeLbl.text = "TYPE: \(workoutType.capitalized)"
        self.workoutType = workoutType
        timeFromIntent = goalValue
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
//        timerLbl.text = "\(goalValue.convertDoubletoClockTime()) LEFT"
    }
    
    @objc func updateTimer() {
        if timeFromIntent > 0.0 {
            timeFromIntent -= 1.0
            timerLbl.text = "\(timeFromIntent.convertDoubletoClockTime()) LEFT"
        } else {
            timer.invalidate()
            typeLbl.text = "END OF TIME"
            timerLbl.text = "0:00 LEFT"
        }
        
    }


}

