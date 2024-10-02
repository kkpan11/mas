//
//  SignInSpec.swift
//  masTests
//
//  Created by Ben Chatelain on 2018-12-28.
//  Copyright © 2018 mas-cli. All rights reserved.
//

import Nimble
import Quick

@testable import mas

// Deprecated test
public class SignInSpec: QuickSpec {
    override public func spec() {
        beforeSuite {
            Mas.initialize()
        }
        // account command disabled since macOS 10.13 High Sierra https://github.com/mas-cli/mas#%EF%B8%8F-known-issues
        xdescribe("signin command") {
            xit("signs in") {
                expect {
                    try Mas.SignIn.parse(["", ""]).run()
                }
                .toNot(throwError())
            }
        }
    }
}
