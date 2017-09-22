//
//  City.swift
//  WeatherApp
//
//  Created by Paulo on 2017-09-21.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class City: NSObject {
    var name: String
    var temperature: Int
    var precipitation: String
    
    init(name: String, temperature: Int, precipitation: String) {
        self.name = name
        self.temperature = temperature
        self.precipitation = precipitation
    }
}
