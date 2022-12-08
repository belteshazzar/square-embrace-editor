//
//  square_embrace_editorApp.swift
//  square-embrace-editor
//
//  Created by Daniel Walton on 28/11/2022.
//

import SwiftUI
import WebKit

@main
struct SqrmEditorApp: App {
    
    var body: some Scene {
        DocumentGroup(newDocument: SqrmDocument()) { file in
#if os(macOS)
            HSplitView {
                EditorView(text: file.$document.text)
                SqrmWebView(text: file.$document.text)
            }
#elseif os(iOS)
            HStack {
                EditorView(text: file.$document.text)
                SqrmWebView(text: file.$document.text)
            }
#endif
        }
    }
}
