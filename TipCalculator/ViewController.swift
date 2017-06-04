//
//  ViewController.swift
//  TipCalculator
//
//  Created by Nguyen Chau Chieu on 5/23/17.
//  Copyright © 2017 Nguyen Chau Chieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet var billTextField: UITextField!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipControl: UISegmentedControl!
    @IBOutlet var oneStar: UIImageView!
    @IBOutlet var twoStar: UIImageView!
    @IBOutlet var threeStar: UIImageView!
    @IBOutlet var fourStar: UIImageView!
    @IBOutlet var fiveStar: UIImageView!
    @IBOutlet var numberOfPeopleTextField: UITextField!
    @IBOutlet var perPersonLabel: UILabel!
    @IBOutlet var personLabel: UILabel!
    @IBOutlet var billCurrency: UILabel!
    @IBOutlet var tipCurrency: UILabel!
    @IBOutlet var totalCurrency: UILabel!
    @IBOutlet var perPersonCurrency: UILabel!

    
    let userDefaults = UserDefaults.standard
    var tipPercentage = 10
    var bill: Double = 0
    var tip: Double = 0
    var total: Double = 0
    var perPerson: Double = 0
    var numberOfPeople: Int = 1
    
    var serviceQuality = ServiceQuality.oneStar
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billTextField.becomeFirstResponder()
        
        if userDefaults.integer(forKey: "tip_percent_for_one_star") == 0 {
            userDefaults.set(2, forKey: "tip_percent_for_one_star")
            userDefaults.set(5, forKey: "tip_percent_for_two_star")
            userDefaults.set(10, forKey: "tip_percent_for_three_star")
            userDefaults.set(15, forKey: "tip_percent_for_four_star")
            userDefaults.set(20, forKey: "tip_percent_for_five_star")
        }
        
        let tapGestureRecognizerforOneStar = UITapGestureRecognizer(target: self, action: #selector(ViewController.oneStarTapped(tapGestureRecognizer:)))
        oneStar.isUserInteractionEnabled = true
        oneStar.addGestureRecognizer(tapGestureRecognizerforOneStar)
        
        let tapGestureRecognizerforTwoStar = UITapGestureRecognizer(target: self, action: #selector(ViewController.twoStarTapped(tapGestureRecognizer:)))
        twoStar.isUserInteractionEnabled = true
        twoStar.addGestureRecognizer(tapGestureRecognizerforTwoStar)
        
        let tapGestureRecognizerforThreeStar = UITapGestureRecognizer(target: self, action: #selector(ViewController.threeStarTapped(tapGestureRecognizer:)))
        threeStar.isUserInteractionEnabled = true
        threeStar.addGestureRecognizer(tapGestureRecognizerforThreeStar)
        
        let tapGestureRecognizerforFourStar = UITapGestureRecognizer(target: self, action: #selector(ViewController.fourStarTapped(tapGestureRecognizer:)))
        fourStar.isUserInteractionEnabled = true
        fourStar.addGestureRecognizer(tapGestureRecognizerforFourStar)
        
        let tapGestureRecognizerforFiveStar = UITapGestureRecognizer(target: self, action: #selector(ViewController.fiveStarTapped(tapGestureRecognizer:)))
        fiveStar.isUserInteractionEnabled = true
        fiveStar.addGestureRecognizer(tapGestureRecognizerforFiveStar)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bill = userDefaults.double(forKey: "bill")
        billTextField.text = String(bill)
        calculateTip()
        switch userDefaults.integer(forKey: "currency") {
        case 0:
            billCurrency.text = "VND"
            tipCurrency.text = "VND"
            totalCurrency.text = "VND"
            perPersonCurrency.text = "VND"
        case 1:
            billCurrency.text = "USD"
            tipCurrency.text = "USD"
            totalCurrency.text = "USD"
            perPersonCurrency.text = "USD"
        default:
            break
        }
    }
    
    func oneStarTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        tappedImage.image = UIImage(named: "star1600_filled.png")
        twoStar.image = UIImage(named: "star1600_black.png")
        threeStar.image = UIImage(named: "star1600_black.png")
        fourStar.image = UIImage(named: "star1600_black.png")
        fiveStar.image = UIImage(named: "star1600_black.png")
        tipPercentage = userDefaults.integer(forKey: "tip_percent_for_one_star")
        serviceQuality = .oneStar
        calculateTip()
    }
    
    func twoStarTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        oneStar.image = UIImage(named: "star1600_filled.png")
        tappedImage.image = UIImage(named: "star1600_filled.png")
        threeStar.image = UIImage(named: "star1600_black.png")
        fourStar.image = UIImage(named: "star1600_black.png")
        fiveStar.image = UIImage(named: "star1600_black.png")
        tipPercentage = userDefaults.integer(forKey: "tip_percent_for_two_star")
        serviceQuality = .twoStar
        calculateTip()
    }
    
    func threeStarTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        oneStar.image = UIImage(named: "star1600_filled.png")
        twoStar.image = UIImage(named: "star1600_filled.png")
        tappedImage.image = UIImage(named: "star1600_filled.png")
        fourStar.image = UIImage(named: "star1600_black.png")
        fiveStar.image = UIImage(named: "star1600_black.png")
        tipPercentage = userDefaults.integer(forKey: "tip_percent_for_three_star")
        serviceQuality = .threeStar
        calculateTip()
    }
    
    func fourStarTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        oneStar.image = UIImage(named: "star1600_filled.png")
        twoStar.image = UIImage(named: "star1600_filled.png")
        threeStar.image = UIImage(named: "star1600_filled.png")
        tappedImage.image = UIImage(named: "star1600_filled.png")
        fiveStar.image = UIImage(named: "star1600_black.png")
        tipPercentage = userDefaults.integer(forKey: "tip_percent_for_four_star")
        serviceQuality = .fourStar
        calculateTip()
    }
    
    func fiveStarTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        oneStar.image = UIImage(named: "star1600_filled.png")
        twoStar.image = UIImage(named: "star1600_filled.png")
        threeStar.image = UIImage(named: "star1600_filled.png")
        fourStar.image = UIImage(named: "star1600_filled.png")
        tappedImage.image = UIImage(named: "star1600_filled.png")
        tipPercentage = userDefaults.integer(forKey: "tip_percent_for_five_star")
        serviceQuality = .fiveStar
        calculateTip()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleBillChanged(_ sender: Any) {
        calculateTip()
    }
    @IBAction func handleNumberOfPeopleChanged(_ sender: Any) {
        calculateTip()
        if numberOfPeople == 1 {
            personLabel.text = "person"
        } else {
            personLabel.text = "people"
        }
    }
    
    func calculateTip() -> Void {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 3
        
        switch serviceQuality {
        case .oneStar:
            tipPercentage = userDefaults.integer(forKey: "tip_percent_for_one_star")
        case .twoStar:
            tipPercentage = userDefaults.integer(forKey: "tip_percent_for_two_star")
        case .threeStar:
            tipPercentage = userDefaults.integer(forKey: "tip_percent_for_three_star")
        case .fourStar:
            tipPercentage = userDefaults.integer(forKey: "tip_percent_for_four_star")
        case .fiveStar:
            tipPercentage = userDefaults.integer(forKey: "tip_percent_for_five_star")
        }
        
        bill = Double(billTextField.text!) ?? 0
        userDefaults.set(bill, forKey: "bill")
        
        tip = bill * Double(tipPercentage) / 100
        numberOfPeople = Int(numberOfPeopleTextField.text!) ?? 1
        total = bill + tip
        perPerson = total / Double(numberOfPeople)
        
        tipLabel.text = formatter.string(from: tip as NSNumber)
        totalLabel.text = formatter.string(from: total as NSNumber)
        perPersonLabel.text = formatter.string(from: perPerson as NSNumber)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

}

