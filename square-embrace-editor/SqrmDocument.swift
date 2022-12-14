//
//  square_embrace_editorDocument.swift
//  square-embrace-editor
//
//  Created by Daniel Walton on 28/11/2022.
//

import SwiftUI
import UniformTypeIdentifiers

extension UTType {
    static var sqrm: UTType {
        UTType(importedAs: "au.com.belteshazzar.square-embrace")
    }
}

protocol SqrmObserver : AnyObject {
    func changed(text: String)
}

struct SqrmDocument: FileDocument {
    var text: String

    init(text: String = "") {
        self.text = text
    }

    static var readableContentTypes: [UTType] { [.sqrm] }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        text = string
    }
    
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = text.data(using: .utf8)!
        return .init(regularFileWithContents: data)
    }
}
