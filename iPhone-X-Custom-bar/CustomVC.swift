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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}



