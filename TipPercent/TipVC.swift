//
//  TipVC.swift
//  TipPercent
//
//  Created by Joshua Madrigal on 1/16/20.
//  Copyright © 2020 Joshua Madrigal. All rights reserved.
//

import UIKit

class TipVC: UIViewController {
    
    // control segment
    @IBOutlet private weak var tipControl: UISegmentedControl!
    
    //TxtField
    @IBOutlet private weak var billTextField: UITextField!
    
    // labels
    @IBOutlet private weak var percentLabel: UILabel!
    @IBOutlet private weak var totalLabel: UILabel!
    
    private var percentageArray = [0.15, 0.20, 0.30]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }

    func updateUI() {
        bottomLayer(textField: billTextField)
        bottomLayer(label: percentLabel)
        bottomLayer(label: totalLabel)
        if billTextField.text!.isEmpty {
            percentLabel.text = "--"
            totalLabel.text = "--"
        }
    }
    
    func bottomLayer(textField: UITextField) {
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0.0, y: 60.0, width: 325, height: 1.0)
        bottomLayer.backgroundColor = UIColor.black.cgColor
        textField.layer.addSublayer(bottomLayer)
    }

    func bottomLayer(label: UILabel) {
        let bottomLayer = CALayer()
        bottomLayer.frame = CGRect(x: 0.0, y: 35.0, width: 325, height: 1.0)
        bottomLayer.backgroundColor = UIColor.black.cgColor
        label.layer.addSublayer(bottomLayer)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billTextField.text!) ?? 0
        
        let tip = bill * percentageArray[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        percentLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
} // end TipVC
