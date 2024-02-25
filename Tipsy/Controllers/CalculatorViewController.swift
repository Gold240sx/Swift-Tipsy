//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Michael Martell on 2/23/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButtton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    var isSelected = 0
    var split: Double = 1
    var billTotal: Double = 0.0
    var splitAmount: Double = 0.0
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // close the numeral keyboard on click
        billTextField.endEditing(true)
        
        // set isSelectedButton to the assigned value
        if sender.titleLabel?.text == "0%" {
            isSelected = 0
            zeroPctButton.isSelected = true
        } else if sender.titleLabel?.text == "10%" {
            isSelected = Int(0.1)
            tenPctButtton.isSelected = true
        } else if sender.titleLabel?.text == "20%" {
            isSelected = Int(0.2)
            twentyPctButton.isSelected = true
        } else {
            print("There was an error with tip selection")
        }
        print(isSelected)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
       
        if sender.stepValue > split {
            //set a maximum of 12 people to split the bill
            if sender.stepValue == 12 {return}
            split = split + 1
        } else {
            if sender.stepValue == 0 {return}
            split = split - 1
        }
        splitNumberLabel.text = String(split)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        // updates when the calculate button is pressed.
        if let billText = billTextField.text, let billAmount = Int(billText) {
            // assume the user has endered a valid number
            
            if isSelected == 0 {
                billTotal = Double(billAmount) * (Double(1) + Double(isSelected))
            } else { billTotal = Double(billAmount) }
            
            splitAmount = billTotal / split
            
            print("bill amount: \(billAmount)")
            print("split amount: \(splitAmount)")
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as!
            ResultsViewController
            
            destinationVC.BillAmount = billTotal
            destinationVC.SplitAmount = splitAmount
            destinationVC.Split = split
            destinationVC.Tip = Double(isSelected)
            
        }
    }
}
