//
//  File.swift
//  
//
//  Created by Manikandan on 27/08/24.
//

import SwiftUI

public enum NerkoOne : String,CaseIterable{
    case Regular = "NerkoOne-Regular"
}

extension Font{
    public static func NerkoOne(_ nerkoOne : NerkoOne,size : CGFloat) -> Font{
        .custom(nerkoOne.rawValue, size: size)
    }
}

