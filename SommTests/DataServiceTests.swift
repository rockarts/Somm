import XCTest
@testable import Somm

class DataServiceTests: XCTestCase {

    func testGetWinesPerformance() throws {
        
        self.measure {
            let dataService = DataService()
            _ = dataService.getData("chat")
        }
    }

}
