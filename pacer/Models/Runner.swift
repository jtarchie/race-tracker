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
            return Float(abs(startTime!.timeIntervalSinceNow)) / currentPaceTotalSeconds() / 26.2
        } else {
            return 0
        }
    }
    
    private
    
    func currentPaceTotalSeconds() -> Float {
        return currentPaceMinutes() * 60 + currentPaceSeconds()
    }
    
    func currentPaceMinutes() -> Float {
        if currentPace != nil {
            var minutes = currentPace!.componentsSeparatedByString(":")[0]
            return NSString(string: minutes).floatValue
        } else {
            return 0
        }
    }
    
    func currentPaceSeconds() -> Float {
        if currentPace != nil {
            var elements = currentPace!.componentsSeparatedByString(":")
            if elements.count == 1 {
                return NSString(string: elements[0]).floatValue
            } else {
                return NSString(string: elements[1]).floatValue
            }
        } else {
            return 0
        }
    }
}