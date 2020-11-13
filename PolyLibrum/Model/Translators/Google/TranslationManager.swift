//
//  DictionaryManager.swift
//  PolyLibrum
//
//  Created by Geunyoun Yi on 08/11/2020.
//

import Foundation


protocol TranslationManagerDelegate {
    func displayWord(_ word: WordModel)
}


struct TranslatonManager {
    
    let wordURL = "https://api.openweathermap.org/data/2.5/weather?appid=e72ca729af228beabd5d20e3b7749713&units=metric"
    
    var delegate: TranslationManagerDelegate?
    
    func fetchWordData(_ word: String) {
        print("performing request")
        performRequest()
    }
    
    
    let headers = [
        "x-rapidapi-host": "google-translate1.p.rapidapi.com",
        "x-rapidapi-key": "a096c8e5f5msh97ecf48a1d23a8dp1427f5jsn2f2f9a9f6c51",
        "accept-encoding": "application/gzip",
        "content-type": "application/x-www-form-urlencoded"
    ]

    let postData = NSMutableData(data: "source=en".data(using: String.Encoding.utf8)!)
    

    let request = NSMutableURLRequest(url: NSURL(string: "https://google-translate1.p.rapidapi.com/language/translate/v2")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)


    
    
    func performRequest() {
        
        
        
        postData.append("&q=Hi My Name Is Tony And I live in new york. meet my new dog".data(using: String.Encoding.utf8)!)
        postData.append("&target=es".data(using: String.Encoding.utf8)!)
        
        
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        

        
//        let body: Data = request.httpBody!
//        print(String(data: body, encoding: .utf8))

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if (error != nil) {
                print(error)
            } else {
                
                if let safeData = data {
//                    let dataString = String(data: safeData, encoding: .utf8)
//                    print(dataString)
                    
                    parseJSON(safeData)
                    
                }
            }
        })

        dataTask.resume()
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
