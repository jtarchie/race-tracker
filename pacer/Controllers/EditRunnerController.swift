//
//  EditRunnersController.swift
//  pacer
//
//  Created by JT Archie on 10/26/14.
//  Copyright (c) 2014 Geeky Of Us. All rights reserved.
//

import Foundation
import UIKit

class EditRunnerController: FXFormViewController {
    var runner: Runner!
    
    convenience init(runner: Runner) {
        self.init()
        self.runner = runner
    }

    required convenience init(coder aDecoder: NSCoder) {
        self.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Edit Runners"
        
        var form = RunnerForm()
        form.setValue(runner.name, forKey: "name")
        form.setValue(runner.bibNumber, forKey: "bibNumber")
        form.setValue(runner.currentPace, forKey: "currentPace")
        form.setValue(runner.startTime, forKey: "startTime")
        self.formController.form = form
    }
    
    override func viewDidDisappear(animated: Bool) {
        var form = self.formController.form as RunnerForm
        runner.name = form.name
        runner.bibNumber = form.bibNumber
        runner.currentPace = form.currentPace
        runner.startTime = form.startTime
        runner.save()
    }
}