//
//  DictionaryData.swift
//  PolyLibrum
//
//  Created by Geunyoun Yi on 08/11/2020.
//

import Foundation


struct TranslationData: Decodable{
    
    let data: TData

    
}

struct TData: Decodable {
    let translations:[Translations]
}



struct Translations : Decodable{
    var translatedText: String
}
