//
//  CurrentDayWeatherController.swift
//  Forcast
//
//  Created by Harish Gonnabhaktula on 22/06/17.
//  Copyright © 2017 Harish Gonnabattula. All rights reserved.
//

import UIKit

class CurrentDayWeatherController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var highLowLabel: UILabel!

    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    
    let httpManager = HTTPManager.defaultManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchTodaysWeather()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetchTodaysWeather() {
        httpManager.fetchTodaysWeather(with: "/weather", method: .get, city: "Mumbai", country: "IN"){ (city, error) in
            if error != nil {
                //show error
            }
            else{
                self.reloadView(wCity: city)
            }
        }
    }
    
    func reloadView(wCity:CityViewModel?) {
        
        if let value = wCity {
            
            cityNameLabel.text = value.nameLabelText
            dayLabel.text = value.weatherView.dateLabel
            temperatureLabel.text = value.weatherView.temperatureViewModel.temperature_Label
            highLowLabel.text = value.weatherView.temperatureViewModel.highLowLabel
            weatherDescriptionLabel.text = value.weatherView.descriptionLabel
            humidityLabel.text = value.weatherView.humidityLabel
            pressureLabel.text = value.weatherView.pressureLabel
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
