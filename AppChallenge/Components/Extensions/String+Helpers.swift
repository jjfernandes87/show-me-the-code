//
//  String+Helpers.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 26/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

extension String {
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: self, comment: "")
    }
}
