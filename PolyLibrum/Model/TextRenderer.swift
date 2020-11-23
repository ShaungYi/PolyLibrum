//
//  TextRenderer.swift
//  PolyLibrum
//
//  Created by Geunyoun Yi on 10/11/2020.
//

import UIKit


protocol TextRendererDelegate {
    
    func addLine() -> UIStackView
    func addWord(line: UIStackView, word: WordModel) -> UIView
    func wordFits(word: UIView) -> Bool
    
}


class TextRenderer{
    
    var lineLength: CGFloat
    var remainingSpace: CGFloat
    var delegate: TextRendererDelegate?
    
    init(lineLength ll: CGFloat, remainingSpace rs: CGFloat) {
        
        self.lineLength = ll
        self.remainingSpace = rs
        
    }
    
    
    func addWords(words: [WordModel]){
        
        var currentLine = delegate?.addLine()
        var currentWordPos = 0
        
        while currentWordPos < words.endIndex {
            var wordFits = true
            
            while wordFits && currentWordPos < words.endIndex  {
                let currentWord = words[currentWordPos]
                let wordFrame = delegate?.addWord(line: currentLine!, word: currentWord)
                currentWordPos += 1
                
                
                wordFits = ((delegate?.wordFits(word: wordFrame!)) != nil)
            }
            
            currentLine = delegate?.addLine()
        }
        
        
        
        
    }
    
    
    
    
    
}
