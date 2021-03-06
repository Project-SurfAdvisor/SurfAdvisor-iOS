//
//  LocationVC.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 21..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class LocationVC: UIViewController {

    @IBOutlet weak var locationTbV: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var filteredArr = [City]() {
        didSet {
            locationTbV.reloadData()
        }
    }
    var cityArr = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaviBar()
        setupView()
        initData()
    }
   
    
    @objc func popAction(btn: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupNaviBar(){
        let imv: UIImageView = UIImageView(image: #imageLiteral(resourceName: "surfAdvisorCopy"))
        navigationItem.titleView = imv
        self.navigationController?.navigationBar.topItem?.title = ""
        
    }
    
    private func setupView(){
        self.searchBar.delegate = self
        self.locationTbV.delegate = self
        self.locationTbV.dataSource = self
    }

    private func initData(){
        CityListService.shareInstance.getCityList(completion: { (city) in
            self.cityArr = city
            self.filteredArr = city
        }) { (err) in
            print("city list err")
        }
    }
}

extension LocationVC: UISearchBarDelegate {
    
    // 텍스트 입력시 필터링
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredArr = searchText.isEmpty ? cityArr : cityArr.filter({ (city) -> Bool in
            return city.cName.range(of: searchText , options: .caseInsensitive ) != nil
        })
        
    }
//    // 텍스트 입력시 취소버튼 보이기
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        self.searchBar.showsCancelButton = true
//    }
//    // 취소버튼 누르면 텍스트 없애고 키보드 사라짐
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        self.searchBar.showsCancelButton = false
//        self.searchBar.text = ""
//        self.searchBar.resignFirstResponder()
//    }
    // 키보드에서 검색버튼 눌렀을 때
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
}

extension LocationVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = locationTbV.dequeueReusableCell(withIdentifier: "CityListCell") as! CityListCell
        cell.nameLabel.text = self.filteredArr[indexPath.row].cName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        NotificationCenter.default.post(name: NSNotification.Name("setLocation"), object: filteredArr[indexPath.row].cName)
        self.navigationController?.popViewController(animated: true)
    }
    
}
