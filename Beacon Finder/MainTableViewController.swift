//
//  MainTableViewController.swift
//  Beacon Finder
//
//  Created by Bob Godwin Obi on 4/7/15.
//  Copyright (c) 2015 Bob Godwin Obi. All rights reserved.
//
import UIKit

class MainTableViewController: UITableViewController, LocationManagerDelegate {

    let locationManager = LocationManager()
    
    @IBOutlet var dataSource: MainTableViewDataSource?
    @IBOutlet var delegate: MainTableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.delegate = self
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.locationManager.requestCurrentLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func reloadData(){
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.tableView.reloadData()
        })
    }
    
    func showErrorMessage(error: LocationError) {
        let alertView = UIAlertView(title: "Beacon Error", message: error.description, delegate: self, cancelButtonTitle: "OK")
        alertView.alertViewStyle = .Default
        alertView.show()
    }
    
    //MARK: LocationManagerDelegate

    func locationDidSendNotification() {
        let notification = UILocalNotification()
        notification.alertBody = "Hello Bob you can have a coffe in the adidas shop next door"
        notification.soundName = "Default"
        //notification.fireDate = NSDate(timeIntervalSinceNow: 10)
        notification.applicationIconBadgeNumber = 1
        //UIApplication.sharedApplication().scheduleLocalNotification(notification)
        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
    }
    
    func locationDidFailBuildingBeaconsWithError(error: LocationError) {
        self.showErrorMessage(error)

    }
    
    func locationDidFailWithAuthorizationError(error: LocationError) {
        self.showErrorMessage(error)
    }
    
    func locationDidUpdateRegionWithBeacons(beacons: [IBeacon]!) {
        self.dataSource?.beacons = beacons
        reloadData()
    }
    
    func locationDidChangeAuthorizationStatus(authorizationStatus: Int) {
        //FIXME: Implement method for locationDidChangeAuthorizationStatus
    }
    
    func locationDidFindCurrentLocality(currentLocality: String) {
        self.locationManager.startMonitoringRegion()
        //FIXME: Just testing the notification
        self.locationDidSendNotification()
    }
    
    func locationDidFailFindingCurrentLocalityWithError(error: LocationError) {
        //FIXME: Implement method for locationDidFailFindingCurrentLocalityWithError
    }
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
}
