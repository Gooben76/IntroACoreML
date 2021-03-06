//
//  CameraExtension.swift
//  IntroACoreML
//
//  Created by Benoît Goossens on 13/06/18.
//  Copyright © 2018 Benoît Goossens. All rights reserved.
//

import UIKit
import AVFoundation

extension ViewController: AVCapturePhotoCaptureDelegate {
    
    func miseEnPlaceCamera() {
        captureVideoPreviewLayer?.removeFromSuperlayer()
        captureSession = AVCaptureSession()
        if captureSession != nil {
            if let appareil = AVCaptureDevice.default(AVCaptureDevice.DeviceType.builtInWideAngleCamera, for: .video, position: position) {
                do {
                    let input = try AVCaptureDeviceInput(device: appareil)
                    if captureSession!.canAddInput(input) {
                        captureSession!.addInput(input)
                        capturePhotoOutput = AVCapturePhotoOutput()
                        if capturePhotoOutput != nil {
                            if captureSession!.canAddOutput(capturePhotoOutput!) {
                                captureSession!.addOutput(capturePhotoOutput!)
                                captureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
                                captureVideoPreviewLayer?.videoGravity = .resizeAspectFill
                                captureVideoPreviewLayer?.connection?.videoOrientation = .portrait
                                if captureVideoPreviewLayer != nil {
                                    captureVideoPreviewLayer!.frame = cameraVue.bounds
                                    cameraVue.layer.addSublayer(captureVideoPreviewLayer!)
                                    cameraVue.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(prendrePhoto)))
                                    captureSession!.startRunning()
                                }
                            }
                        }
                    }
                
                } catch {
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    @objc func prendrePhoto() {
        if capturePhotoOutput != nil {
            capturePhotoOutput!.capturePhoto(with: obtenirReglages(), delegate: self)
        }
    }
    
    func obtenirReglages() -> AVCapturePhotoSettings {
        let reglages = AVCapturePhotoSettings()
        reglages.previewPhotoFormat = reglages.embeddedThumbnailPhotoFormat
        return reglages
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if error == nil {
            if let data = photo.fileDataRepresentation() {
                photoChoisieImageView.image = UIImage(data: data)
            } else {
                print("Le résultat ne donne pas de Data")
            }
        } else {
            print(error!.localizedDescription)
        }
    }
}




