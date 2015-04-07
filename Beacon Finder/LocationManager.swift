//
//  LocationManager.swift
//  Beacon Finder
//
//  Created by Bob Godwin Obi on 4/7/15.
//  Copyright (c) 2015 Bob Godwin Obi. All rights reserved.
//

import Foundation
import CoreLocation
import CoreBluetooth

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    let manager:CLLocationManager
    var delegate:LocationManagerDelegate?
    var region:CLRegion?
    var locality:String?
    
    override init() {
        self.manager = CLLocationManager()
        super.init()
        self.manager.delegate = self
    }
    
    func requestCurrentLocation() {
        if CLLocationManager.authorizationStatus() == .NotDetermined {
            manager.requestWhenInUseAuthorization()
            return
        }
        
        let status = CLLocationManager.authorizationStatus()
        
        if CLLocationManager.locationServicesEnabled() &&  (status == .AuthorizedAlways || status == .AuthorizedWhenInUse) {
            manager.startUpdatingLocation();
        } else {
            self.delegate?.locationDidFailFindingCurrentLocalityWithError(LocationError.LocationAuthorizationError)
        }
    }
    
    func startMonitoringRegion(){
        self.manager.startMonitoringForRegion(self.region)
    }
    
    func findLocalityForLocation(location: CLLocation){
    
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            let placemark:CLPlacemark = placemarks.last as! CLPlacemark
            self.region = placemark.region
            self.locality = placemark.locality
            self.delegate?.locationDidFindCurrentLocality(self.locality!)
        })
    }
    
    //MARK: CLLocationManagerDelegate methods
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        self.manager.stopUpdatingLocation()
        let location:CLLocation = locations.last as! CLLocation
        self.findLocalityForLocation(location)
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse || status == .AuthorizedAlways {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        let beaconBuilder = IBeaconBuilder()
        let beacons = beaconBuilder.buildIBeaconFromManagerResponse(beacons)
        self.delegate!.locationDidupdateRegionWithBeacons(beacons)
    }
}

enum LocationError: Printable {
    
    case LocationUnknownError
    case LocationNetworkError
    case LocationAccessibilityError
    case LocationCoreRegionError
    case LocationProximityError
    case LocationBeaconResponseError
    case LocationBeaconsUpdateError
    case LocationAuthorizationError
    
    var description: String {
        
        switch self
        {
        case .LocationUnknownError:
            return "Unknown Error please restart application"
        case .LocationNetworkError:
            return "Network or internet connection unavailable"
        case .LocationAccessibilityError:
            return "Please allow Beacon Finder to access your location"
        case .LocationCoreRegionError:
            return "The current region is not supported"
        case .LocationBeaconResponseError:
            return "Beacon not responding please move around"
        case .LocationBeaconsUpdateError:
            return "Cannot update beacons please try again"
        case .LocationProximityError:
            return "Low proximity signal"
        case .LocationAuthorizationError:
            return "Please enable Beacon Finder to use location service"
        }
    }
}
