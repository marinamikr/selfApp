//
//  StoryViewController.swift
//  self
//
//  Created by 原田摩利奈 on 2020/01/14.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import UIKit
import RealmSwift


class StoryViewController: UIViewController {
    
    var realm :Realm!
    var realmModelArray:Results<RealmModel>!
    
    
    @IBOutlet var label: UILabel!
    @IBOutlet var textField1: UITextField!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var textField3: UITextField!
    @IBOutlet var textView1: UITextView!
    @IBOutlet var textView2: UITextView!
    
    var text1 = ""
    var text2 = ""
    var text3 = ""
    var text4 = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = text1
        
        // Do any additional setup after loading the view.
        realm = try! Realm()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton() {
        
        let saveData1 = RealmModel()
        saveData1.itsu = textField1.text!
        try! realm.write() {
            realm.add(saveData1)
        }
        let saveData2 = RealmModel()
        saveData2.dokode = textField2.text!
        try! realm.write() {
            realm.add(saveData2)
        }
        
        let saveData3 = RealmModel()
        saveData3.dareto = textField3.text!
        try! realm.write() {
            realm.add(saveData3)
        }
        let saveData4 = RealmModel()
        saveData4.nanishita = textView1.text!
        try! realm.write() {
            realm.add(saveData4)
        }
        let saveData5  = RealmModel()
        saveData5.sonota = textView2.text!
        try! realm.write() {
            realm.add(saveData5)
        }
        
        print(saveData1.itsu)
        print(saveData2.dokode)
        print(saveData3.dareto)
        print(saveData4.nanishita)
        print(saveData5.sonota)
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
