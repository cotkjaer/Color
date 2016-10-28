//
//  ColorScheme.swift
//  Color
//
//  Created by Christian Otkjær on 28/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import Foundation

public struct ColorScheme
{
    public let hue : Color
    
    public var lightest : Color
    {
        return hue.tinted(0.8).named("Lightest \(hue.name)")
    }
    
    public var lighter : Color
    {
        return hue.tinted(0.2).named("Lighter \(hue.name)")
    }
    
    public var darker : Color
    {
        return hue.toned(0.2).named("Darker \(hue.name)")
    }

    public var darkest : Color
    {
        return hue.shaded(0.2).named("Darkest \(hue.name)")
    }
    
    public var hues : [Color]
    {
        return [lightest, lighter, hue, darker, darkest]
    }
}
