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
        let replaced = name.stringByReplacingOccurrencesOfString(" ", withString: "")
        print("teimmedString")
        print(replaced)
        print("trimmedString")
        self._name = name
        self._cityURL = "\(BASE_URL)\(replaced)\(API_KEY)"
    }
    
    func downloadCityDetails(completed: DownloadComplete){
        let url = NSURL(string: _cityURL)!
        Alamofire.request(.GET, url).responseJSON{ response in
            let result = response.result
            if let descDict = result.value as? Dictionary<String, AnyObject>{
                print("2")
                print(self.name)
                if let name = descDict["name"] as? String{
                    self._name = name
                    print("1")
                    print(self.name)
                    print(self._name)
                }
                if let main = descDict["main"] as? Dictionary<String, AnyObject>{
               
                    if let temp = main["temp"] as? Double{
                        self._temp = "\(kToF(temp))"
                    }
                }
                if let weather = descDict["weather"] as? [Dictionary<String, AnyObject>]{
                    if let main = weather[0]["main"]{
                        print(main)
                        self._weather = main as! String
                    }
                }
            }else{
                self._name = ""
            }
            completed()
        }
    }
}