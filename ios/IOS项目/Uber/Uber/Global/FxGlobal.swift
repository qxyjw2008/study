//
//  FxGlobal.swift
//  Uber
//
//  Created by Benjamin on 1/2/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

import Foundation
import UIKit

/**
 check the operate System is iOS8
 */
func isSystemiOS8() -> Bool {
    let systemVersion = Float(UIDevice.currentDevice().systemVersion)!
    return (systemVersion - iOS8) < -0.001
}