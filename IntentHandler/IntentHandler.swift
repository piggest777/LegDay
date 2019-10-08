//
//  IntentHandler.swift
//  IntentHandler
//
//  Created by Denis Rakitin on 2019-10-07.
//  Copyright © 2019 Denis Rakitin. All rights reserved.
//

import Intents

class IntentHandler: INExtension, INStartWorkoutIntentHandling, INEndWorkoutIntentHandling, INPauseWorkoutIntentHandling, INResumeWorkoutIntentHandling {
    
    
    
    func handle(intent: INResumeWorkoutIntent, completion: @escaping (INResumeWorkoutIntentResponse) -> Void) {
        let response = INResumeWorkoutIntentResponse(code: .handleInApp, userActivity: nil)
        completion(response)
    }
    
    
    
    func handle(intent: INEndWorkoutIntent, completion: @escaping (INEndWorkoutIntentResponse) -> Void) {
        
//         guard let spokenPhrase = intent.workoutName?.spokenPhrase else {
//            completion(INEndWorkoutIntentResponse(code: .failureNoMatchingWorkout, userActivity: nil))
//                   return
//               }
//
//        if spokenPhrase == "walk" {
//            print("it goes good with stop")
//            completion(INEndWorkoutIntentResponse(code: .handleInApp, userActivity: nil))
//        } else {
//            completion(INEndWorkoutIntentResponse(code: .failureNoMatchingWorkout, userActivity: nil))
//        }
        
        let response = INEndWorkoutIntentResponse(code: .handleInApp, userActivity: nil)
        completion(response)
    }
    
    func canHandle(_ intent: INIntent) -> Bool {
        return intent is INPauseWorkoutIntent
    }
    
    func confirm(intent pauseWorkoutIntent: INPauseWorkoutIntent, completion: @escaping (INPauseWorkoutIntentResponse) -> Void) {
       
        let response: INPauseWorkoutIntentResponse

        
            response = INPauseWorkoutIntentResponse(code: .ready, userActivity: nil)
       
        completion(response)
    }
    
    func handle(intent: INPauseWorkoutIntent, completion: @escaping (INPauseWorkoutIntentResponse) -> Void) {
        
        let response = INPauseWorkoutIntentResponse(code: .handleInApp, userActivity: nil)
        completion(response)
//        do something
    }
    

    func handle(intent: INStartWorkoutIntent, completion: @escaping (INStartWorkoutIntentResponse) -> Void) {
        print("Start workout intent: ", intent)
        
        let userActivity: NSUserActivity? = nil
        
        guard let spokenPhrase = intent.workoutName?.spokenPhrase else {
            completion(INStartWorkoutIntentResponse(code: .failureNoMatchingWorkout, userActivity: nil))
            return
        }
        
        if spokenPhrase == "walk" || spokenPhrase == "run" {
            completion(INStartWorkoutIntentResponse(code: .handleInApp, userActivity: userActivity))
        } else {
            completion(INStartWorkoutIntentResponse(code: .failureNoMatchingWorkout, userActivity: nil))
        }
        
    }
}
