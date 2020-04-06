//
//  Task.swift
//  RubyTestApp2
//
//  Created by kazuy Ito on 2020/04/07.
//  Copyright © 2020 hoya. All rights reserved.
//

import Foundation
import UIKit

class MesseageCell {
    //  入力文字
    let inputCharacter: String

    //  出力ruby文字
    let outputRubyCharacter: String
    
    init(inputCharacter: String, outputRubyCharacter: String){
        self.inputCharacter = inputCharacter
        self.outputRubyCharacter = outputRubyCharacter
    }
    
    /*
     
    */
    
    init(from dictionary: [String: Any]) {
        self.inputCharacter = dictionary["inputCharacter"] as! String
        self.outputRubyCharacter = dictionary["outputRubyCharacter"] as! String
    }
    
}
