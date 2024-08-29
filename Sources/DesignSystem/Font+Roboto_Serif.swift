//
//  File.swift
//  
//
//  Created by Manikandan on 27/08/24.
//

import SwiftUI

public enum Roboto_Serif : String,CaseIterable{
    case Normal = "RobotoSerif"
    case Italic = "RobotoSerif-Italic"
    
}

extension Font{
    
    public static func Roboto_Serif(_ robotoSerif : Roboto_Serif,size : CGFloat) -> Font{
                
        return Font.custom(robotoSerif.rawValue, size: size)
    }
}
