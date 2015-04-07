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
    
    let manager = CLLocationManager()
    var delegate:LocationManagerDelegate?
    
    func requestCurrentLocation() {
        if CLLocationManager.locationServicesEnabled(){
            manager.startUpdatingLocation();
        }
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse || status == .AuthorizedAlways {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        let beaconBuilder = IBeaconBuilder()
        let beacons = beaconBuilder.buildIBeaconFromManagerResponse(beacons)
        if (self.delegate?.locationDidupdateRegionWithBeacons(beacons) == nil){
            self.delegate?.locationDidFailBuildingBeaconsWithError(LocationError.LocationBeaconsUpdateError)
        }
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
        }
    }
}
