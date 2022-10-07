//
//  UITextField+.swift
//  Assignment-1st
//
//  Created by 양정연 on 2022/10/07.
//

import UIKit

extension UITextField {
    func setUnderline(underlineColor: UIColor = .systemGray5) {
        self.backgroundColor = .white
        self.font = .systemFont(ofSize: 16, weight: .medium)
        let underLine = CALayer()
        underLine.backgroundColor = underlineColor.cgColor
        underLine.frame = CGRect(x: 0, y: self.frame.size.height, width: self.bounds.width, height: 1)
        self.layer.addSublayer(underLine)
    }
}
