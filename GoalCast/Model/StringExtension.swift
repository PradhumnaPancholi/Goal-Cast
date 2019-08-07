
//
//  StringExtension.swift
//  GoalCast
//
//  Created by Amrit on 2019-08-07.
//  Copyright © 2019 Pradhumna Pancholi. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
