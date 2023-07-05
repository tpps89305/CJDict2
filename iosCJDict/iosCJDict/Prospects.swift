//
//  Prospects.swift
//  iosCJDict
//
//  Created by 楊朝富 on 2023/7/5.
//  Copyright © 2023 Dispy. All rights reserved.
//

import Foundation

@MainActor class Prospects: ObservableObject {
    @Published var tabSelection: Int
    @Published var input: String
    
    init() {
        tabSelection = 0
        input = ""
    }
}
