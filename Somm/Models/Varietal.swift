import Foundation

struct Varietal: Codable {
    let id: Int
    let label: String
    let shortDescription, fullDescription: String?
    let bottleShape: String
    let color, style: Color
}
