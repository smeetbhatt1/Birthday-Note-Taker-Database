//
//  ViewController.swift
//  BDay Note Taker-StoringData
//
//  Created by smeetbhatt on 15/10/17.
//  Copyright © 2017 smeetbhatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var bdayText: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedDate = UserDefaults.standard.object(forKey: "bday")
        
        if let newName = storedName as? String{
            nameLabel.text = "Stored Name: \(newName)"
        }
        if let newDate = storedDate as? String {
            bdayLabel.text = "Stored Name: \(newDate)"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveButton(_ sender: Any) {
        UserDefaults.standard.set(nameText.text, forKey: "name")
        UserDefaults.standard.set(bdayText.text, forKey: "bday")
        UserDefaults.standard.synchronize()
        
        nameLabel.text = "Stored Name: \(nameText.text!)"
        bdayLabel.text = "Stored Date: \(bdayText.text!)"
        
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedDate = UserDefaults.standard.object(forKey: "bday")
        
        if let _ = storedName as? String{
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Stored Name: )"
        }
        if let _ = storedDate as? String {
            UserDefaults.standard.removeObject(forKey: "bday")
            bdayLabel.text = "Stored Name: )"
        }
    }
}

