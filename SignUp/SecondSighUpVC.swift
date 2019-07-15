//
//  SecondSighUpVC.swift
//  SignUp
//
//  Created by 정재훈 on 14/07/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class SecondSighUpVC: UIViewController, UITextFieldDelegate {

    var isInsertDate: Bool?
    
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        
        return formatter
    }()
    
    @IBOutlet weak var textFieldPhoneNumber: UITextField!
    @IBOutlet weak var labelBirthDayDate: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var buttonJoin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        isInsertDate = false
        textFieldPhoneNumber.delegate = self
        
        ifHaveUserInfo()
    }
    
    func ifHaveUserInfo() {
        if (UserInfomation.shared.PhoneNumber != "") {
            textFieldPhoneNumber.text = UserInfomation.shared.PhoneNumber
        }
        
        if (UserInfomation.shared.BirthDayDate != "") {
            labelBirthDayDate.text = UserInfomation.shared.BirthDayDate
            isInsertDate = true
        }
    }
    
    func checkInsertAll() {
        guard textFieldPhoneNumber.text != "", isInsertDate == true else {
            buttonJoin.isEnabled = false
            return
        }
        
        buttonJoin.isEnabled = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkInsertAll()
    }
    
    @IBAction func datePickerView(_ sender: UIDatePicker) {
        let date: Date = sender.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.labelBirthDayDate.text = dateString
        checkInsertAll()
    }
    
    @IBAction func btnCancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        UserInfomation.shared.PhoneNumber = textFieldPhoneNumber.text
        UserInfomation.shared.BirthDayDate = labelBirthDayDate.text
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnJoin(_ sender: UIButton) {
        UserInfomation.shared.PhoneNumber = textFieldPhoneNumber.text
        UserInfomation.shared.BirthDayDate = labelBirthDayDate.text
        dismiss(animated: true, completion: nil)
    }
}
