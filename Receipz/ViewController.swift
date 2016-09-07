//
//  ViewController.swift
//  Receipz
//
//  Created by Arpita Bhatia on 9/5/16.
//  Copyright © 2016 Arpita Bhatia. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var receipes = [Receipe]()
   // var fetchedResultsController:NSFetchedResultsController!
    
    func fetchAndSetResults(){
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Receipe")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.receipes = results as! [Receipe]
            
        } catch let err as NSError {
            print (err.debugDescription)
            
        }
        
    }
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("ReceipeCell") as? ReceipeCell {
            let receipe = receipes[indexPath.row]
            cell.configureCell(receipe)
            return cell
        
        } else {
            return ReceipeCell()
        }
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receipes.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

}

