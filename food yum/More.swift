//
//  FirstViewController.swift
//  food yum
//
//  Created by yugantar jain on 18/05/18.
//  Copyright © 2018 sanjeev jain. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    let me = UserDefaults(suiteName: "remem")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signout(_ sender: Any) {
        me?.set(false, forKey: "remember")
        performSegue(withIdentifier: "signOut", sender: self)
    }
    
}

