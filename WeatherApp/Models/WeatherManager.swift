//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by william gossard on 08/06/2018.
//  Copyright © 2018 william gossard. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherManager {
    
    private var _city: String!
    private var _temp: Double!
    private var _forecast: String!
    private var _iconForcast: String!
    private var _wind: Int!
    private var _humidity: Int!
    
    var city: String {
        if (self._city == nil) {
            _city = ""
        }
        return _city
    }
    
    var currentTemp: Double {
        if (_temp == nil) {
            _temp = 0.0
        }
        return _temp
    }
    
    var forecast: String {
        if (self._forecast == nil) {
            _forecast = ""
        }
        return _forecast
    }
    
    var icon: String {
        if (self._iconForcast == nil) {
            _iconForcast = "01d"
        }
        return _iconForcast
    }
    
    var wind: Int {
        if (self._wind == nil) {
            _wind = 0
        }
        return _wind
    }
    
    var humidity: Int {
        if (self._humidity == nil) {
            _humidity = 0
        }
        return _humidity
    }
    
    func downloadCurrentWeather(completed: @escaping DownloadComplete) {
        Alamofire.request(API_URL).responseJSON { response in
            // TODO: gestion erreur
            let resjson = JSON(response.result.value!)
            print(resjson)
            self._city = resjson["name"].string
            self._temp = resjson["main"]["temp"].double?.rounded()
            self._forecast = resjson["weather"][0]["main"].string
            self._humidity = resjson["main"]["humidity"].int
            self._wind = resjson["wind"]["speed"].int
            self._iconForcast = resjson["weather"][0]["icon"].string?.lowercased()
            print(self._iconForcast)
            completed()
            
        }
    }
}
