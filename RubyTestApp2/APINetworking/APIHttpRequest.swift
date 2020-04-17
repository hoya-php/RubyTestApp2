//
//  APIHttpRequest.swift
//  RubyTestApp2
//
//
//  Copyright © 2020 hoya. All rights reserved.
//

import Foundation
import Alamofire

class APIHttpRequest {
    
    /// レスポンスデータ
    struct ResponseData: Codable {
        var request_id = ""
        var output_type = ""
        var converted = ""
    }
    
    //API通信処理　=> ViewController.swift
    func requests(sentence: String, completion: @escaping (_ rubyCharacter: String) -> Void) {
        
        // リクエスト情報 => APIKey.swift
        let requestsData = RequestsData(sentence)
        
        // リクエスト送信
        AF.request(requestsData.requestUrl, method:.post, parameters: requestsData.parameters).responseJSON {
            
            response in
            
            do {
                // JSON取得 response.data unwrap
                let responseData = try JSONDecoder().decode(ResponseData.self, from: response.data!)
                
                // 取り出して変換
                let rubyCharacter = responseData.converted
                completion(rubyCharacter)
                
            } catch {
                //error処理
            }
        }
    }
}
