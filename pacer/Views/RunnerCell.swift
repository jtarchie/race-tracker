//
//  RunnerCell.swift
//  pacer
//
//  Created by JT Archie on 10/27/14.
//  Copyright (c) 2014 Geeky Of Us. All rights reserved.
//

import Foundation
import UIKit

class RunnerCell: UITableViewCell {
    @IBOutlet var name: UILabel!
    @IBOutlet var progress: UIProgressView!
    @IBOutlet var estimatedTimeArrival: UILabel!
    
    func updateWithModel(model: AnyObject!){
        let runner = model as Runner
        self.name.text = runner.name
        self.estimatedTimeArrival.text = "10m"
        self.progress.progress = runner.progress()
    }
}