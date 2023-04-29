//
//  ThirdViewController.swift
//  IOS-HomeWork-7
//
//  Created by MacBook Pro on 29/4/23.
//

import UIKit

class ThirdViewController: UIViewController {
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Thank"
        return label
    }()

    override func viewDidLoad() {
        view.addSubview(label)
        super.viewDidLoad()
        
        view.backgroundColor = .white
        initUI()
    }
    
    func initUI() {
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
        }
    }
}
