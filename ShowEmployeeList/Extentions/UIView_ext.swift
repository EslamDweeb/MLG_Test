//
//  UIView_ext.swift
//  ShowEmployeeList
//
//  Created by eslam dweeb on 18/01/2023.
//

import UIKit

extension UIView {
    /* The color of the shadow. Defaults to opaque black. Colors created
     * from patterns are currently NOT supported. Animatable. */
    static func getIdentifier () -> String  {
        return String(describing: self )
    }
}
