//
//  CustomVC.swift
//  iPhone-X-Custom-bar
//
//  Created by admin on 22/01/18.
//  Copyright © 2018 Aklesh. All rights reserved.
//

import UIKit

class CustomVC: UIViewController {

    @IBOutlet weak var navigationHeight: NSLayoutConstraint!
    @IBOutlet weak var lblLabel: UILabel!
    @IBOutlet weak var bottomViewHeight: NSLayoutConstraint!
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("CustomVC viewDidLoad Local")

        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:
                print("iPhone X")
            default:
                navigationHeight.constant = 64
                bottomViewHeight.constant = 49
            }
        }
        
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
       // self.lblLabel.layer.anchorPoint = CGPoint(x: 0,y :0)
        
       /* UIView.animate(withDuration: 1.0, animations: {
           // coloredSquare.backgroundColor = UIColor.redColor()
           self.lblLabel.frame = CGRect(x: 10, y: 120, width: 320, height: 320)
            
        })*/
       

      /*  UIView.animate(withDuration: 2.0,
                       animations: {
                        self.lblLabel.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 2.0) {
                            self.lblLabel.transform = CGAffineTransform.identity
                        }
        })*/
        
       /* UIView.animate(withDuration: 3.0, animations: {
           // self.lblLabel.backgroundColor = .brown
            self.lblLabel.frame.size.width += 100
            self.lblLabel.frame.size.height += 100
           // self.lblLabel.font = self.lblLabel.font.withSize(30)

        })*/
        
      //  self.makeAnimation()
        
    }
    
    
    func makeAnimation()  {
        lblLabel.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(6.0),
                       options: UIViewAnimationOptions.allowUserInteraction,
                       animations: {
                        self.lblLabel.transform = CGAffineTransform.identity
        },
                       completion: { Void in()  }
        )
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func show(_ sender: Any) {
        
        self.lblLabel.layer.anchorPoint = CGPoint(x: 0.0,y :0.0)
        self.lblLabel.layer.position = CGPoint(x: 10, y: 98)
        lblLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        
        UIView.animate(withDuration: 1.0) {
             self.lblLabel.layer.position = CGPoint(x: 10, y: 108)
            self.lblLabel.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
    }
    
    
    

}

extension UIView {
    
    /**
     Simply zooming in of a view: set view scale to 0 and zoom to Identity on 'duration' time interval.
     
     - parameter duration: animation duration
     */
    func zoomIn(duration: TimeInterval = 5.0) {
        self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.transform = CGAffineTransform.identity
        }) { (animationCompleted: Bool) -> Void in
        }
    }
    
    /**
     Simply zooming out of a view: set view scale to Identity and zoom out to 0 on 'duration' time interval.
     
     - parameter duration: animation duration
     */
    func zoomOut(duration: TimeInterval = 0.2) {
        self.transform = CGAffineTransform.identity
        UIView.animate(withDuration: duration, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        }) { (animationCompleted: Bool) -> Void in
        }
    }
    
    /**
     Zoom in any view with specified offset magnification.
     
     - parameter duration:     animation duration.
     - parameter easingOffset: easing offset.
     */
    func zoomInWithEasing(duration: TimeInterval = 5.0, easingOffset: CGFloat = 0.2) {
        let easeScale = 1.0 + easingOffset
        let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
        let scalingDuration = duration - easingDuration
        UIView.animate(withDuration: scalingDuration, delay: 0.0, options: .curveEaseIn, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
        }, completion: { (completed: Bool) -> Void in
            UIView.animate(withDuration: easingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
                self.transform = CGAffineTransform.identity
            }, completion: { (completed: Bool) -> Void in
            })
        })
    }
    
    /**
     Zoom out any view with specified offset magnification.
     
     - parameter duration:     animation duration.
     - parameter easingOffset: easing offset.
     */
    func zoomOutWithEasing(duration: TimeInterval = 0.2, easingOffset: CGFloat = 0.2) {
        let easeScale = 1.0 + easingOffset
        let easingDuration = TimeInterval(easingOffset) * duration / TimeInterval(easeScale)
        let scalingDuration = duration - easingDuration
        UIView.animate(withDuration: easingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: easeScale, y: easeScale)
        }, completion: { (completed: Bool) -> Void in
            UIView.animate(withDuration: scalingDuration, delay: 0.0, options: .curveEaseOut, animations: { () -> Void in
                self.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
            }, completion: { (completed: Bool) -> Void in
            })
        })
}
}


extension UILabel {
    func animate(font: UIFont, duration: TimeInterval) {
        // let oldFrame = frame
        let labelScale = self.font.pointSize / font.pointSize
        self.font = font
        let oldTransform = transform
        transform = transform.scaledBy(x: labelScale, y: labelScale)
        // let newOrigin = frame.origin
        // frame.origin = oldFrame.origin // only for left aligned text
        // frame.origin = CGPoint(x: oldFrame.origin.x + oldFrame.width - frame.width, y: oldFrame.origin.y) // only for right aligned text
        setNeedsUpdateConstraints()
        UIView.animate(withDuration: duration) {
            //L self.frame.origin = newOrigin
            self.transform = oldTransform
            self.layoutIfNeeded()
        }
    }
}



