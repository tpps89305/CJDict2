//
//  CJButtonStyle.swift
//  iosCJDict
//
//  Created by 楊朝富 on 2023/8/2.
//  Copyright © 2023 Dispy. All rights reserved.
//

import Foundation
import SwiftUI

struct CJButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(Color("Title"))
            .background(Color("Primary"))
            .cornerRadius(10)
    }
    
}
