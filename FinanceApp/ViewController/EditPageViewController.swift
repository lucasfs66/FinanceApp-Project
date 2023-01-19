//
//  EditPageViewController.swift
//  FinanceApp
//
//  Created by Lucas Freire Sabino on 1/17/23.
//

import UIKit

class EditPageViewController: UIViewController {

    @IBOutlet weak var warningNote: UILabel!
    @IBOutlet weak var newBalance: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
        // Do any additional setup after loading the view.
    }
    
    func fetch(){
        warningNote.text = "Warning: Keep in mind That this page is going to change your balance, use carefully."
    }
    

    
    
    @IBAction func saveButton(_ sender: Any) {
        guard let newDouble = Double(newBalance.text ?? "")else { return }
        
        Balance.shared.createNewBalance(money: newDouble)
        self.navigationController?.popViewController(animated: true)
        
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
