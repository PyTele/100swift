//
//  ViewController.swift
//  Project22
//
//  Created by Hubert Leszkiewicz on 26/10/2020.
//

import CoreLocation
import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var distanceReading: UILabel!
    var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestAlwaysAuthorization()
        
        view.backgroundColor = .lightGray
    }
    
    func locationManager (_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }
        
    func startScanning() {
        let uuid = UUID(uuidString: "5A4BCFCE-174E-4BAC-A814-092E77F6B7E5")!

        let beaconIdentity = CLBeaconIdentityConstraint(uuid: uuid, major: 123, minor: 456)
        let beaconRegion = CLBeaconRegion(beaconIdentityConstraint: beaconIdentity, identifier: "MyBeacon")

        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(satisfying: beaconIdentity)
    }
    
    func update(distance: CLProximity) {
        UIView.animate(withDuration: 1) {
        switch distance {
        
        case .far:
            self.view.backgroundColor = .green
            self.distanceReading.text = "FAR"
            
        case .near:
            self.view.backgroundColor = .orange
            self.distanceReading.text = "NEAR"
            
        case .immediate:
            self.view.backgroundColor = .gray
            self.distanceReading.text = "RIGHT HERE"
            
        default:
            self.view.backgroundColor = .lightGray
            self.distanceReading.text = "UNKNOWN"
            
            
            }
            
        }


    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if let beacon = beacons.first {
            update(distance: beacon.proximity)
        }else{update(distance: .unknown)
            
        }
    }

}
