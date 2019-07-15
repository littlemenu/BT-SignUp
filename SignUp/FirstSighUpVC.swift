//
//  FirstSighUpVC.swift
//  SignUp
//
//  Created by 정재훈 on 14/07/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class FirstSighUpVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textFieldID: UITextField!
    @IBOutlet weak var textFieldPW: UITextField!
    @IBOutlet weak var textFieldPWR: UITextField!
    @IBOutlet weak var textViewUserText: UITextView!
    @IBOutlet weak var buttonNext: UIButton!
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        buttonNext.isEnabled = false
        imageViewUserInteraction()
        textFieldSet()
    }
    
    func imageViewUserInteraction() {
        let imageViewTapGestureEvent = UITapGestureRecognizer(target: self, action: #selector(imageViewPicker))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(imageViewTapGestureEvent)
    }
    
    func textFieldSet() {
        textFieldID.delegate = self
        textFieldPW.delegate = self
        textFieldPWR.delegate = self
    }
    
    @objc func imageViewPicker() {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage: UIImage = info[.originalImage] as?
            UIImage {
            self.imageView.image = originalImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkInsertAll()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        checkInsertAll()
    }
    
    func checkInsertAll() {
        guard textFieldID.text != "", textFieldPW.text != "", textFieldPWR.text != "", textViewUserText.text != "" else {
            buttonNext.isEnabled = false
            return
        }
        
        buttonNext.isEnabled = true
        
        // if textFieldID.text?.isEmpty ?? true { textFieldID의 값이
        // a ?? b == a != nil ? a! : b (즉, 3항 연산자)
        // textFieldID의 text가 nil이면 true 값을 반환하고, nil이 아니면 text의 값을 강제 언래핑하라
        // }
    }
    
    @IBAction func btnCancel(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        if textFieldPW.text == textFieldPWR.text {
            UserInfomation.shared.ID = textFieldID.text
            UserInfomation.shared.PW = textFieldPW.text
            UserInfomation.shared.PWR = textFieldPWR.text
            UserInfomation.shared.UserText = textViewUserText.text
        } else {
            let AlertController = UIAlertController(title: "비밀번호 불일치", message: "비밀번호 재확인과 불일치합니다!", preferredStyle: .alert)
            let Alert = UIAlertAction(title: "알겠습니다.", style: .destructive, handler: nil)
            AlertController.addAction(Alert)
            self.present(AlertController, animated: true, completion: nil)
        }
    }
}
