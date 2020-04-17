//
//  CreateMessageListController.swift
//  RubyTestApp2
//
//  Created by kazuya ito on 2020/04/14.
//  Copyright © 2020 hoya. All rights reserved.
//

import UIKit

class CreateMessageCellViewController: UIViewController {
    
    private var createMessageCellView: CreateMessageCellView!
    private var messageCellDataSource: MessageCellDataSource!
    private var messageCellInputCharacterText: String?
    private var messageCellOutputRubyCharacterText: String?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        createMessageCellView = CreateMessageCellView()
        createMessageCellView.delegate = self
        
        view.addSubview(createMessageCellView)
        
        messageCellDataSource = MessageCellDataSource()
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        createMessageCellView.frame = CGRect(x: view.safeAreaInsets.left,
                                             y: view.safeAreaInsets.top,
                                             width: view.frame.size.width -
                                                view.safeAreaInsets.left -
                                                view.safeAreaInsets.right,
                                             height: view.frame.size.height -
                                                view.safeAreaInsets.bottom)
        
    }

    
    fileprivate func showSaveAlert() {
        
        let alert = UIAlertController(title: "保存しました",
                                      message: nil,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .cancel)
                                        { (action) in
        
                                        self.navigationController?.popViewController(animated: true)
                                        
                                        })
        
        present(alert, animated: true, completion: nil)
        
    }
    
    fileprivate func showMissingMessageCellTextAlert() {
        
        let alertController = UIAlertController(title: "タスクを入力してください",
                                                message: nil,
                                                preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: .cancel,
                                   handler: nil)
        
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
        
    }
    
}


extension CreateMessageCellViewController: CreateMessageCellViewDelegate {
    
    func createView(inputCharacterEditting view: CreateMessageCellView,
                    inputCharacter: String) {
        
        messageCellInputCharacterText = inputCharacter
        
    }
    
    func createView(outputRubyCharacterEditting view: CreateMessageCellView,
                    outputRubyCharacter: String) {
        
        messageCellOutputRubyCharacterText = outputRubyCharacter
        
    }
    
    func createView(saveButtonDidTap view: CreateMessageCellView) {
        
        guard let messageCellInputCharacterText = messageCellInputCharacterText else {
            
            showMissingMessageCellTextAlert()
            return
            
        }
        
        APIHttpRequest().requests(sentence: messageCellInputCharacterText, completion: { [weak self] (rubyCharacter: String) -> Void in
            
            let messageCell = MessageCell(inputCharacter: messageCellInputCharacterText,
                                          outputRubyCharacter: rubyCharacter)
            
            self?.messageCellDataSource.messageCellsDataSave(messageCell: messageCell)
            
            self?.showSaveAlert()

        })
        
    }
    
}
