//
//  Color+Equatable.swift
//  Color
//
//  Created by Christian Otkjær on 28/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

extension Color : Equatable {}

public func == (lhs: Color, rhs: Color) -> Bool
{
    return lhs.rgb == rhs.rgb
}
