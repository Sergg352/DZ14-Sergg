//
//  UserDefaults.swift
//  MyProject DZ14
//
//  Created by Sergey Gorshenin on 14/09/2019.
//  Copyright © 2019 Sergey Gorshenin. All rights reserved.
//

import Foundation

class dataName {
    static let temperatures = dataName()
    
    private let kUserNameKey = "dataName.kUserNameKey"
    
    var dataJson: JsonData? {
        set{UserDefaults.standard.set(newValue, forKey: kUserNameKey)}
        get{
           // return UserDefaults.standard(forKey: kUserNameKey)
            return UserDefaults.standard.object(forKey: kUserNameKey) as? JsonData
        }
    }
}
