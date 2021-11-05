//
//  ViewController.swift
//  The Light project
//
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    var lights = 0
    var isLightOn = false
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchlight(number: lights)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        switchlight(number: lights)
        
    }
    
    func switchlight(number: Int) {
        switch number {
        case 1:
            view.backgroundColor = .lightGray
        case 2:
            view.backgroundColor = .darkGray
        case 3:
            view.backgroundColor = .black
        default:
            view.backgroundColor = .white
            lights = 0
        }
        
        lights += 1
        
    }
   
    
    func setupRealLight() {
           let device = AVCaptureDevice.default(for: AVMediaType.video)
           
           if let dev = device, dev.hasTorch {
               view.backgroundColor = .black
               do {
                   try dev.lockForConfiguration()
                   dev.torchMode = isLightOn ? .on : .off
                   dev.unlockForConfiguration()
               } catch {
                   print(error)
               }
           } else {
               print("Device has no torch")
           }
       }
    
    @IBAction func buttonPressed(_ sender: Any) {
        isLightOn.toggle()
        setupRealLight()
        
    }
}



