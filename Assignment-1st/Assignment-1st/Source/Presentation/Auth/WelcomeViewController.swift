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
        let label = UILabel(frame: CGRect(x: 200, y: 120, width: 250, height: 30))
        label.text = "환영합니다"
        label.font = .boldSystemFont(ofSize: 20)
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
//        let components: [Any] = [titleLabel]
//        components.forEach {
//            view.addSubview($0 as! UIView)
//        }
    }
    
}

