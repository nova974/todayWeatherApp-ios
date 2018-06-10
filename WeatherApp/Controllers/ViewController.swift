//
//  ViewController.swift
//  WeatherApp
//
//  Created by william gossard on 07/06/2018.
//  Copyright © 2018 william gossard. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    // Outlets
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var forecastLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var loadingView: UIView!
    
    
    // Constants
    let locationManager = CLLocationManager()

    // Variables
    var weatherManager: WeatherManager!
    var currentLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager = WeatherManager()

        callDelegate()
        setupLocation()
        locationAuthCheck()
    }

    override func viewDidAppear(_ animated: Bool) {
        locationAuthCheck()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationAuthCheck() {
        if (CLLocationManager.authorizationStatus() == .authorizedWhenInUse) {
            currentLocation = locationManager.location
            
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude

            weatherManager.downloadCurrentWeather {
                self.updateUI()
                //            self.loadingView.isHidden = true
            }
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthCheck()
        }
    }
    
    func setupLocation() {
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    func callDelegate() {
        locationManager.delegate = self
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

