//
//  SignUPViewController.swift
//  food yum
//
//  Created by yugantar jain on 13/06/18.
//  Copyright © 2018 sanjeev jain. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SignUP: UIViewController {
    
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phoneNo: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var address: UITextField!
    
    @IBAction func createAccount(_ sender: UIButton) {
        let phno = phoneNo.text
        ref.child("Users").child(phno!).child("Name").childByAutoId().setValue(name.text)
        ref.child("Users").child(phno!).child("Password").childByAutoId().setValue(password.text)
        ref.child("Users").child(phno!).child("Address").childByAutoId().setValue(address.text)
        ref.child("Users").child(phno!).child("PhoneNo").childByAutoId().setValue(phoneNo.text)
        
        presentingViewController?.dismiss(animated: true, completion: nil)
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
