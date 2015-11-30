//
//  models.swift
//  TrainSpotting
//
//  Created by Tuukka Ojala on 30/11/15.
//  Copyright © 2015 Tampereen ammattikorkeakoulu Oy. All rights reserved.
//

import JSONJoy

struct Train: JSONJoy {
    var trainNumber: Int?
    var operatorShortCode: String?
    var trainType: String?
    var timetableRows: Array<TimetableRow>?
    
    init() {
        
    }
    
    init (_ decoder: JSONDecoder) {
        trainNumber = decoder["trainNumber"].integer
        trainType = decoder["trainType"].string
        operatorShortCode = decoder["operatorShortCode"].string
        if let ttrs = decoder["timetableRows"].array {
            timetableRows = Array<TimetableRow>()
            for ttrDecoder in ttrs {
                timetableRows?.append(TimetableRow(ttrDecoder))
            }
            }
    }
}

    struct TimetableRow: JSONJoy {
        var stationShortCode: String?
        var type: String?
        var cancelled: Bool?
        var scheduledTime: String?
        
        init () {
            
        }
        
        init (_ decoder: JSONDecoder) {
            stationShortCode = decoder["stationShortCode"].string
            scheduledTime = decoder["scheduledTime"].string
            type = decoder["type"].string
            cancelled = decoder["cancelled"].bool
        }
}
