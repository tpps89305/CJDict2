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
    @State var input = ""
    var cangJi5 = CangJi5Dict()
    @State var testArray: [CangWord] = []
    @State var showRoot = true
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0.0) {
                SearchField(input: $input)
                    .onChange(of: input, perform: { newValue in
                        let array = cangJi5.getCangJiCode(words: newValue) as! [CangWord]
                        if (!array.isEmpty) {
                            self.testArray = array
                        } else {
                            self.testArray.removeAll()
                        }
                    })
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1.0)
                List(testArray.indices, id: \.self) { index in
                    CangDictTile(
                        word: testArray[index].word,
                        root: testArray[index].root,
                        letter: showRoot ? testArray[index].letter : ""
                    )
                    .listRowInsets(EdgeInsets())
                }
                .padding(.all)
                .listStyle(.plain)
                Spacer()
            }
            
            .navigationTitle("倉頡字典")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            showRoot = SettingHandler.shared.showRoot
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

private struct SearchField: View {
    
    @Binding var input: String
    
    var body: some View {
        HStack {
            TextField("輸入欲查詢的字", text: $input)
                .padding(16.0)
            
            if (!input.isEmpty) {
                Button {
                    input = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .foregroundColor(Color.gray)
                        .frame(width: 25.0, height: 25.0)
                }
                .padding(.trailing, 20.0)
            }
        }
    }
}
