//
//  Meme.swift
//  MemeMe
//
//  Created by Michael Day on 6/18/15.
//  Copyright (c) 2015 Michael Day. All rights reserved.
//

import Foundation
import UIKit

class Meme {
    
    var topText : UITextField
    var bottomText : UITextField
    var image : UIImage
    var memedImage : UIImage
    
    
    
    init(topText: UITextField, bottomText: UITextField, image: UIImage, memedImage: UIImage) {
        self.topText = topText
        self.bottomText = bottomText
        self.image = image
        self.memedImage = memedImage
        
    }
    

}
