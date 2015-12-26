//
//  BCDownloadButton.swift
//  PopDemo2
//
//  Created by Benjamin on 12/19/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class BCDownloadButton: UIControl {
    
    /* 进度条长度 */
    let progressLength: CGFloat!
    /* button的直径 */
    let diameter: CGFloat!

    init(diameter: CGFloat, center: CGPoint, color mainColor: UIColor, progressLineColor progressColor: UIColor, downloadIcon icon: UIImage, progressViewLength length: CGFloat) {
        let origin = CGPointMake(center.x - diameter/2, center.y - diameter/2)
        let frame = CGRectMake(origin.x, origin.y, diameter, diameter)
        self.progressLength = length
        self.diameter = diameter
        
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
