//
//  Condition.swift
//  WeatherAPI
//
//  Created by kraujalis.rolandas on 11/11/2023.
//

import Foundation

struct Condition: Codable {

  var text : String?
  var icon : String?
  var code : Int?

  enum CodingKeys: String, CodingKey {

    case text = "text"
    case icon = "icon"
    case code = "code"
  
  }

}
