//
//  Person.swift
//  Project10
//
//  Created by Hubert Leszkiewicz on 16/08/2020.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String

    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
