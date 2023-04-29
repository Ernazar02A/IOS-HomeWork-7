//
//  SecondViewController.swift
//  IOS-HomeWork-7
//
//  Created by MacBook Pro on 29/4/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    private var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1821432114, green: 0.3977169991, blue: 0.7752947211, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Click Me Please", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        view.backgroundColor = .white
        initUI()
        actionUI()
    }
    
    func initUI() {
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(80)
        }
    }
    
    func actionUI() {
        button.addTarget(self, action: #selector(pressed), for: .touchUpInside)
    }
    
    @objc func pressed(_ sender: UIButton) {
        navigationController?.pushViewController(ThirdViewController(), animated: true)
    }
    
}
