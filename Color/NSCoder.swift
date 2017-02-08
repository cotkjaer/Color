//
//  NSCoder.swift
//  Color
//
//  Created by Christian Otkjær on 27/01/17.
//  Copyright © 2017 Silverback IT. All rights reserved.
//

import Foundation

// MARK: - Persistence

extension NSCoder
{
    public func encode(color: Color?, forKey: String)
    {
        guard let name = color?.name, let rgb = color?.rgb else { return }
        
        encode([name, rgb], forKey: forKey)
    }
    
    public func decodeColor(forKey: String) -> Color?
    {
        guard let array = decodeObject(forKey: forKey) as? [Any] else { return nil }
        
        guard array.count == 2, let name = array.first as? String, let rgb = array.last as? Int else { return nil }
        
        return Color(rgb, name)
    }
}

