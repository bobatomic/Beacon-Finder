//
//  MainTableViewDataSource.swift
//  Beacon Finder
//
//  Created by Bob Godwin Obi on 4/7/15.
//  Copyright (c) 2015 Bob Godwin Obi. All rights reserved.
//

import UIKit

class MainTableViewDataSource: NSObject, UITableViewDataSource {
    
    private struct cellIdentifiers {
        static var IBeaconCell = "IBeaconTableViewCell"
    }
    
    var beacons:[IBeacon]?
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if beacons?.count > 0 {
            return beacons!.count
        } else {
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableview(tableView, IBeaconCellForRowAtIndexPath: indexPath)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableview(tableView: UITableView, IBeaconCellForRowAtIndexPath indexPath:NSIndexPath)->IBeaconTableViewCell {
        let cell: IBeaconTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifiers.IBeaconCell, forIndexPath: indexPath) as! IBeaconTableViewCell;
        if let beacon:IBeacon! = beacons?[indexPath.row]{
            cell.beaconDescriptionLabel?.text = beacon.description
            cell.UUIDLabel?.text = beacon.UUIDString
        } else {
            cell.beaconDescriptionLabel?.text = "OPS! no beacon currently detected try move around"
            cell.UUIDLabel?.text = "Searing for beacons"
        }
        return cell
    }
}
