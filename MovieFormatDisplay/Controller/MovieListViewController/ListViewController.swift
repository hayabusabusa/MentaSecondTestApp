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
    
    @IBOutlet weak var table:UITableView!
    @IBOutlet weak var segmentedControl:UISegmentedControl!
    
    // Realm から読み込んだデータ
    private var registeredMovies = [RegisteredMovie]()
    
    // TableView に表示するためのデータ
    private var dataSource: [RegisteredMovie] {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            // 未視聴のものを表示.
            return registeredMovies.filter { !$0.isWatched }
        case 1:
            // 視聴済みのものを表示.
            return registeredMovies.filter { $0.isWatched }
        default:
            fatalError("Unknown case.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // タブが切り替えられたタイミングで Realm から読み込み
        loadRegiseredMovies()
    }
    
    @IBAction func segmentSelcted(_ sender: UISegmentedControl) {
        
        table.reloadData()
    }
}

// MARK: - Setup

extension ListViewController {
    
    private func setupTable() {
        table.delegate = self
        table.dataSource = self
        table.register(ListTableViewCell.nib(), forCellReuseIdentifier: ListTableViewCell.identifier)
    }
}

// MARK: - Realm

extension ListViewController {
    
    private func loadRegiseredMovies() {
        // Realm からデータ読み込み、TableView を更新.
        do {
            let realm = try Realm()
            let storedRegisteredMovies = Array(realm.objects(RegisteredMovie.self))
            registeredMovies = storedRegisteredMovies
            
            table.reloadData()
        } catch {
            print(error)
        }
    }
    
    private func updateRegisteredMovie(of id: Int, isWatched: Bool) {
        // 選択された ID を使用して Realm から読み込んデータから更新すべきデータの Index を探す.
        guard let index = registeredMovies.firstIndex(where: { $0.id == id }) else {
            return
        }
        do {
            // 読み込んだ RegisteredMovie はすでにマネージドオブジェクトになるため、`realm.write()` で更新
            let realm = try Realm()
            try realm.write {
                registeredMovies[index].isWatched = isWatched
            }
            
            // データ更新後はテーブルを更新.
            table.reloadData()
        } catch {
            print(error)
        }
    }
}

// MARK: - TableView DataSource

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as! ListTableViewCell
        cell.setcell(object: dataSource[indexPath.row])
        return cell
    }
}

// MARK: - TableView Delegate

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // データ選択時に選択されたデータの ID を取得
        // IndexPath.row では表示しているデータと保持している Realm のデータの Index がずれてしまうため ID を使用して Index を探す.
        let selectedRegisteredMovieID = dataSource[indexPath.row].id
        let isWatched = segmentedControl.selectedSegmentIndex == 0
        updateRegisteredMovie(of: selectedRegisteredMovieID, isWatched: isWatched)
    }
}
