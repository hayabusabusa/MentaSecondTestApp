//
//  ViewController.swift
//  MovieFormatDisplay
//
//  Created by Yuta Toba on 2020/07/31.
//  Copyright © 2020 Yuta Toba. All rights reserved.

//Array型をxibFileでStringにする方法
//配列に複数の情報を入れる方法
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table:UITableView!
    var items:[Item] = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)

        table.delegate = self
        table.dataSource = self
        
        self.setupItems()
    }
    
    func setupItems(){
        items = [Item(name:"a",date:"1"),Item(name:"b",date:"2"),Item(name:"c",date:"3"),Item(name:"d",date:"4"),Item(name:"e",date:"5"),]
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.setcell(item: items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "registerControl", sender: items[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registerControl"{
            let nextVC: RegisterViewController = segue.destination as! RegisterViewController
            if let selecteditems = sender as? Item{
                nextVC.item = selecteditems
            }
        }
    }
}

