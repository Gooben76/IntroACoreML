//
//  ViewController.swift
//  IntroACoreML
//
//  Created by Benoît Goossens on 12/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var cameraVue: UIView!
    @IBOutlet weak var photoChoisieImageView: UIImageView!
    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var rotationButton: UIButton!
    @IBOutlet weak var libraryButton: UIButton!
    
    var captureSession: AVCaptureSession?
    var capturePhotoOutput: AVCapturePhotoOutput?
    var captureVideoPreviewLayer: AVCaptureVideoPreviewLayer?
    var position =  AVCaptureDevice.Position.back
    var imagePicker: UIImagePickerController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rotationButton.layer.cornerRadius = 5
        libraryButton.layer.cornerRadius = 5
        miseEnPlaceCamera()
        imagePicker.delegate = self
    }

    @IBAction func rotationAction(_ sender: Any) {
        switch position {
            case .front: position = .back
            case .back: position = .front
            case .unspecified: position = .back
        }
        miseEnPlaceCamera()
    }
    
    @IBAction func libraryAction(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
}

