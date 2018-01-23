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
       self.makeAnimation()
        
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





