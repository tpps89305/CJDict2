//
//  Prospects.swift
//  iosCJDict
//
//  Created by 楊朝富 on 2023/7/5.
//  Copyright © 2023 Dispy. All rights reserved.
//

import Foundation
import SwiftUI

@MainActor class Prospects: ObservableObject {
    @Published var tabSelection: Int = 0
    @Published var input: String = ""
    @Published var isPreferrScheme: Bool = false
    @Published var theme: ColorScheme = .light
    
}
