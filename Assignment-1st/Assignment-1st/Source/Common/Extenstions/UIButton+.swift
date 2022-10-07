//
//  UIButton+.swift
//  Assignment-1st
//
//  Created by 양정연 on 2022/10/07.
//

import UIKit

extension UIButton {
    func setDefaultButton(title: String, backgroundColor: UIColor = .systemGray6, titleColor: UIColor = .black) {
        self.setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 15)
    }
}
