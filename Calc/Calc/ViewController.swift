//
//  ViewController.swift
//  Calc
//
//  Created by Elnara  on 1/18/20.
//  Copyright © 2020 Elnara . All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    let plus = 10
    let equal = 11
    
    @IBOutlet var lbltext : UILabel!
    var num1 : NSInteger = 0
    var num2 : NSInteger = 0
    var operand : NSInteger = 0
    var answer : Double = 0.0
    
    var number : String = ""
    
    @IBAction func calculate (sender : UIButton){
        num2 = Int(number)!
        if operand == plus{
            answer = Double(num1 + num2)
            number = String(answer)
            printNumber()
        }
        else if operand == equal{
            number = String(answer)
            printNumber()
        }
    }
    
    @IBAction func setOperand(sender : UIButton){
        operand = sender.tag
        saveNum1()
    }
    func saveNum1(){
        num1 = Int(number)!
        number = ""
        printNumber()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        printNumber()
    }
    
    func printNumber(){
        lbltext.text = number
    }
    
    @IBAction func pressNumber(sender : UIButton){
        number += String(sender.tag)
        printNumber()
    }
}

