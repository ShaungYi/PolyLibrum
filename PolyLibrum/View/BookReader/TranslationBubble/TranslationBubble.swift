//
//  TranslationBubble.swift
//  PolyLibrum
//
//  Created by Geunyoun Yi on 23/11/2020.
//

import UIKit

class TranslationBubble: UIImageView {
    
    
    @IBOutlet var frameView: UIView!
    
    
    @IBOutlet weak var translationLabel: UILabel!
    
    

    override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
    }
        
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
    }
        
    func commonInit() {
        
        Bundle.main.loadNibNamed(K.TranslationBubbleNibName, owner: self, options: nil)
        
        addSubview(frameView)
        frameView.frame = self.bounds
        frameView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    }
    


}
