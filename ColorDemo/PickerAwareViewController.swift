//
//  PickerAwareViewController.swift
//  Color
//
//  Created by Christian Otkjær on 09/01/17.
//  Copyright © 2017 Silverback IT. All rights reserved.
//

import UIKit
import Color

class PickerAwareViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let picker = segue.destination as? ColorPicker
        {
            picker.pickerDelegate = self
        }
    }
    

}

// MARK: - <#protocol#>

extension PickerAwareViewController : ColorPickerDelegate
{
    
    func colorPicker(picker: ColorPicker, willPick color: Color)
    {
        // NOOP
    }
    
    func colorPicker(picker: ColorPicker, didPick color: Color)
    {
        self.view.backgroundColor = ColorScheme(color).lightest.uiColor
        
        self.dismiss(animated: true, completion: nil)
    }
}
