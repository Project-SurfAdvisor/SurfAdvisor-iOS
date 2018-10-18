//
//  SearchVC.swift
//  SurfAdvisor
//
//  Created by 박세은 on 2018. 10. 19..
//  Copyright © 2018년 박세은. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {

    @IBOutlet weak var resultTbV: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    func setupView() {
        resultTbV.delegate = self
        resultTbV.dataSource = self
    }
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resultTbV.dequeueReusableCell(withIdentifier: "SearchResultCell") as! SearchResultCell
        return cell
    }
    
    
}
