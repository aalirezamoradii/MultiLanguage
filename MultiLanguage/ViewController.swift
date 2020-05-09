//
//  ViewController.swift
//  MultiLanguage
//
//  Created by Alireza Moradi on 2/20/1399 AP.
//  Copyright © 1399 Alireza Moradi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var btnChangeLanguage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    func setView() {
        lblTitle.text = "title".localizedText
        lblText.text = "text".localizedText
        btnChangeLanguage.setTitle("btn".localizedText, for: .normal)
    }
    func initViewControler() {
        let appDelegate = UIApplication.shared
        let viewController = storyboard?.instantiateInitialViewController()
        appDelegate.windows.first?.rootViewController = viewController
    }
    @IBAction func btnAction(_ sender: UIButton) {
        let language = LocalizationSystem.instance.getLanguage()
        switch language {
        case .English:
            LocalizationSystem.instance.setLanguage(language: .Persian)
        case .Persian:
            LocalizationSystem.instance.setLanguage(language: .English)
        }
        initViewControler()
    }
    
    
}

