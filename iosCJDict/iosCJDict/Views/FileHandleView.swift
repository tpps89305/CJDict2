//
//  FileHandleView.swift
//  iosCJDict
//
//  Created by 楊朝富 on 2023/8/2.
//  Copyright © 2023 Dispy. All rights reserved.
//

import SwiftUI
import cjdict

struct FileHandleView: View {
    
    var body: some View {
        VStack(spacing: 0.0) {
            AppBar(title: "資料庫備份")
            
            FileHandleContentView()
                .background(Color("Background"))
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct FileHandleView_Previews: PreviewProvider {
    static var previews: some View {
        FileHandleView()
    }
}

struct FileHandleContentView: View {
    
    @State private var showFileImporter = false
    @State private var showFileExporter = false
    @State private var databaseArray: [String] = []
    
    let database = CJDictDatabase(databaseDriverFactory: DatabaseDriverFactory())
    
    var body: some View {
        VStack(spacing: 40.0) {
            VStack {
                Text("可將收藏簿儲存成 .csv 檔案")
                Button {
                    showFileExporter = true
                } label: {
                    Text("匯出到檔案")
                }
                .buttonStyle(CJButtonStyle())
            }
            
            VStack {
                Text("可將 .csv 檔案匯入到收藏簿")
                Button {
                    showFileImporter = true
                } label: {
                    Text("從檔案匯入")
                }
                .buttonStyle(CJButtonStyle())
            }
            
            Spacer()
        }
        .padding()
        .fileImporter(
            isPresented: $showFileImporter,
            allowedContentTypes: [.commaSeparatedText]
        ) { result in
            switch result {
            case .success(let fileUrl):
                print("File url: \(fileUrl.path)")
                do {
                    if fileUrl.startAccessingSecurityScopedResource() {
                      // do-catch statement
                        let content = try String(contentsOf: fileUrl)
                        print("load content = \(content)")
                    }
                    fileUrl.stopAccessingSecurityScopedResource()
                } catch {
                    print(error)
                }
            case .failure(let error):
                print("Cannot load file: \(error)")
            }
        }
        .fileExporter(
            isPresented: $showFileExporter,
            document: CSVFile(initialArray: databaseArray),
            contentType: .commaSeparatedText,
            defaultFilename: "倉頡字典查詢紀錄"
        ) { result in
            switch result {
            case .success(let url):
                print("Save to \(url)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        .onAppear {
            databaseArray = database.selectAllSaves().map({ save in
                return save.data_
            })
        }
    }
    
}
