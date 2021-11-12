//
//  ItemViewModel+Mock.swift
//  SnapshotTestingDemoTests
//
//  Created by Miguel de Elias on 12/11/21.
//

import Foundation
@testable import SnapshotTestingDemo
import UIKit

extension ItemViewModel {
    static func makeMock(
        image: UIImage = UIImage(named: "point_free_logo")!,
        title: String = "Snapshot Testing Demo",
        body: String = "When an assertion first runs, a snapshot is automatically recorded to disk and the test will fail, printing out the file path of any newly-recorded reference."
    ) -> ItemViewModel {
        .init(image: image, title: title, body: body)
    }

    static func makeDiffMock(
        image: UIImage = UIImage(named: "point_free_logo")!,
        title: String = "Different Snapshot Testing Demo",
        body: String = "When an assertion first runs, a snapshot is automatically recorded to disk and the test will fail, printing out the file path of any newly-recorded reference."
    ) -> ItemViewModel {
        .init(image: image, title: title, body: body)
    }
}
