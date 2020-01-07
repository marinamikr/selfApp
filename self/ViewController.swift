//
//  ViewController.swift
//  self
//
//  Created by 原田摩利奈 on 2019/12/17.
//  Copyright © 2019 原田摩利奈. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    var realm :Realm!
    var realmModelArray:Results<RealmModel>!
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var label1:UILabel!
    @IBOutlet var label2:UILabel!
    @IBOutlet var label3:UILabel!
    @IBOutlet var label4:UILabel!
    @IBOutlet var label5:UILabel!
    @IBOutlet var label6:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        realm = try! Realm()
        realmModelArray = realm.objects(RealmModel.self)
        label1.text = realmModelArray[0].text
        label2.text = realmModelArray[1].text
        label3.text = realmModelArray[2].text
        label4.text = realmModelArray[3].text
        label5.text = realmModelArray[4].text
        label6.text = realmModelArray[5].text

        
    }
    
    @IBAction func addButton() {
        
        let saveData = RealmModel()
        saveData.text = textField.text
        try! realm.write() {
            realm.add(saveData)
        }
        print(saveData.text)
        
        
        
    }
    
}

