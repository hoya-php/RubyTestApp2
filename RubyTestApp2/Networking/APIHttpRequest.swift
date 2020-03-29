//
//  APIHttpRequest.swift
//  RubyTestApp2
//

//
//  Copyright © 2020 hoya. All rights reserved.
//
import Foundation
import Alamofire
import Keys

/// レスポンスデータ
struct ResponseData: Codable {
    var request_id = ""
    var output_type = ""
    var converted = ""
}
class APIHttpRequest {
    
    func APIHttpRequest(sentence: String, completion: @escaping (ResponseData) -> Void) {
        // リクエスト情報
        let requestUrl = "https://labs.goo.ne.jp/api/hiragana"
        let appKey = RubyTestApp2Keys()
        let parameters:[String: Any] = [
            "app_id": appKey.apiTokenRubyApp,
            "sentence": sentence,
            "output_type": "hiragana"
        ]
        // リクエスト送信
        AF.request(requestUrl, method:.post, parameters: parameters).responseJSON {
            
            response in
            guard let jsonData = response.data else {
                return
            }
            let responseData = try! JSONDecoder().decode(ResponseData.self, from: jsonData)
            completion(responseData)
        }
        
    }
    
}
