//
//  Config.swift
//  WeatherApp
//
//  Created by william gossard on 09/06/2018.
//  Copyright © 2018 william gossard. All rights reserved.
//

import Foundation

let API_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude)&lon=\(Location.sharedInstance.longitude)&appid=8863ddaed7e91e62ec5cab0b846e913d&units=metric"

typealias DownloadComplete = () -> ()
