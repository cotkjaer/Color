//
//  Color+Mix.swift
//  Color
//
//  Created by Christian Otkjær on 28/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import Foundation

// MARK: - Mixing

public extension Color
{
    private func lerp (a: Float, b: Float, t: Float) -> Float
    {
        return a * (1 - t) + b * t
    }
    
    private func lerp(_ a: Int, _ b: Int, _ t: Float) -> Int
    {
        return Int(lerp(a: Float(a), b: Float(b), t: t))
    }
    
    func overlayed(withColor color: Color, atOpacity alpha: Float) -> Color
    {
        let r = Float(color.r) * alpha + Float(self.r) * (1 - alpha)
        let g = Float(color.g) * alpha + Float(self.g) * (1 - alpha)
        let b = Float(color.b) * alpha + Float(self.b) * (1 - alpha)
        
        return Color(r: Int(r), g: Int(g), b: Int(b))
    }
    
    mutating func mix(withPercent percent: Float, color: Color )
    {
        self = mixed(withPercent: percent, color: color)
        
//        r = lerp(r, color.r, percent)
//        g = lerp(g, color.g, percent)
//        b = lerp(b, color.b, percent)
    }
    
    func mixed(withPercent percent: Float, color: Color ) -> Color
    {
        return Color(r: lerp(r, color.r, percent),
                     g: lerp(g, color.g, percent),
                     b: lerp(b, color.b, percent))
    }
    
    
}
