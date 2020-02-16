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
    
    var DBRef:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self as! UITextFieldDelegate
        DBRef = Database.database().reference()
        
    }
    
    func upload(name: String) {
        let storage = Storage.storage()
        let storageRef = storage.reference(forURL: "gs://favoritesns3.appspot.com/")
        let riversRef = storageRef.child(Util.getUUID()).child(String.getRandomStringWithLength(length: 60))
        riversRef.putData(data, metadata: nil, completion: { metaData, error in
            let downloadURL: String = (metaData?.downloadURL()?.absoluteString)!
            let data = ["name": name,"iconURL": downloadURL] as [String : Any]
            let ref = Database.database().reference()
            ref.child(Util.getUUID()).child("userData").setValue(data)
        })
        
    }
    
    @IBAction func nextButton() {
        if nameTextField.text != "" {
            upload(name: nameTextField.text!)
            performSegue(withIdentifier: "toViewController", sender: nil)
        } else {
            makeAleart(title: "名前を入力してください", message: "全て入力してください", okText: "OK")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        if (segue.identifier == "toViewController") {
            let ViewController = (segue.destination as?
            ViewController)!
            ViewController.name = self.nameTextField.text
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
