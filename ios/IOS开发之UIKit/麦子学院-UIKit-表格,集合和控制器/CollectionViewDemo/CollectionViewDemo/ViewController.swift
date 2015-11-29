//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Benjamin on 11/10/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    let images = ["1", "2", "3", "4", "5", "6", "7"]

    @IBOutlet weak var collectionView1: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView1.dataSource = self
        collectionView1.delegate = self
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let width = UIScreen.mainScreen().bounds.width
        return CGSize(width: width/2.0, height: 150.0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    //返回每个的cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("benjamin", forIndexPath: indexPath) as UICollectionViewCell
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: images[indexPath.row])
        return cell
    }
    
    //返回一个section里的个数
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
}

