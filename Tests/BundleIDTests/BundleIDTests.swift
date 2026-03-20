import Foundation
import Testing
@testable import BundleID

struct BundleIDTests {
    @Test
    func fixtureBundleProducesBundleID() throws {
        let bundle = try fixtureBundle()

        let bundleID = bundle.bundleID

        #expect(bundleID.rawValue == "com.inekipelov.bundle-id-fixture")
    }

    @Test
    func rawValueMatchesBundleIdentifier() throws {
        let bundle = try fixtureBundle()
        let bundleIdentifier = try #require(bundle.bundleIdentifier)

        #expect(bundle.bundleID.rawValue == bundleIdentifier)
    }

    @Test
    func repeatedReadsReturnEqualTaggedValues() throws {
        let bundle = try fixtureBundle()

        #expect(bundle.bundleID == bundle.bundleID)
    }

    @Test
    func apiExposesTaggedBundleIDType() throws {
        let bundle = try fixtureBundle()

        #expect(consume(bundle.bundleID) == "com.inekipelov.bundle-id-fixture")
    }

    private func fixtureBundle() throws -> Bundle {
        let bundleURL = try #require(
            Bundle.module.url(forResource: "BundleIDFixture", withExtension: "bundle")
        )
        let bundle = try #require(Bundle(url: bundleURL))

        return bundle
    }

    private func consume(_ bundleID: BundleID) -> String {
        bundleID.rawValue
    }
}
