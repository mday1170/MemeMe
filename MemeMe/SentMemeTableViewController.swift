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
    var tableMeme: [Meme]!
    
    @IBOutlet weak var memTableView: UITableView!

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        tableMeme = appDelegate.memes
        tabBarController?.tabBar.hidden = false
        memTableView.reloadData()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableMeme.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeTableCell") as! UITableViewCell
         let meme = tableMeme[indexPath.row]
         cell.textLabel?.text = meme.topText.text
         cell.detailTextLabel?.text = meme.bottomText.text
         cell.imageView?.image = meme.memedImage
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailController = storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = tableMeme[indexPath.row]
        navigationController!.pushViewController(detailController, animated: true)
        
    }
}