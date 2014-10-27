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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Edit Runners"
        self.formController.form = RunnerForm()
    }
}