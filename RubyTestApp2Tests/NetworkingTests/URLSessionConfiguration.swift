//
//  URLSessionConfiguration.swift
//  RubyTestApp2Tests
//
//  Created by Kazuya Ito on 2020/03/30.
//  Copyright © 2020 hoya. All rights reserved.
//

import Foundation

public extension URLSessionConfiguration {
    
    // .defaultをモック用と入れ替えるメソッド
    public class func setupMockDefaultSessionConfiguration() {
        let defaultSessionConfiguration = class_getClassMethod(URLSessionConfiguration.self, #selector(getter: URLSessionConfiguration.default))!
        let swizzledDefaultSessionConfiguration = class_getClassMethod(URLSessionConfiguration.self, #selector(getter: URLSessionConfiguration.mock))!
        method_exchangeImplementations(defaultSessionConfiguration, swizzledDefaultSessionConfiguration)
    }
    
    // .defaultと入れ替えるプロパティ変数
    @objc private dynamic class var mock: URLSessionConfiguration {
        let configuration = self.mock
        configuration.protocolClasses?.insert(MockURLProtocol.self, at: 0)
        URLProtocol.registerClass(MockURLProtocol.self)
        return configuration
    }
}
