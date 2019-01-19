//
//  ViewController.swift
//  PersianDatePicker
//
//  Created by Farid on 1/19/19.
//  Copyright © 2019 SMON.Fridday. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var viewBack: UIView!
    @IBOutlet weak var lblPersianDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.viewBack.alpha = 0
        self.lblPersianDate.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.loadAnimation()
    }
    
    private func loadAnimation() {
        
        UIView.animate(withDuration: 1.5, animations: {
            
            self.viewBack.alpha = 1
            self.lblPersianDate.alpha = 1
            
        }) { (finished) in
            
            if finished {
                UIView.animate(withDuration: 1.5, animations: {
                    
                    self.viewBack.alpha = 0
                    self.lblPersianDate.alpha = 0
                    
                }) { (finished) in
                    
                    if finished {
                        
                        self.persianDateViewControllerTransition()
                    }
                }
            }
        }
    }
    
    ///View Transition
    private func persianDateViewControllerTransition() {
        
        let persianDateVC = self.storyboard?.instantiateViewController(withIdentifier: "PersianDateViewControllerID") as! PersianDateViewController
        self.navigationController?.present(persianDateVC, animated: false, completion: nil)
    }
    
}

