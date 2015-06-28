//
//  MemeTextDelegate.swift
//  MemeMe
//
//  Created by Michael Day on 6/19/15.
//  Copyright (c) 2015 Michael Day. All rights reserved.
//

import Foundation
import UIKit

class MemeTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = ""
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        var currString = textField.text as NSString
        currString = currString.stringByReplacingCharactersInRange(range, withString: string)
        return true
    }
}
