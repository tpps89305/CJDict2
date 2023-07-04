//
//  CollectionListItem.swift
//  iosCJDict
//
//  Created by 楊朝富 on 2023/7/4.
//  Copyright © 2023 Dispy. All rights reserved.
//

import Foundation
import cjdict

class CollectionListItem : Identifiable {
    var uuid = UUID()
    var isSave: Bool
    var cangData: Save
    
    init(isSave: Bool, cangData: Save) {
        self.isSave = isSave
        self.cangData = cangData
    }
    
}
