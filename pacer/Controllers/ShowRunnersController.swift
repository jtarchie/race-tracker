//
//  ShowRunnersController.swift
//  pacer
//
//  Created by JT Archie on 10/27/14.
//  Copyright (c) 2014 Geeky Of Us. All rights reserved.
//

import Foundation
import UIKit

class ShowRunnersController: UITableViewController {
    var runners: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Active Runners"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addRunner")
        self.tableView.registerNib(UINib(nibName: "RunnerCell", bundle: nil), forCellReuseIdentifier: "runnerCell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.reloadTable()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.reloadTable()
    }
    
    func addRunner() {
        var runner = Runner.create([
            "name": "New Runner " + String(Runner.count() + 1),
            "currentPace": "8:00"
        ]) as Runner
        runner.save()
        self.reloadTable()
    }
    
    func reloadTable() {
        self.runners = Runner.all()
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.runners.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let runner = self.runners[indexPath.row] as Runner
        let cell = self.tableView.dequeueReusableCellWithIdentifier("runnerCell", forIndexPath: indexPath) as RunnerCell

        cell.updateWithModel(runner)
        return cell
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        var editButton = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Edit", handler: {(action, indexPath) -> Void in
                var runner = self.runners[indexPath.row] as Runner
                self.editRunnerScreen(runner)
            })
        editButton.backgroundColor = UIColor.greenColor()
        var deleteButton = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: {(action, indexPath) -> Void in
            var runner = self.runners[indexPath.row] as Runner
            runner.delete()
            self.reloadTable()
        })
        deleteButton.backgroundColor = UIColor.redColor()
        return [editButton, deleteButton]
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func editRunnerScreen(runner: Runner) {
        var controller = EditRunnerController(runner: runner)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}