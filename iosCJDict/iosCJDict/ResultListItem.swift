//
//  ResultListItem.swift
//  iosCJDict
//
//  Created by 楊朝富 on 2023/7/4.
//  Copyright © 2023 Dispy. All rights reserved.
//

import Foundation
import cjdict

class ResultListItem : Identifiable {
    var uuid = UUID()
    var isSave: Bool
    var cangWord: CangWord
    
    init(isSave: Bool, cangWord: CangWord) {
        self.isSave = isSave
        self.cangWord = cangWord
    }
    
}
