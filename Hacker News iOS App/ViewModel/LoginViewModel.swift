//
//  LoginViewModel.swift
//  Hacker News iOS App
//
//  Created by Tejasv Singh on 9/4/25.
//


import Foundation

final class LoginViewModel {
    func login(_ name: String?,_ password: String?) -> Bool {
        let validUsername = name?.count ?? 0 > 4 && name?.count ?? 0 < 15
        let validPassword = password?.count ?? 0 > 4 && password?.count ?? 0 < 10
        return validUsername && validPassword
    }
}
