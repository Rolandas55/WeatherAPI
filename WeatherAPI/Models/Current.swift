//
//  Current.swift
//  WeatherAPI
//
//  Created by kraujalis.rolandas on 11/11/2023.
//

import Foundation

struct Current: Codable {
    
    //  var lastUpdatedEpoch : Int?
    //  var lastUpdated      : String?
    var tempC            : Double?
    //  var tempF            : Double?
    //  var isDay            : Int?
    //  var condition        : Condition?
    //  var windMph          : Double?
    //  var windKph          : Double?
    //  var windDegree       : Int?
    //  var windDir          : String?
    //  var pressureMb       : Int?
    //  var pressureIn       : Double?
    var precipMm         : Double?
    //  var precipIn         : Int?
    //  var humidity         : Int?
    //  var cloud            : Int?
    //  var feelslikeC       : Double?
    //  var feelslikeF       : Double?
    //  var visKm            : Int?
    //  var visMiles         : Int?
    //  var uv               : Int?
    //  var gustMph          : Double?
    //  var gustKph          : Double?
    
    enum CodingKeys: String, CodingKey {
        
        //    case lastUpdatedEpoch = "last_updated_epoch"
        //    case lastUpdated      = "last_updated"
        case tempC            = "temp_c"
        //    case tempF            = "temp_f"
        //    case isDay            = "is_day"
        //    case condition        = "condition"
        //    case windMph          = "wind_mph"
        //    case windKph          = "wind_kph"
        //    case windDegree       = "wind_degree"
        //    case windDir          = "wind_dir"
        //    case pressureMb       = "pressure_mb"
        //    case pressureIn       = "pressure_in"
        case precipMm         = "precip_mm"
        //    case precipIn         = "precip_in"
        //    case humidity         = "humidity"
        //    case cloud            = "cloud"
        //    case feelslikeC       = "feelslike_c"
        //    case feelslikeF       = "feelslike_f"
        //    case visKm            = "vis_km"
        //    case visMiles         = "vis_miles"
        //    case uv               = "uv"
        //    case gustMph          = "gust_mph"
        //    case gustKph          = "gust_kph"
        
    }
}
