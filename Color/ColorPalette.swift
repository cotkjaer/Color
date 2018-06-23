//
//  ColorPalette.swift
//  Color
//
//  Created by Christian Otkjær on 23/06/2018.
//  Copyright © 2018 Silverback IT. All rights reserved.
//

import Foundation

open class ColorPalette
{
    open let colors: [Color]
    
    public init(colors: [Color])
    {
        self.colors = colors
    }
    
    static public let basic = ColorPalette(colors: [
        Color(r: 251, g: 207, b: 062),
        Color(r: 238, g: 155, b: 057),
        Color(r: 226, g: 103, b: 051),
        Color(r: 200, g: 058, b: 058),
        Color(r: 162, g: 087, b: 144),
        Color(r: 111, g: 096, b: 147),
        Color(r: 038, g: 107, b: 175),
        Color(r: 102, g: 173, b: 211),
        Color(r: 080, g: 160, b: 141),
        Color(r: 061, g: 140, b: 069),
        Color(r: 127, g: 167, b: 069),
        Color(r: 178, g: 196, b: 068),
        Color(r: 204, g: 166, b: 071),
        Color(r: 169, g: 132, b: 060),
        //Grays
        Color(r: 233, g: 234, b: 235),
        Color(r: 187, g: 190, b: 192),
        Color(r: 144, g: 151, b: 155),
        Color(r: 084, g: 093, b: 098)
        ])
}
