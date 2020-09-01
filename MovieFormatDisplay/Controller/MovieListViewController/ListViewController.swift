//
//  MovieListViewController.swift
//  MovieFormatDisplay
//
//  Created by Yuta Toba on 2020/08/07.
//  Copyright © 2020 Yuta Toba. All rights reserved.
//

import UIKit

class ListViewController: UIViewController{
    
    var list:[Item]{
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return ListAddedData.shared.allList
        case 1:
            return ListAddedData.shared.selectedList
        default:
            fatalError("caseでカバーできません")
        }
    }
    
    @IBOutlet weak var table:UITableView!
    
    @IBOutlet weak var segmentedControl:UISegmentedControl!
    
    @IBAction func segmentSelcted(_ sender: UISegmentedControl) {
        
        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(ListTableViewCell.nib(), forCellReuseIdentifier: ListTableViewCell.identifier)


        table.delegate = self
        table.dataSource = self
        
    }
}

extension ListViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as! ListTableViewCell
        cell.setcell(item: list[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//Singleton
class ListAddedData{
    static let shared = ListAddedData()
    
    private(set) var allList:[Item] = []
    private(set) var selectedList:[Item] = []
    
    func add(_ item:Item, isSelected: Bool = false){
        allList.append(item)
        if isSelected{
            selectedList.append(item)
        }
    }
}
