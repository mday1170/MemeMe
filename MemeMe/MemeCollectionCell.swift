//
//  MemeCollectionCell.swift
//  MemeMe
//
//  Created by Michael Day on 6/22/15.
//  Copyright (c) 2015 Michael Day. All rights reserved.
//

import Foundation
import UIKit

class MemeCollectionCell: UICollectionViewCell {
    //
    

    @IBOutlet weak var memeCImage: UIImageView!
    
    // currently not using text labels, but kept this outlets as placeholders
    // for future use.
    @IBOutlet weak var memeTopText: UILabel!
    @IBOutlet weak var memeBottomText: UILabel!
}