//
//  Color+Name.swift
//  Color
//
//  Created by Christian Otkjær on 28/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import Foundation

// MARK: - Names

extension Color
{
    public init?(named: String)
    {
        guard let color = Color.colorsByName[named] else { return nil }
        
        self = color
    }
    
    public mutating func name(_ name: String)
    {
        self.name = name
    }
    
    public func named(_ name: String) -> Color
    {
        return Color(r: r, g: g, b: b, name: name)
    }
}
