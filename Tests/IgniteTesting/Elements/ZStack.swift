//
//  ZStack.swift
//  Ignite
//  https://www.github.com/twostraws/Ignite
//  See LICENSE for license information.
//

import Foundation
import Testing

@testable import Ignite

/// Tests for the `ZStack` element.
@Suite("ZStack Tests")
@MainActor
class ZStackTests: IgniteTestSuite {
    static let alignments: [Alignment] = [
        .top, .topLeading, .topTrailing,
        .leading, .center, .trailing,
        .bottom, .bottomLeading, .bottomTrailing
    ]

    @Test("ZStack with elements")
    func basicZStack() async throws {
        let element = ZStack {
            Label(text: "Top Label")
            Label(text: "Bottom Label")
        }
        let output = element.render()

        #expect(output == """
        <div style="display: grid">\
        <label style="position: relative; display: grid; grid-area: 1/1; \
        z-index: 0; align-self: center; justify-self: center">Top Label</label>\
        <label style="position: relative; display: grid; grid-area: 1/1; \
        z-index: 1; align-self: center; justify-self: center">Bottom Label</label>\
        </div>
        """)
    }
}
