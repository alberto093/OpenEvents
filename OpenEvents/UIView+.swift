//
//  UIView+.swift
//  OpenEvents
//
//  Created by Open Reply on 13/05/2020.
//

import UIKit

extension UIView {
    static var identifier: String {
        String(describing: self)
    }
    
    static var nib: UINib {
        UINib(nibName: identifier, bundle: Bundle(for: self))
    }
}
