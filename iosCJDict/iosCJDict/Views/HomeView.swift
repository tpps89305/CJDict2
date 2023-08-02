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
    let settings = SettingHandler(context: NSObject())
    @State private var resultArray: [ResultListItem] = []
    @EnvironmentObject var prospects: Prospects
    @State private var showRecents = false
    
    private func search(words: String) {
        let array = cangJi5.getCangJiCode(words: words) as! [CangWord]
        if (!array.isEmpty) {
            resultArray.removeAll()
            for each in array {
                let isSave = database.isDataSaved(dataToCheck: each.word)
                resultArray.append(ResultListItem(isSave: isSave, cangWord: each))
            }
            if prospects.saveToRecent {
                database.insertRecent(data: prospects.input)
            }
            // 恢復為原本的狀態
            prospects.saveToRecent = true
        } else {
            self.resultArray.removeAll()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0.0) {
                SearchField(input: $prospects.input)
                    .onChange(of: prospects.input, perform: { newValue in
                        search(words: newValue)
                    })
                ResultField(resultArray: $resultArray)
            }
            
            .navigationTitle("倉頡字典")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        showRecents = true
                    } label: {
                        Image(systemName: "clock.arrow.circlepath")
                            .foregroundColor(Color.white)
                    }
                }
            }
            .sheet(isPresented: $showRecents) {
                RecentsView()
            }
            .background(Color("Background"))
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
        .background(Color("TileBackground"))
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
                        letter: settings.getShowRoot() ? each.cangWord.letter : "",
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
            showRoot = settings.getShowRoot()
        }
    }
    
}

struct ResultField_Previews: PreviewProvider {
    @StateObject var prospects = Prospects()
    
    static var test = ResultListItem(
        isSave: false,
        cangWord: CangWord(word: "安", root: "十女", letter: "JV"))
    
    static var previews: some View {
        ResultField(resultArray: .constant([test, test]))
    }
}
