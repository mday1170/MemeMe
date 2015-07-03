//
//  CollectionViewController.swift
//  MemeMe
//
//  Created by Michael Day on 6/21/15.
//  Copyright (c) 2015 Michael Day. All rights reserved.
//

import Foundation
import UIKit


class SentCollectionViewController: UIViewController, UICollectionViewDataSource {
    
    // var tableMeme: [Meme]!
    
    @IBOutlet weak var memCollView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.hidden = false
        memCollView.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCollectionCell", forIndexPath: indexPath) as! MemeCollectionCell
        let memeCell = (UIApplication.sharedApplication().delegate as! AppDelegate).memes[indexPath.row]
        cell.memeCImage?.image = memeCell.memedImage
        
        // In case I need to add more detail to the collection vew tab.
        // cell.memeTopText.text = memeCell.topText.text
        // cell.memeBottomText.text = memeCell.bottomText.text
        
        return cell
    }
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detailController = storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = (UIApplication.sharedApplication().delegate as! AppDelegate).memes[indexPath.row]
        detailController.memeIndex = indexPath.row
        navigationController!.pushViewController(detailController, animated: true)
    }

}

// Revisit this later to work on a custom layout; specifically, to work on the 
// the space between the items.

//extension SentCollectionViewController: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInterItemSpacing section: Int) -> CGFloat {
//        return 5.0
//    }
//}
