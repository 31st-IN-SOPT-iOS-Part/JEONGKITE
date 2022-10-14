//
//  ProfileViewController.swift
//  Assignment-1st
//
//  Created by 양정연 on 2022/10/14.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - UI Property
    
        private lazy var closeButton = UIButton().then {
            $0.setImage(Const.Image.icClose, for: .normal)
            $0.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        }
        
        private let profileImg = UIImageView().then {
            $0.image = Const.Image.jeongkiteProfileImg
        }
        
        private let profileNameLabel = UILabel().then {
            $0.text = "jeongkite"
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 18, weight: .regular)
        }
        
        private let divisionLine = UIView().then {
            $0.backgroundColor = UIColor(hexString: "9FA7AD")
        }
        
        private let chatImg = UIImageView().then {
            $0.image = Const.Image.icProfileChat
        }
        
        private let chatLabel = UILabel().then {
            $0.text = "나와의 채팅"
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 10, weight: .regular)
        }
        
        private let chatStackView = UIStackView().then {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 8
        }
        
        private let editLabel = UILabel().then {
            $0.text = "프로필 편집"
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 10, weight: .regular)
        }
        
        private let editImg = UIImageView().then {
            $0.image = Const.Image.icProfileEdit
        }
        
        private let editStackView = UIStackView().then {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 8
        }
        
        private let stroyImg = UIImageView().then {
            $0.image = Const.Image.icKakaoStory
        }
        
        private let storyLabel = UILabel().then {
            $0.text = "카카오스토리"
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 10, weight: .regular)
        }
        
        private let storyStackView = UIStackView().then {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 8
        }
        
        private let chatContainerView = UIView()
        private let editContainerView = UIView()
        private let storyContainerView = UIView()
        
        // MARK: - Life Cycle
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            setBackgroundColor()
            setLayout()
            addViewTapGesture()
        }
        
        // MARK: - @objc
        
        @objc private func backButtonDidTap() {
            dismiss(animated: true)
        }
        
        @objc private func chatContainerViewDidTap() {
            print("나와의 채팅")
        }
        
        @objc private func editContainerViewDidTap() {
            print("프로필 편집")
        }
        
        @objc private func stroyContainerViewDidTap() {
            print("카카오 스토리")
        }
        
        // MARK: - Custom Method
        
        private func setBackgroundColor() {
            view.backgroundColor = UIColor(hexString: "#879198")
        }
        
        private func addViewTapGesture() {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(chatContainerViewDidTap))
            chatContainerView.addGestureRecognizer(gesture)
            let editGesture = UITapGestureRecognizer(target: self, action: #selector(editContainerViewDidTap))
            editContainerView.addGestureRecognizer(editGesture)
            let storyGesture = UITapGestureRecognizer(target: self, action: #selector(stroyContainerViewDidTap))
            storyContainerView.addGestureRecognizer(storyGesture)
        }
        
        private func setLayout() {
            setHierarchy()
            setConstraint()
        }
        
        private func setHierarchy() {
            view.addSubviews(closeButton, profileImg, profileNameLabel,
                              divisionLine, chatContainerView,
                              editContainerView, storyContainerView)
            
            chatContainerView.addSubview(chatStackView)
            editContainerView.addSubview(editStackView)
            storyContainerView.addSubview(storyStackView)
            
            [chatImg, chatLabel].forEach {
                chatStackView.addArrangedSubview($0)
            }
            [editImg, editLabel].forEach {
                editStackView.addArrangedSubview($0)
            }
            [stroyImg, storyLabel].forEach {
                storyStackView.addArrangedSubview($0)
            }
        }
        
        private func setConstraint() {
            closeButton.snp.makeConstraints {
                $0.leading.equalToSuperview().inset(18)
                $0.top.equalTo(view.safeAreaLayoutGuide).inset(14)
            }
            
            chatContainerView.snp.makeConstraints {
                $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(44)
                $0.width.equalTo(convertByWidthRatio(92))
                $0.height.equalTo(72)
            }
            
            chatStackView.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
            }
            
            editContainerView.snp.makeConstraints {
                $0.leading.equalTo(chatContainerView.snp.trailing)
                $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(44)
                $0.width.equalTo(convertByWidthRatio(92))
                $0.height.equalTo(72)
                $0.centerX.equalToSuperview()
            }
            
            editStackView.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
            }
            
            storyContainerView.snp.makeConstraints {
                $0.leading.equalTo(editContainerView.snp.trailing)
                $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(44)
                $0.width.equalTo(convertByWidthRatio(92))
                $0.height.equalTo(72)
            }
            
            storyStackView.snp.makeConstraints {
                $0.centerX.centerY.equalToSuperview()
            }
            
            divisionLine.snp.makeConstraints {
                $0.leading.trailing.equalToSuperview()
                $0.bottom.equalTo(editContainerView.snp.top).offset(-11)
                $0.height.equalTo(1)
            }
            
            profileNameLabel.snp.makeConstraints {
                $0.bottom.equalTo(divisionLine.snp.top).offset(-42)
                $0.centerX.equalToSuperview()
            }
            
            profileImg.snp.makeConstraints {
                $0.bottom.equalTo(profileNameLabel.snp.top).offset(-8)
                $0.width.height.equalTo(97)
                $0.centerX.equalToSuperview()
            }
        }
}
