//
//  TreeView.swift
//  self
//
//  Created by 原田摩利奈 on 2020/02/11.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import UIKit
import Firebase

class TreeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib() {
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            
            view.frame = self.bounds
            view.frame = CGRect(origin: self.frame.origin, size: CGSize(width: UIScreen.main.bounds.size.width, height: self.frame.size.height))
            print("TreeView")
            print(UIScreen.main.bounds.size)
            print(self.bounds)
            view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            self.addSubview(view)
            makeContents(view: view, makeContents: 6)
        }
    }
    
    
    
    //
    //    func loadNib() {
    //
    //        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
    //                  view.frame = self.bounds
    //                  self.addSubview(view)
    //}
    //        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
    //            view.frame = self.bounds
    //            view.frame = self.bounds
    //            print("TreeView")
    //            print(self.bounds)
    //            view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    //            view.backgroundColor = UIColor.blue
    //            self.addSubview(view)
    //            makeContents(view: view, makeContents: 6)
    //        }
    
    //
    //        label.frame = CGRect(x: viewWidth / 4, y: viewHeight / 2, width: viewWidth / 2, height: 40)
    //        label.text = "Hello World"
    //        view.addSubview(label)
    
    
    
    
    //    }
    
    func makeContents(view:UIView,makeContents: Int) {
        
        print(view.bounds)
        let viewWidth = view.bounds.width
        let viewHeight = view.bounds.height
        let centerX = Double(viewWidth / 2) + Double(view.frame.origin.x)
        let centerY = Double(viewHeight / 2) + Double(view.frame.origin.y)
        let radius = 40
        let labelWidth = 20.0
        let labelHeight = 20.0
        //angle　何度ずつずらすか
        //radius 半径
        //        print(String(centerX) + "," + String(centerY))
        
        for i in 0 ..< makeContents {
            let angle: Double = 360.0 / Double(makeContents)
            let x: Double = angle / 2 + angle * Double(i)
            //            print(x)
            let posX = Double(radius) * sin(x * (Double.pi / 180)) + centerX
            let posY = centerY - Double(radius) * cos(x * (Double.pi / 180))
            //            print(String(posX) + "," + String(posY))
            let label = UILabel()
            label.frame = CGRect(x: posX - labelWidth / 2, y: posY - labelHeight / 2, width: labelWidth, height: labelHeight)
            label.text = "Hello World"
            label.backgroundColor = UIColor.red
            view.addSubview(label)
        }
    }
}
