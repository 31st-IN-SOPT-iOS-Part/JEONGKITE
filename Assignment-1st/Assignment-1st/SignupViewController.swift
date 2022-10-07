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
        let label = UILabel(frame: CGRect(x: 80, y: 120, width: 250, height: 30))
        label.text = "카카오톡을 시작합니다"
        label.font = .boldSystemFont(ofSize: 20)
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
    
    private let passwordCheckTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 22, y: 420, width: 350, height: 50))
        textField.backgroundColor = .white
        textField.font = .systemFont(ofSize: 16, weight: .medium)
        textField.placeholder = "비밀번호"
        let underLine = CALayer()
        underLine.backgroundColor = UIColor.systemGray5.cgColor
        underLine.frame = CGRect(x: 0, y: 50, width: 350, height: 1)
        textField.layer.addSublayer(underLine)
        return textField
    }()
    
    private let signupButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 22, y: 500, width: 350, height: 50))
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.backgroundColor = .systemGray6
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        return button
    }()
    
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }
    
    // MARK: - Function
    private func setUI() {
        view.backgroundColor = .white
        let components: [Any] = [titleLabel, userIDTextField, passwordTextField, passwordCheckTextField, signupButton]
        components.forEach {
            view.addSubview($0 as! UIView)
        }
    }
}
