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
        
        EntryController.fetchAllCategories { (categories) in
            for category in categories {
                print(category)
                self.quotesLabel.text = " \(category)"
            }
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
