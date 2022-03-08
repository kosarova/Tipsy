//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var percentValueSelected : Double = 0.1
    var numberOfPeople = 2
    var billTotal = 0.0
    var resultForEveryFriend = ""
    
    @IBOutlet weak var billTextFiled: UITextField!
    @IBOutlet weak var zeroPrtButton: UIButton!
    @IBOutlet weak var tenPrtButton: UIButton!
    @IBOutlet weak var twentyPrtButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextFiled.endEditing(true)
        
        zeroPrtButton.isSelected = false
        tenPrtButton.isSelected = false
        twentyPrtButton.isSelected = false
       
        sender.isSelected = true
        
        let senderTitle = sender.currentTitle!
        
        percentValueSelected = Double(senderTitle.dropLast())! / 100
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        numberOfPeople = Int(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextFiled.text!
        
        if bill != "" {
            billTotal = Double(bill)!
            
            let result = billTotal * (1 + percentValueSelected) / Double(numberOfPeople)
            
            resultForEveryFriend = String(format: "%.2f", result)
            
            self.performSegue(withIdentifier: "goToResult", sender: self)
        }
        
        print(resultForEveryFriend)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.resultForEveryFriend = resultForEveryFriend
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.percentValueSelected = String(format: "%.0f", percentValueSelected * 100)
        }
    }
}

