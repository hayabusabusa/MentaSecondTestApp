//
//  RegisterViewController.swift
//  MovieFormatDisplay
//
//  Created by Yuta Toba on 2020/08/03.
//  Copyright © 2020 Yuta Toba. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var registeredNameLabel: UILabel!
    @IBOutlet weak var registeredDateLabel: UILabel!
    @IBOutlet var addListButton:UIBarButtonItem!
    
    //Item型
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MovieListに追加するためのボタン
        addListButton = UIBarButtonItem(title: "リストへ追加", style: .plain, target: self, action: #selector(addListTapped(_:)))
        self.navigationItem.rightBarButtonItems = [addListButton]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let item = item else{
            print("item is nil")
            return
        }
        registeredNameLabel.text = item.name
        registeredDateLabel.text = item.date
    }
    
    //Listに追加
    @objc func addListTapped(_ sender: UIBarButtonItem){
        print("Tapped")
        //Optional<Item>
        guard let item = item else{
            print("item is nill")
            return
        }
        ListAddedData.shared.add(item, isSelected: false)
    }
}
