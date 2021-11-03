//
//  ViewController.swift
//  The Light project
//
//
import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    var lights = 0
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchlight(number: lights)
        updateView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        switchlight(number: lights)
        updateView()
        
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
   
// фонарик работает (включается на физическом устройстве), но не выключается. Не понимаю почему.
    
    func updateView() {
           let device = AVCaptureDevice.default(for: AVMediaType.video)
           
           if let dev = device, dev.hasTorch {
               view.backgroundColor = .black
               do {
                   try dev.lockForConfiguration()
                   dev.torchMode = (lights != 0) ? .on : .off
                   dev.unlockForConfiguration()
               } catch {
                   print(error)
               }
           } else {
               
               switchlight(number: lights)
           }
       }
    
    
}



