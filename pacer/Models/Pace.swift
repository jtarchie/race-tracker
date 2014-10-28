//
//  Pace.swift
//  pacer
//
//  Created by JT Archie on 10/28/14.
//  Copyright (c) 2014 Geeky Of Us. All rights reserved.
//

import Foundation

class Pace {
    var minutes: Int!
    var seconds: Int!
    
    convenience init(pace: String) {
        self.init()
        var elements = pace.componentsSeparatedByString(":")
        if elements.count == 1 {
            self.minutes = 0
            self.seconds = NSString(string: elements[0]).integerValue
        } else {
            self.minutes = NSString(string: elements[1]).integerValue
            self.seconds = NSString(string: elements[0]).integerValue
        }
    }
    
    func totalSeconds() -> Int {
        return minutes * 60 + seconds
    }
}