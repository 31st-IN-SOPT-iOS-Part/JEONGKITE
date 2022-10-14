//
//  LoginViewController.swift
//  Assignment-1st
//
//  Created by 양정연 on 2022/10/07.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Property
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "사용하던 카카오계정이 있다면\n이메일 또는 전화번호로 로그인해 주세요."
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .systemGray2
        label.numberOfLines = 0
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
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setDefaultButton(title: "카카오계정 로그인")
        button.addTarget(self, action: #selector(presentToWelcomeViewController), for: .touchUpInside)
        return button
    }()
    
    private let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setDefaultButton(title: "새로운 카카오계정 만들기")
        button.addTarget(self, action: #selector(pushToSignupViewController), for: .touchUpInside)
        return button
    }()
    
    private let findAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("카카오계정 또는 비밀번호 찾기", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }()
    
    private lazy var formStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userIDTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loginButton, signupButton, findAccountButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
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
        view.addSubviews(titleLabel, descriptionLabel, formStackView, buttonStackView)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
        }
        
        userIDTextField.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        
        formStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(60)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.centerX.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
            make.top.equalTo(formStackView.snp.bottom).offset(20)
            make.height.equalTo(150)
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
    
    @objc private func pushToSignupViewController() {
        let signupViewController = SignupViewController()
        self.navigationController?.pushViewController(signupViewController, animated: true)
    }
}
