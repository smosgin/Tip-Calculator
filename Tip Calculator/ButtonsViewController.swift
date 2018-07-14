//
//  ButtonsViewController.swift
//  Tip Calculator
//
//  Created by Seth Mosgin on 7/2/18.
//  Copyright © 2018 Seth Mosgin. All rights reserved.
//

import UIKit

class ButtonsViewController: UIViewController {
    var userIsTyping : Bool = false
    
    var subtotal : Double = 0
    var fifteenTip : Double = 0
    var fifteenTotal : Double = 0
    var eighteenTip : Double = 0
    var eighteenTotal : Double = 0
    var twentyTip : Double = 0
    var twentyTotal : Double = 0
    
    @IBOutlet weak var fifteenTipLabel: UILabel!
    @IBOutlet weak var fifteenTotalLabel: UILabel!
    @IBOutlet weak var eighteenTipLabel: UILabel!
    @IBOutlet weak var eighteenTotalLabel: UILabel!
    @IBOutlet weak var twentyTipLabel: UILabel!
    @IBOutlet weak var twentyTotalLabel: UILabel!
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func digitPressed(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsTyping {
            let textCurrentlyInDisplay = display.text!
            //If . is already in the display, do nothing
            if digit == "." && textCurrentlyInDisplay.range(of: ".") != nil {
                return;
            }
            display.text = textCurrentlyInDisplay + digit
            print("\(digit) was touched")
            subtotal = Double(textCurrentlyInDisplay + digit)!
            calcTips()
            updateLabels()
        } else {
            display.text = digit
            userIsTyping = true
            subtotal = Double(digit)!
            calcTips()
            updateLabels()
        }
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        display.text = "0"
        userIsTyping = false
        subtotal = 0
        calcTips()
        updateLabels()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateLabels()
    }
    
    func calcTip(subtotal : Double, percentage : Double) -> Double {
        return subtotal * percentage
    }
    
    func calcTips() {
        fifteenTip = calcTip(subtotal: subtotal, percentage: 0.15)
        eighteenTip = calcTip(subtotal: subtotal, percentage: 0.18)
        twentyTip = calcTip(subtotal: subtotal, percentage: 0.20)
    }
    
    func updateLabels() {
        print("Updating labels")
        fifteenTipLabel.text = "$" + String(format: "%0.2f", fifteenTip)
        fifteenTotalLabel.text = String(format: "$%0.2f", fifteenTip + subtotal)
        eighteenTipLabel.text = String(format: "$%0.2f", eighteenTip)
        eighteenTotalLabel.text = String(format: "$%0.2f", eighteenTip + subtotal)
        twentyTipLabel.text = String(format: "$%0.2f", twentyTip)
        twentyTotalLabel.text = String(format: "$%0.2f", twentyTip + subtotal)
    }
    
    // MARK: - Navigation
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    /*

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
