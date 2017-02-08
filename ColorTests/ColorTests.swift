//
//  ColorTests.swift
//  ColorTests
//
//  Created by Christian Otkjær on 27/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import Foundation
import XCTest
@testable import Color

class ColorTests: XCTestCase
{
    func test_random()
    {
        let r1 = Color.random()
        let r2 = Color.random()
        let r3 = Color.random()
        
        XCTAssertFalse(r1 == r2 && r1 == r3, "Oh my, seems three identical colors were generated")
    }
    
    func test_equal()
    {
        XCTAssertEqual(Color.indigo, Color.indigo.named("something else"))
        
        XCTAssertEqual(Color(0), Color(r:0, g: 0, b: 0))
    }
    
    func test_indigo()
    {
        let indigo = Color.indigo
        
        XCTAssertEqual(indigo.r, 0x0d)
        XCTAssertEqual(indigo.g, 0x3d)
        XCTAssertEqual(indigo.b, 0x56)
        
        XCTAssertEqual(indigo, Color(named: "Indigo"))
    }
    
    func test_sophia()
    {
        let sophia = Color.sophia
        
        XCTAssertEqual(sophia.r, 0x0F)
        XCTAssertEqual(sophia.g, 0x5B)
        XCTAssertEqual(sophia.b, 0x78)
    }
    
    func test_skye()
    {
        let skye = Color.skye
        
        XCTAssertEqual(skye.r, 0x11)
        XCTAssertEqual(skye.g, 0x78)
        XCTAssertEqual(skye.b, 0x99)
    }
    
    func test_alice()
    {
        let alice = Color.alice
        
        XCTAssertEqual(alice.r, 0x14)
        XCTAssertEqual(alice.g, 0x96)
        XCTAssertEqual(alice.b, 0xBB)
    }
    
    func test_jade()
    {
        let jade = Color.jade
        
        XCTAssertEqual(jade.r, 0x5C)
        XCTAssertEqual(jade.g, 0xA7)
        XCTAssertEqual(jade.b, 0x94)
    }
    
    func test_kelly()
    {
        let kelly = Color.kelly
        
        XCTAssertEqual(kelly.r, 0xA3)
        XCTAssertEqual(kelly.g, 0xB8)
        XCTAssertEqual(kelly.b, 0x6C)
    }
    
    func test_daisy()
    {
        let daisy = Color.daisy
        
        XCTAssertEqual(daisy.r, 0xEB)
        XCTAssertEqual(daisy.g, 0xC9)
        XCTAssertEqual(daisy.b, 0x44)
    }
    
    func test_amber()
    {
        let amber = Color.amber
        
        XCTAssertEqual(amber.r, 0xED)
        XCTAssertEqual(amber.g, 0xAA)
        XCTAssertEqual(amber.b, 0x38)
    }
    
    func test_april()
    {
        let april = Color.april
        
        XCTAssertEqual(april.r, 0xF0)
        XCTAssertEqual(april.g, 0x8C)
        XCTAssertEqual(april.b, 0x2D)
    }
    
    func test_coral()
    {
        let coral = Color.coral
        
        XCTAssertEqual(coral.r, 0xF2)
        XCTAssertEqual(coral.g, 0x6D)
        XCTAssertEqual(coral.b, 0x21)
    }
    
    func test_rowan()
    {
        let rowan = Color.rowan
        
        XCTAssertEqual(rowan.r, 0xD9)
        XCTAssertEqual(rowan.g, 0x4E)
        XCTAssertEqual(rowan.b, 0x20)
    }
    
    func test_ruby()
    {
        let ruby = Color.ruby
        
        XCTAssertEqual(ruby.r, 0xC0)
        XCTAssertEqual(ruby.g, 0x2F)
        XCTAssertEqual(ruby.b, 0x1D)
    }
    
    class ColorContainer: NSObject, NSCoding
    {
        var color: Color
        var value: Int
        
        init(color: Color, value: Int)
        {
            self.color = color
            self.value = value
        }
        
        required convenience init?(coder decoder: NSCoder)
        {
            guard let color = decoder.decodeColor(forKey: "color") else { return nil }
            
            self.init(color: color, value: decoder.decodeInteger(forKey: "value"))
        }
        
        func encode(with coder: NSCoder)
        {
            coder.encode(color: color, forKey: "color")
            coder.encode(value, forKey: "value")
        }
    }
    
    func test_settings()
    {
        let ruby = Color.ruby
        let settings = UserDefaults.standard
        
        settings.set(ruby, forKey: "color")
        
        let c = settings.color(forKey: "color")
        
        XCTAssertNotNil(c)
        
        XCTAssertEqual(ruby, c)
        
        let colorContainers = [ColorContainer(color: Color.ruby, value: 90),
                               ColorContainer(color: .amber, value: -10)]
        
        settings.set(values: colorContainers, forKey: "colors")
        
        let cs: [ColorContainer] = settings.values(forKey: "colors")
        
        XCTAssertNotNil(cs)
        XCTAssertEqual(cs.count, colorContainers.count)
        
        XCTAssertEqual(colorContainers.map{$0.color}, cs.map{$0.color})
        
    }
}
