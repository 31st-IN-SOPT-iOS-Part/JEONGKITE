//
//  UIViewController+.swift
//  Assignment-1st
//
//  Created by 양정연 on 2022/10/14.
//

import UIKit

extension UIViewController {
    func getDeviceWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    func getDeviceHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    func convertByWidthRatio(_ convert: CGFloat) -> CGFloat {
        return (convert / 375) * getDeviceWidth()
    }
    
    func convertByHeightRatio(_ convert: CGFloat) -> CGFloat {
        return (convert / 812) * getDeviceHeight()
    }
}
