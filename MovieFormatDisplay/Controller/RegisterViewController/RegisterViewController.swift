//
//  RegisterViewController.swift
//  MovieFormatDisplay
//
//  Created by Yuta Toba on 2020/08/03.
//  Copyright © 2020 Yuta Toba. All rights reserved.
//

import UIKit
import RealmSwift

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var registeredNameLabel: UILabel!
    @IBOutlet weak var registeredDateLabel: UILabel!
    @IBOutlet var addListButton:UIBarButtonItem!
    
    //Item型
    var item: MovieItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBarButton()
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
        
        //Optional<Item>
        guard let item = item else{
            print("item is nill")
            return
        }
        let realm = try! Realm()
        let registeredMovie = RegisteredMovie()

//        ListAddedData.shared.add(item, isSelected: false)
    }
}

extension RegisterViewController {
    
    private func setupBarButton() {
        //MovieListに追加するためのボタン
        addListButton = UIBarButtonItem(title: "リストへ追加", style: .plain, target: self, action: #selector(addListTapped(_:)))
        self.navigationItem.rightBarButtonItems = [addListButton]
    }
}
