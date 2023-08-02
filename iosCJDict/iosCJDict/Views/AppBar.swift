//
//  AppBar.swift
//  iosCJDict
//
//  Created by 楊朝富 on 2023/8/2.
//  Copyright © 2023 Dispy. All rights reserved.
//

import SwiftUI

struct AppBar: View {
    
    let title: String
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .foregroundColor(Color.gray)
                    .frame(width: 25.0, height: 25.0)
            }
            Spacer()
            Text(title)
            Spacer()
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 25.0, height: 25.0)
        }
        .padding(.all)
    }
}

struct AppBar_Previews: PreviewProvider {
    static var previews: some View {
        AppBar(title: "標題")
    }
}
