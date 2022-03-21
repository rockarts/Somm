import Foundation
import Combine

protocol ServiceProtocol {
    func getData(_ search:String) -> AnyPublisher<[Wine], Error>
}
