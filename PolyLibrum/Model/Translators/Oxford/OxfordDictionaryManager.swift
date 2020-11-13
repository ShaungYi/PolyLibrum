//
//  OxfordDictionaryManager.swift
//  PolyLibrum
//
//  Created by Geunyoun Yi on 09/11/2020.
//

import Foundation




protocol OxfordDictionaryManagerDelegate {
    func displayWord(_ word: WordModel)
}


struct OxfordDictionaryManager {
    
    let wordURL = "https://api.openweathermap.org/data/2.5/weather?appid=e72ca729af228beabd5d20e3b7749713&units=metric"
    
    var delegate: OxfordDictionaryManagerDelegate?
    
    func fetchWordData(_ word: String) {
        print("performing request")
        performRequest()
    }
    
    
    
    
    var swiftOxfordAPI = SwiftOxfordAPI()


    
    
    func performRequest() {
       
        swiftOxfordAPI.entries(language: "es", word: "venir")
        
        
    }

    
//    func performRequest(with urlString: String) {
//        if let url = URL(string: urlString) {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { (data, response, error) in
//                if error != nil {
////                    self.delegate?.didFailWithError(error: error!)
//                    return
//                }
//                if let safeData = data {
//                    if let wordModel = parseJSON(safeData){
//                        delegate?.displayWord(wordModel)
//                    }
//
//                }
//            }
//            task.resume()
//        }
//    }
    
    
    
    
    func parseJSON(_ wordData: Data) -> WordModel?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(TranslationData.self, from: wordData)
            

            let wordModel = WordModel(word: "flower", meanings: ["flor"])
            
            print(decodedData.data.translations[0].translatedText)
    
            
            return wordModel
            
            
        } catch {
            print("no data")
//            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
