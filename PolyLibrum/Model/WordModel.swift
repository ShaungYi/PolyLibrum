//
//  WordModel.swift
//  PolyLibrum
//
//  Created by Geunyoun Yi on 08/11/2020.
//

import Foundation


struct WordModel {
    
    let word: String
    let meanings: [String]
    
    
    static func toWordArray(sentence: String) -> [WordModel] {
        
        let stringArray = sentence.split(separator: " ")
        var wordArray = [WordModel]()
        
        
        for str in stringArray{
            let word = WordModel(word: String(str), meanings: ["flip", "flop"])
            wordArray.append(word)
        }
        
        
        return wordArray
        
        
    }
}
