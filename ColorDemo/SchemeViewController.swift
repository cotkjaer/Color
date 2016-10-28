//
//  MixViewController.swift
//  Color
//
//  Created by Christian Otkjær on 27/10/16.
//  Copyright © 2016 Silverback IT. All rights reserved.
//

import UIKit
import Color

class SchemeViewController: UIViewController
{
    @IBOutlet var colorLabels: [UILabel]!
    
    var color: Color = Color.alice
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    
        colorLabels.sort { (l1, l2) -> Bool in
            let y1 = view.convert(l1.center, from: l1.superview).y
            let y2 = view.convert(l2.center, from: l2.superview).y
            
            return y1 < y2
        }
        
        let colors = ColorScheme(hue: color).colors.reversed()
        
        for (index, label) in colorLabels.enumerated()
        {
            label.superview?.backgroundColor = colors[index].uiColor
            
            label.text = colors[index].name
            
            if index < colorLabels.count - 1
            {
                label.textColor = Color.lilia.uiColor
            }
            else
            {
                label.textColor = Color.jet.uiColor
            }
        }
    }
    
}
