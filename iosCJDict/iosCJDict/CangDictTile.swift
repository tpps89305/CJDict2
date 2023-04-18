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
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("Primary"))
            HStack(alignment: .bottom) {
                Text(word)
                    .font(.system(size: 28))
                    .foregroundColor(Color("Title"))
                HStack {
                    Text(root)
                        .foregroundColor(Color("Title"))
                    Text(letter)
                        .foregroundColor(Color("Title"))
                }
                .padding(.bottom, 2.0)
                
                Spacer()
            }
            .padding(.all)
        }
    }
}

struct CangDictTile_Previews: PreviewProvider {
    static var previews: some View {
        CangDictTile(word: "安", root: "十女", letter: "JV")
            .background(Color.gray)
    }
}
