//
//  ViewController.swift
//  25Double
//
//  Created by 宮崎直久 on 2019/12/14.
//  Copyright © 2019 宮崎直久. All rights reserved.
//

import UIKit

//①UITextFieldDelegateのデリゲートプロトコルの採用を宣言する
//テキストフィールドはイベントの受付だけを行う
//実施の処理は他のクラスに任せる・外注する（デリゲート）
class ViewController: UIViewController, UITextFieldDelegate {

//    テキストフィールドのプロパティ宣言
    @IBOutlet weak var myTextField: UITextField!
    
//    ラベルのプロパティ宣言
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ②myTextFieldのデリゲート(外注先)になる）（delegateプロパティにselfを指定します）
        myTextField.delegate = self
    }
    
//    ③デリゲートメソッドを実装する(編集中に変更がある度に発生するイベント)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//変更後の内容を作成する。
        let tmpStr = textField.text! as NSString
//        replacingCharactersメソッドは、現在の値を作る。NSString型のストリングを対象とする。（置換後の結果はString型で返ります）
        let replacedString = tmpStr.replacingCharacters(in: range, with: string)
        if replacedString == "" {
//            変更後が空ならばラベルに0を表示する
            myLabel.text = "0"
        } else {
//            変更後の値を計算してラベルに表示する。（25をかけた値）
//            replacedStringを整数に変換できた時にnumを代入する。
            if let num = Int(replacedString) {
                myLabel.text = String(num * 25)
            }
        }
//        テキストフィールドを更新する（テキストの編集が確定）
        return true
    }
    
//    クリアボタンで実行されるデリゲートメソッド
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        myLabel.text = "0"
        return true
    }


}

