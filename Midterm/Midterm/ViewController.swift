//
//  ViewController.swift
//  Midterm
//
//  Created by Elnara  on 3/7/20.
//  Copyright © 2020 Elnara . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func new(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "ColorPicker") as ColorPickerViewController? else {return}
        
        vc.action = {
            [weak self] color in guard self != nil else {return}
            sender.backgroundColor = vc.color
        }
        
        self.present(vc, animated: true)
        
    }

}

