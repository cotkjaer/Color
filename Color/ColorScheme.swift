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
    /// Base color
    public let color : Color
    
    public init(_ color: Color)
    {
        self.color = color
    }
    
    public var lightest : Color
    {
        return color.tinted(0.8).named("Lightest \(color.name)")
    }
    
    public var lighter : Color
    {
        return color.tinted(0.2).named("Lighter \(color.name)")
    }
    
    public var darker : Color
    {
        return color.toned(0.2).named("Darker \(color.name)")
    }

    public var darkest : Color
    {
        return color.shaded(0.2).named("Darkest \(color.name)")
    }
    
    public var hues : [Color]
    {
        return [lightest, lighter, color, darker, darkest]
    }
}
