//
//  ViewController.swift
//  MovieFormatDisplay
//
//  Created by Yuta Toba on 2020/07/31.
//  Copyright © 2020 Yuta Toba. All rights reserved.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    private var items: [MovieItem] = [MovieItem]()
     
     override func viewDidLoad() {
         super.viewDidLoad()
         setupTable()
         setupItems()
     }
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registerControl"{
            let nextVC: RegisterViewController = segue.destination as! RegisterViewController
            if let selecteditems = sender as? MovieItem{
                nextVC.item = selecteditems
            }
        }
    }
}

extension ViewController {
    
    private func setupTable() {
        table.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }
    
    private func setupItems() {
        items = [
            MovieItem(id: 1, name:"a", date:"1"),
            MovieItem(id: 2, name:"b", date:"2"),
            MovieItem(id: 3, name:"c", date:"3"),
            MovieItem(id: 4, name:"d", date:"4"),
            MovieItem(id: 5, name:"e", date:"5")
        ]
        table.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.setcell(item: items[indexPath.row])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "registerControl", sender: items[indexPath.row])
    }
}
