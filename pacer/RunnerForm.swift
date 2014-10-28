//
//  RunnerForm.swift
//  pacer
//
//  Created by JT Archie on 10/26/14.
//  Copyright (c) 2014 Geeky Of Us. All rights reserved.
//

import Foundation
import UIKit

class RunnerForm: NSObject, FXForm {
    var name: NSString?
    var startTime: NSDate?
    var bibNumber: NSString?
    var currentPace: NSString?
    
    func nameField() -> NSDictionary {
        return [
            FXFormFieldTitle: "Name"
        ]
    }
    
    func startTimeField() -> NSDictionary {
        return [
            FXFormFieldTitle: "Start Time",
            FXFormFieldType: FXFormFieldTypeTime,
            FXFormFieldDefaultValue: NSDate()
        ]
    }
    
    func bibNumberField() -> NSDictionary {
        return [
            FXFormFieldTitle: "Bib Number",
            FXFormFieldPlaceholder: "123456",
            FXFormFieldDefaultValue: ""
        ]
    }
    
    func currentPaceField() -> NSDictionary {
        return [
            FXFormFieldTitle: "Current Pace",
            FXFormFieldPlaceholder: "MM:SS",
            FXFormFieldDefaultValue: ""
        ]
    }
}