//
//  KeyChainExt.swift
//  keyChainMIT
//
//  Created by Hamza Mustafa on 25/11/2020.
//

import Foundation

fileprivate let EmailKey = "email"
fileprivate let PasswordKey = "password"

extension KeychainWrapper {
    
    func cacheUsername(email: String, password: String) {
        KeychainWrapper.standard.set(email, forKey: EmailKey)
        KeychainWrapper.standard.set(password, forKey: PasswordKey)
    }
    
    func cachedUsername() -> (String?, String?) {
        return (self.string(forKey: EmailKey), self.string(forKey: PasswordKey))
    }
    
    func purgeUsernameFromCache() {
        KeychainWrapper.standard.removeObject(forKey: EmailKey)
        KeychainWrapper.standard.removeObject(forKey: PasswordKey)
    }
}
