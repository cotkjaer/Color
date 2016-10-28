//
//  Color+Equatable.swift
//  Color
//
//  Created by Christian Otkjær on 28/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import Foundation

//MARK: - Hashable

extension Color : Hashable
{
    public var hashValue : Int { return rgb }
}
