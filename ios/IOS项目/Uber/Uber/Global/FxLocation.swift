//
//  FxLocation.swift
//  Uber
//
//  Created by Benjamin on 1/3/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

import UIKit
import CoreLocation

class FxLocation: NSObject,CLLocationManagerDelegate {
    
    var manager: CLLocationManager?
    
    func startLocation() {
        if CLLocationManager.locationServicesEnabled() {
            manager = CLLocationManager()
            
            manager?.delegate = self
            //控制定位精度，越高耗电越大
            manager?.desiredAccuracy = kCLLocationAccuracyBest
            //控制定位服务更新频率。单位是“米”
            manager?.distanceFilter = 100
            
            manager?.startUpdatingLocation()
            manager?.requestAlwaysAuthorization()
        }
    }
    
    /**
     根据位置进行反地理编码
     */
    func searchAddress(newLocation location: CLLocation) {
        let corder = CLGeocoder()
        corder.reverseGeocodeLocation(location) { (marks: [CLPlacemark]?, error: NSError?) -> Void in
            if marks != nil {
                for mark in marks! {
                    FxLog(mark.name!)
                }
            }
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        FxLog(String(status.rawValue))
    }
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        searchAddress(newLocation: newLocation)
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        searchAddress(newLocation: locations[0])
        //停止更新服务，如果定位服务不需要实时更新的话，那么应该停止位置的更新
        manager.stopUpdatingLocation()
    }
}
