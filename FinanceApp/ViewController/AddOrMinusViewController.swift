//
//  AddOrMinusViewController.swift
//  FinanceApp
//
//  Created by Lucas Freire Sabino on 1/17/23.
//

import UIKit

class AddOrMinusViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButton(_ sender: Any) {
        guard let newDouble = Double(textField.text ?? "")else { return }
        
        Balance.shared.updateAddMoney(num: newDouble)
        self.navigationController?.popViewController(animated: true)
        textField.text = ""
    }
    @IBAction func minusButton(_ sender: Any) {
        guard let newDouble = Double(textField.text ?? "")else { return }
        
        Balance.shared.updateMinusMoney(num: newDouble)
        self.navigationController?.popViewController(animated: true)
        textField.text = ""
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
