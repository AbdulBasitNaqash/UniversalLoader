//
//  JSONFetcher.swift
//  MindValleyLoader
//
//  Created by Abdul Basit on 23/03/19.
//  Copyright © 2019 Abdul Basit. All rights reserved.
//

import Foundation

//Class for fetching the JSON data from the API...
class JSONFetcher{
    
    //Function for fetching the JSON data from the API...
    func fetchJSONData(urlString : String, onComplete: @escaping (Bool, [CardModel])->Void){
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else { return }
            //Implement JSON decoding and parsing
            do {
                //Decode retrived data with JSONDecoder and assing type of CardModel object
                let cardsData = try JSONDecoder().decode([CardModel].self, from: data)
                
                //Get back to the main queue
                DispatchQueue.main.async {
                    onComplete(true, cardsData)
                }
                
            } catch let jsonError {
                print(jsonError.localizedDescription)
            }
            
            
            }.resume()
        
    }
}
