//
//  Color+Tone.swift
//  Color
//
//  Created by Christian Otkjær on 28/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import Foundation

// MARK: - Tone

extension Color
{
    // Mix color with a percent of grey (7F7F7F)
    public mutating func tone(_ percent: Float)
    {
        mix(withPercent: min(1,max(percent, 0)), color: .white)
    }
    
    // Mix color with a percent of grey (7F7F7F)
    public func toned(_ percent: Float) -> Color
    {
        return mixed(withPercent: min(1,max(percent, 0)), color: .white)
    }
}
