//
//  DataService.swift
//  LegDay
//
//  Created by Denis Rakitin on 2019-10-07.
//  Copyright © 2019 Denis Rakitin. All rights reserved.
//

import Foundation
import Intents

class DataService {
    
    static let instance = DataService()
    
    var startWorkoutIntent: INStartWorkoutIntent?
    var endWorkoutIntent: INEndWorkoutIntent?
    
    
}
