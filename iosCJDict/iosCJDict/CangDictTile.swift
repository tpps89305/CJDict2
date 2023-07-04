//
//  CangDictTile.swift
//  iosCJDict
//
//  Created by 楊朝富 on 2023/4/17.
//  Copyright © 2023 orgName. All rights reserved.
//

import SwiftUI

enum CangDictTileStyle {
    case result
    case collection
    
    var background: Color {
        switch self {
        case .result:
            return Color("Primary")
        case .collection:
            return .white
        }
    }
    
    var textColor: Color {
        switch self {
        case .result:
            return Color("Title")
        case .collection:
            return Color("Text")
        }
    }
}

struct CangDictTile: View {
    let word: String
    let root: String
    let letter: String
    @Binding var isSave: Bool
    let style: CangDictTileStyle
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(style.background)
            HStack {
                Text(word)
                    .font(.system(size: 28))
                    .foregroundColor(style.textColor)
                VStack {
                    Spacer()
                    HStack(alignment: .bottom) {
                        Text(root)
                            .foregroundColor(style.textColor)
                        Text(letter)
                            .foregroundColor(style.textColor)
                    }
                }
                .padding(.bottom, 2.0)
                
                Spacer()
                Button {
                    if (style == .result) {
                        isSave = true
                    } else if (style == .collection) {
                        isSave = false
                    }
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
            isSave: .constant(true),
            style: .result)
        .background(Color.gray)
        .fixedSize()
    }
}
