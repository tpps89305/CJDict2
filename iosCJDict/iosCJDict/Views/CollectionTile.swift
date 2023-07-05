//
//  CollectionTile.swift
//  iosCJDict
//
//  Created by 楊朝富 on 2023/7/5.
//  Copyright © 2023 Dispy. All rights reserved.
//

import SwiftUI

struct CollectionTile: View {
    let word: String
    let root: String
    let letter: String
    @Binding var isSave: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("TileBackground"))
            HStack {
                Text(word)
                    .font(.system(size: 28))
                VStack {
                    Spacer()
                    HStack(alignment: .bottom) {
                        Text(root)
                        Text(letter)
                    }
                }
                .padding(.bottom, 2.0)
                
                Spacer()
                Button {
                    isSave.toggle()
                } label: {
                    if isSave {
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(.yellow)
                    } else {
                        Image(systemName: "star")
                            .resizable()
                            .foregroundColor(.yellow)
                    }
                }
                .frame(width: 30, height: 30)

            }
            .padding(.all)
        }
        .cornerRadius(10)
    }
}

struct CollectionTile_Previews: PreviewProvider {
    static var previews: some View {
        CollectionTile(
            word: "安",
            root: "十女",
            letter: "JV",
            isSave: .constant(true))
        .fixedSize()
    }
}
