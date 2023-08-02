//
//  FileHandleView.swift
//  iosCJDict
//
//  Created by 楊朝富 on 2023/8/2.
//  Copyright © 2023 Dispy. All rights reserved.
//

import SwiftUI

struct FileHandleView: View {
    @State private var showFileExporter = false
    var body: some View {
        VStack {
            AppBar(title: "資料庫備份")
            
            ExtractedView()
        }
    }
}

struct FileHandleView_Previews: PreviewProvider {
    static var previews: some View {
        FileHandleView()
    }
}

struct ExtractedView: View {
    
    @State private var showFileImporter = false
    @State private var showFileExporter = false
    
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
        .fileImporter(isPresented: $showFileImporter, allowedContentTypes: [.item]) { result in
            switch result {
            case .success(let fileUrl):
                print("File url: \(fileUrl.path)")
            case .failure(let error):
                print("Cannot load file: \(error)")
            }
        }
        .fileExporter(isPresented: $showFileExporter, document: CSVFile(initialText: "Hello, world"), contentType: .commaSeparatedText) { result in
            switch result {
            case .success(let url):
                print("Save to \(url)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
