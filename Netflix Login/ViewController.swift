//
//  ViewController.swift
//  Netflix Login
//
//  Created by Junhee Yoon on 2022/07/06.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var referralCodeTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var additionalSwitch: UISwitch!
    
    @IBOutlet weak var additionalInformationLabel: UILabel!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var referralCodeErrorLabel: UILabel!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Helper Functions
    
    func configureUI() {
        
        configureTextFields(emailTextField, placeholder: "이메일 또는 전화번호")
        configureTextFields(passwordTextField, placeholder: "비밀번호")
        configureTextFields(nicknameTextField, placeholder: "닉네임")
        configureTextFields(locationTextField, placeholder: "위치")
        configureTextFields(referralCodeTextField, placeholder: "추천 코드 입력")
        configurePasswordTextStyle()
        configureSignUpButton()
        configureAdditionalSwitch()
        
        additionalInformationLabel.alpha = 1
        emailErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        referralCodeErrorLabel.isHidden = true
  
    }
    
    func configureTextFields(_ textFieldName: UITextField, placeholder: String) {
        textFieldName.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textFieldName.textAlignment = .center
        textFieldName.backgroundColor = .systemGray
        textFieldName.textColor = .white
        textFieldName.layer.cornerRadius = 8
        textFieldName.borderStyle = .none
    }
    
    func configurePasswordTextStyle() {
        passwordTextField.isSecureTextEntry = true
        passwordTextField.textContentType = .oneTimeCode
        passwordTextField.autocorrectionType = .no
        passwordTextField.autocapitalizationType = .none
        passwordTextField.spellCheckingType = .no
    }

    func configureSignUpButton() {
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.setTitleColor(.black, for: .normal)
        signUpButton.backgroundColor = .white
        signUpButton.layer.cornerRadius = 8
    }
    
    func configureAdditionalSwitch() {
        additionalSwitch.setOn(true, animated: true)
        additionalSwitch.onTintColor = .red
    }
        
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func switchButtonTapped(_ sender: UISwitch) {
        
        if additionalSwitch.isOn {
            additionalSwitch.onTintColor = .red
            additionalSwitch.thumbTintColor = .white
        } else {
            additionalSwitch.thumbTintColor = .gray
        }
        
        if additionalSwitch.isOn {
            additionalInformationLabel.alpha = 1.0
        } else {
            additionalInformationLabel.alpha = 0.0
        }
    }
    
    @IBAction func SignUpButtonClicked(_ sender: UIButton) {
        view.endEditing(true)
        
        if emailTextField.text == nil || emailTextField.text == "" {
            emailErrorLabel.text = "이메일 또는 전화번호를 입력해주세요"
            emailErrorLabel.textColor = .red
            emailErrorLabel.font = .systemFont(ofSize: 10)
            emailErrorLabel.isHidden = false
        } else {
            emailErrorLabel.text = "OK"
            emailErrorLabel.isHidden = true
        }
        
        if passwordTextField.text?.count ?? 0 < 6 {
            passwordErrorLabel.text = "비밀번호를 6자 이상 입력해주세요"
            passwordErrorLabel.textColor = .red
            passwordErrorLabel.font = .systemFont(ofSize: 10)
            passwordErrorLabel.isHidden = false
        } else {
            passwordErrorLabel.text = "OK"
            passwordErrorLabel.isHidden = true
        }
        
        if Int(referralCodeTextField.text!) != nil || referralCodeTextField.text == "" {
            referralCodeErrorLabel.text = "OK"
            referralCodeErrorLabel.isHidden = true
        } else {
            referralCodeErrorLabel.text = "추천코드는 숫자만 입력해주세요"
            referralCodeErrorLabel.textColor = .red
            referralCodeErrorLabel.font = .systemFont(ofSize: 10)
            referralCodeErrorLabel.isHidden = false
        }
        
        if emailErrorLabel.text == "OK", passwordErrorLabel.text == "OK", referralCodeErrorLabel.text == "OK" {
            
            let alert = UIAlertController(title: "회원가입", message: "완료되었습니다!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "승인", style: .default, handler: { action -> Void in
                self.performSegue(withIdentifier: "toSignedUp", sender: self)
                
            }))
            
            present(alert, animated: true)
        }
    }
    
    @IBAction func unwindTransitionFirstVC(jackSegue: UIStoryboardSegue) {
        
    }
    
}
