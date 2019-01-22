//
//  HomeView.swift
//  WeatherApp
//
//  Created by William GOSSARD on 22/01/2019.
//  Copyright © 2019 william gossard. All rights reserved.
//

import UIKit

class HomeView: UIView {

    private let topView: UIView = {
        var v: UIView = UIView()
        v.backgroundColor = .yellow
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private let tempLabel: UILabel = {
        var l: UILabel = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = .purple
        l.text = "30 *"
        return l
    }()

    private let cityLabel: UILabel = {
        var l: UILabel = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.backgroundColor = .blue
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
        backgroundColor = .red

        addSubview(topView)
        addSubview(tempLabel)
        addSubview(cityLabel)

        

        topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topView.bottomAnchor.constraint(equalTo: centerYAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true


        cityLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -20).isActive = true
        cityLabel.widthAnchor.constraint(equalTo: topView.widthAnchor).isActive = true

        tempLabel.bottomAnchor.constraint(equalTo: cityLabel.topAnchor, constant: 0).isActive = true
        tempLabel.widthAnchor.constraint(equalTo: cityLabel.widthAnchor).isActive = true
    }
}
