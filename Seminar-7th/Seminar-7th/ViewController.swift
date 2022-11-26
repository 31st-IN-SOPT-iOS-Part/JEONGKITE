//
//  ViewController.swift
//  Seminar-7th
//
//  Created by 양정연 on 2022/11/26.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...5 {
            testSync(index: i)
        }
        
    }
    
    private func testSync(index: Int) {
        let concurrent = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
        concurrent.sync { print("검수\(index)") }
        print("포장\(index)")
    }
    
}

