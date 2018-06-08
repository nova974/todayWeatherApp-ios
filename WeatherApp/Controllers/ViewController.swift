//
//  ViewController.swift
//  WeatherApp
//
//  Created by william gossard on 07/06/2018.
//  Copyright © 2018 william gossard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var humidity: Int = 0
    var temp: Int = 0
    var wind: Float = 0
    var icon: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        manager.delegate = self
//        manager.desiredAccuracy = kCLLocationAccuracyBest
//        manager.requestWhenInUseAuthorization()
//        manager.startUpdatingLocation()
//        
//        Alamofire.request("http://api.openweathermap.org/data/2.5/weather?q=paris&appid=8863ddaed7e91e62ec5cab0b846e913d&units=metric").responseJSON { response in
//            let resJson = JSON(response.result.value!)
//            self.humidity = resJson["main"]["humidity"].int!
//            self.temp = resJson["main"]["temp"].int!
//            self.wind = resJson["wind"]["speed"].float!
//            self.icon = resJson["weather"][0]["main"].string!.lowercased()
//
//            print(self.humidity)
//            print(self.temp)
//            print(self.wind)
//            print(self.icon)
//            print(resJson)
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//            }
//            
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
//            }
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

