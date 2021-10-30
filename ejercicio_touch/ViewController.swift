//
//  ViewController.swift
//  ejercicio_touch
//
//  Created by fran on 30/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var tocaImagen = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.imageView.isMultipleTouchEnabled = true

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {  // Sólo nos centramos en el primer toque
            print("Touches began")

            let touchCount = event!.allTouches!.count // Número de dedos pulsando
            let tapCount = touch.tapCount  // Núero de pulsaciones rápidas

            print("Finger count= \(touchCount)")
            print("Tap count= \(tapCount)")

            let loc = touch.location(in: self.view)
            if self.imageView.frame.contains(loc) {
                print("Detectado toque sobre la imagen")
                self.tocaImagen = true
            }
        }
        super.touchesBegan(touches, with: event)
    }


    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            print("Touches moved")
            let loc = touch.location(in: self.view)
            if self.tocaImagen == true {
                self.imageView.center = loc
            }
        }
        super.touchesMoved(touches, with: event)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            print("Touches ended")
            self.tocaImagen = false
            super.touchesEnded(touches, with: event)
        
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
            print("Touches cancelled")
            self.tocaImagen = false
            super.touchesCancelled(touches, with: event)
    }

    


}

