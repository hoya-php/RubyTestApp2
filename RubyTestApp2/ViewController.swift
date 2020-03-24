//
//  ViewController.swift
//  RubyTestApp2
//
//
//  Copyright © 2020 hoya. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var humImage: UIImageView!
    @IBOutlet weak var outputRuby: UILabel!
    @IBOutlet weak var outputCharacter: UILabel!
    @IBOutlet weak var inputBox: UITextField!
    @IBOutlet weak var outputView: UIView!
    @IBOutlet weak var SendButton: UIButton!
    @IBOutlet weak var prevCharacter: UILabel!
    @IBOutlet weak var nextCharacter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// ルビ変換ボタン押下時、ルビを画面に表示するメソッド
    ///
    /// - Parameter sender: UIButton
    @IBAction func convertRuby(_ sender: UIButton) {
        guard let inputText = inputBox.text else {
            return
        }
        
        if inputText != "" {
            _ = APIHttpRequest.init(sentence: inputText, completion: {(responseData: ResponseData) -> Void in
                
                self.prevCharacter.text = ""
                self.nextCharacter.text = "って、よむんだよ"
                
                self.outputRuby.text = inputText
                self.outputCharacter.text = responseData.converted
                
            })
        }
    }
}
