//
//  DetailViewController.swift
//  OCRDemo
//
//  Created by Adrian Bolinger on 12/12/16.
//  Copyright © 2016 Adrian Bolinger. All rights reserved.
//

import UIKit
import SwiftOCR

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var labelString: String?
    var imageToScan: UIImage?
    
    let swiftOCRInstance = SwiftOCR()
    

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelString
        configureImageView()
        scanImage()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Configuration Methods
    func configureImageView() {
        imageToScan = imageToScan?.grayscale()
        imageView.image = imageToScan
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.cornerRadius = 10.0
        imageView.contentMode = .scaleAspectFit
    }
    
    // MARK: - OCR Methods
    func scanImage() {
        if let imageToScan = imageToScan {
//            swiftOCRInstance.characterWhiteList = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"
            swiftOCRInstance.recognize(imageToScan) { recognizedString in
                print("recognizedString = \(recognizedString)")
            }
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
