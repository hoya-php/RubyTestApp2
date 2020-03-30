//
//  AdaptiveCardSwiftSampleTests.swift
//  RubyTestApp2Tests
//
//  Created by Kazuya Ito on 2020/03/30.
//  Copyright © 2020 hoya. All rights reserved.
//

@testable import RubyTestApp2
import XCTest

class AdaptiveCardSwiftSampleTests: XCTestCase {
    private var subject: APIHttpRequest!
    
    override func setUp() {
        subject = APIHttpRequest()
        // スタブに置き換え
        URLSessionConfiguration.setupMockDefaultSessionConfiguration()
    }
    
    func testExample() {
        //非同期の待ち時間用
        let expectation = XCTestExpectation(description: "Hoge")
        
        subject.APIHttpRequest(sentence: "テスト駆動開発") { (result) in
            //期待する返却値(MockURLProtocolで指定しているJSONデータ)
            XCTAssertEqual(result.request_id, "request-id")
            XCTAssertEqual(result.output_type, "hiragana")
            XCTAssertEqual(result.converted, "てすとくどうかいはつ")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3)
    }
    
}
