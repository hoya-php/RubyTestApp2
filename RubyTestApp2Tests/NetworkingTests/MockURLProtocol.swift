//
//  MockURLProtocol.swift
//  RubyTestApp2Tests
//
//  Created by Kazuya Ito on 2020/03/30.
//  Copyright © 2020 hoya. All rights reserved.
//

import Foundation

public class MockURLProtocol: URLProtocol {
    
    // 引数のURLRequestを処理できる場合はtrue
    override open class func canInit(with request:URLRequest) -> Bool {
        return true
    }
    
    // URLRequestの修正が必要でなければそのまま返す。
    override open class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    // 通信開始時に呼ばれるメソッド、ここに通信のモックを実装します。
    override open func startLoading() {
        let delay: Double = 1.0 // 通信に1秒かかるモック
        DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
            self.client?.urlProtocol(self, didLoad: self.response!) // 結果を返す
            self.client?.urlProtocolDidFinishLoading(self)     // 通信が終了したことを伝える
            
            // エラー時のハンドリングもこちらで可能です。
            // self.client?.urlProtocol(self, didFailWithError: error)
        }
    }
    
    // 通信停止時に呼ばれるメソッド
    override open func stopLoading() {
    }
    
    private var response: Data? {
        // URLなどでパターンマッチングすることで結果を切り替えることも出来る
        // self.request.url
        let json = "{\"converted\":\"てすとくどうかいはつ\",\"output_type\":\"hiragana\",\"request_id\":\"request-id\"}"
        return json.data(using: .utf8)
    }
}
