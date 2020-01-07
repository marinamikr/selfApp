//
//  SelectCharacterViewController.swift
//  self
//
//  Created by 原田摩利奈 on 2020/01/07.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import UIKit
import RealmSwift

class SelectCharacterViewController: UIViewController {
    
    var realm :Realm!
    
    
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var textField1: UITextField!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var textField3: UITextField!
    @IBOutlet var textField4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton() {
        let saveData1 = RealmModel()
        saveData1.text = textField1.text
        try! realm.write() {
            realm.add(saveData1)
        }
        
        let saveData2 = RealmModel()
        saveData2.text = textField2.text
        try! realm.write() {
            realm.add(saveData2)
        }
        let saveData3 = RealmModel()
        saveData3.text = textField3.text
        try! realm.write() {
            realm.add(saveData3)
        }
        let saveData4 = RealmModel()
        saveData4.text = textField4.text
        try! realm.write() {
            realm.add(saveData4)
        }
        
        print(saveData1.text)
        print(saveData2.text)
        print(saveData3.text)

        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
