//
//  SearchSpec.swift
//  masTests
//
//  Created by Ben Chatelain on 2018-12-28.
//  Copyright © 2018 mas-cli. All rights reserved.
//

import Nimble
import Quick

@testable import mas

public class SearchSpec: QuickSpec {
    override public func spec() {
        let storeSearch = StoreSearchMock()

        beforeSuite {
            Mas.initialize()
        }
        describe("search command") {
            beforeEach {
                storeSearch.reset()
            }
            it("can find slack") {
                let mockResult = SearchResult(
                    trackId: 1111,
                    trackName: "slack",
                    trackViewUrl: "mas preview url",
                    version: "0.0"
                )
                storeSearch.apps[mockResult.trackId] = mockResult
                expect {
                    try Mas.Search.parse(["slack"]).run(storeSearch: storeSearch)
                }
                .toNot(throwError())
            }
            it("fails when searching for nonexistent app") {
                expect {
                    try Mas.Search.parse(["nonexistent"]).run(storeSearch: storeSearch)
                }
                .to(throwError(MASError.noSearchResultsFound))
            }
        }
    }
}
