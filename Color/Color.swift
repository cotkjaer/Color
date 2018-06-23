//
//  Color.swift
//  Color
//
//  Created by Christian Otkjær on 27/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import Foundation

public struct Color
{
    static var colorsByName = Dictionary<String, Color>()

    private let R,G,B : UInt8
    
    public var r : Int { return Int(R) }
    public var g : Int { return Int(G) }
    public var b : Int { return Int(B) }
    
    public var name: String
    
    private(set) var rgb : Int
    
    public init(r: Int, g: Int, b: Int, name: String? = nil)
    {
        self.R = UInt8(r)//min(255, max(0, r))
        self.G = UInt8(g)//min(255, max(0, g))
        self.B = UInt8(b)//min(255, max(0, b))
        self.name = name ?? String(format:"%6X", r << 16 + g << 8 + b)
        self.rgb = r << 16 + g << 8 + b
        if let name = name
        {
            Color.colorsByName[name] = self
        }
    }
    
    public init(_ rgb: Int, _ name: String? = nil)
    {
        let rgb = max(0, rgb)
        
        self.init(
            r: (rgb >> 16) & 0xFF,
            g: (rgb >> 8) & 0xFF,
            b: rgb & 0xFF,
            name: name
                  )
    }
    
    public var uiColor : UIColor { return UIColor(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1) }
    
    public var cgColor : CGColor { return uiColor.cgColor }
    
    //Colors, see https://www.viget.com/articles/naming-colors
    
    public static let indigo = Color(0x0D3D56, "Indigo")
    public static let sophia = Color(0x0F5B78, "Sophia")
    public static let skye = Color(0x117899, "Skye")
    public static let alice = Color(0x1496BB, "Alice")
    public static let jade = Color(0x5CA794, "Jade")
    public static let kelly = Color(0xA3B86C, "Kelly")
    public static let daisy = Color(0xEBC944, "Daisy")
    public static let amber = Color(0xEDAA38, "Amber")
    public static let april = Color(0xF08C2D, "April")
    public static let coral = Color(0xF26D21, "Coral")
    public static let rowan = Color(0xD94E20, "Rowan")
    public static let ruby = Color(0xC02F1D, "Ruby")
    
    //Grays, see https://www.viget.com/articles/naming-colors
    
    public static let jet = Color(0x131516, "Jet")
    public static let raven = Color(0x373D3F, "Raven")
    public static let asher = Color(0x555F61, "Asher")
    public static let stone = Color(0x707C80, "Stone")
    public static let gray = Color(0x8C979A, "Gray")
    public static let streling = Color(0xA7B0B2, "Streling")
    public static let heather = Color(0xC1C7C9, "Heather")
    public static let pearl = Color(0xDADEDF, "Pearl")
    public static let lilia = Color(0xF2F3F4, "Lilia")
    
    public static let black = Color(0x000000, "Black")
    public static let white = Color(0xFFFFFF, "White")
    public static let grey = Color(0x7F7F7F, "Grey")
    
    public static let gold = Color(0xFFD700, "Gold")
    public static let silver = Color(0xC0C0C0, "Silver")
    public static let bronze = Color(0xCD7F32, "Bronze")
    
    //Colors in palettes, from https://www.canva.com/learn/brand-color-palette/
    
    public static let glass = Color(0xEDFAFD, "Glass")
    public static let chill = Color(0xAED9DA, "Chill")
    public static let californianCoral = Color(0x3DDAD7, "Californian Coral")
    public static let bondiBlue = Color(0x2A93D5, "Bondi Blue")
    public static let marina = Color(0x135589, "Marina")
  
    public static let sheer = Color(0xC5D2DB, "Sheer")
    public static let shutterBlue = Color(0x2096BA, "Shutter Blue")
    public static let papayaWhip = Color(0xE7B183, "Papaya Whip")
    public static let puce = Color(0xC5919D, "Puce")
    public static let terracotta = Color(0xDF6E21, "Terracotta")
    
    public static let tropicalPink = Color(0xF5AB99, "Tropical Pink")
    public static let liquidSunset = Color(0xFEB47B, "Liquid Sunset")
    public static let heatwave = Color(0xFF7e5f, "HeatWave")
    public static let paradise = Color(0x765285, "Paradise")
    public static let nightfall = Color(0x351c4d, "Nightfall")
    
//    public static let <#name#> = Color(0x<#value#>, "<#name#>")

}

