//
//  ViewController.swift
//  swift_tutorial_struct
//
//  Created by 早川マイケル on 2021/01/30.
//

import UIKit

protocol SetOKDelegate{
    func setOK(check:Person)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SetOKDelegate{
    
    // テーブル
    @IBOutlet weak var tableView: UITableView!

    // セルに登録されている人物データ
    var personArray = [Person]()

    // 画面読み込み
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // テーブルビューを利用する時のお決まり
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // ボタンをタップしたとき
    @IBAction func favButtonAction(_ sender: Any) {
        
        // 画面遷移
        performSegue(withIdentifier: "next", sender: nil)
    }

    // 画面遷移時実行関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // セグウェイがnextだった時の処理
        if segue.identifier == "next" {
            let nextVC = segue.destination as! NextViewController
            
            // 遷移先のsetOKDelegateに自身を渡す
            nextVC.setOKDelegate = self
        }
    }

    // 遷移先から戻ってきたとき
    func setOK(check: Person) {
        // 人物データ追加
        personArray.append(check)
        
        // テーブルビュー再作成
        tableView.reloadData()
    }

    // セルの数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // 人物データの数
        return personArray.count
    }
    
    // セルの高さを指定
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // セル作成時の処理
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let userNameLabel = cell.contentView.viewWithTag(1) as! UILabel
        userNameLabel.text = personArray[indexPath.row].name

        let shumiLabel = cell.contentView.viewWithTag(1) as! UILabel
        shumiLabel.text = personArray[indexPath.row].shumi
        
        let movieLabel = cell.contentView.viewWithTag(1) as! UILabel
        movieLabel.text = personArray[indexPath.row].movie
        
        return cell
    }
    
    

    
    
}

