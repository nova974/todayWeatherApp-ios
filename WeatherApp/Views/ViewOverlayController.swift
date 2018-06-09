//
//  ViewOverlayController.swift
//  WeatherApp
//
//  Created by william gossard on 09/06/2018.
//  Copyright © 2018 william gossard. All rights reserved.
//

import UIKit

class ViewOverlayController: UIView {

    @IBOutlet var contentView: UIView!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.cummonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.cummonInit()
    }
    
    private func cummonInit() {
        Bundle.main.loadNibNamed("ViewOverlay", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
