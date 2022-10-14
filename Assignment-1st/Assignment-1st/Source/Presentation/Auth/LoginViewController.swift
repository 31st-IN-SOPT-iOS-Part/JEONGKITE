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
        let label = UILabel(frame: CGRect(x: 80, y: 120, width: 250, height: 30))
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 80, y: 160, width: 250, height: 40))
        label.text = "사용하던 카카오계정이 있다면\n이메일 또는 전화번호로 로그인해 주세요."
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .systemGray2
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let userIDTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 22, y: 300, width: 350, height: 50))
        textField.setUnderline()
        textField.placeholder = "이메일 또는 전화번호"
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 22, y: 360, width: 350, height: 50))
        textField.setUnderline()
        textField.placeholder = "비밀번호"
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 22, y: 440, width: 350, height: 50))
        button.setDefaultButton(title: "카카오계정 로그인")
        button.addTarget(self, action: #selector(presentToWelcomeViewController), for: .touchUpInside)
        return button
    }()
    
    private let signupButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 22, y: 500, width: 350, height: 50))
        button.setDefaultButton(title: "새로운 카카오계정 만들기")
        button.addTarget(self, action: #selector(pushToSignupViewController), for: .touchUpInside)
        return button
    }()
    
    private let findAccountLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 80, y: 570, width: 250, height: 20))
        label.text = "카카오계정 또는 비밀번호 찾기"
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }

    // MARK: - Function
    private func setUI() {
        view.backgroundColor = .white
        let components: [Any] = [titleLabel, descriptionLabel, userIDTextField, passwordTextField, loginButton, signupButton, findAccountLabel]
        components.forEach {
            view.addSubview($0 as! UIView)
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
