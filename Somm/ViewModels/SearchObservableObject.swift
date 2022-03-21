import Foundation
import Combine

class SearchObservableObject: ObservableObject {
    @Published var searchTerm = ""
    @Published var searchResults:[WineVM] = []
    
    var subscription: Set<AnyCancellable> = []
    private var dataService: ServiceProtocol
    
    init(dataService: ServiceProtocol = DataService()) {
        self.dataService = dataService
        $searchTerm
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map({ (string) -> String? in
                if string.count < 1 {
                    self.searchResults = []
                    return nil
                }
                return string
            })
            .compactMap{ $0 }
            .sink { (_) in
            } receiveValue: { [self] (searchField) in
                searchItems(searchText: searchField)
            }.store(in: &subscription)
    }
    
    private func searchItems(searchText: String) {
        dataService.getData(searchText)
            .sink{ (completed) in
            } receiveValue: { [self] wineList in
                searchResults = wineList.map { WineVM(wine: $0)}
                searchResults = searchResults.filter { (vm) in
                    vm.name.contains(searchText)
                }
            }.store(in: &subscription)
    }
}
