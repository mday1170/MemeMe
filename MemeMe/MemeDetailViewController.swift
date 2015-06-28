//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Michael Day on 6/26/15.
//  Copyright (c) 2015 Michael Day. All rights reserved.
//

import Foundation
import UIKit


class MemeDetailViewController: UIViewController {
    // Create a single meme object variable to display
    var meme: Meme!
    
    @IBOutlet weak var memeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.hidden = true
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        memeImage.image = meme.memedImage
    }
}
