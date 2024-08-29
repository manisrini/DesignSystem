//
//  File.swift
//  
//
//  Created by Manikandan on 27/08/24.
//

import Foundation
import UIKit
import SwiftUI

public enum FontError : Error{
    case failedToRegister
}

public enum Fonts {
    case NerkoOne(NerkoOne,CGFloat)
    case Roboto(Roboto,CGFloat)
    case RobotoSerif(Roboto_Serif,CGFloat)
}

public struct FontHelper{

    public static func registerFonts(){
        Roboto.allCases.forEach { font in
            do {
                try self.registerFont(name: font.rawValue)
            }catch{
                print(error.localizedDescription)
            }
        }
        
        NerkoOne.allCases.forEach { font in
            do {
                try self.registerFont(name: font.rawValue)
            }catch{
                print(error.localizedDescription)
            }
        }
        
        Roboto_Serif.allCases.forEach { font in
            do {
                try self.registerFont(name: font.rawValue)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    
    private static func registerFont(name : String) throws {
        let url = Bundle.module.url(forResource: name, withExtension: "ttf")
        guard let gUrl = url,
              let gDataProvider = CGDataProvider(url: gUrl as CFURL),
              let font = CGFont(gDataProvider) else {
                throw FontError.failedToRegister
        }
        
        var error : Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}


public struct CustomFont : ViewModifier{
    
    var font : Fonts
    
    func getFontName(font : Fonts) -> String{
        switch font {
        case .NerkoOne(let style, _):
            return style.rawValue
        case .Roboto(let style, _):
            return style.rawValue
        case .RobotoSerif(let style, _):
            return style.rawValue
        }
    }
    
    func getFontSize(font : Fonts) -> CGFloat{
        switch font {
        case .NerkoOne(_, let size):
            return size
        case .Roboto(_, let size):
            return size
        case .RobotoSerif(_, let size):
            return size
        }
    }
    
    public func body(content: Content) -> some View {
        content
            .font(.custom(getFontName(font: font), size: getFontSize(font: font)))
    }
}


extension View {
    public func customFontStyle(_ font : Fonts) -> some View{
        modifier(CustomFont(font: font))
    }
}
