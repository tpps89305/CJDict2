//
//  SettingsView.swift
//  iosCJDict
//
//  Created by 楊朝富 on 2023/4/18.
//  Copyright © 2023 Dispy. All rights reserved.
//

import SwiftUI
import cjdict

struct SettingsView: View {
    @State var isShowKey = false
    let settings = SettingHandler(context: NSObject())
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("顯示設定")) {
                    Toggle(isOn: $isShowKey) {
                        Text("顯示對應按鍵")
                    }
                    .onChange(of: isShowKey) { newValue in
                        settings.setShowRoot(value: isShowKey)
                    }
                    SetApperanceButton()
                }
                Section(header: Text("記錄設定")) {
                    SetAmountButton()
                    
                    DeleteRecordButton()
                }
                Section(header: Text("其他")) {
                    AboutButton()
                }
            }
            
            .navigationTitle("設定")
        }
        .onAppear {
            isShowKey = settings.getShowRoot()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    @StateObject var prospects = Prospects()
    static var previews: some View {
        SettingsView()
    }
}

private struct SetApperanceButton: View {
    
    let settings = SettingHandler(context: NSObject())
    @State var isShowApperanceDialog = false
    @EnvironmentObject var prospects: Prospects
    @State var themeName = "一般"
    
    var body: some View {
        Button {
            isShowApperanceDialog = true
        } label: {
            HStack {
                Text("顯示模式")
                    .foregroundColor(Color("Text"))
                Spacer()
                Text(themeName)
                    .foregroundColor(Color.gray)
            }
        }
        .actionSheet(isPresented: $isShowApperanceDialog) {
            ActionSheet(title: Text("顯示模式"), buttons: [
                .default(Text("一般")) {
                    settings.setTheme(value: 1)
                    prospects.isPreferrScheme = true
                    prospects.theme = .light
                    themeName = "一般"
                },
                .default(Text("暗色")) {
                    settings.setTheme(value: 2)
                    prospects.isPreferrScheme = true
                    prospects.theme = .dark
                    themeName = "暗色"
                },
                .default(Text("比照系統設定")) {
                    settings.setTheme(value: 3)
                    prospects.isPreferrScheme = true
                    prospects.theme = .light
                    themeName = "比照系統設定"
                }
            ])
        }
        .onAppear {
            switch settings.getTheme() {
            case 1:
                themeName = "一般"
            case 2:
                themeName = "暗色"
            default:
                themeName = "比照系統設定"
            }
        }
    }
}

private struct SetAmountButton: View {
    
    @State var isShowAmountDialog = false
    @State var recentAmount = 0
    
    let settings = SettingHandler(context: NSObject())
    
    var body: some View {
        Button {
            isShowAmountDialog = true
        } label: {
            HStack {
                Text("最近查詢數量")
                    .foregroundColor(Color("Text"))
                Spacer()
                Text("\(recentAmount)")
                    .foregroundColor(Color.gray)
            }.onAppear {
                recentAmount = Int(settings.getRecentAmount())
            }
        }
        .actionSheet(isPresented: $isShowAmountDialog) {
            ActionSheet(title: Text("最近查詢數量"), buttons: [
                .default(Text("10")) {
                    recentAmount = 10
                    settings.setRecentAmount(value: 10)
                },
                .default(Text("30")) {
                    recentAmount = 30
                    settings.setRecentAmount(value: 30)
                },
                .default(Text("50")) {
                    recentAmount = 50
                    settings.setRecentAmount(value: 50)
                },
                .default(Text("70")) {
                    recentAmount = 70
                    settings.setRecentAmount(value: 70)
                },
                .default(Text("100")) {
                    recentAmount = 100
                    settings.setRecentAmount(value: 100)
                }
            ])
        }
    }
}

private struct DeleteRecordButton: View {
    
    @State var isShowAboutDialog = false
    let database = CJDictDatabase(databaseDriverFactory: DatabaseDriverFactory())
    
    var body: some View {
        Button {
            isShowAboutDialog = true
        } label: {
            Text("刪除查詢紀錄")
                .foregroundColor(Color("Text"))
        }
        .actionSheet(isPresented: $isShowAboutDialog) {
            ActionSheet(title: Text("是否要清除查詢紀錄"), buttons: [
                .destructive(Text("確認")) {
                    database.removeAllRecents()
                },
                .cancel(Text("取消"))
            ])
        }
    }
}

private struct AboutButton: View {
    
    @State var isShowAboutButton = false
    
    var body: some View {
        Button {
            isShowAboutButton = true
        } label: {
            Text("關於《倉頡字典》")
                .foregroundColor(Color("Text"))
        }
        .alert(isPresented: $isShowAboutButton) {
            return Alert(
                title: Text("倉頡字典"),
                message: Text("版本：1.0.0\n2023 年 4 月 18 日")
            )
        }
    }
}
