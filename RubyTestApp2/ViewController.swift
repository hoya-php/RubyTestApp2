//
//  ViewController.swift
//  RubyTestApp2
//
//
//  Copyright © 2020 hoya. All rights reserved.
//
import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
    

    @IBOutlet weak var HumImage: UIImageView!
    @IBOutlet weak var CellImage: UIImageView!
    @IBOutlet weak var outputRuby: UILabel!
    @IBOutlet weak var outputCharacter: UILabel!
    @IBOutlet weak var inputBox: UITextField!
    @IBOutlet weak var outputView: UIView!
    @IBOutlet weak var SendButton: UIButton!
    @IBOutlet weak var prevCharacter: UILabel!
    @IBOutlet weak var nextCharacter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputBox.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // Notificationを設定
    func configureObserver() {
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(keyboardWillShow(_:)),
                                 name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide(_:)),
                                 name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // キーボードが表示時に画面をずらす。
    @objc func keyboardWillShow(_ notification: Notification?) {
        guard let rect = (notification?.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue,
            let duration = notification?.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
        UIView.animate(withDuration: duration) {
            let transform = CGAffineTransform(translationX: 0, y: -(rect.size.height))
            self.view.transform = transform
        }
    }
    
    
    //// キーボードが消えたときに、画面を戻す
    @objc func keyboardWillHide(_ notification: Notification?) {
        guard let duration = notification?.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? TimeInterval else { return }
        UIView.animate(withDuration: duration) {
            self.view.transform = CGAffineTransform.identity
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Returnキーを押したときにキーボードを下げる
        return true
    }
    
    //ルビ変換ボタン押下時、ルビを画面に表示するメソッド
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
