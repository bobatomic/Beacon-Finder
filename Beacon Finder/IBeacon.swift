//
//  IBeacon.swift
//  Beacon Finder
//
//  Created by Bob Godwin Obi on 4/7/15.
//  Copyright (c) 2015 Bob Godwin Obi. All rights reserved.
//

import Foundation
import CoreLocation

struct IBeacon {
    var beacon = CLBeacon()
    var UUIDString:String {
        get {
           return beacon.proximityUUID.UUIDString as String
        }
    }
    var major:NSNumber {
        get{
            return beacon.major
        }
    }
    var minor:  NSNumber{
        get{
            return beacon.minor
        }
    }
    var proximity: CLProximity {
        get{
            return beacon.proximity
        }
    }
    
    var proximityDescription: String {
        switch self.proximity {
        case .Unknown:
            return "Beacon proximity unknown"
        case .Near:
            return "Beacon proximity close to you"
        case .Far:
            return "Beacon is quite far from you please move closer"
        case .Immediate:
            return "Beacon is in your optimate proximity"
        }
    }
    
    var description: String {
        return "\(UUIDString) is \(proximityDescription) with major \(toString(major)) and \(toString(minor)))"
    }
}
