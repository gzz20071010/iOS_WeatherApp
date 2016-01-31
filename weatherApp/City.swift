//
//  City.swift
//  weatherApp
//
//  Created by shengxiang guo on 1/30/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import Foundation
import Alamofire

class City{
    private var _name: String!
    private var _temp: String!
    private var _weather: String!
    private var _cityURL: String!

    var name: String{
        if _name == nil{
            _name = ""
        }
        return _name
    }
    
    var temp: String{
        if _temp == nil{
            _temp = ""
        }
        return _temp
    }
    
    var weather: String{
        if _weather == nil{
            _weather = ""
        }
        return _weather
    }
    
    var cityURL: String{
        if _cityURL == nil {
            _cityURL = ""
        }
        return _cityURL
    }
    
    init (name: String){
        self._name = name
        self._cityURL = "\(BASE_URL)\(name)\(API_KEY)"
    }
    
    func downloadCityDetails(completed: DownloadComplete){
        let url = NSURL(string: _cityURL)!
        Alamofire.request(.GET, url).responseJSON{ response in
            let result = response.result
            if let descDict = result.value as? Dictionary<String, AnyObject>{
                if let name = descDict["name"] as? String{
                    self._name = name
                    print(self.name)
                }
            }else{
                self._name = ""
            }
        }
    }
}