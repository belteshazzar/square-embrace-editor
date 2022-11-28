//
//  square_embrace_editorApp.swift
//  square-embrace-editor
//
//  Created by Daniel Walton on 28/11/2022.
//

import SwiftUI

@main
struct square_embrace_editorApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: square_embrace_editorDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
