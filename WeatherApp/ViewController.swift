//
//  ViewController.swift
//  WeatherApp
//
//  Created by Student016 on 12/09/18.
//  Copyright © 2018 mahesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tempTextField: UITextField!
    
    
    @IBOutlet weak var humidityTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    override func
        viewDidLoad() {
        super.viewDidLoad()
    
        

        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    
    @IBAction func showWeatherDetails(_ sender: UIButton) {
        
        
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=e57b6b7cbcbda6455c1f5464dc58303d"
        let url = NSURL(string: urlString)! as URL
        let sessionConf = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConf)
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            let r = response
            if (r != nil){
                let d = data
                if(d != nil)
                {
                    do{
                        let firstDic:[String:Any] = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:Any]
                        //  print(firstDic)
                        
                        let weatherArray:[[String:Any]] = firstDic["weather"] as! [[String:Any]]
                        
                        // print(weatherArray)
                        
                        let descDic:[String:Any] = weatherArray.first!
                        // print(descDic)
                        
                        let strDes:String = descDic["description"] as! String
                        
                        print("Got Description:\(strDes)")
                        
                        
                        let mainDic:[String:Any] = firstDic["main"] as! [String:Any]
                        
                        
                        let humidity:NSNumber = mainDic["humidity"] as! NSNumber
                        
                        
                        
                        let strhumidity:String = humidity.stringValue
                        
                        print("Got humidity:\(strhumidity)")
                        
                        let temperature:NSNumber = mainDic["temp"] as! NSNumber
                        
                        let strtemperature:String = temperature.stringValue
                        
                        print("Got temperature:\(strtemperature)")
                        
                        DispatchQueue.main.async {
                            
                            self.tempTextField.text = strtemperature
                            self.humidityTextField.text = strhumidity
                            self.descriptionTextField.text = strDes
                        }
                        
                        
                        
                        
                        
                        
                        
                    }
                    catch
                    {
                        print(error.localizedDescription)
                    }
                    
                    
                }
                else{
                    print("Data not found:\(String(describing: error?.localizedDescription))")
                }
                
                
                
                
                
                
                
                
            }
            else{
                
                print("Response not found:\(String(describing: error?.localizedDescription))")
            }
            
            
            
        }
        
        
        
        dataTask.resume()
        
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

