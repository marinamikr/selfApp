//
//  TreeView.swift
//  self
//
//  Created by 原田摩利奈 on 2020/02/11.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import UIKit

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
        guard let view = UINib(nibName: "TreeView", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view.backgroundColor = UIColor.blue
        
        let label = UILabel()
        
//
//        label.frame = CGRect(x: viewWidth / 4, y: viewHeight / 2, width: viewWidth / 2, height: 40)
//        label.text = "Hello World"
//        view.addSubview(label)
        
        makeContents(view: view, makeContents: 6)
        
        self.addSubview(view)
    }
    
    func makeContents(view:UIView,makeContents: Int) {
        
        let viewWidth = view.bounds.width
        let viewHeight = view.bounds.height
        let centerX = viewHeight / 2
        let centerY = viewWidth / 2
        let radius = viewHeight / 2
        
        for i in 0 ..< makeContents {
            let angle: Int = 360 / makeContents
            let x: Int = angle / 2 + angle * i
            let posX = centerX + radius
        }
    }
}
