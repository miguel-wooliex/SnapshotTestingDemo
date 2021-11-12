//
//  MockRewardsEndpoints.swift
//  SnapshotTestingDemoTests
//
//  Created by Miguel de Elias on 12/11/21.
//

import Foundation
@testable import SnapshotTestingDemo

struct RewardsEndpointsStub: RewardsEndpoints {
    let baseURL = URL(string: "test.mobile-api.woolworths.com.au")!
    let rewardsActivityPath = "/zeus/metis/v1/rewards/graphql"
}
