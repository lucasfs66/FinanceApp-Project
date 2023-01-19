//
//  BalanceController.swift
//  FinanceApp
//
//  Created by Lucas Freire Sabino on 1/16/23.
//

import CoreData

class Balance {

    static let shared = Balance()

    private init() {
        
       fetchMoney()
    }

    var money: Double = 0.0
    var moneyStory: [Double] = []
    
    private lazy var fetchRequest: NSFetchRequest<BalanceMoney> = {
        let request = NSFetchRequest<BalanceMoney>(entityName: "BalanceMoney")
        request.predicate = NSPredicate(value: true)
        return request
    }()

    func fetchMoney() {
        let result = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        guard !result.isEmpty else { return }
        money = result[result.count - 1].money
        moneyStory.append(money)
    }

    func createNewBalance(money: Double) {
        
        let balanceMoney = BalanceMoney(money: money)
        moneyStory.append(money)

        CoreDataStack.saveContext()
        fetchMoney()
    }

    func updateAddMoney(num: Double) {
        var numMoney = moneyStory[moneyStory.count - 1] + num
        let balanceMoney = BalanceMoney(money: numMoney)
        moneyStory.append(numMoney)
        CoreDataStack.saveContext()
        fetchMoney()
    }
    func updateMinusMoney(num: Double) {
        var numMoney = moneyStory[moneyStory.count - 1] - num
        let balanceMoney = BalanceMoney(money: numMoney)
        moneyStory.append(numMoney)
        CoreDataStack.saveContext()
        fetchMoney()
    }


//    func updateMediaItemReminderDate(_ num : Double) {
//
//        CoreDataStack.saveContext()
//    }

//    func deleteMediaItem(_ mediaItem: MediaItem) {
//        CoreDataStack.context.delete(mediaItem)
//        CoreDataStack.saveContext()
//        fetchMoney()
//    }
}
