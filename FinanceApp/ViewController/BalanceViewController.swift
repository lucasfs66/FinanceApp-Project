//
//  BalanceViewController.swift
//  FinanceApp
//
//  Created by Lucas Freire Sabino on 1/17/23.
//

import UIKit

class BalanceViewController: UIViewController {
    

    @IBOutlet weak var BalanceNumber: UILabel!
    @IBOutlet weak var quotesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Balance.shared.fetchMoney()
        fetch()
        viewWillAppear(true)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetch()
       

    }
    
    func fetch(){
        
        BalanceNumber.text = "\(Balance.shared.money)"
        EntryController.fetchAllCategoriesV2 { result in
            switch result {
            case .success(let quoteThatCameFromTheInternet):
                
                guard let quoteThatCameFromTheInternetTopLevelDictionary = quoteThatCameFromTheInternet.first else { return
                    
                }
                
                guard let randomEntry = quoteThatCameFromTheInternetTopLevelDictionary.entries.randomElement() else { return }

                DispatchQueue.main.async {
                    self.quotesLabel.text = "\(randomEntry.text)\n-\(randomEntry.author)"
                }
            case .failure(let myCustomError):
                print(myCustomError)
            }
                
            
        }
        
    }
    
    /*
     EntryController.fetchAllCategories { (categories) in
         for category in categories {
             print(category)
             DispatchQueue.main.async {
                 self.quotesLabel.text = " \(category)"
             }
         }
     }
     */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
