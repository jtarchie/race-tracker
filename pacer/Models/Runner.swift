//
//  Runner.swift
//  pacer
//
//  Created by JT Archie on 10/27/14.
//  Copyright (c) 2014 Geeky Of Us. All rights reserved.
//

import Foundation
import CoreData

@objc(Runner)
class Runner: NSManagedObject {
    @NSManaged var name: String?
    @NSManaged var startTime: NSDate?
    @NSManaged var bibNumber: String?
    @NSManaged var currentPace: String?
    
    func progress() -> Float {
        if startTime != nil {
            return Float(abs(startTime!.timeIntervalSinceNow)) / Float(pace().totalSeconds()) / 26.2
        } else {
            return 0
        }
    }
    
    func pace() -> Pace {
        return Pace(pace: currentPace!)
    }
}