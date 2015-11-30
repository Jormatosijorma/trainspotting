//
//  FirstViewController.swift
//  TrainSpotting
//
//  Created by Joonas Maliniemi on 14.11.2015.
//  Copyright © 2015 Tampereen ammattikorkeakoulu Oy. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var fromTextField: UITextField!
    @IBOutlet weak var toTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var selectedDate: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib

        self.edgesForExtendedLayout = UIRectEdge.None
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let resultsViewController = segue.destinationViewController as! ResultsTableViewController
        resultsViewController.dateToPass = self.datePicker.date
        resultsViewController.fromTextToPass = self.fromTextField.text
        resultsViewController.toTextToPass = self.toTextField.text
    }

    
}

