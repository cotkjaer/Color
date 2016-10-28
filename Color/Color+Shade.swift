//
//  Color+Shade.swift
//  Color
//
//  Created by Christian Otkjær on 28/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import Foundation

// MARK: - Shade

extension Color
{
    // Mix color with a percent of black
    public mutating func shade(_ percent: Float)
    {
        mix(withPercent: min(1,max(percent, 0)), color: .black)
    }
    
    public func shaded(_ percent: Float) -> Color
    {
        return mixed(withPercent: min(1,max(percent, 0)), color: .black)
    }
    
}
