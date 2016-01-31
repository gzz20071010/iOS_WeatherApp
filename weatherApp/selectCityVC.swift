//
//  selectCityVC.swift
//  weatherApp
//
//  Created by shengxiang guo on 1/30/16.
//  Copyright © 2016 shengxiang guo. All rights reserved.
//

import UIKit

class selectCityVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var cities = [City]()
    var filteredCity = [City]()
    var isSearchMode = false
    let tempCity = City(name: "newyork")

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.Done
        cities.append(tempCity)
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("cityCell", forIndexPath: indexPath) as? TableViewCell{
            
            let city: City!
            if isSearchMode{
                city = filteredCity[indexPath.row]
            }else{
                city = cities[indexPath.row]
            }
            
            cell.configuerCell(city)
            return cell
        }else{
            return UITableViewCell()
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearchMode{
            return filteredCity.count
        }else{
            return cities.count
        }
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var city:City!
        if isSearchMode{
            city = filteredCity[indexPath.row]
        }else{
            city = cities[indexPath.row]
        }
        performSegueWithIdentifier("ViewController", sender: city)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            isSearchMode = false
            view.endEditing(true)
            tableView.reloadData()
        }else{
            isSearchMode = true
            let lower = searchBar.text!.lowercaseString
            filteredCity = cities.filter({$0.name.rangeOfString(lower) != nil})
            tableView.reloadData()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ViewController"{
            if let detailVC = segue.destinationViewController as? ViewController{
                if let city = sender as? City{
                    detailVC.city = city
                }
            }
        }
    }
}
