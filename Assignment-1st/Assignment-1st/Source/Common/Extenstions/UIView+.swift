//
//  UIView+.swift
//  Assignment-1st
//
//  Created by 양정연 on 2022/10/14.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
