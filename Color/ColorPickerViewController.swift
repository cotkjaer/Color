//
//  ColorPickerViewController.swift
//  Color
//
//  Created by Christian Otkjær on 09/01/17.
//  Copyright © 2017 Silverback IT. All rights reserved.
//

import UIKit

public protocol ColorPicker: class
{
    var pickerDelegate: ColorPickerDelegate? { set get }
}

public protocol ColorPickerDelegate
{
    func colorPicker(picker: ColorPicker, willPick color: Color)
    
    func colorPicker(picker: ColorPicker, didPick color: Color)
}

private let reuseIdentifier = "Cell"

open class ColorPickerViewController: UICollectionViewController, ColorPicker
{
    // MARK: - Delegate
    
    open var pickerDelegate: ColorPickerDelegate?
    
    // MARK: - Colors
    
    open var colors: [Color] = [
        .indigo,
        .sophia,
        .skye,
        .alice,
        .jade,
        .kelly,
        .daisy,
        .amber,
        .april,
        .coral,
        .rowan,
        .ruby]
        {
        didSet { collectionView?.reloadData() }
    }
    
    func color(at indexPath: IndexPath) -> Color?
    {
        guard indexPath.item >= 0, indexPath.item < colors.endIndex else { return nil }
        
        return colors[indexPath.item]
    }
    
    // MARK: - Lifecycle
    
    override open func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    override open func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        updateLayout()
    }
    
    override open func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
     
        updateLayout()
    }
    
    // MARK: - Layout
    
    var flowLayout: UICollectionViewFlowLayout? { return collectionView?.collectionViewLayout as? UICollectionViewFlowLayout }
    
    override open func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { (context) in
            
        }) { (context) in
            self.updateLayout()
        }
    }
    
    func updateLayout()
    {
        guard var size = collectionView?.bounds.size, let layout = flowLayout else { return }
        
        if let contentInset = collectionView?.contentInset
        {
            size.height -= contentInset.bottom + contentInset.top
            size.width -= contentInset.left + contentInset.right
        }
        
        if let sectionInset = flowLayout?.sectionInset
        {
            size.height -= sectionInset.bottom + sectionInset.top
            size.width -= sectionInset.left + sectionInset.right
        }
        
        layout.scrollDirection = size.width > size.height ? .horizontal : .vertical
        
        let MaxSide = 60 + layout.minimumInteritemSpacing
        
        var side = min(size.width, size.height)
        
        if side / MaxSide > 2
        {
            side /= floor(side / MaxSide)
        }
        
        layout.itemSize = CGSize(width: side, height: side)
    }
    
    // MARK: UICollectionViewDataSource
    
    override open func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    override open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return colors.count
    }
    
    override open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        cell.contentView.backgroundColor = color(at: indexPath)?.uiColor
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
     // Uncomment this method to specify if the specified item should be selected
     override open func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool
     {
        guard let color = color(at: indexPath) else { return false }
        
        pickerDelegate?.colorPicker(picker: self, willPick: color)

        return true
     }
    
    override open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        guard let color = color(at: indexPath) else { return }
        
        pickerDelegate?.colorPicker(picker: self, didPick: color)
    }
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
