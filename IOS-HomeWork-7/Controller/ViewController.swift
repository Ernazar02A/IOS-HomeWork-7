//
//  ViewController.swift
//  IOS-HomeWork-7
//
//  Created by MacBook Pro on 29/4/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let search: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "enter address"
        return search
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2016684425)
        return view
    }()
    
    private let questionBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Or select via map?", for: .normal)
        let color = #colorLiteral(red: 0.1821432114, green: 0.3977169991, blue: 0.7752947211, alpha: 1)
        button.setTitleColor(color, for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 13.0, weight: .semibold)
        return button
    }()
    
    private let table: UITableView = UITableView()
    
    private let doneBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.1821432114, green: 0.3977169991, blue: 0.7752947211, alpha: 1)
        button.setTitle("Done", for: .normal)
        button.layer.cornerRadius = 22
        return button
    }()
    
    private var addresses: [Adress] = []
    
    private var filteredAdress: [Adress] = []
    
    private var isFiltered: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        addSub()
        view.backgroundColor = .white
        outletUpdate()
        initData()
        table.dataSource = self
        table.delegate = self
        search.delegate = self
        
    }
    
    private func addSub() {
        view.addSubview(search)
        view.addSubview(doneBtn)
        view.addSubview(lineView)
        view.addSubview(questionBtn)
        view.addSubview(table)
    }
    
    private func initData() {
        addresses = [Adress(object: "Apple company", location: "Cupertino, CA 95014, USA"),
                     Adress(object: "Microsoft company", location: "Redmond, WA 98052-6399 USA"),
                     Adress(object: "Facebook company", location: "Menlo Park, CA 94025"),
                     Adress(object: "SpaceX company", location: "Hawthorne, CA 90250, USA"),
                     Adress(object: "Amazon company", location: " Seattle 98109, WA"),
                     Adress(object: "Alibaba company", location: "969 District, China"),
                     Adress(object: "IBM company", location: "1 North , Armonk, NY 10504."),
                     Adress(object: "Dell company", location: "Round Rock, Texas 78682"),
                     Adress(object: "HP company", location: "Palo Alto, California, USA"),
                     Adress(object: "Samsumg company", location: "Suwon-si, South Korea"),]
    }

    private func outletUpdate() {
        search.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(19)
            make.top.equalToSuperview().inset(99)
            make.height.equalTo(40)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.trailing.leading.equalToSuperview().inset(19)
            make.top.equalTo(search.snp.bottom).offset(40)
        }
        
        questionBtn.snp.makeConstraints { make in
            make.height.equalTo(41)
            make.width.equalTo(136)
            make.centerX.equalToSuperview()
            make.top.equalTo(lineView.snp.top).offset(-20)
        }
        
        table.snp.makeConstraints { make in
            make.bottom.equalTo(doneBtn.snp.top).offset(-60)
            make.top.equalTo(questionBtn.snp.bottom).offset(0)
            make.trailing.leading.equalToSuperview()
        }
        
        doneBtn.snp.makeConstraints { make in
            make.height.equalTo(45)
            make.trailing.leading.equalToSuperview().inset(19)
            make.bottom.equalToSuperview().offset(-101)
        }
    }

}

//MARK: - UITableViewDataSource & UITableViewDelegate

extension ViewController: UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isFiltered ? filteredAdress.count : addresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = isFiltered ? filteredAdress[indexPath.row].object : addresses[indexPath.row].object
        cell.textLabel?.font = .systemFont(ofSize: 13.0, weight: .semibold)
        cell.detailTextLabel?.text = isFiltered ? filteredAdress[indexPath.row].location : addresses[indexPath.row].location
        cell.detailTextLabel?.font = .systemFont(ofSize: 12.0, weight: .light)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}


//MARK: - UISearchBarDelegate

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        if searchText.isEmpty {
            isFiltered = false
        } else {
            isFiltered = true
            
            filteredAdress = addresses.filter { $0.location.contains(searchText) }
        }
        
        table.reloadData()
    }
}
