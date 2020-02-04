//
//  Util.swift
//  self
//
//  Created by 原田摩利奈 on 2020/01/28.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Util: NSObject {
    static func getUUID() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
}
