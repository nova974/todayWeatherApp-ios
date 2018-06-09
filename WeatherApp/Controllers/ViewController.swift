//
//  ViewController.swift
//  WeatherApp
//
//  Created by william gossard on 07/06/2018.
//  Copyright © 2018 william gossard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var forecastLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var loadingView: UIView!
    
    
    var weatherManager: WeatherManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadingView.isHidden = false
        weatherManager = WeatherManager()
        weatherManager.downloadCurrentWeather {
            print("data downloaded")
            self.updateUI()
            self.loadingView.isHidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    func updateUI() {
        self.cityLabel.text = weatherManager.city
        self.tempLabel.text = "\(Int(weatherManager.currentTemp))°"
        self.icon.image = UIImage(named: weatherManager.icon)
        self.windLabel.text = "\(weatherManager.wind) km/h"
        self.forecastLabel.text = weatherManager.forecast
        self.humidityLabel.text = "\(weatherManager.humidity)%"
    }

}

