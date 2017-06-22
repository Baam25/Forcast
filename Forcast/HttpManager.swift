//
//  HttpManager.swift
//  Forcast
//
//  Created by Harish Gonnabhaktula on 22/06/17.
//  Copyright © 2017 Harish Gonnabattula. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class HTTPManager{
    
    fileprivate var client:HTTPClient!
    fileprivate var apiKey = ""
    
    static var defaultManager = HTTPManager(with: ApiKey)
    var json:JSON!
    
    init(with key:String) {
        self.apiKey = key
        client = HTTPClient()
    }
    
    typealias WeatherHandler = (CityViewModel,Error?)->Void
    typealias ForecastHandler = ([CityViewModel],Error?)->Void
    
    func fetchTodaysWeather(with Url:String, method: httpMethod, city:String, country:String, completionHandler:@escaping WeatherHandler){
            let wURL = URL(string: baseURL+Url)!
            let params = [
                "q":city+","+country,
                "APPID":self.apiKey,
                "units":"metric"
            ]
            let hMethod = HTTPMethod(rawValue: method.description)!
        
            client.loadData(with: wURL, method: hMethod, parameters: params, encoding: URLEncoding.queryString , headers: nil) { (resultCompletion) in
                
                if let error = resultCompletion.error {
                    completionHandler(CityViewModel(), error)
                }
                if let value = resultCompletion.value {
                    self.json = JSON.init(value)
                    let c = self.formModels(weatherJSON: self.json)
                    completionHandler(c, resultCompletion.error)
                }
        }
    }
    
    func fetchFutureWeather(with Url:String, method: httpMethod, city:String, country:String,cnt:Int,completionHandler:@escaping ForecastHandler){
        
            let wURL = URL(string: baseURL+Url)!
            let params = [
                "q":city+","+country,
                "APPID":self.apiKey,
                "cnt":cnt,
                "units":"metric"
            ] as [String : Any]
            let hMethod = HTTPMethod(rawValue: method.description)!
        
            client.loadData(with: wURL, method: hMethod, parameters: params, encoding: URLEncoding.queryString , headers: nil) { (resultCompletion) in
                
                if let error = resultCompletion.error {
                    completionHandler([], error)
                }
                if let value = resultCompletion.value {
                    self.json = JSON.init(value)
                    let c = self.formForecastModels(weatherJSON: self.json)
                    completionHandler(c, resultCompletion.error)
                }
            }

    }
    
    fileprivate func formModels(weatherJSON:JSON) -> CityViewModel{
        
        let temp = weatherJSON.dictionaryValue["main"]!.dictionaryValue
        let tResult = buildTemperatureModel(temperature: temp)
        let weather = weatherJSON.dictionaryValue
        let wResult = buildWeatherModel(weather: weather, temperature: tResult.0)
        let city = buildCityModel(city: weather["name"]!.stringValue, weather: wResult.0)
        
        return city
    }
    
    fileprivate func buildWeatherModel(weather:[String:JSON], temperature: Temperature)->(Weather,WeatherViewModel){
        let date = weather["dt"]!.intValue
        let pressure = weather["main"]!.dictionaryValue["pressure"]!.doubleValue
        let humidity = weather["main"]!.dictionaryValue["humidity"]!.intValue
        let description = weather["weather"]!.arrayValue.first!.dictionaryValue["description"]!.stringValue
        let wModel = Weather(date: date, temperature: temperature, pressure: pressure, humidity: humidity, description: description)
        
        return (wModel,WeatherViewModel(weather: wModel))
    }
    
    fileprivate func buildCityModel(city:String,weather:Weather)->CityViewModel{
        let cModel = City(city: city, weather)
        return CityViewModel(city: cModel)
    }
    
    fileprivate func buildTemperatureModel(temperature:[String:JSON])->(Temperature ,TemperatureViewModel){
        
        let tempModel = Temperature(temperature["temp"]!.doubleValue, nil, temp_min: temperature["temp_min"]!.doubleValue, temp_max: temperature["temp_max"]!.doubleValue)
        
        return (tempModel,TemperatureViewModel(temperature: tempModel))
    }
    
    fileprivate func formForecastModels(weatherJSON:JSON) -> [CityViewModel]{
        
        let list = weatherJSON.dictionaryValue["list"]!.arrayValue
        var cities = [CityViewModel]()
        for value in list {
            let tempDict = value.dictionaryValue["temp"]!.dictionaryValue
            let temp = Temperature.init(nil, tempDict["day"]!.doubleValue, temp_min: tempDict["min"]!.doubleValue, temp_max: tempDict["max"]!.doubleValue)
            //let tempViewModel = TemperatureViewModel(temperature: temp)
            let weather = Weather(date: value["dt"].intValue, temperature: temp, pressure: value["pressure"].doubleValue, humidity: value["humidity"].intValue, description: value["weather"].arrayValue.first!.dictionaryValue["description"]!.stringValue)
            //let weatherViewModel = WeatherViewModel(weather: weather)
            let city = City(city: weatherJSON["city"].dictionaryValue["name"]!.stringValue, weather)
            let cityViewModel = CityViewModel(city: city)
            cities.append(cityViewModel)
            
        }
        return cities
    }
}
