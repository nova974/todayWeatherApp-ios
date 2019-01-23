//
//  DetailView.swift
//  WeatherApp
//
//  Created by William GOSSARD on 22/01/2019.
//  Copyright © 2019 william gossard. All rights reserved.
//

import UIKit

class DetailView: UIView {

    var weatherDetail: WeatherDetail? {
        didSet {
            guard let wd = weatherDetail else { return }

            iconImageView.image = UIImage(named: wd.icon)

            let attributedText = NSMutableAttributedString(string: "\(wd.title)\n", attributes: [.font: UIFont(name: "GothamPro", size: 20)!, .foregroundColor: UIColor(red: 108/255, green: 109/255, blue: 129/255, alpha: 1)])

            attributedText.append(NSAttributedString(string: wd.content, attributes: [.font: UIFont(name: "GothamPro", size: 24)!, .foregroundColor: UIColor(red: 81/255, green: 99/255, blue: 168/255, alpha: 1)]))


            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            paragraphStyle.lineSpacing = 10
            let range = NSMakeRange(0, attributedText.string.count)
            attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)

            contentLabel.attributedText = attributedText
        }
    }

    private let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "01d")
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private let contentLabel: UILabel = {
        let l = UILabel()
        l.text = "TEST"
        l.textAlignment = .center
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    private func setupView() {

        addSubview(iconImageView)
        addSubview(contentLabel)

        iconImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        iconImageView.centerXAnchor.constraint(lessThanOrEqualTo: iconImageView.superview!.centerXAnchor).isActive = true

        contentLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 15).isActive = true
        contentLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        contentLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
