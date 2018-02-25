//
//  String+Helpers.swift
//  AppChallenge
//
//  Created by Julio Fernandes on 25/02/18.
//  Copyright © 2018 Julio Fernandes. All rights reserved.
//

import UIKit

extension String {
    
    func makeACall() {
        guard let url = URL(string: "tel://\(self)"), UIApplication.shared.canOpenURL(url) else { print("Generic parser error"); return }
        UIApplication.shared.open(url)
    }
}

