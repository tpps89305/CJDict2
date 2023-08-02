//
//  CSVFile.swift
//  iosCJDict
//
//  Created by 楊朝富 on 2023/8/2.
//  Copyright © 2023 Dispy. All rights reserved.
//

import Foundation
import SwiftUI
import UniformTypeIdentifiers

struct CSVFile: FileDocument {
    static var readableContentTypes = [UTType.commaSeparatedText]
    static var writableContentTypes = [UTType.commaSeparatedText]
    
    var text = ""
    
    init(initialText: String = "") {
        text = initialText
    }
    
    init(initialArray: [String]) {
        text = initialArray.joined(separator: ",")
    }
    
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            text = String(decoding: data, as: UTF8.self)
        }
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = Data(text.utf8)
        return FileWrapper(regularFileWithContents: data)
    }
    
}
