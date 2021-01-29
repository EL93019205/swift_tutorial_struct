//
//  NextViewController.swift
//  swift_tutorial_struct
//
//  Created by 早川マイケル on 2021/01/30.
//

import UIKit


class NextViewController: UIViewController {
    
    var person = Person()

    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var shumiTextField: UITextField!
    
    @IBOutlet weak var movieTextField: UITextField!
    
    var setOKDelegate: SetOKDelegate?

    // 初回実行時処理
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // 決定ボタンをタップ
    @IBAction func done(_ sender: Any) {
        person.name = nameTextField.text!
        person.shumi = shumiTextField.text!
        person.movie = movieTextField.text!
        
        // setOKにpersonをセット
        setOKDelegate?.setOK(check: person)
        
        // 元の画面に戻る
        dismiss(animated: true, completion: nil)
    }
    
}
