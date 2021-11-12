//
//  GraphQLRequest.swift
//  SnapshotTestingDemo
//
//  Created by Miguel de Elias on 12/11/21.
//

import Foundation

protocol RewardsEndpoints {
    var baseURL: URL { get }
    var rewardsActivityPath: String { get }
}

struct RewardsDismissBannerRequest {
    let apiEndpoints: RewardsEndpoints
    let bannerId: String

    init(apiEndpoints: RewardsEndpoints, bannerId: String) {
        self.apiEndpoints = apiEndpoints
        self.bannerId = bannerId
    }
}

extension RewardsDismissBannerRequest {
    var query: String {
        """
        mutation($id: ID!) {
          rewardsBannerDismissed(id: $id)
        }
        """
    }

    var baseURL: URL {
        apiEndpoints.baseURL
    }

    var path: String {
        apiEndpoints.rewardsActivityPath
    }

    var variables: Encodable? {
        RewardsBannerDismissVariableModel(id: bannerId)
    }
}

private
struct RewardsBannerDismissVariableModel: Encodable {
    let id: String
}
