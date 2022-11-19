//
//  WelcomeViewController.swift
//  Assignment-1st
//
//  Created by 양정연 on 2022/10/07.
//

import UIKit

import SnapKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Property
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "환영합니다"
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let finishButton: UIButton = {
        let button = UIButton()
        button.setDefaultButton(title: "확인", backgroundColor: .kakaoYellow)
        button.addTarget(self, action: #selector(touchupFinishButton), for: .touchUpInside)
        return button
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
        let components: [Any] = [titleLabel, finishButton]
        components.forEach {
            view.addSubview($0 as! UIView)
        }
    }
    
    private func setLayout() {
        view.addSubviews(titleLabel, finishButton)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).inset(200)
        }
        
        finishButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(180)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(18)
            make.height.equalTo(45)
        }
    }
    
    func setTItleLabel(userID: String) {
        titleLabel.text = "\(userID)님\n환영합니다"
    }
    
    // MARK: - Objc Function
    @objc private func touchupFinishButton() {
        let friendsViewController = FriendsViewController()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(friendsViewController, animated: false)
    }
}

