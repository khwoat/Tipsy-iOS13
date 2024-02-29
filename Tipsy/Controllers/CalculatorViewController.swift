//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPct: Float? = 0.1
    var splitNum: Int = 2
    var result: Float = 0.0

    @IBAction func onTipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        switch (sender.titleLabel) {
        case zeroPctButton.titleLabel:
            tipPct = 0.0
        case tenPctButton.titleLabel:
            tipPct = 0.1
        case twentyPctButton.titleLabel:
            tipPct = 0.2
        default:
            tipPct = nil
        }
        
    }
    
    @IBAction func onStepChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        
        splitNum = Int(sender.value)
        splitNumberLabel.text = String(splitNum)
    }
    
    
    @IBAction func onCalculatePressed(_ sender: UIButton) {
        result = Float(billTextField.text ?? "0")! * (1 + tipPct!) / Float(splitNum)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destination = segue.destination as! ResultViewController
            destination.resultValue = result
        }
    }
}

