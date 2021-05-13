import XCTest
@testable import FlatMany

import Combine

final class FlatManyTests: XCTestCase {
    func testExample() {
        let sema = DispatchSemaphore(value: 0)
        let task = Just<[Int]>([1, 2, 3])
            .flatMany {
                Just("\($0 * $0)").eraseToAnyPublisher()
            }
            .sink { values in
                XCTAssertEqual(values, [1, 4, 9].map(String.init))
                sema.signal()
            }
        
        sema.wait()
        
        XCTAssertNotNil(task)
    }
}
