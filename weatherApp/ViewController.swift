//
//  ViewController.swift
//  weatherApp
//
//  Created by shengxiang guo on 1/30/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var weatherPicture: UIImageView!
    
    var city :City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if city != nil {
            print("here")
            city.downloadCityDetails { () -> () in
                print("zhe")
                self.updateUI()
            }
        }

    }

    func updateUI(){
        print("city name: \(city.name)")
        nameLbl.text = city.name
        
    }

}

