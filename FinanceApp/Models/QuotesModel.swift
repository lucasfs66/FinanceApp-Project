//
//  QuotesModel.swift
//  FinanceApp
//
//  Created by Lucas Freire Sabino on 1/18/23.
//

import Foundation

//struct TopLevelObeject: Decodable{
//    let entries: [Entry]
//}


struct Entry: Decodable{
    let text: String
    let author: String?
}
