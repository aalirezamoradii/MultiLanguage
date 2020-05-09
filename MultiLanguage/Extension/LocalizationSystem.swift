//
//  LocalizationSystem.swift
//  MultiLanguage
//
//  Created by Alireza Moradi on 2/20/1399 AP.
//  Copyright © 1399 Alireza Moradi. All rights reserved.
//

import UIKit

class LocalizationSystem:NSObject {
    
    var bundle: Bundle!
    
    static let instance: LocalizationSystem = LocalizationSystem()

    override init() {
        super.init()
        bundle = Bundle.main
    }
    
    func localizedStringForKey(key:String, comment:String) -> String {
        return bundle.localizedString(forKey: key, value: comment, table: nil)
    }
    
    func localizedImagePathForImg(imagename:String, type:String) -> String {
        guard let imagePath =  bundle.path(forResource: imagename, ofType: type) else {
            return ""
        }
        return imagePath
    }
    
    //MARK:- setLanguage
    // Sets the desired language of the ones you have.
    // If this function is not called it will use the default OS language.
    // If the language does not exists y returns the default OS language.
    func setLanguage(language:Language) {
        switch language {
        case .English:
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        case .Persian:
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
        var appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as? [String]
        appleLanguages?.remove(at: 0)
        appleLanguages?.insert(language.rawValue, at: 0)
        UserDefaults.standard.set(appleLanguages, forKey: "AppleLanguages")
        UserDefaults.standard.synchronize() //needs restrat
        
        if let languageDirectoryPath = Bundle.main.path(forResource: language.rawValue, ofType: "lproj")  {
            bundle = Bundle.init(path: languageDirectoryPath)
        } else {
            resetLocalization()
        }
    }
    
    //MARK:- resetLocalization
    //Resets the localization system, so it uses the OS default language.
    func resetLocalization() {
        bundle = Bundle.main
    }
    
    //MARK:- getLanguage
    // Just gets the current setted up language.
    func getLanguage() -> Language {
        let appleLanguages = UserDefaults.standard.object(forKey: "AppleLanguages") as? [String]
        let prefferedLanguage = appleLanguages?[0]
        return prefferedLanguage == "en" ? .English : .Persian
    }
    
}
