//
//  DoubleEet.swift
//  LegDay
//
//  Created by Denis Rakitin on 2019-10-07.
//  Copyright © 2019 Denis Rakitin. All rights reserved.
//

import Foundation

extension Double {
    func convertDoubletoClockTime() -> String {
        let minutes = Int(self) / 60
        let seconds = Int(self) % 60
        return String(format: "%0d:%02d", minutes, seconds)
    }
}
