//
//  MessageListViewController+extensionDatasorceAndDelegate.swift
//  RubyTestApp2
//
//  Created by kazuya Ito on 2020/04/12.
//  Copyright © 2020 hoya. All rights reserved.
//

import UIKit

extension MessageListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messageCellDataSource.cellsCount()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 68
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MessageListCell
        
        //  indexPath.row に応じた MessageCell を返す。
        let messageCell = messageCellDataSource.messageCellData(at: indexPath.row)
        
        //  messageCell を cell に受け渡す。
        cell.messageCell = messageCell
        return cell
        
    }
    
    
    
}
