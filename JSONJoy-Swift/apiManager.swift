//
//  apiManager.swift
//  JSONJoy
//
//  Created by Tuukka Ojala on 30/11/15.
//  Copyright © 2015 Vluxe. All rights reserved.
//

import Foundation

class ApiManager {
    static let baseUrl = "htp://rata.digitraffic.fi/api/v1"
    
    class func httpGet(_ path: String, onComplete: (NSData, NSError) -> Void) {
        let url =  NSURL(string: baseUrl +path)
        let request = NSMutableURLRequest(URL: url!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: { data, response, error in
            )onComplete(data, error)
        })
        task.resume()
    }
    
    class func getSchedule(departureDate: String, departureStation: String, arrivalStation: String, onComplete: (Train?, NSError?) -> Void) {
        httpGet("/schedule?departure_date=\(departureDate)&departure_station=\(departureStation)&arrival_station=\(arrivalStation)", onComplete: { data, error in
            onComplete(Train(data), error)
        })
    }
}