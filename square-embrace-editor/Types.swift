//
//  Types.swift
//  square-embrace-editor
//
//  Created by Daniel Walton on 9/12/2022.
//

import SwiftUI

#if os(iOS)
    import UIKit
    public typealias Color = UIColor
    public typealias Font = UIFont
    public typealias FontDescriptor = UIFontDescriptor
    public typealias Traits = UIFontDescriptor.SymbolicTraits
    public typealias ViewRepresentable = UIViewRepresentable
#elseif os(macOS)
    import AppKit
    public typealias Color = NSColor
    public typealias Font = NSFont
    public typealias FontDescriptor = NSFontDescriptor
    public typealias Traits = NSFontDescriptor.SymbolicTraits
    public typealias ViewRepresentable = NSViewRepresentable
#endif
