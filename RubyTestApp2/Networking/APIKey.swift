//
//  APIKey.swift
//  RubyTestApp2
//
//  Copyright © 2020 hoya. All rights reserved.
//

import Foundation
import Keys

let appKey = RubyTestApp2Keys()

struct RequestsData {
    
    let requestUrl: String = "https://labs.goo.ne.jp/api/hiragana"
    let parameters: [String: Any]
    
    init(_ sentence: String){
        
        parameters  = [
            "app_id": appKey.apiTokenRubyApp,
            "sentence": sentence,
            "output_type": "hiragana"
        ]
        
    }
    
}
