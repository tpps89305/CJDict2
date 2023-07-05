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
    @State var resultArray: [CollectionListItem] = []
    var perviewMode = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(Color("Background"))
                ScrollView {
                    VStack {
                        ForEach($resultArray) { $each in
                            CangDictTile(
                                word: each.cangData.data_,
                                root: "",
                                letter: "",
                                isSave: $each.isSave,
                                style: .collection)
                            .onChange(of: each.isSave) { newValue in
                                print("將刪除 id = \(each.cangData._id) 的資料")
                                database.deleteSaveById(id: each.cangData._id)
                                resultArray.removeAll { item in
                                    item.uuid == each.uuid
                                }
                            }
                        }
                    }
                    .padding(.all)
                }
                
                .navigationTitle("收藏簿")
            }
        }.onAppear {
            if !perviewMode {
                let dataFromDB = database.selectAllSaves()
                resultArray.removeAll()
                for each in dataFromDB {
                    resultArray.append(CollectionListItem(isSave: true, cangData: each))
                }
            }
        }
    }
}

struct CollectionsView_Previews: PreviewProvider {
    static var words = [CollectionListItem(isSave: true, cangData: Save(_id: 87, data_: "我"))]
    
    static var previews: some View {
        CollectionsView(resultArray: words, perviewMode: true)
    }
}
