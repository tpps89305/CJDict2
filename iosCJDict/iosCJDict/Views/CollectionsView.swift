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
    @State var resultArray: [CollectionListItem] = []
    @EnvironmentObject var prospects: Prospects
    @State private var presentFileHandleView = false
    
    let database = CJDictDatabase(databaseDriverFactory: DatabaseDriverFactory())
    var perviewMode = false
    
    private func manageCollection(state: Bool, cangData: Save) {
        if state == false {
            print("將刪除 id = \(cangData._id) 的資料")
            database.deleteSaveById(id: cangData._id)
        } else {
            database.insertSave(data: cangData.data_)
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .fill(Color("Background"))
                ScrollView {
                    VStack {
                        ForEach($resultArray) { $each in
                            CollectionTile(
                                word: each.cangData.data_,
                                root: "",
                                letter: "",
                                isSave: $each.isSave)
                            .onChange(of: each.isSave) { newValue in
                                manageCollection(state: newValue, cangData: each.cangData)
                            }.onTapGesture {
                                prospects.tabSelection = 0
                                prospects.input = each.cangData.data_
                            }
                        }
                    }
                    .padding(.all)
                }
                
                .navigationTitle("收藏簿")
                .toolbar {
                    ToolbarItem {
                        Button {
                            presentFileHandleView = true
                        } label: {
                            Image(systemName: "tray.and.arrow.down.fill")
                                .foregroundColor(Color.white)
                        }
                    }
                }
                .sheet(isPresented: $presentFileHandleView) {
                    FileHandleView()
                }
            }
        }
        .onAppear {
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
    @StateObject var prospects = Prospects()
    static var words = [CollectionListItem(isSave: true, cangData: Save(_id: 87, data_: "我"))]
    
    static var previews: some View {
        CollectionsView(resultArray: words, perviewMode: true)
    }
}
