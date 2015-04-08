//
//  LocationManagerDelegate.swift
//  Beacon Finder
//
//  Created by Bob Godwin Obi on 4/7/15.
//  Copyright (c) 2015 Bob Godwin Obi. All rights reserved.
//

import Foundation

protocol LocationManagerDelegate {
    
    func locationDidFindCurrentLocality(currentLocality: String)
    func locationDidFailFindingCurrentLocalityWithError(error: LocationError)
    func locationDidChangeAuthorizationStatus(authorizationStatus: Int)
    func locationDidFailWithAuthorizationError(error: LocationError)
    func locationDidUpdateRegionWithBeacons(beacons: [IBeacon]!)
    func locationDidSendNotification()
    func locationDidFailBuildingBeaconsWithError(error: LocationError)
}
