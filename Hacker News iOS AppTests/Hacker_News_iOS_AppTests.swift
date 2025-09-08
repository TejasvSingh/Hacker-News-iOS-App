//
//  Hacker_News_iOS_AppTests.swift
//  Hacker News iOS AppTests
//
//  Created by Tejasv Singh on 8/22/25.
//

import XCTest
@testable import Hacker_News_iOS_App

final class Hacker_News_iOS_AppTests: XCTestCase {
    var loginViewModel: LoginViewModel!
    var objNewsViewModel : NewsListViewModel?
    override func setUpWithError() throws {
        objNewsViewModel = NewsListViewModel()
        objNewsViewModel?.stories = []
        loginViewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        objNewsViewModel = nil
        loginViewModel = nil
    }

    func testGetCount() {
        objNewsViewModel?.stories = []
        XCTAssertEqual(objNewsViewModel?.getStoryCount(), 0)
        
        objNewsViewModel?.stories = [.init(title: "Show HN: Draw a fish and watch it swim with the others", points: 813, comments: 211, author: "halifax", hoursAgo: 6)]
        XCTAssertEqual(objNewsViewModel?.getStoryCount(), 1)
    }
    
    func testGetNews() {
        objNewsViewModel?.stories = [.init(title: "Show HN: Draw a fish and watch it swim with the others", points: 813, comments: 211, author: "halifax", hoursAgo: 6)]
        XCTAssertEqual(objNewsViewModel?.getStory(at: 0).comments, 211)
    }

        func testValidLoginTypical() throws {
            let result = loginViewModel.login(name: "Alice12", password: "abcde12")
            XCTAssertEqual(result, true)
        }

        func testValidLoginAtLowerBounds() throws {
            let result = loginViewModel.login(name: "User5", password: "pass5")
            XCTAssertEqual(result, true)
        }

        func testValidLoginAtUpperBounds() throws {
            let username = String(repeating: "u", count: 14)
            let password = String(repeating: "p", count: 9)
            let result = loginViewModel.login(name: username, password: password)
            XCTAssertEqual(result, true)
        }

        func testInvalidUsernameTooShort() throws {
            let result = loginViewModel.login(name: "Abcd", password: "valid55")
            XCTAssertEqual(result, false)
        }

        func testInvalidUsernameTooLong() throws {
            let longUser = String(repeating: "a", count: 15)
            let result = loginViewModel.login(name: longUser, password: "valid55")
            XCTAssertEqual(result, false)
        }

        func testInvalidPasswordTooShort() throws {
            let result = loginViewModel.login(name: "ValidU", password: "1234")
            XCTAssertEqual(result, false)
        }

        func testInvalidPasswordTooLong() throws {
            let result = loginViewModel.login(name: "ValidU", password: "abcdefghij")
            XCTAssertEqual(result, false)
        }

        func testBothInvalidTooShort() throws {
            let result = loginViewModel.login(name: "Abcd", password: "1234")
            XCTAssertEqual(result, false)
        }

        func testUsernameValidPasswordInvalid() throws {
            let result = loginViewModel.login(name: "UserOK", password: "0123456789")
            XCTAssertEqual(result, false)
        }

        func testUsernameInvalidPasswordValid() throws {
            let result = loginViewModel.login(name: String(repeating: "x", count: 15), password: "pass567")
            XCTAssertEqual(result, false)
        }

        func testUsernameExactly4CharactersFails() throws {
            let result = loginViewModel.login(name: "Four", password: "pass67")
            XCTAssertEqual(result, false)
        }

        func testPasswordExactly10CharactersFails() throws {
            let result = loginViewModel.login(name: "UserOK", password: "passw0rd10")
            XCTAssertEqual(result, false)
        }


        func testEmptyStringsFail() throws {
            let result = loginViewModel.login(name: "", password: "")
            XCTAssertEqual(result, false)
        }

        func testWhitespaceOnlyCurrentBehavior() throws {
            let name = String(repeating: " ", count: 5)
            let pass = String(repeating: " ", count: 5)
            let result = loginViewModel.login(name: name, password: pass)
            XCTAssertEqual(result, true)
        }
    }


