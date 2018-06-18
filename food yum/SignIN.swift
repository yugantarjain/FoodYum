//
//  SignIN.swift
//  food yum
//
//  Created by yugantar jain on 13/06/18.
//  Copyright © 2018 sanjeev jain. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SignIN: UIViewController {
    
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    let me = UserDefaults(suiteName: "remem")!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        ref = Database.database().reference()
    }
    override func viewDidAppear(_ animated: Bool) {
        if(me.bool(forKey: "remember")==true)
        {
            phono = me.string(forKey: "phoneNo")!
            self.performSegue(withIdentifier: "toApp", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var phoneno: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var remember: UISwitch!
    
    @IBAction func SubmitDetails(_ sender: UIButton) {
        
        handle = ref.child("Users").child(phoneno.text!).child("Password").observe(.childAdded, with: { (snapshot) in
            let pass = snapshot.value as! String
            if(pass==self.password.text)
            {
                if( self.remember.isOn )
                {
                    self.me.set(self.phoneno.text , forKey: "phoneNo")
                    self.me.set(self.password.text , forKey: "password")
                    self.me.set(true, forKey: "remember")
                }
                
                phono = self.phoneno.text!
                self.performSegue(withIdentifier: "toApp", sender: self)
            }
        })
    }
    
    
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
