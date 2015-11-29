//
//  ConversationViewController.swift
//  CloudIMTest
//
//  Created by Benjamin on 11/23/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ConversationViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setMessageAvatarStyle(.USER_AVATAR_CYCLE)
    }
}
