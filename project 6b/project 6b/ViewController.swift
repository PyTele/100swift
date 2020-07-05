//
//  ViewController.swift
//  project 6b
//
//  Created by Hubert Leszkiewicz on 05/07/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let lableone = UILabel()
        lableone.translatesAutoresizingMaskIntoConstraints = false
        lableone.backgroundColor = .red
        lableone.text = "THESE"
        lableone.sizeToFit()
        
        let labletwo = UILabel()
        labletwo.translatesAutoresizingMaskIntoConstraints = false
        labletwo.backgroundColor = .cyan
        labletwo.text = "ARE"
        labletwo.sizeToFit()
        
        let lablethree = UILabel()
        lablethree.translatesAutoresizingMaskIntoConstraints = false
        lablethree.backgroundColor = .yellow
        lablethree.text = "SOME"
        lablethree.sizeToFit()
        
        let lablefour = UILabel()
        lablefour.translatesAutoresizingMaskIntoConstraints = false
        lablefour.backgroundColor = .green
        lablefour.text = "AWESOME"
        lablefour.sizeToFit()
        
        let lablefive = UILabel()
        lablefive.translatesAutoresizingMaskIntoConstraints = false
        lablefive.backgroundColor = .orange
        lablefive.text = "LABLES"
        lablefive.sizeToFit()
        
        view.addSubview(lableone)
        view.addSubview(labletwo)
        view.addSubview(lablethree)
        view.addSubview(lablefour)
        view.addSubview(lablefive)
        
        let viewdc = ["lableone": lableone, "labletwo": labletwo, "lablethree": lablethree, "lablefour": lablefour, "lablefive": lablefive]
        for lable in viewdc.keys {
            view.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(lable)]|", options: [], metrics: nil, views: viewdc))
            }
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lableone]-[labletwo]-[labelthree]-[lablefour]-[lablefive]", options: [], metrics: nil, views: viewdc))
        }
    }




