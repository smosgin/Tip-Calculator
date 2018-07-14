//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Seth Mosgin on 6/28/18.
//  Copyright © 2018 Seth Mosgin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    @IBOutlet weak var subtotalTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateLabels()
    }
    
    //I recommend -viewDidAppear:, since this generates animations. Generating animations in -viewWillAppear can lead to graphic artifacts, since you're not on the screen yet. Since you almost certainly want it every time you come on screen, -viewDidLoad is likely redundant (it happens every time the view is loaded from disk, which is somewhat unpredictable, so isn't a good place for visual effects).
    override func viewDidAppear(_ animated: Bool) {
        //Want the textField to be the first responder when the view appears so the user can start typing right away
        subtotalTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Dismiss the keyboard whenever the user taps elsewhere on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

    @IBAction func valueChanged(_ sender: Any) {
        print("The Value has changed")
        if Double(subtotalTextField.text!) != nil {
            print("We got the value")
            subtotal = Double(subtotalTextField.text!)!
        } else {
            //Something screwy happened
            print("WTF??")
        }
        fifteenTip = calcTip(subtotal: subtotal, percentage: 0.15)
//        fifteenTotal = fifteenTip + subtotal
        eighteenTip = calcTip(subtotal: subtotal, percentage: 0.18)
//        eighteenTotal = eighteenTip + subtotal
        twentyTip = calcTip(subtotal: subtotal, percentage: 0.20)
//        twentyTotal = twentyTip + subtotal
        updateLabels()
    }
    
    func calcTip(subtotal : Double, percentage : Double) -> Double {
        return subtotal * percentage
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
}

