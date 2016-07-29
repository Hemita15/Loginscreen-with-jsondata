//
//  ViewController.swift
//  LoginScreen
//
//  Created by Hemita Pathak on 13/07/16.
//  Copyright © 2016 InformationWorks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //MARK:Properties
    
    @IBOutlet weak var UsernameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(true)
        
        self.performSegueWithIdentifier("home", sender: self)
        
        let pref : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let isLoggedIn : Int = pref.integerForKey("isLoggedIn") as Int
        if (isLoggedIn != 1 )
        {
            self.performSegueWithIdentifier("home", sender: self)
            
        }
        
           else
        {
            self.UsernameLabel.text = pref.valueForKey("usename") as? String
        }
        
    }
    
    
    
    //MARK:Actions
    
    
    @IBAction func Logoutapped(sender: UIButton) {
        
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        
        self.performSegueWithIdentifier("home", sender: self)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

