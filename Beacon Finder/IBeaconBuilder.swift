//
//  IBeaconBuilder.swift
//  Beacon Finder
//
//  Created by Bob Godwin Obi on 4/7/15.
//  Copyright (c) 2015 Bob Godwin Obi. All rights reserved.
//

import Foundation
import CoreLocation
import CoreBluetooth

class IBeaconBuilder {

    func buildIBeaconFromManagerResponse(response: [AnyObject]) -> [IBeacon] {
        var beacons = [IBeacon]()
        
        for (index, value) in enumerate(response){
            let beacon:CLBeacon = value as! CLBeacon
            var iBeacon = IBeacon()
            iBeacon.beacon = beacon
            beacons.append(iBeacon)
        }
        return beacons
    }
}