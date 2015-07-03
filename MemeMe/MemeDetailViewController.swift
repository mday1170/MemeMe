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
    var memeIndex: Int!
    var deleteBarButton: UIBarButtonItem!

    @IBOutlet weak var memeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.hidden = true
        deleteBarButton = UIBarButtonItem(barButtonSystemItem: .Trash, target: self, action: "deleteImage")
        navigationItem.rightBarButtonItem = deleteBarButton
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        memeImage.image = meme.memedImage
    }
    
    
    func deleteImage() {
        
        // Implement a UIAlertController to allow a choice 
        var memeAlert = UIAlertController()
        memeAlert.message = "Delete Meme?"
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){
            action in (UIApplication.sharedApplication().delegate as! AppDelegate).memes.removeAtIndex(self.memeIndex)
            self.dismissViewControllerAnimated(true, completion: nil)
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default) {
            action in self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        memeAlert.addAction(okAction)
        memeAlert.addAction(cancelAction)
        presentViewController(memeAlert, animated: true, completion: nil)
        
        
        
    }
}
