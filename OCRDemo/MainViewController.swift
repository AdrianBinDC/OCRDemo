//
//  MainViewController.swift
//  OCRDemo
//
//  Created by Adrian Bolinger on 12/12/16.
//  Copyright © 2016 Adrian Bolinger. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Button Actions
    
    @IBAction func buttonAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            print("button 0 pressed")
        case 1:
            print("button 1 pressed")
        case 2:
            print("button 2 pressed")
        case 3:
            print("button 3 pressed")
        default:
            return
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
