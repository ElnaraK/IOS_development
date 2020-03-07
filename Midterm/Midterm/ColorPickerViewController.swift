//
//  ColorPicker.swift
//  Midterm
//
//  Created by Elnara  on 3/7/20.
//  Copyright © 2020 Elnara . All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController {
    var color: UIColor?
    var selectedButton: UIView?
    
    var action: ((_ color: UIColor) -> Void)? = nil
    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func colorButton(_ sender: UIButton) {
        
        buttons.forEach {(button) in
            if button == sender {
                button.isSelected = true
            } else {
                button.isSelected = false
            }
        }

        guard let bgColor = sender.backgroundColor else {return}
        self.action?(bgColor)
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
