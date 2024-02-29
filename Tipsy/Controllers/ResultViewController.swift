//
//  ResultViewController.swift
//  Tipsy
//
//  Created by IT-HW05011-00224 on 11/1/2567 BE.
//  Copyright © 2567 BE The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var resultValue: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = String(format: "%.2f", resultValue ?? 0)
    }
    
    @IBAction func onRecalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
