//
//  WelcomeViewController.swift
//  Assignment-1st
//
//  Created by 양정연 on 2022/10/07.
//

import UIKit

class WelcomeViewController: UIViewController {

    // MARK: - Property
    private let titleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 80, y: 300, width: 250, height: 60))
        label.text = "환영합니다"
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    private let finishButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 22, y: 390, width: 350, height: 50))
        button.setDefaultButton(title: "확인", backgroundColor: .kakaoYellow)
        button.addTarget(self, action: #selector(touchupFinishButton), for: .touchUpInside)
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
        let components: [Any] = [titleLabel, finishButton]
        components.forEach {
            view.addSubview($0 as! UIView)
        }
    }
    
    func setTItleLabel(userID: String) {
        titleLabel.text = "\(userID)님\n환영합니다"
    }
    
    // MARK: - Objc Function
    @objc private func touchupFinishButton() {
        if self.navigationController == nil{
            self.dismiss(animated: true, completion: nil)
        }
        else{
            self.navigationController?.popViewController(animated: true)
        }
    }
}

