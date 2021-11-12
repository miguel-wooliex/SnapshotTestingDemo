//
//  ItemViewTests.swift
//  SnapshotTestingDemoTests
//
//  Created by Miguel de Elias on 12/11/21.
//

import XCTest
import SnapshotTesting
@testable import SnapshotTestingDemo

final class ItemViewTests: XCTestCase {

    private
    enum Constants {
        static let size: CGSize = .init(width: 383.0, height: 160.0)
    }

    private var view: ItemView!

    override class func setUp() {
        SnapshotTesting.diffTool = "ksdiff"
    }

    override func setUp() {
        view = ItemView()
    }

    func testItemViewImage() {
        view.bind(.makeDiffMock()) // makeDiffMock()
        assertSnapshot(matching: view, as: .image(size: Constants.size), )
    }

    func testItemViewRecursiveDescription() {
        view.bind(.makeMock())
        assertSnapshot(matching: view, as: .recursiveDescription)
    }

    func testViewModel() {
        let viewModel: ItemViewModel = .makeMock() // makeDiffMock()
        assertSnapshot(matching: viewModel, as: .dump) // .dump
    }
}
