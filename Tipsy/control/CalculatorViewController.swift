//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var tispyBrain = TipsyBrain()
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var priceValueTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipPercentPressed(_ sender: UIButton)
    {
        priceValueTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        tispyBrain.setTipPercent(sender.currentTitle!)
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        stepperLabel.text = String(format: "%.0f", sender.value)
        tispyBrain.setPepoleNumber(Float(sender.value))
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        tispyBrain.setPriceText((priceValueTextField.text ))
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destionationVC = segue.destination as! ResultViewController
            destionationVC.explanation = tispyBrain.getExplanationText()
            destionationVC.result = tispyBrain.getResult()
        }
    }
}

