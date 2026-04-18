//
//  ViewController.swift
//  lab2_2
//
//  Created by Nemo on 16/04/2026.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func empBtn(_ sender: Any) {
        let text = textView.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        if let salary = Double(text){
            let emp = Employee(salary: salary)
            let result = emp.getSalary()
            salaryLabel.text = "\(result) $"
        }
        else{
            salaryLabel.text = "invailed number"
        }
    }
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var textView: UITextField!
    @IBAction func managerBtn(_ sender: Any) {
        let text = textView.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        if let salary = Double(text){
            let manager = Manager(salary: salary)
            let result = manager.getSalary()
            salaryLabel.text = "\(result) $"
        }
        else{
            salaryLabel.text = "invailed number"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

