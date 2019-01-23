//
//  HomeView.swift
//  WeatherApp
//
//  Created by William GOSSARD on 22/01/2019.
//  Copyright © 2019 william gossard. All rights reserved.
//

import UIKit

class HomeView: UIView {

    var weatherModel: WeatherManager? {
        didSet {
            guard let wm = weatherModel else { return }

            tempLabel.text = "\(Int(wm.currentTemp))°"
            cityLabel.text = wm.city
            setupWeatherDetailsInfo()
        }
    }

    private let topView: UIView = {
        var v: UIView = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let tempLabel: UILabel = {
        var l: UILabel = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        l.textColor = UIColor(red: 81/255, green: 99/255, blue: 168/255, alpha: 1)
        l.font = UIFont(name: "GothamPro", size: 125.0)
        l.text = "30°"
        return l
    }()

    private let cityLabel: UILabel = {
        var l: UILabel = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textAlignment = .center
        l.textColor = UIColor(red: 108/255, green: 109/255, blue: 129/255, alpha: 1)
        l.font = UIFont(name: "GothamPro", size: 40)
        l.text = "Paris"
        return l
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .white

        addSubview(topView)
        addSubview(tempLabel)
        addSubview(cityLabel)
        

        topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topView.bottomAnchor.constraint(equalTo: centerYAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

        cityLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -40).isActive = true
        cityLabel.widthAnchor.constraint(equalTo: topView.widthAnchor).isActive = true

        tempLabel.bottomAnchor.constraint(equalTo: cityLabel.topAnchor, constant: -10).isActive = true
        tempLabel.widthAnchor.constraint(equalTo: cityLabel.widthAnchor).isActive = true
    }

    fileprivate func setupWeatherDetailsInfo() {
        let forcastContainerView = DetailView()
        forcastContainerView.weatherDetail = WeatherDetail(icon: weatherModel?.icon ?? "", title: "Forecast", content: weatherModel?.forecast ?? "")

        let windContainerView = DetailView()
        windContainerView.weatherDetail = WeatherDetail(icon: "wind", title: "Wind", content: "\(weatherModel!.wind) km/h")

        let humidityContainerView = DetailView()
        humidityContainerView.weatherDetail = WeatherDetail(icon: "mist", title: "Humidity", content: "\(weatherModel!.humidity)%")

        let stackView: UIStackView = UIStackView(arrangedSubviews: [forcastContainerView, windContainerView, humidityContainerView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually

        addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 40).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

    }
}
