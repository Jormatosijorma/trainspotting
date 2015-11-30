//
//  ResultsTableViewController.swift
//  TrainSpotting
//
//  Created by Joonas Maliniemi on 30.11.2015.
//  Copyright © 2015 Tampereen ammattikorkeakoulu Oy. All rights reserved.
//

import Foundation
import UIKit

class ResultsTableViewController: UITableViewController {

    var dateToPass: NSDate!
    var toTextToPass: String!
    var fromTextToPass: String!

    var date: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sss'Z'"
        return dateFormatter.stringFromDate(dateToPass)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib

        self.edgesForExtendedLayout = UIRectEdge.None
        NSLog(fromTextToPass)
        NSLog(toTextToPass)
        NSLog(date)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("resultID") as UITableViewCell!
        //cell.textLabel!.text = "test"
        ApiManager.getSchedule(date, departureStation: fromTextToPass, arrivalStation: toTextToPass, onComplete: { trains, error in
            for train in trains!.trains! {
                NSLog("\(train.trainType)")
                cell.textLabel!.text = ("\(train.trainType)\(train.trainNumber)")
            }
        })
        return cell
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}