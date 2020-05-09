//
//  ExtensionString.swift
//  MultiLanguage
//
//  Created by Alireza Moradi on 2/20/1399 AP.
//  Copyright © 1399 Alireza Moradi. All rights reserved.
//

import Foundation

extension String {
    
    public var localizedText: String {
        get {
            let language = UserDefaults.standard.array(forKey: "AppleLanguages")
            let defaultLanguage = "en"
            let resource = language?.first as? String ?? defaultLanguage
            guard let path = Bundle.main.path(forResource: resource, ofType: "lproj") else { return self }
            guard let bundleName = Bundle(path: path) else { return self }
            return NSLocalizedString(self, tableName: nil, bundle: bundleName, value: "", comment: "")
        }
    }

    
}

