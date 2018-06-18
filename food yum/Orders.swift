//
//  SecondViewController.swift
//  food yum
//
//  Created by yugantar jain on 18/05/18.
//  Copyright © 2018 sanjeev jain. All rights reserved.
//

import UIKit
import FirebaseDatabase

class Cart: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    var postData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        self.postData.removeAll()
        
        ref = Database.database().reference()
        handle = ref.child("Orders").child(phono).observe(.childAdded, with: { (snapshot) in
            let order = snapshot.value as! String
            self.postData.append(order)
            self.tableView.reloadData()
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = postData[indexPath.row]
        return cell!
    }


}

