//
//  ViewController.swift
//  The Light project
//
//

import UIKit

class ViewController: UIViewController {
    
    var lights = 0
    
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
    
    //    MARK: Switch Light
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
}
