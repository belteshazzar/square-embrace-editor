//
//  EditorView.swift
//  square-embrace-editor
//
//  Created by Daniel Walton on 8/12/2022.
//

import SwiftUI

struct EditorView: ViewRepresentable {

    @Binding var text: String
    
    let textStorage = TextStorage()
        
#if os(iOS)
    public func makeUIView(context: Context) -> UITextView {
        
        return UITextView()
    }
    
    public func updateUIView(_ uiView: UITextView, context: Context) {
    }
#endif
    
#if os(macOS)
    
    public func makeNSView(context: Context) -> NSScrollView {

        let scrollView = NSTextView.scrollableTextView()

        guard let textView = scrollView.documentView as? NSTextView else { return scrollView }

        textView.allowsUndo = true
        textView.isRichText = true

        textStorage.addLayoutManager(textView.layoutManager!)
        textView.textStorage?.setAttributedString(NSMutableAttributedString(string: text))

        textView.delegate = context.coordinator

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = NSFont.monospacedSystemFont(ofSize: 12, weight: .regular)
        textView.lnv_setUpLineNumberView()
        return scrollView
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
     
    class Coordinator: NSObject, NSTextViewDelegate {
        var parent: EditorView
         
        init(_ parent: EditorView) {
            self.parent = parent
        }
         
        func textViewDidChange(_ textView: NSTextView) {
            self.parent.text = textView.string
        }
         
        func textDidChange(_ notification: Notification) {
            guard let textView = notification.object as? NSTextView else {return}
            self.parent.text = textView.string
        }
    }

    public func updateNSView(_ view: NSScrollView, context: Context) {
    }
#endif

}
