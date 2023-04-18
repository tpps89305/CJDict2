//
//  SettingHandler.swift
//  iosCJDict
//
//  Created by 楊朝富 on 2023/4/18.
//  Copyright © 2023 Dispy. All rights reserved.
//

import UIKit

class SettingHandler {
    static let tagShowRoot = "ROOT"
    
    static let shared: SettingHandler = SettingHandler()
    let userdefault = UserDefaults.standard
    
    var showRoot: Bool {
        set {
            userdefault.set(newValue, forKey: SettingHandler.tagShowRoot)
        }
        get {
            userdefault.bool(forKey: SettingHandler.tagShowRoot)
        }
    }
}
