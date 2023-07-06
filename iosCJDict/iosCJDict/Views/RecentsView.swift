//
//  RecentsView.swift
//  iosCJDict
//
//  Created by 楊朝富 on 2023/7/6.
//  Copyright © 2023 Dispy. All rights reserved.
//

import SwiftUI
import cjdict

struct RecentsView: View {
    
    let database = CJDictDatabase(databaseDriverFactory: DatabaseDriverFactory())
    let settings = SettingHandler(context: NSObject())
    
    @State var recents: [String] = []
    @EnvironmentObject var prospects: Prospects
    @Environment(\.presentationMode) var presentationMode
    var perviewMode = false
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .foregroundColor(Color.gray)
                        .frame(width: 25.0, height: 25.0)
                }
                Spacer()
                Text("最近查詢")
                Spacer()
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 25.0, height: 25.0)
            }
            .padding(.all)
            List(recents.indices, id: \.self) { index in
                Button {
                    // 不重覆寫入一樣的資料
                    prospects.saveToRecent = false
                    prospects.input = recents[index]
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text(recents[index])
                        .foregroundColor(Color("Text"))
                }
            }.onAppear {
                if !perviewMode {
                    database.deleteOldRecents(amountRecent: settings.getRecentAmount())
                    recents = database.selectAllRecents()
                }
        }
        }
    }
}

struct RecentsView_Previews: PreviewProvider {
    
    @StateObject var prospects = Prospects()
    
    static var previews: some View {
        RecentsView(recents: ["我", "是"], perviewMode: true)
    }
}
