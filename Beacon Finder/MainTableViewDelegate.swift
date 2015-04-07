//
//  MainTableViewDelegate.swift
//  Beacon Finder
//
//  Created by Bob Godwin Obi on 4/7/15.
//  Copyright (c) 2015 Bob Godwin Obi. All rights reserved.
//

import UIKit

class MainTableViewDelegate: NSObject, UITableViewDelegate {
    
    var beacons:[IBeacon]?
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        //FIXME: Implement the most famos method of tableView delegate Later
        var beacon = beacons![indexPath.row]
        println("\(beacon.description)")
    }
   
}
