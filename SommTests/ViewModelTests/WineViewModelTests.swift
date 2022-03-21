import XCTest

@testable import Somm

class WineViewModelTests: XCTestCase {
    
    func testCanMapValidModelToViewModel() throws {
        let wine = createWine()
        
        let wineViewModel = WineVM(wine: wine)
        XCTAssert(wineViewModel.name == wine.name)
        XCTAssert(wineViewModel.images.count == 1)
        XCTAssert(wineViewModel.images[0].url ==  "https://directus.dev.bethesomm.com/assets/3e04a29c-30ac-4547-874e-8e3a7f4cdda1")
        XCTAssert(wineViewModel.varietalLabel == "Cabernet Sauvignon")
        XCTAssert(wineViewModel.varietalColor == "Red")
        XCTAssert(wineViewModel.producerName == "Excelsior Estate")
        XCTAssert(wineViewModel.region == "Western Cape, Breede River Valley")
        XCTAssert(wineViewModel.regionCountry == "South Africa")
    }
    
    func testCanMapWineWithNilValuesToViewModel() throws {
        let wine = Wine(id: 1, name: "Circus Malbec", varietal: Varietal(id: 1, label: "Malbec", shortDescription: nil, fullDescription: nil, bottleShape: "bordeaux", color: Color(slug: "red", name: "Red"), style: Color(slug: "still", name: "Still")), region: nil, images: nil, producer: nil)
        
        let wineViewModel = WineVM(wine: wine)
        XCTAssert(wineViewModel.name == wine.name)
        
        XCTAssert(wineViewModel.images.count == 1)
        XCTAssert(wineViewModel.images[0].url ==  wineViewModel.defaultImageUrl)
        
        XCTAssert(wineViewModel.name == wine.name)
        XCTAssert(wineViewModel.varietalLabel == "Malbec")
        XCTAssert(wineViewModel.varietalColor == "Red")
        
        XCTAssert(wineViewModel.producerName == "Unknown Producer")
        XCTAssert(wineViewModel.region == "Unknown Region")
        XCTAssert(wineViewModel.regionCountry == "Unknown Country")
    }
    
    func testCanMapEmptyImageArrayToDefaultImage() throws {
        let wine = Wine(id: 1, name: "Circus Malbec", varietal: Varietal(id: 1, label: "Malbec", shortDescription: nil, fullDescription: nil, bottleShape: "bordeaux", color: Color(slug: "red", name: "Red"), style: Color(slug: "still", name: "Still")), region: nil, images: [], producer: nil)
        
        let wineViewModel = WineVM(wine: wine)
        
        XCTAssert(wineViewModel.images.count == 1)
        XCTAssert(wineViewModel.images[0].url ==  wineViewModel.defaultImageUrl)
    }
    
    func createWine() -> Wine {
        return Wine(id: 3, name: "Excelsior Estate Cabernet Sauvignon Robertson", varietal: Varietal(id: 3, label: "Cabernet Sauvignon", shortDescription: "Big, bold juicy and rich", fullDescription: "Cabernet Sauvignon is a thick skinned red grape variety native to Southern France but grown all over the world. Infact Cabernet Sauvignon is the most planted red grape variety in the world. Loved for it's big bold flavours and powerful structure. Cabernet Sauvignon also tends to be a very age worthy style of wine. \n\nPairs well with rich meats such as; Steak and Venison.\n\nIf you like Red Bordeaux, Shiraz or Malbec you will enjoy Cabernet Sauvignon.", bottleShape: "bordeaux", color: Color(slug: "red", name: "Red"), style: Color(slug: "still", name: "Still")), region: Region(id: 246, name: "Western Cape, Breede River Valley", country: Country(id: "za", name: "South Africa")), images: [Image(id: "3e04a29c-30ac-4547-874e-8e3a7f4cdda1", url: "https://directus.dev.bethesomm.com/assets/3e04a29c-30ac-4547-874e-8e3a7f4cdda1")], producer: Producer(id: 3714, name: "Excelsior Estate"))
    }
    
}
