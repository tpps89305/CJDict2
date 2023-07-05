//
//  HomeView.swift
//  iosCJDict
//
//  Created by 楊朝富 on 2023/4/18.
//  Copyright © 2023 Dispy. All rights reserved.
//

import SwiftUI
import cjdict

struct HomeView: View {
    
    var cangJi5 = CangJi5Dict()
    let database = CJDictDatabase(databaseDriverFactory: DatabaseDriverFactory())
    @State private var resultArray: [ResultListItem] = []
    @EnvironmentObject var prospects: Prospects
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0.0) {
                SearchField(input: $prospects.input)
                    .onChange(of: prospects.input, perform: { newValue in
                        let array = cangJi5.getCangJiCode(words: newValue) as! [CangWord]
                        if (!array.isEmpty) {
                            resultArray.removeAll()
                            for each in array {
                                let isSave = database.isDataSaved(dataToCheck: each.word)
                                resultArray.append(ResultListItem(isSave: isSave, cangWord: each))
                            }
                        } else {
                            self.resultArray.removeAll()
                        }
                    })
                ResultField(resultArray: $resultArray)
            }
            
            .navigationTitle("倉頡字典")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        // TODO: 前往最近查詢頁
                    } label: {
                        Image(systemName: "clock.arrow.circlepath")
                            .foregroundColor(Color.white)
                    }
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    
    @StateObject static var prospects = Prospects()
    
    static var previews: some View {
        HomeView()
            .environmentObject(prospects)
    }
}

private struct SearchField: View {
    
    @Binding var input: String
    
    var body: some View {
        HStack {
            TextField("輸入欲查詢的字", text: $input)
                .font(.system(size: 24))
                .padding(16.0)
            
            if (!input.isEmpty) {
                Button {
                    input = ""
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .foregroundColor(Color.gray)
                        .frame(width: 20.0, height: 20.0)
                }
                .padding(.trailing, 20.0)
            }
        }
    }
}

private struct ResultField: View {
    
    let database = CJDictDatabase(databaseDriverFactory: DatabaseDriverFactory())
    let settings = SettingHandler(context: NSObject())
    
    @Binding var resultArray: [ResultListItem]
    @State var showRoot = true
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach($resultArray) { $each in
                    ResultTile(
                        word: each.cangWord.word,
                        root: each.cangWord.root,
                        letter: each.cangWord.letter,
                        isSave: $each.isSave)
                    .onChange(of: each.isSave) { newValue in
                        if each.isSave == true {
                            self.database.insertSave(data: each.cangWord.word)
                        }
                    }
                }
            }
            .padding(.all)
        }
        .onAppear {
            // 測試資料庫功能
            showRoot = settings.getShowRoot()
            print("最近查詢數量：\(settings.getRecentAmount())")
            print("套用主題：\(settings.getTheme())")
        }
    }
    
}

struct ResultField_Previews: PreviewProvider {
    
    static var test = ResultListItem(
        isSave: false,
        cangWord: CangWord(word: "安", root: "十女", letter: "JV"))
    
    static var previews: some View {
        ResultField(resultArray: .constant([test, test]))
    }
}