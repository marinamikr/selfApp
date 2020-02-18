//
//  ViewController.swift
//  self
//
//  Created by 原田摩利奈 on 2019/12/17.
//  Copyright © 2019 原田摩利奈. All rights reserved.
//

import UIKit
import RealmSwift
import Firebase

class ViewController: UIViewController {
    
    var characterArray: [Character] = Array()
    var DBRef:DatabaseReference!
    var realm :Realm!
    var realmModelArray:Results<RealmModel>!
    var name: String!
    
    @IBOutlet var businessCard: BusinessCard!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var textField: UITextField!
    //    @IBOutlet var label1:UILabel!
    //    @IBOutlet var label2:UILabel!
    //    @IBOutlet var label3:UILabel!
    //    @IBOutlet var label4:UILabel!
    //    @IBOutlet var label5:UILabel!
    //    @IBOutlet var label6:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DBRef = Database.database().reference()
        
        // Do any additional setup after loading the view.
        realm = try! Realm()
        realmModelArray = realm.objects(RealmModel.self)
        
        
        DBRef.child("userData").child(Util.getUUID()).child("character").observe(.value, with: { (snapshot) in
            
            for itemSnapShot in snapshot.children  {
                let snap = itemSnapShot as! DataSnapshot
                let data = snap.value as! [String : AnyObject]
                var character: Character = Character(key: data["key"] as! String, itsu: data["itsu"] as! String, dokode: data["dokode"] as! String, dareto: data["dareto"] as! String, nanishita: data["nanishita"] as! String, sonota: data["sonota"] as! String)
                self.characterArray.append(character)
            }
            self.showCharacter()
            
        })
        
        //        for i in 0..<realmModelArray.count {
        //            switch i {
        //            case 0:
        //                label1.text = realmModelArray[i].text
        //                break
        //            case 1:
        //                label2.text = realmModelArray[i].text
        //                break
        //            case 2:
        //                label3.text = realmModelArray[i].text
        //                break
        //            case 3:
        //                label4.text = realmModelArray[i].text
        //                break
        //            case 4:
        //                label5.text = realmModelArray[i].text
        //                break
        //            case 5:
        //                label6.text = realmModelArray[i].text
        //                break
        //            default: break
        //
        //            }
        //        }
        businessCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.transition(_ :))))
        
//        nameLabel.text = name!
    }
    
    @objc func transition(_ sender: UITapGestureRecognizer) {
        UIView.transition(with: self.businessCard, duration: 1.0, options: [.transitionFlipFromLeft], animations: nil, completion:{
            bool in
            self.businessCard.treeView.alpha = 1
            
        })
    }
//
//    @objc func businessCardTapped(_ sender: UITapGestureRecognizer) {
//        let anim = CABasicAnimation(keyPath: "transform.rotation.y")
//        anim.fromValue = 0
//        anim.toValue = 1 * M_PI
//        anim.duration = 1.0
//        anim.repeatCount = 1
//        businessCard.layer.add(anim, forKey: "key")
//
//    }
//
    @IBAction func addButton() {
        
        //        let saveData = RealmModel()
        //        saveData.text = textField.text
        //        try! realm.write() {
        //            realm.add(saveData)
        //        }
        //        print(saveData.text)
        
        let data = ["key": textField.text,"itsu": "","dokode": "","dareto": "","nanishita": "","sonota": ""] as [String : Any]
        
        DBRef.child("userData").child(Util.getUUID()).child("character").childByAutoId().setValue(data)
        
    }
    
    //    @IBAction func rotationButton(){
    //               let storyboard: UIStoryboard = self.storyboard!
    //               let nextView = storyboard.instantiateViewController(withIdentifier: "toIntroductionViewController") as! IntroductionViewController
    //
    //               nextView.modalTransitionStyle = .flipHorizontal
    //
    //               self.present(nextView, animated: true, completion: nil)
    //    }
    
    func showCharacter() {
        for i in 0..<characterArray.count {
            switch i {
            case 0:
                businessCard.label1.text = characterArray[i].key
                break
            case 1:
                businessCard.label2.text = characterArray[i].key
                break
            case 2:
                businessCard.label3.text = characterArray[i].key
                break
            case 3:
                businessCard.label4.text = characterArray[i].key
                break
            case 4:
                businessCard.label5.text = characterArray[i].key
                break
            case 5:
                businessCard.label6.text = characterArray[i].key
                break
            default: break
                
            }
        }
    }
    
}

