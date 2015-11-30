//
//  apiManager.swift
//  JSONJoy
//
//  Created by Tuukka Ojala on 30/11/15.
//  Copyright © 2015 Vluxe. All rights reserved.
//

import Foundation
import JSONJoy

class ApiManager {
    static let baseUrl = "http://rata.digitraffic.fi/api/v1"

    class func httpGet(path: String, onComplete: (NSData, NSError) -> Void) {
        let url =  NSURL(string: baseUrl + path)
        let request = NSMutableURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: { data, response, error -> Void in
            let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            NSLog("\(dataString)");
            onComplete(data!, error!)
        })
        task.resume()
    }

    class func getSchedule(departureDate: String, departureStation: String, arrivalStation: String, onComplete: (Trains?, NSError?) -> Void) {
        httpGet("/schedules?from=\(departureDate)&departure_station=\(departureStation)&arrival_station=\(arrivalStation)", onComplete: { data, error in onComplete(Trains(JSONDecoder(data)), error)
        })
    }
}