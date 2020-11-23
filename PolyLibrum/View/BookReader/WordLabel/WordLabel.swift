//
//  WordLabel.swift
//  PolyLibrum
//
//  Created by Geunyoun Yi on 18/11/2020.
//

import UIKit

class WordLabel: UILabel {
    
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet var wordFrame: UIView!

    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        
        wordLabel.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
        wordLabel.addGestureRecognizer(gestureRecognizer)

    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
        
    func commonInit() {
        
        Bundle.main.loadNibNamed(K.wordLabelNibName, owner: self, options: nil)
        
        addSubview(wordFrame)
        wordFrame.frame = self.bounds
        wordFrame.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        

    }
    
    
    
    @objc func labelClicked(_ sender: Any) {
        print("UILabel clicked")
    }
    
    
    
    
    
    

}


