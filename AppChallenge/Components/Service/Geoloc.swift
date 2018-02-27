//
//  Geoloc.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 25/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit
import CoreLocation

private let instance = Geoloc()

class Geoloc: NSObject {
    
    class var shared: Geoloc { return instance }
    
    var manager: CLLocationManager?
    var lastLocation: CLLocation?
    
    func userLocationRequired() {
        requireLocation()
    }
    
    fileprivate func requireLocation() {
        if manager == nil {
            manager = ({
                let locationManager = CLLocationManager()
                locationManager.delegate = self
                locationManager.distanceFilter = kCLDistanceFilterNone
                locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
                locationManager.requestWhenInUseAuthorization()
                
                return locationManager
            })()
        }
        
        startLocationRequest()
    }
    
    func startLocationRequest() {
        guard let locationManager = manager else { validateAndRequireLocation(); return  }
        locationManager.startUpdatingLocation()
    }
    
    func stopLocationRequests() {
        guard let locationManager = manager else { return }
        locationManager.stopUpdatingLocation()
    }
    
    func userLocationAvailable() -> Bool {
        
        //UITesting
        if ProcessInfo.processInfo.arguments.contains("UITesting") { return true }
        if ProcessInfo.processInfo.arguments.contains("UITestingOnboarding") { return false }
        
        if !CLLocationManager.locationServicesEnabled() { return false }
        if CLLocationManager.authorizationStatus() == .denied { return false }
        if CLLocationManager.authorizationStatus() == .restricted { return false }
        if CLLocationManager.authorizationStatus() == .notDetermined { return false }
        return true
    }
    
    func currentLocation() -> String? {
        guard let location = lastLocation else { return nil }
        return "\(location.coordinate.latitude),\(location.coordinate.longitude)"
    }
    
    func defaultLocation() {
        guard let lat = CLLocationDegrees(exactly: -23.5632103), let lng = CLLocationDegrees(exactly: -46.6542503) else { return }
        lastLocation = CLLocation(latitude: lat, longitude: lng)
    }
    
    fileprivate func validateAndRequireLocation() {
        let value = UserDefaults.standard.object(forKey: OnboardingController.onboardingComplete()) as? Bool
        if value ?? false { requireLocation() }
    }
}

extension Geoloc: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        lastLocation = location
        NotificationCenter.default.post(name: .location, object: nil, userInfo: nil)
    }
    
    /// When location fail (set paulista with default location)
    ///
    /// - Parameters:
    ///   - manager: CLLocationManager
    ///   - error: error
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        defaultLocation()
        NotificationCenter.default.post(name: .location, object: nil, userInfo: nil)
    }
}
