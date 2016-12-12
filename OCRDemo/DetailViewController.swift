//
//  DetailViewController.swift
//  OCRDemo
//
//  Created by Adrian Bolinger on 12/12/16.
//  Copyright © 2016 Adrian Bolinger. All rights reserved.
//

import UIKit
import TesseractOCR

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var labelString: String?
    var imageToScan: UIImage?
    

    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelString
        configureImageView()
        if let imageToScan = imageToScan {
            performOCR(on: imageToScan)
        }

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Configuration Methods
    func configureImageView() {
        imageView.image = imageToScan
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.layer.cornerRadius = 10.0
        imageView.contentMode = .scaleAspectFit
    }
    
    func performOCR(on image: UIImage) {
        let tesseract = G8Tesseract(language: "eng+fra")
        tesseract?.delegate = self
        tesseract?.engineMode = .tesseractCubeCombined
        tesseract?.pageSegmentationMode = .auto
        tesseract?.maximumRecognitionTime = 60.0
        tesseract?.image = imageToScan?.g8_grayScale()
        tesseract?.recognize()
        
        print("recognizedText = \(tesseract?.recognizedText)")
        
        textView.text = tesseract?.recognizedText
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

extension DetailViewController: G8TesseractDelegate {
    func shouldCancelImageRecognition(for tesseract: G8Tesseract!) -> Bool {
        return false
    }
}
