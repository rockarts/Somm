import XCTest
import Combine
import Somm

@testable import Somm

class SearchObservableObjectTests: XCTestCase {
    
    var subscriptions = Set<AnyCancellable>()
    var dataService:ServiceProtocol?
    var searchObject:SearchObservableObject?
    
    override func setUp() {
        dataService = MockDataService()
        searchObject = SearchObservableObject(dataService: dataService!)
    }
    
    override func tearDown() {
        subscriptions = []
    }
    
    func testWontLoadWinesUnlessSearchTermIsSet() {
        XCTAssert(searchObject!.searchResults.count == 0)
    }
    
    func testFilterWines() {
        //Match Bello in mock data
        searchObject!.searchTerm = "Bello"
        XCTAssert(searchObject!.searchResults.count == 0)
        
        let promise = expectation(description: "Filtering wines")
        searchObject!.$searchResults.sink { (wines) in
            print(wines)
            if wines.count == 1 {
                promise.fulfill()
                
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 1)
    }
}
