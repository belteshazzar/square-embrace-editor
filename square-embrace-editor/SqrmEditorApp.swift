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
    
    @State private var showNew = false
    
    var body: some Scene {
        DocumentGroup(newDocument: SqrmDocument()) { file in

#if os(macOS)

            HSplitView {
                EditorView(text: file.$document.text)
                SqrmWebView(text: file.$document.text)
            }

#elseif os(iOS)

            GeometryReader { geometry in
                let h = geometry.frame(in: .global).height
                let w = geometry.frame(in: .global).width
                
                if h > w {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            EditorView(text: file.$document.text)
                                .frame(width: geometry.size.width * 0.8)
                            SqrmWebView(text: file.$document.text)
                                .frame(width: geometry.size.width * 0.8)
                        }
                    }

                } else {
                    
                    HStack {
                        EditorView(text: file.$document.text)
                        SqrmWebView(text: file.$document.text)
                    }

                }
            }
            .toolbarRole(.automatic)

#endif

        }
    }
}
