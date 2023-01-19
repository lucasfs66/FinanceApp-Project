//
//  QuotesModelController.swift
//  FinanceApp
//
//  Created by Lucas Freire Sabino on 1/18/23.
//

import Foundation

class EntryController{
    static let baseURL = URL(string: "https://type.fit/api/quotes")
    
    /// This function fetch all the category
    static func fetchAllCategories(completion: @escaping ([[String: String?]]) -> Void){
        //1 - URL
        guard let baseURL = baseURL else { return completion([[:]]) }
        let categoriesURL = baseURL
        print(categoriesURL)
        //2 - Data Task
        URLSession.shared.dataTask(with: categoriesURL) { (data, _, error) in
            //3 - Error Handling
            if let error = error {
                print(error, error.localizedDescription)
                return completion([[:]])
            }
            
            //4 - Check for data
            guard let data = data else { return completion([[:]]) }
            //5 - Decode Data
            do {
                let categories = try JSONDecoder().decode([[String : String?]].self, from: data)
                return completion(categories)
            } catch{
                print(error, error.localizedDescription)
                return completion([[:]])
            }
            
        }.resume()

    }
}

