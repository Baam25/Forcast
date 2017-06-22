//
//  HomeScreenController.swift
//  Forcast
//
//  Created by Harish Gonnabhaktula on 22/06/17.
//  Copyright © 2017 Harish Gonnabattula. All rights reserved.
//

import UIKit

var currentWeather = ""

class HomeScreenController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    let forecastController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Forecast") as! ForecastWeatherController
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func toggleWeather(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.containerView.bringSubview(toFront: self.containerView.subviews.first!)
        default:
            if !self.childViewControllers.contains(forecastController){
                self.addChildViewController(forecastController)
            
                forecastController.view.frame = CGRect(x: 0, y: 0, width: self.containerView.frame.size.width, height: self.containerView.frame.size.height)
                self.containerView.addSubview(forecastController.view)
                forecastController.didMove(toParentViewController: self)
            }
            else{
                self.containerView.bringSubview(toFront: self.containerView.subviews.first!)
            }
        }
        
    }
    
    @IBAction func shareAction(_ sender: UIBarButtonItem) {
        
        let weatherString = "The current weather is " + currentWeather
        let share = UIActivityViewController(activityItems: [weatherString], applicationActivities: nil)
        present(share, animated: true, completion: nil)
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
