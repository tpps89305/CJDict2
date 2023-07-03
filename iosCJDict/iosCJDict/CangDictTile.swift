//
//  CangDictTile.swift
//  iosCJDict
//
//  Created by 楊朝富 on 2023/4/17.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

struct CangDictTile: View {
    let word: String
    let root: String
    let letter: String
    @Binding var isSave: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("Primary"))
            HStack {
                Text(word)
                    .font(.system(size: 28))
                    .foregroundColor(Color("Title"))
                VStack {
                    Spacer()
                    HStack(alignment: .bottom) {
                        Text(root)
                            .foregroundColor(Color("Title"))
                        Text(letter)
                            .foregroundColor(Color("Title"))
                    }
                }
                .padding(.bottom, 2.0)
                
                Spacer()
                Button {
                    isSave = true
                } label: {
                    if isSave {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    } else {
                        Image(systemName: "star")
                            .foregroundColor(.yellow)
                    }
                }
                .frame(width: 30, height: 30)

            }
            .padding(.all)
        }
    }
}

struct CangDictTile_Previews: PreviewProvider {
    static var previews: some View {
        CangDictTile(
            word: "安",
            root: "十女",
            letter: "JV",
            isSave: .constant(true))
        .background(Color.gray)
        .fixedSize()
    }
}
