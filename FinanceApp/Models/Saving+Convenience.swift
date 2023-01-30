//
//  Balance+Convenience.swift
//  FinanceApp
//
//  Created by Lucas Freire Sabino on 1/16/23.
//

import CoreData

extension SavingMoney {
    @discardableResult convenience init(saving: Double, context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.saving = saving
    }
}
