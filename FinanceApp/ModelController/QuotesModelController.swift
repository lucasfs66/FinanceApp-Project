

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
    //Result -> It worked, or , it did not work : (
    static func fetchAllCategoriesV2(completion: @escaping (Result<Entry, QuoteError>) -> Void){
        //1 - URL
        guard let baseURL = baseURL else {
            return completion(.failure(QuoteError.badBaseURL))
        }
        
        let categoriesURL = baseURL
        print(categoriesURL)
        //2 - Data Task
        URLSession.shared.dataTask(with: categoriesURL) { (data, _, error) in
            //3 - Error Handling
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(QuoteError.badBaseURL))
            }
            
            //4 - Check for data
            guard let data = data else {
                return completion(.failure(QuoteError.invalidData(error?.localizedDescription ?? "Data is Invalid")))
            }
            //5 - Decode Data
            do {
                let quotesFromTheInternet = try JSONDecoder().decode([Entry].self, from: data)
                //If we made it this far, we are in a good spot we can pull down data
                return completion(.success(quotesFromTheInternet.randomElement()!))
            } catch{
                print(error, error.localizedDescription)
                return completion(.failure(QuoteError.invalidData(error.localizedDescription)))
            }
        }.resume()
        
    }
    
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

/*
 static func fetchAllCategoriesV2(completion: @escaping (Result<TopLevelObeject, QuoteError>) -> Void){
     //1 - URL
     guard let baseURL = baseURL else {
         return completion(.failure(QuoteError.badBaseURL))
     }
     
     let categoriesURL = baseURL
     print(categoriesURL)
     //2 - Data Task
     URLSession.shared.dataTask(with: categoriesURL) { (data, _, error) in
         //3 - Error Handling
         if let error = error {
             print(error, error.localizedDescription)
             return completion(.failure(QuoteError.badBaseURL))
         }
         
         //4 - Check for data
         guard let data = data else {
             return completion(.failure(QuoteError.invalidData(error?.localizedDescription ?? "Data is Invalid")))
         }
         //5 - Decode Data
         do {
             let quotesFromTheInternet = try JSONDecoder().decode([TopLevelObeject].self, from: data)
             //If we made it this far, we are in a good spot we can pull down data
             return completion(.success(quotesFromTheInternet.randomElement() ?? TopLevelObeject(entries: [Entry(text: "Example", author: "author")])))
         } catch{
             print(error, error.localizedDescription)
             return completion(.failure(QuoteError.invalidData(error.localizedDescription)))
         }
     }.resume()
     
 }
 */
