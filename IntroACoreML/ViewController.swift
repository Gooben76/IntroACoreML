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
    
    var captureSession: AVCaptureSession?
    var capturePhotoOutput: AVCapturePhotoOutput?
    var captureVideoPreviewLayer: AVCaptureVideoPreviewLayer?
    var position =  AVCaptureDevice.Position.back
    
    override func viewDidLoad() {
        super.viewDidLoad()
        miseEnPlaceCamera()
    }

}

