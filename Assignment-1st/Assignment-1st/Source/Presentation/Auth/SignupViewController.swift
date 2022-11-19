//
//  SignupViewController.swift
//  Assignment-1st
//
//  Created by 양정연 on 2022/10/07.
//

import UIKit

class SignupViewController: UIViewController {
    
    // MARK: - Property
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let userIDTextField: UITextField = {
        let textField = UITextField()
        textField.setUnderline()
        textField.placeholder = "이메일 또는 전화번호"
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.setUnderline()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let passwordCheckTextField: UITextField = {
        let textField = UITextField()
        textField.setUnderline()
        textField.placeholder = "비밀번호 확인"
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let signupButton: UIButton = {
        let button = UIButton()
        button.setDefaultButton(title: "새로운 카카오계정 만들기")
        button.addTarget(self, action: #selector(presentToWelcomeViewController), for: .touchUpInside)
        return button
    }()
    
    private lazy var formStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userIDTextField, passwordTextField, passwordCheckTextField])
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    // MARK: - Function
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(titleLabel, formStackView, signupButton)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
        }
        
        
        formStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(titleLabel.snp.bottom).offset(60)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
        }
        
        signupButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
            make.top.equalTo(formStackView.snp.bottom).offset(20)
            make.height.equalTo(45)
        }
    }
    
    // MARK: - Objc Function
    @objc private func presentToWelcomeViewController() {
        let welcomeViewController = WelcomeViewController()
        if let userID = userIDTextField.text {
            welcomeViewController.setTItleLabel(userID: userID)
        }
        welcomeViewController.modalPresentationStyle = .fullScreen
        self.present(welcomeViewController, animated: true, completion: nil)
    }
}
