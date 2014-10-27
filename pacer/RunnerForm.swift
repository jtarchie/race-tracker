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
    var startTime: NSDate?
    var bibNumber: NSString?
    var currentPace: NSString?
    
    func startTimeField() -> NSDictionary {
        return [
            FXFormFieldTitle: "Start Time"
        ]
    }
}