//
//  Extension.swift
//  Appetizers
//
//  Created by Rahul Kumar on 30/12/23.
//

import Foundation
import UIKit

extension UIWindow {
    static var current: UIWindow? {
        for scene in UIApplication.shared.connectedScenes {
            guard let windowScene = scene as? UIWindowScene else { continue }
            for window in windowScene.windows {
                if window.isKeyWindow { return window }
            }
        }
        return nil
    }
}


extension UIScreen {
    private static var current: UIScreen {
        UIWindow.current?.screen ?? UIScreen()
    }
    
    static let screenWidth = UIScreen.current.bounds.width
    static let screenHeight = UIScreen.current.bounds.height
}

extension Sequence  {
    func sum<T: AdditiveArithmetic>(_ predicate: (Element) -> T) -> T { reduce(.zero) { $0 + predicate($1) } }
}


extension UserDefaults {
    func deleteUser() {
        removeObject(forKey: AppStorageKey.user)
    }
}
