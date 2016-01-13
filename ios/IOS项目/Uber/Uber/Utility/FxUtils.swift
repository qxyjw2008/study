//
//  FxUtils.swift
//  Uber
//
//  Created by Benjamin on 1/5/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

import Foundation
import UIKit

struct FxUtils {
    
    static func setCornerRadius(view: UIView, radius: CGFloat) {
        view.layer.cornerRadius = radius
        view.layer.masksToBounds = true
    }
}