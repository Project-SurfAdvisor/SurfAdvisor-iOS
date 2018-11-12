//
//  SearchVC.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 19..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class SearchResultVC: UIViewController {
    var places = [Place]() {
        didSet {
            self.resultTbV.reloadData()
//            print(date)
//            print(location)
        }
    }
    var date = ""
    var location = ""
    @IBOutlet weak var resultTbV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(date)
        print(location)
        setupView()
        initData()
    }
    
    private func setupView() {
        resultTbV.delegate = self
        resultTbV.dataSource = self
    }
    
    private func initData() {
        print("ddfdfdfdf")
        SearchResultService.shareInstance.getGradeSearchResult(date: self.date, location: self.location, completion: { (places) in
            
            print("dddd")
            self.places = places
        }) { (err) in
            print("검색 결과 실패")
        }
    }
    
    @IBAction func selectOptionAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            SearchResultService.shareInstance.getGradeSearchResult(date: self.date, location: location, completion: { (places) in
                
                self.places = places
                
            }) { (err) in
                print("검색 결과 실패")
            }
        } else {
            SearchResultService.shareInstance.getDistanceSearchResult(date: self.date, location: location, completion: { (places) in
                
                self.places = places
                
            }) { (err) in
                print("검색 결과 실패")
            }
        }
    }
}

extension SearchResultVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultTbV.dequeueReusableCell(withIdentifier: "SearchResultCell") as! SearchResultCell
        cell.nameLabel.text = places[indexPath.row].saName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
