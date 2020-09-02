//
//  MovieListViewController.swift
//  MovieFormatDisplay
//
//  Created by Yuta Toba on 2020/08/07.
//  Copyright © 2020 Yuta Toba. All rights reserved.
//

import UIKit
import RealmSwift

class ListViewController: UIViewController {
    
    var movieItems: Results<RegisteredMovie>!
    
    var list:[RegisteredMovie]{
        
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
       
        self.setupTable()
        
        let realm = try! Realm()
        movieItems = realm.objects(RegisteredMovie.self)
        
        table.reloadData()
    }
    
//メソッドsegmentSelcted同等の処理なら不要
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        table.reloadData()
//    }
}

extension ListViewController {
    
    private func setupTable() {
        table.register(ListTableViewCell.nib(), forCellReuseIdentifier: ListTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as! ListTableViewCell
        cell.setcell(object: list[indexPath.row])
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//Singleton
//class ListAddedData{
//    static let shared = ListAddedData()
//    private init(){}
//
//    private(set) var allList:[MovieItem] = []
//    private(set) var selectedList:[MovieItem] = []
//
//    func add(_ item:MovieItem, isSelected: Bool = false){
//        allList.append(item)
//        if isSelected{
//            selectedList.append(item)
//        }
//    }
//}
