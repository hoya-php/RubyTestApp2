//
//  CreateMessageListView.swift
//  RubyTestApp2
//
//  Created by kazuya ito on 2020/04/14.
//  Copyright © 2020 hoya. All rights reserved.
//


import UIKit

protocol CreateMessageCellViewDelegate : class {
    
    func createView(inputCharacterEditting view: CreateMessageCellView, inputCharacter: String)
    func createView(outputRubyCharacterEditting view: CreateMessageCellView, outputRubyCharacter: String)
    func createView(saveButtonDidTap view: CreateMessageCellView)
    
}


class CreateMessageCellView: UIView {
    
    private var messageCellInputCharacterTextField: UITextField!
    private var messageCellOutputRubyCharacterTextField: UITextField!
    private var saveButton: UIButton!
    
    weak var delegate: CreateMessageCellViewDelegate?
    
    required override init(frame: CGRect) {
        
        super.init(frame: frame)
    
        
        messageCellInputCharacterTextField = UITextField()
        messageCellInputCharacterTextField.delegate = self
        messageCellInputCharacterTextField.tag = 0
        messageCellInputCharacterTextField.placeholder = "予定を入れてください"
        addSubview(messageCellInputCharacterTextField)
    
        
        messageCellOutputRubyCharacterTextField = UITextField()
        messageCellOutputRubyCharacterTextField.tag = 1
        messageCellOutputRubyCharacterTextField.placeholder = "出力が表示されます"
        addSubview(messageCellOutputRubyCharacterTextField)
    
        
        saveButton = UIButton()
        saveButton.setTitle("保存する", for: .normal)
        saveButton.setTitleColor(UIColor.black, for: .normal)
        saveButton.layer.borderWidth = 0.5
        saveButton.layer.cornerRadius = 4.0
        saveButton.addTarget(self,
                             action: #selector(saveButtonTapped(_:)),
                             for: .touchUpInside)
        addSubview(saveButton)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    @objc func saveButtonTapped(_ sender: UIButton) {
        
        delegate?.createView(saveButtonDidTap: self)
        
    }
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        messageCellInputCharacterTextField.frame = CGRect(x: bounds.origin.x + 30,
                                                    y: bounds.origin.y + 30,
                                                    width: bounds.size.width - 60,
                                                    height: 50)
        
        messageCellOutputRubyCharacterTextField.frame = CGRect(x: messageCellInputCharacterTextField.frame.origin.x,
                                                               y: messageCellInputCharacterTextField.frame.maxY + 30,
                                                               width: messageCellInputCharacterTextField.frame.size.width,
                                                               height: messageCellInputCharacterTextField.frame.size.height)
        
        let saveButtonSize = CGSize(width: 100, height: 50)
        
        saveButton.frame = CGRect(x: (bounds.size.width - saveButtonSize.width) / 2,
                                  y: messageCellOutputRubyCharacterTextField.frame.maxY + 30,
                                  width: saveButtonSize.width,
                                  height: saveButtonSize.height)

    }
    
}

extension CreateMessageCellView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if messageCellInputCharacterTextField.tag == 0 {
            // 入力してある側の文字をクリエイトビューに渡す
            delegate?.createView(inputCharacterEditting: self,
                                 inputCharacter: messageCellInputCharacterTextField.text!)
            
            
            
        }
        
        return true
        
    }
    
}
