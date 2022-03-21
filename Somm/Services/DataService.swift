import Foundation
import Combine

class DataService : ServiceProtocol {
    
    func getData(_ search:String) -> AnyPublisher<[Wine], Error> {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.dev.bethesomm.com"
        components.path = "/api/knowledge/wine"
        components.queryItems = [URLQueryItem(name: "search", value: search)]
        
        let subscription = URLSession.shared.dataTaskPublisher(for: components.url!)
        .map{ $0.data }
        .decode(type: [Wine].self, decoder: JSONDecoder())
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
        
        return subscription
    }
}
