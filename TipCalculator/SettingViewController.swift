//
//  SettingViewController.swift
//  TipCalculator
//
//  Created by Nguyen Chau Chieu on 5/24/17.
//  Copyright © 2017 Nguyen Chau Chieu. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var oneStarStepper: UIStepper!
    @IBOutlet var twoStarStepper: UIStepper!
    @IBOutlet var threeStarStepper: UIStepper!
    @IBOutlet var fourStarStepper: UIStepper!
    @IBOutlet var fiveStarStepper: UIStepper!
    
    @IBOutlet var oneStarTipPercentLabel: UILabel!
    @IBOutlet var twoStarTipPercentLabel: UILabel!
    @IBOutlet var threeStarTipPercentLabel: UILabel!
    @IBOutlet var fourStarTipPercentLabel: UILabel!
    @IBOutlet var fiveStarTipPercentLabel: UILabel!
    
    @IBOutlet var currencySegment: UISegmentedControl!
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oneStarStepper.minimumValue = 2
        oneStarStepper.maximumValue = 100
        
        twoStarStepper.minimumValue = 5
        twoStarStepper.maximumValue = 100
        
        threeStarStepper.minimumValue = 10
        threeStarStepper.maximumValue = 100
        
        fourStarStepper.minimumValue = 15
        fourStarStepper.maximumValue = 100
        
        fiveStarStepper.minimumValue = 20
        fiveStarStepper.maximumValue = 100
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        oneStarStepper.value = Double(userDefaults.integer(forKey: "tip_percent_for_one_star"))
        oneStarTipPercentLabel.text = "\(Int(oneStarStepper.value))"
        
        twoStarStepper.value = Double(userDefaults.integer(forKey: "tip_percent_for_two_star"))
        twoStarTipPercentLabel.text = "\(Int(twoStarStepper.value))"
        
        threeStarStepper.value = Double(userDefaults.integer(forKey: "tip_percent_for_three_star"))
        threeStarTipPercentLabel.text = "\(Int(threeStarStepper.value))"
        
        fourStarStepper.value = Double(userDefaults.integer(forKey: "tip_percent_for_four_star"))
        fourStarTipPercentLabel.text = "\(Int(fourStarStepper.value))"
        
        fiveStarStepper.value = Double(userDefaults.integer(forKey: "tip_percent_for_five_star"))
        fiveStarTipPercentLabel.text = "\(Int(fiveStarStepper.value))"
        
        currencySegment.selectedSegmentIndex = userDefaults.integer(forKey: "currency")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func oneStarStepperValueChanged(_ sender: Any) {
        oneStarTipPercentLabel.text = "\(Int(oneStarStepper.value))"
    }
    
    @IBAction func twoStarStepperValueChanged(_ sender: Any) {
        twoStarTipPercentLabel.text = "\(Int(twoStarStepper.value))"
    }
    
    @IBAction func threeStarStepperValueChanged(_ sender: Any) {
        threeStarTipPercentLabel.text = "\(Int(threeStarStepper.value))"
    }
    
    @IBAction func fourStarStepperValueChanged(_ sender: Any) {
        fourStarTipPercentLabel.text = "\(Int(fourStarStepper.value))"
    }
    
    @IBAction func fiveStarStepperValueChanged(_ sender: Any) {
        fiveStarTipPercentLabel.text = "\(Int(fiveStarStepper.value))"        
    }
    
    @IBAction func saveSetting(_ sender: Any) {
        userDefaults.set(Int(oneStarStepper.value), forKey: "tip_percent_for_one_star")
        userDefaults.set(Int(twoStarStepper.value), forKey: "tip_percent_for_two_star")
        userDefaults.set(Int(threeStarStepper.value), forKey: "tip_percent_for_three_star")
        userDefaults.set(Int(fourStarStepper.value), forKey: "tip_percent_for_four_star")
        userDefaults.set(Int(fiveStarStepper.value), forKey: "tip_percent_for_five_star")
        
        let currency = userDefaults.integer(forKey: "currency")
        switch currencySegment.selectedSegmentIndex {
        case 0:
            if currency == 1 {
                let bill = userDefaults.integer(forKey: "bill")
                userDefaults.set(bill * 22000, forKey: "bill")
            }
            userDefaults.set(currencySegment.selectedSegmentIndex, forKey: "currency")
        case 1:
            if currency == 0 {
                let bill = userDefaults.integer(forKey: "bill")
                userDefaults.set(bill / 22000, forKey: "bill")
            }
            userDefaults.set(currencySegment.selectedSegmentIndex, forKey: "currency")
        default: break
            
        }
        
        userDefaults.synchronize()
    }
    
    @IBAction func resetSetting(_ sender: Any) {
        oneStarStepper.value = 2
        oneStarTipPercentLabel.text = "\(Int(oneStarStepper.value))"
        twoStarStepper.value = 5
        twoStarTipPercentLabel.text = "\(Int(twoStarStepper.value))"
        threeStarStepper.value = 10
        threeStarTipPercentLabel.text = "\(Int(threeStarStepper.value))"
        fourStarStepper.value = 15
        fourStarTipPercentLabel.text = "\(Int(fourStarStepper.value))"
        fiveStarStepper.value = 20
        fiveStarTipPercentLabel.text = "\(Int(fiveStarStepper.value))"
        
        currencySegment.selectedSegmentIndex = 0
    }
}
