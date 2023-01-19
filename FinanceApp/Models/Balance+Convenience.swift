//
//  Balance+Convenience.swift
//  FinanceApp
//
//  Created by Lucas Freire Sabino on 1/16/23.
//

import CoreData

extension BalanceMoney {
    @discardableResult convenience init(money: Double, context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.money = money
    }
}
