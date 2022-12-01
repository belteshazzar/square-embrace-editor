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
            HSplitView {
                TextEditor(text: file.$document.text)
                    .font(.system(.body, design: .monospaced))
                SqrmWebView(text: file.$document.text)
            }
        }
    }
}

extension NSTextView {
    open override var frame: CGRect {
        didSet {
            self.isAutomaticQuoteSubstitutionEnabled = false
        }
    }
}
