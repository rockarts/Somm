import Foundation

struct Wine: Codable, Identifiable {
    let id: Int
    let name: String
    let varietal: Varietal
    let region: Region?
    let images: [Image]?
    let producer: Producer?
}
