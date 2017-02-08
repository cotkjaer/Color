//
//  UserDefaults.swift
//  Color
//
//  Created by Christian Otkjær on 27/01/17.
//  Copyright © 2017 Silverback IT. All rights reserved.
//

import Foundation

// MARK: - Persistence

extension UserDefaults
{
    /** Sets the value of the specified key in the defaults.
    - note: If `color` is nil, the current value stored at `key` will **not** be erased
    - parameter color: the value to store in these defaults
    - parameter key: the key to store the color under/at
     */
    public func set(_ color: Color?, forKey key: String)
    {
        guard let name = color?.name, let rgb = color?.rgb else { return }
        
        set([name, rgb], forKey: key)
    }
    /** Fetches the color associated with the specified key in these defaults.

    - parameter key: the key to lookup

    - returns: The color associated with the specified key. *nil* if the associated value is not a Color or no value is associated with the key.
 */
    public func color(forKey key: String) -> Color?
    {
        guard let array = array(forKey: key) else { return nil }
        
        guard array.count == 2, let name = array.first as? String, let rgb = array.last as? Int else { return nil }
        
        return Color(rgb, name)
    }
    
    ///TODO: move to general Defaults framework
    public func values<T>(forKey key: String) -> [T] where T: NSCoding
    {
        guard let datas: [Data] = array(forKey: key) as! [Data]? else { return [] }
        
        return datas.flatMap { NSKeyedUnarchiver.unarchiveObject(with: $0) as? T }
    }
    
    ///TODO: move to general Defaults framework
    func set<T>(values: [T]?, forKey key: String) where T: NSCoding
    {
        guard let datas = values?.map({ NSKeyedArchiver.archivedData(withRootObject: $0)}) else { return }
        
        set(datas, forKey: key)
    }
}
