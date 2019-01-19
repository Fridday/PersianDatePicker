//
//  PersianDateViewController.swift
//  PersianDatePicker
//
//  Created by Farid on 1/19/19.
//  Copyright © 2019 SMON.Fridday. All rights reserved.
//

import UIKit

class PersianDateViewController: UIViewController {
  
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var stackViewBirthday: UIStackView!
    @IBOutlet weak var textFieldBirthday: UITextField!
    @IBOutlet weak var lblBirthday0: UILabel!
    @IBOutlet weak var lblBirthday1: UILabel!
    
    //You need this:
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        self.stackViewBirthday.alpha = 0
        self.lblDate.alpha = 0
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.loadAnimation()
        
        //You need this:
        showDatePicker()
    }
    
    private func loadAnimation() {
        UIView.animate(withDuration: 1.5, animations: {
            
            self.stackViewBirthday.alpha = 1
            self.lblDate.alpha = 1
        })
    }
}
