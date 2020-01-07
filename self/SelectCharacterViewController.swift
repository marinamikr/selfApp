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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realm = try! Realm()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton() {
        let saveData = RealmModel()
              saveData.text = textField1.text
              try! realm.write() {
                  realm.add(saveData)
              }
              print(saveData.text)
              
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
