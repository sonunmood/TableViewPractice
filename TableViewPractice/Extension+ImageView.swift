//
//  Extension+ImageView.swift
//  TableViewPractice
//
//  Created by Sonun on 1/10/23.
//

import Foundation
import UIKit

extension UIImageView {
    func getImage(from path:String) {
        let url = URL(string: path)
        
        let urlRequest = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: urlRequest) { data, _, _ in
            guard let data = data else {return}
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }.resume()
    }
}
