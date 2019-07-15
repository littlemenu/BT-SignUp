//
//  MainVC.swift
//  SignUp
//
//  Created by 정재훈 on 14/07/2019.
//  Copyright © 2019 정재훈. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textFieldID: UITextField!
    
    
    override func viewWillAppear(_ animated: Bool) {
        setLoginView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = UIImage(named: "apple")
    }
    
    func setLoginView() {
        if (UserInfomation.shared.ID != nil) {
            textFieldID.text = UserInfomation.shared.ID
        }
    }
}
