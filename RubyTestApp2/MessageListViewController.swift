//
//  MessageListViewController.swift
//  RubyTestApp2
//
//  Created by kazuya Ito on 2020/04/12.
//  Copyright © 2020 hoya. All rights reserved.
//

import UIKit

class MessageListViewController: UIViewController {
    
    var messageCellDataSource: MessageCellDataSource!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        messageCellDataSource = MessageCellDataSource()
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MessageListCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .add,
                                        target: self,
                                        action: #selector(barButtonTapped(_:)))
        
        navigationItem.rightBarButtonItem = barButton
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        //  画面表示するたびに、データロードを行う。
        messageCellDataSource.messageCellsDataLoad()
        
        //  データロード後、 tableView を更新
        tableView.reloadData()
        
    }
    
    
    @objc func barButtonTapped(_ sender: UIBarButtonItem) {
        //  task モニタ
        let controller = CreateMessageCellViewController()
        
        //let navi = UINavigationController(rootViewController: controller)
        //present(navi, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(controller, animated: true)
    
    }

}
