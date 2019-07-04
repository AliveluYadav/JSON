//
//  ViewController.swift
//  JSON
//
//  Created by Alivelu Ravula on 4/18/18.
//  Copyright © 2018 Alivelu Ravula. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var URLSessionObj:URLSession?
    var URLReq:URLRequest?
    var dataTask:URLSessionDataTask?
    
    
    @IBOutlet weak var TF1: UITextField!
    @IBOutlet weak var TF2: UITextField!
    
  

    @IBAction func btnAction(_ sender: Any) {
        
        
        self.URLSessionObj=URLSession(configuration: .default)
        self.URLReq=URLRequest(url: URL(string:"https:www.brninfotech.com/pulse/modules/admin/ValidateLogin.php")!)
        self.URLReq?.httpMethod="POST"
        
        
        
        
        let dataToPass="funcName=verifyLogin&registeredEmail="+self.TF1.text!+"&registeredPassword="+self.TF2.text!
        self.URLReq?.httpBody=dataToPass.data(using: String.Encoding.utf8)
        self.dataTask=self.URLSessionObj?.dataTask(with: URLReq!, completionHandler: {(data,resp,error) in
            
            print(data)
            
            do{
                var serverRespDic:[String:String]=try
                
                JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:String]
                
                print(serverRespDic)
            }
                catch
                {
                    print("something went wrong")
                }
            })
        
        self.dataTask?.resume()
        
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

