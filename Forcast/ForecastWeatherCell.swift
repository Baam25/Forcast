//
//  ForecastWeatherCell.swift
//  Forcast
//
//  Created by Harish Gonnabhaktula on 22/06/17.
//  Copyright © 2017 Harish Gonnabattula. All rights reserved.
//

import UIKit

class ForecastWeatherCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var highLowLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(city:CityViewModel) {
        
        dateLabel.text = city.weatherView.dateLabel
        temperatureLabel.text = city.weatherView.temperatureViewModel.temperature_Label
        highLowLabel.text = city.weatherView.temperatureViewModel.highLowLabel
    }

}
