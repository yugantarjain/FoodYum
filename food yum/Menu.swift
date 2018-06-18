//
//  ThirdViewController.swift
//  FoodYum
//
//  Created by sanjeev jain on 23/04/18.
//  Copyright © 2018 sanjeev jain. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Menu: UIViewController {
    
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    var menuItems = ["","",""]
    var index = 0
    @IBOutlet weak var FoodLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ref = Database.database().reference()
        handle = ref.child("Menu").child("a").observe(.childAdded, with: { (snapshot) in
            self.menuItems[0] = snapshot.value as! String
            self.FoodLabel.text = self.menuItems[0]
        })
        handle = ref.child("Menu").child("b").observe(.childAdded, with: { (snapshot) in
            self.menuItems[1] = snapshot.value as! String
        })
        handle = ref.child("Menu").child("c").observe(.childAdded, with: { (snapshot) in
            self.menuItems[2] = snapshot.value as! String
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var FoodSegment: UISegmentedControl!
    @IBAction func FoodChoice(_ sender: UISegmentedControl)
    {
        if(FoodSegment.selectedSegmentIndex==0)
        {
            FoodLabel.text = menuItems[0]
        }
        else if(FoodSegment.selectedSegmentIndex==1)
        {
            FoodLabel.text = menuItems[1]
        }
        else
        {
            FoodLabel.text = menuItems[2]
        }
    }
    
    @IBAction func placeOrder(_ sender: UIButton) {
        ref.child("Orders").child(phono).childByAutoId().setValue(FoodLabel.text)
    }
    
}
