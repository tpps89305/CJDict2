//
//  CollectionsView.swift
//  iosCJDict
//
//  Created by 楊朝富 on 2023/5/31.
//  Copyright © 2023 Dispy. All rights reserved.
//

import SwiftUI
import cjdict

struct CollectionsView: View {
    let database = CJDictDatabase(databaseDriverFactory: DatabaseDriverFactory())
    @State var saveArray: [String] = []
    var perviewMode = false
    
    var body: some View {
        NavigationView {
            List(saveArray.indices, id: \.self) { index in
                CangDictTile(
                    word: saveArray[index],
                    root: "",
                    letter: "",
                    isSave: .constant(true),
                    style: .collection)
                .listRowInsets(EdgeInsets())
            }
            .padding(.all)
            .listStyle(.plain)
            .navigationTitle("收藏簿")
            .onAppear {
                UITableView.appearance().separatorStyle = .none
            }
        }.onAppear {
            if !perviewMode {
                saveArray = database.selectAllSaves()
            }
        }
    }
}

struct CollectionsView_Previews: PreviewProvider {
    static var words = ["我"]
    
    static var previews: some View {
        CollectionsView(saveArray: words, perviewMode: true)
    }
}
