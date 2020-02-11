//
//  BusinessCard.swift
//  self
//
//  Created by 原田摩利奈 on 2020/02/04.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import UIKit

class BusinessCard: UIView {
    
    @IBOutlet var label1:UILabel!
    @IBOutlet var label2:UILabel!
    @IBOutlet var label3:UILabel!
    @IBOutlet var label4:UILabel!
    @IBOutlet var label5:UILabel!
    @IBOutlet var label6:UILabel!
    @IBOutlet var backView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }

    func loadNib() {
        guard let view = UINib(nibName: "BusinessCard", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
    }
}
