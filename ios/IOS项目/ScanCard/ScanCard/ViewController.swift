//
//  ViewController.swift
//  ScanCard
//
//  Created by Benjamin on 11/26/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CardIOPaymentViewControllerDelegate {

    @IBOutlet weak var labelResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //加速后面的扫描
        CardIOUtilities.preload()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //begin scan
    @IBAction func startScan(sender: UIButton) {
        let cardVC = CardIOPaymentViewController(paymentDelegate: self)
        cardVC.modalPresentationStyle = .FormSheet
        presentViewController(cardVC, animated: true, completion: nil)
    }
    
    //用户取消识别
    func userDidCancelPaymentViewController(paymentViewController: CardIOPaymentViewController!) {
        labelResult.text = "已取消扫描"
        paymentViewController.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //用户确认扫描信息
    func userDidProvideCreditCardInfo(cardInfo: CardIOCreditCardInfo!, inPaymentViewController paymentViewController: CardIOPaymentViewController!) {
        if let card = cardInfo {
            labelResult.text = "卡号:\(card.cardNumber)\n过期年月:\(card.expiryYear)年\(card.expiryMonth)月\nCVV:\(card.cvv)"
        }
        paymentViewController.dismissViewControllerAnimated(true, completion: nil)
    }

}

