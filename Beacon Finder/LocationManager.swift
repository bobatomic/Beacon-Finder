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

class LocationManager: NSObject, CLLocationManagerDelegate, LocationManagerDelegate {

    //MARK: LocationManagerDelegate
    
    func locationDidChangeAuthorizationStatus(authorizationStatus: Int) {
        //FIXME: Implement method for locationDidChangeAuthorizationStatus
    }
    
    func locationDidFindCurrentLocality(currentLocality: String) {
        //FIXME: Implement method for locationDidFindCurrentLocality
    }
    
    func locationDidFailFindingCurrentLocalityWithError(error: LocationError) {
        //FIXME: Implement method for locationDidFailFindingCurrentLocalityWithError
    }
}


enum LocationError: Printable {
    case LocationUnknownError
    case LocationNetworkError
    case LocationAccessibilityError
    case LocationCoreRegionError
    case LocationProximityError
    case LocationBeaconError
    
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
        case .LocationBeaconError:
            return "Beacon not responding please move around"
        case .LocationProximityError:
            return "Low proximity signal"
        }
    }
}
