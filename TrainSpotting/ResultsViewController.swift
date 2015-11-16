//
//  ResultsViewController.swift
//  TrainSpotting
//
//  Created by Joonas Maliniemi on 14.11.2015.
//  Copyright © 2015 Tampereen ammattikorkeakoulu Oy. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var dateToPass: NSDate!
    var toTextToPass: String!
    var fromTextToPass: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib

        self.edgesForExtendedLayout = UIRectEdge.None
        NSLog(fromTextToPass)
        NSLog(toTextToPass)

        var date: String {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm"
            return dateFormatter.stringFromDate(dateToPass)
        }

        NSLog(date)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}