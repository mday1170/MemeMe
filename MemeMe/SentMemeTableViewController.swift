//
//  SentMemeTableViewController.swift
//  MemeMe
//
//  Created by Michael Day on 6/20/15.
//  Copyright (c) 2015 Michael Day. All rights reserved.
//

import Foundation
import UIKit

class SentMemeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //
    // var tableMeme: [Meme]!
    
    @IBOutlet weak var memTableView: UITableView!

    @IBOutlet weak var sentMemeEdit: UIBarButtonItem!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        let object = UIApplication.sharedApplication().delegate
//        let appDelegate = object as! AppDelegate
//        tableMeme = appDelegate.memes
        tabBarController?.tabBar.hidden = false
        memTableView.setEditing(false, animated: true)
        memTableView.reloadData()

        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeTableCell") as! UITableViewCell
         let meme = (UIApplication.sharedApplication().delegate as! AppDelegate).memes[indexPath.row]
         cell.textLabel?.text = meme.topText.text
         cell.detailTextLabel?.text = meme.bottomText.text
         cell.imageView?.image = meme.memedImage
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailController = storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = (UIApplication.sharedApplication().delegate as! AppDelegate).memes[indexPath.row]
        navigationController!.pushViewController(detailController, animated: true)
       
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return memTableView.editing ? true : false

    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        //
        if editingStyle == UITableViewCellEditingStyle.Delete {
            (UIApplication.sharedApplication().delegate as! AppDelegate).memes.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            memTableView.setEditing(false, animated: true)
            
        } else {
            memTableView.setEditing(false, animated: true)
        }
    }
    
    @IBAction func editSentMeme(sender: AnyObject) {
        memTableView.setEditing(true, animated: true)
    }
    
    
}