//
//  PaletteViewController.swift
//  ColorDemo
//
//  Created by Christian Otkjær on 23/06/2018.
//  Copyright © 2018 Silverback IT. All rights reserved.
//

import UIKit
import Color

private let reuseIdentifier = "Cell"

class PaletteCell: UICollectionViewCell
{
    @IBOutlet weak var label: UILabel?
}

extension Array
{
    func get(i: Index) -> Element?
    {
        guard i < endIndex, i >= startIndex else { return nil }
        
        return self[i]
    }
}

class PaletteViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout
{

    let palette = ColorPalette.basic
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return palette.colors.count }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        if let cell = cell as? PaletteCell, let c = palette.colors.get(i: indexPath.item)
        {
            cell.label?.text = c.name
            cell.backgroundColor = c.uiColor
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
