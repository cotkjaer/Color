//
//  ColorSchemeTests.swift
//  Color
//
//  Created by Christian Otkjær on 28/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import XCTest

@testable import Color

class ColorSchemeTests: XCTestCase
{
    func test_kelly_color_scheme()
    {
        let scheme = ColorScheme(.kelly)
        
        XCTAssertEqual(scheme.hues.count, 5)
        
        XCTAssertEqual(scheme.darkest.name, "Darkest Kelly")
    }
}
