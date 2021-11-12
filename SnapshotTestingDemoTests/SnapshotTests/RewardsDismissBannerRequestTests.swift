//
//  RewardsDismissBannerRequestTests.swift
//  SnapshotTestingDemoTests
//
//  Created by Miguel de Elias on 12/11/21.
//

import XCTest
import SnapshotTesting
@testable import SnapshotTestingDemo

final class RewardsDismissBannerRequestTests: XCTestCase {

    var request: RewardsDismissBannerRequest!

    override func setUp() {
        request = RewardsDismissBannerRequest(apiEndpoints: RewardsEndpointsStub(), bannerId: "snapshotID")
    }

    func testRequest() {
        assertSnapshot(matching: request, as: .dump)
    }

    func testRequestWithQuery() {
        assertSnapshot(matching: (base: request, query: request.query), as: .dump)
    }

    func testRequestWithCustomStrategy() {
        assertSnapshot(matching: request, as: .customStrategy)
    }
}

extension Snapshotting where Value == RewardsDismissBannerRequest, Format == String {
    static let customStrategy: Snapshotting<RewardsDismissBannerRequest, String> = SimplySnapshotting.lines.pullback { $0.customDescription }
}

extension RewardsDismissBannerRequest {
    var customDescription: String {
        """
        dump: \(dump(self))
        query: \(query)
        """
    }
}
