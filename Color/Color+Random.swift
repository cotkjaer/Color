//
//  Color+Random.swift
//  Color
//
//  Created by Christian Otkjær on 28/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

extension Color
{
    public static func random() -> Color
    {
        return Color(r: Int(arc4random_uniform(256)),g: Int(arc4random_uniform(256)),b: Int(arc4random_uniform(256)))
    }
}
