//
//  ViewController.swift
//  hw20160502
//
//  Created by AI Matsubara on 2016/05/02.
//  Copyright © 2016年 AI Matsubara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTextField.returnKeyType = UIReturnKeyType.Search

    }
    
    override func viewWillAppear(animated: Bool) {
        var myDefault = NSUserDefaults.standardUserDefaults()
        var myStr = myDefault.stringForKey("myString")
        if let tmpStr = myStr {
            myTextField.text = tmpStr
            print(tmpStr)
        }
    }


    @IBAction func tapSearch(sender: UITextField) {
        
        if myTextField.text == ""{
            var alertController = UIAlertController(
                title: "未入力",
                message: "何か入力して下さい",
                preferredStyle: .Alert)
            
            alertController.addAction(UIAlertAction(
                title: "OK",
                style: .Default,
                handler: { action in print("OK") } ))
            
            presentViewController(alertController, animated: true, completion: nil)
            
            return
        }

        
        var myDefault = NSUserDefaults.standardUserDefaults()
        myDefault.setObject(sender.text, forKey: "myString")
        myDefault.synchronize()
        
        var myURL = NSURL(string:sender.text!)
        
        var myURLReq = NSURLRequest(URL: myURL!)
        
        myWebView.loadRequest(myURLReq)
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

