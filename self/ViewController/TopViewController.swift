//
//  TopViewController.swift
//  self
//
//  Created by 原田摩利奈 on 2020/02/17.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import UIKit
import Firebase

class TopViewController: UIViewController {
    @IBOutlet var nameTextField: UITextField!
    
    let userDefaults = UserDefaults.standard

    var DBRef:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaults.register(defaults: ["isFirst":false])
        
        nameTextField.delegate = self as! UITextFieldDelegate
        DBRef = Database.database().reference()
        
    }
    
    
    func upload(name: String) {
        let ref = Database.database().reference()
        let data = ["name": name]
        ref.child("userData").child(Util.getUUID()).setValue(data)
        userDefaults.set(true, forKey: "isFirst")
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func nextButton() {
        if nameTextField.text != "" {
            upload(name: nameTextField.text!)
        } else {
            makeAleart(title: "名前を入力してください", message: "全て入力してください", okText: "OK")
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
    
    func makeAleart(title: String, message: String, okText: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okayButton = UIAlertAction(title: okText, style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okayButton)
        present(alert, animated: true, completion: nil)
    }
    
}

extension TopViewController :UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
