//
//  Color+Tint.swift
//  Color
//
//  Created by Christian Otkjær on 28/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import Foundation

// MARK: - Tint

extension Color
{
    // Mix color with a percent of white
    public mutating func tint(_ percent: Float)
    {
        mix(withPercent: min(1,max(percent, 0)), color: .white)
    }
    
    public func tinted(_ percent: Float) -> Color
    {
        return mixed(withPercent: min(1,max(percent, 0)), color: .white)
    }
}
