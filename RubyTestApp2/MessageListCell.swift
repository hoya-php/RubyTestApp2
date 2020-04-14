//
//  MessageListCell.swift
//  RubyTestApp2
//
//  Created by kazuya ito on 2020/04/12.
//  Copyright © 2020 hoya. All rights reserved.
//

import UIKit

class MessageListCell: UITableViewCell {
    
    //  massageCell の inputCharacter 表示用 Label
    private var inputCharacterLabel: UILabel!
    
    //  massageCell の outputRubyCharacter 表示用 Label
    private var outputRubyCharacterLabel: UILabel!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        inputCharacterLabel = UILabel()
        inputCharacterLabel.textColor = UIColor.black
        inputCharacterLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(inputCharacterLabel)
        
        outputRubyCharacterLabel = UILabel()
        outputRubyCharacterLabel.textColor = UIColor.black
        outputRubyCharacterLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(outputRubyCharacterLabel)
        
    }
    
    //  init(coder:) -ストーリーボードまたはnibファイルからビューをロードし、ビューにカスタム初期化が必要な場合は、このメソッドを実装します。
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        inputCharacterLabel.frame = CGRect(x: 15.0,
                                          y: 15.0,
                                          width: contentView.frame.width - ( 15.0 * 2 ),
                                          height: 15.0)
        
        outputRubyCharacterLabel.frame = CGRect(x: inputCharacterLabel.frame.origin.x,
                                                y: inputCharacterLabel.frame.maxY + 8.0,
                                                width: inputCharacterLabel.frame.width,
                                                height: 15.0)
        
    }
    
    var messageCell: MessageCell? {
        
        /*
         didset は messageCell のセットが行われる時、呼ばれる。
         messageCell ごとにラベルに文字をセットし、MessageListViewController で使う。
         */
        didSet {
            
            guard let m = messageCell else { return }
            
            inputCharacterLabel.text = m.inputCharacter
            outputRubyCharacterLabel.text = m.outputRubyCharacter
            
        }
        
    }
    
}
