//
//  PersianDatePicker+ViewController.swift
//  PersianDatePicker
//
//  Created by Farid on 1/19/19.
//  Copyright © 2019 SMON.Fridday. All rights reserved.
//

import UIKit

//**Change it to your ViewController**
extension PersianDateViewController {
    
    //Show DatePicker
    func showDatePicker() {
        
        //DatePicker Formate Date
        datePicker.datePickerMode = .date
        datePicker.calendar = Calendar(identifier: .persian)
        datePicker.locale = Locale(identifier: "fa_IR")
        
        /*
         Set Colors here:
         
            datePicker.backgroundColor = UIColor.
            datePicker.setValue(UIColor.white, forKey: "textColor")
        */
        
        //ToolBar
        let toolbar = UIToolbar()
        toolbar.barStyle = .blackTranslucent
        
        /*
         Set Colors here:
         
            toolbar.backgroundColor = UIColor.
            toolbar.tintColor = UIColor.
        */
        
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "تایید", style: .done, target: self, action: #selector(doneDatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "لغو", style: .done, target: self, action: #selector(cancelDatePicker));
        
        
        /*
         You can set fonts to the Buttons here:
         
            if let font = UIFont.init(name: "BNazaninBold", size: 18) {
                doneButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: font], for:.normal)
                cancelButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: font], for:.normal)
            }
        */
        
        toolbar.setItems([cancelButton,spaceButton,doneButton], animated: true)
        
        //**Change it to your textFiled or Label**
        self.textFieldBirthday.inputAccessoryView = toolbar
        self.textFieldBirthday.inputView = datePicker
        
    };@objc func cancelDatePicker() {
        self.view.endEditing(true)
    };@objc func doneDatePicker() {
        //**Change it to your textFiled or Label**
        self.textFieldBirthday.text = getDate(calendar: .persian, in: .short)
        self.lblBirthday0.text = getDate(calendar: .persian, in: .medium)
        self.lblBirthday1.text = getDate(calendar: .gregorian, in: .medium)
        
        self.view.endEditing(true)
    }
    
    fileprivate func getDate(calendar: Calendar.Identifier, in dateFormtterStyle: DateFormatter.Style) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: calendar)
        switch calendar {
        case .gregorian: formatter.locale = Locale(identifier: "en_US_POSIX")
        case .persian: formatter.locale = Locale(identifier: "fa_IR_POSIX")
        case .buddhist, .chinese, .coptic, .ethiopicAmeteMihret, .ethiopicAmeteAlem, .hebrew, .iso8601,  .indian, .islamic, .islamicCivil, .japanese, .republicOfChina, .islamicTabular, .islamicUmmAlQura: break
        }
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.dateStyle = dateFormtterStyle
        formatter.timeStyle = .none
        
        return formatter.string(from: datePicker.date)
    }
}

