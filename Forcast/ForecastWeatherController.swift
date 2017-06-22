//
//  ForecastWeatherController.swift
//  Forcast
//
//  Created by Harish Gonnabhaktula on 22/06/17.
//  Copyright © 2017 Harish Gonnabattula. All rights reserved.
//

import UIKit

class ForecastWeatherController: UITableViewController {

    let httpManager = HTTPManager.defaultManager
    var datasource = [CityViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchForecast()
        self.tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datasource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! ForecastWeatherCell

        cell.configureCell(city: datasource[indexPath.row])

        return cell
    }
 

    func fetchForecast() {
        
        httpManager.fetchFutureWeather(with: "/forecast/daily", method: .get, city: "Mumbai", country: "IN", cnt: 7) { (cityModels, error) in
            if error != nil {
                //show error
            }
            else{
                self.datasource = cityModels
                self.tableView.reloadData()
            }
        }
    }
}
