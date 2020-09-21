//
//  capital.swift
//  Project 16
//
//  Created by Hubert Leszkiewicz on 14/09/2020.
//

import UIKit
import MapKit

class capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    

    }

}
