//
//  UserInfoPage.swift
//  Uber
//
//  Created by Benjamin on 1/3/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

import UIKit

class UserInfoPage: FxBasePage, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var avatar: UIImageView?
    @IBOutlet var backAvatarView: UIView?
    @IBOutlet var backUserView: UIView?
    @IBOutlet var editBtn: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "建立基本资料"
        setNavigationItem("Back.png", selector: "doBack", isRight: false)
        setNavigationItem("下一步", selector: "doNext", isRight: true)
        FxUtils.setCornerRadius(backAvatarView!, radius: 5.0)
        FxUtils.setCornerRadius(backUserView!, radius: 5.0)
    }
    
    override func doBack() {
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func doNext() {
        let addPayPage = AddPayPage()
        self.navigationController?.pushViewController(addPayPage, animated: true)
    }
    
    @IBAction func doSetAvatar(sender: UIButton) {
        let page = UIImagePickerController()
        //从相册选择照片
        page.sourceType = .PhotoLibrary
        page.delegate = self
        self.presentViewController(page, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        avatar?.image = image
        editBtn?.setTitle("", forState: .Normal)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
