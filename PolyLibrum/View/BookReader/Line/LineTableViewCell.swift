//
//  LineTableViewCell.swift
//  PolyLibrum
//
//  Created by Geunyoun Yi on 19/11/2020.
//

import UIKit

class LineTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var frameView: UIView!
    

    @IBOutlet weak var wordStackView: UIStackView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 30, left: 0, bottom: 30, right: 0))
//    }
    
    
    func addWords(_ wordArray: [WordModel]) {
        
        
        for word in wordArray {
            
            let wordView = WordLabel()
            wordView.wordLabel.text = word.word
            
            wordStackView.addArrangedSubview(wordView)
        }
    }
    
    
    func setFont(_ font: UIFont){
        
        for wordLabel in wordStackView.arrangedSubviews {
            (wordLabel as! WordLabel).wordLabel.font = font
        }
    }
    
    
}
