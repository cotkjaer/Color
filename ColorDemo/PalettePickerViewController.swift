//
//  PalettePickerViewController.swift
//  ColorDemo
//
//  Created by Christian Otkjær on 23/06/2018.
//  Copyright © 2018 Silverback IT. All rights reserved.
//

import UIKit
import Color

private let reuseIdentifier = "Cell"

class PalettePickerViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let dest = segue.destination as? PaletteViewController, let c = sender as? PalettePickerCell, let i = collectionView?.indexPath(for: c), let p = ColorPalette.all.get(i: i.item)
        {
            dest.palette = p
        }
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return ColorPalette.all.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        if let cell = cell as? PalettePickerCell, let p = ColorPalette.all.get(i: indexPath.item)
        {
            cell.label?.text = p.name
            
            if let views = cell.stackView?.subviews
            {
                views.forEach({cell.stackView?.removeArrangedSubview($0); $0.removeFromSuperview()})
            }
            
            for c in p.colors
            {
                let v = UIView(frame: .zero)
                v.backgroundColor = c.uiColor
                cell.stackView?.addSubview(v)
                cell.stackView?.addArrangedSubview(v)
            }
            
            cell.backgroundColor = p.colors.first?.uiColor
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        var size = collectionView.bounds.size
        
        size.height = 60
        
        return size
    }
}
