//
//  MesseageCellDataSource.swift
//  RubyTestApp2
//
//  Created by kazuya ito on 2020/04/07.
//  Copyright © 2020 hoya. All rights reserved.
//

import Foundation
import UIKit

class MessageCellDataSource {
    
    //UITableView 用のデータ
    private var  messageCells = [MessageCell]()
    
    
    //UserDefaults から保存した一覧を取得
    func messageCellsDataLoad() {
        
        let userDefaults = UserDefaults.standard
        let messageCellDictionaries = userDefaults.object(forKey: "messageCells") as? [[String: Any]]
        
        guard let t = messageCellDictionaries else { return }
        
        for dic in t {
            
            let messageCell = MessageCell(from: dic)
            messageCells.append(messageCell)
            
        }
        
    }
    
    
    //cells を UserDefault に保存している。
    func messageCellsDataSave(messageCell: MessageCell) {
        
        messageCells.append(messageCell)
        
        var messageCellDictionaries = [[String: Any]]()
        for m in messageCells {
            
            var messageCellDictionary: [String: Any] = ["inputCharacter": m.inputCharacter,
                                                        "outputRubyCharacter": m.outputRubyCharacter]
            
            messageCellDictionaries.append(messageCellDictionary)
        
        }
        
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(messageCellDictionaries, forKey: "MessageCells")
        
        userDefaults.synchoronize()
        
    }
    
    
    //総数を返す
    func cellsCount() -> Int {
        return messageCells.count
    }
    
    
    //割り当てられた index ごとに Cell を返す
    func messageCellData(at index: Int) -> Messagecell? {
        
        if messageCells.count > index {
            
            return massageCells[index]
            
        }
        
        return nil
        
    }
    
    
}
