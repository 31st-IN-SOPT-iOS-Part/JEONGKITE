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
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 16, weight: .medium)
        textField.placeholder = "이메일 또는 전화번호"
        let underLine = CALayer()
        underLine.backgroundColor = UIColor.systemGray5.cgColor
        underLine.frame = CGRect(x: 0, y: 50, width: 350, height: 1)
        textField.layer.addSublayer(underLine)
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 22, y: 360, width: 350, height: 50))
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 16, weight: .medium)
        textField.placeholder = "비밀번호"
        let underLine = CALayer()
        underLine.backgroundColor = UIColor.systemGray5.cgColor
        underLine.frame = CGRect(x: 0, y: 50, width: 350, height: 1)
        textField.layer.addSublayer(underLine)
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 22, y: 450, width: 350, height: 50))
        button.setTitle("카카오계정 로그인", for: .normal)
        button.backgroundColor = .systemGray6
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        return button
    }()
    
    private let signupButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 22, y: 510, width: 350, height: 50))
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.backgroundColor = .systemGray6
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        return button
    }()
    
    private let findAccountLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 80, y: 580, width: 250, height: 20))
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
}
