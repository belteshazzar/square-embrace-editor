//
//  ContentView.swift
//  square-embrace-editor
//
//  Created by Daniel Walton on 28/11/2022.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: square_embrace_editorDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(square_embrace_editorDocument()))
    }
}
