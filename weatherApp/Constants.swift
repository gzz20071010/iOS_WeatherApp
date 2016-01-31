//
//  Constants.swift
//  weatherApp
//
//  Created by shengxiang guo on 1/30/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import Foundation

let API_KEY = "&appid=a6532c48f7aa4c6aeb394e6cfdedd6d0"
let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?q="
typealias DownloadComplete = () -> ()


func kToF(k: Double) ->Int {
    let f = k*9.0/5.0 - 459.67
    let y = Int(round(f))
    return y
}