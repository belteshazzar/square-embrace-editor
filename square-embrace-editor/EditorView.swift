//
//  EditorView.swift
//  square-embrace-editor
//
//  Created by Daniel Walton on 8/12/2022.
//

import SwiftUI

struct EditorView: ViewRepresentable {

    @Binding var text: String

#if os(iOS)
    public func makeUIView(context: Context) -> UITextView {
    }
    
    public func updateUIView(_ uiView: UITextView, context: Context) {
    }
#endif
    
#if os(macOS)
    public func makeNSView(context: Context) -> NSScrollView {
        let scrollView = NSTextView.scrollableTextView()
        let textView = scrollView.documentView as? NSTextView
        textView!.isRichText = false
        textView!.delegate = context.coordinator
        textView!.string = text
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        textView!.font = NSFont.monospacedSystemFont(ofSize: 12, weight: .regular)
        textView!.lnv_setUpLineNumberView()
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
            self.parent.text = (notification.object as! NSTextView) .string
        }
    }

    public func updateNSView(_ view: NSScrollView, context: Context) {
    }
#endif

}
