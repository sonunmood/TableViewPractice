//
//  NetworkManager.swift
//  TableViewPractice
//
//  Created by Sonun on 23/9/23.
//

import Foundation
import UIKit

class NetworkManager  {
    
    let url = "https://rickandmortyapi.com/api/character"
    
    func getdata(comletion: @escaping ([Result]) ->()) {
        guard let url = URL(string: url) else {return}
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let error {
                print(error)
            }
            
            guard let data = data else {return}
            
            do {
                let parseData = try JSONDecoder().decode(Characters.self, from: data)
                comletion(parseData.results)
            }
            
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
