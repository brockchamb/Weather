//
//  Weather.swift
//  Weather
//
//  Created by admin on 2/17/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class Weather {
    
    private let kMain = "main"
    private let kDescription = "description"
    private let kIconString = "iconString"
    private let kIconImage = "iconImage"
    private let ktemperatureK = "temperatureK"
    private let kCityName = "cityName"
    private let ktemperatureC = "temperatureC"
    
    var main: String
    var description: String
    var iconString: String
    var iconImage: UIImage?
    var temperatureK: Float?
    var cityName: String
    var temperatureC: Float? {
        return temperatureK! - 273.15
    }
    
    init(jsonDictionary:[String:AnyObject]) {
        guard let main = jsonDictionary[kMain] as? String,
              let description = jsonDictionary[kDescription] as? String,
              let iconString = jsonDictionary[kIconString] as? String,
              let iconImage = jsonDictionary[kIconImage] as? UIImage?,
              let temperatureK = jsonDictionary[ktemperatureK] as? Float?,
              let cityName = jsonDictionary[kCityName] as? String else {
                self.main = ""
                self.description = ""
                self.iconString = ""
                self.iconImage = nil
                self.temperatureK = nil
                self.cityName = ""
            
                return
        }
        self.main = main
        self.description = description
        self.iconString = iconString
        self.cityName = cityName
        self.iconImage = iconImage
        self.temperatureK = temperatureK
    }
    
}