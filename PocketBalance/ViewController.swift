//
//  ViewController.swift
//  PocketBalance
//
//  Created by Daniel Apps on 12/10/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateTotalBalanceLabel()  // Update the total balance when the view loads
    }

    var expenses: [(amount: Double, description: String)] = []  // Use a tuple to store expenses
    
    
    
    @IBOutlet weak var totalBalanceLabel: UILabel!
    @IBOutlet weak var expenseEntryTextField: UITextField!
    @IBOutlet weak var descriptionEntryTextField: UITextField!
    @IBOutlet weak var expenseListLabel: UILabel!
    
    
    
    @IBAction func addExpenseButtonTaped(_ sender: UIButton) {
        addExpense()
    }
    
    
    @IBAction func deleteExpenseButtonTaped(_ sender: UIButton) {
        deleteExpense()
    }
    
    func updateTotalBalanceLabel() {
        let totalBalance = expenses.reduce(0) { $0 + $1.amount }
        totalBalanceLabel.text = "Total Balance: $\(totalBalance)"
    }
    
    // Function to update the expense list label
    func updateExpenseListLabel() {
        let expenseDescriptions = expenses.map { "$\($0.amount) - \($0.description)" }
        let joinedExpenses = expenseDescriptions.joined(separator: "\n")
        expenseListLabel.text = joinedExpenses
    }
    
    func addExpense() {
        // Ensure that the text fields are not empty
        guard let amountText = expenseEntryTextField.text, let description = descriptionEntryTextField.text else {
            return
        }

        // Convert the amount to a Double, and add the expense
        if let amount = Double(amountText) {
            expenses.append((amount, description))
            updateTotalBalanceLabel()
            updateExpenseListLabel()
        }

        // Clear the text fields
        expenseEntryTextField.text = ""
        descriptionEntryTextField.text = ""
    }
    
    func deleteExpense() {
        expenses.removeLast()  // Remove the last expense from the list
        updateTotalBalanceLabel()  // Update the total balance label
        updateExpenseListLabel()   // Update the expense list
        
    }
}

