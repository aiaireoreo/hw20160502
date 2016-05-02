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
        // Do any additional setup after loading the view, typically from a nib.
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
        
        myTextField.returnKeyType = UIReturnKeyType.Search
        
        
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

