//
//  InputViewController.swift
//  Instagram
//
//  Created by hirokawa rakuma on 2021/10/14.
//

import UIKit
import Firebase
import SVProgressHUD


class InputViewController: UIViewController {
    @IBOutlet weak var commentTextField: UITextField!
    
    var postData : PostData!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func CommentInputButton(_ sender: Any) {
        
        let commentname = Auth.auth().currentUser?.displayName
        
        
        let newcomment = self.commentTextField.text!
        
        
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
        
        let updateValue: FieldValue
        updateValue = FieldValue.arrayUnion([commentname! + " : " + newcomment])

        postRef.updateData(["comments": updateValue])
        
        
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        
        
    }
    
    func dismissKeyboard(){
        // キーボードを閉じる
        view.endEditing(true)
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

