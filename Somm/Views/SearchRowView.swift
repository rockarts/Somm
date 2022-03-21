import SwiftUI

struct SearchRowView: View {
    var wine: WineVM
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: (wine.images[0].url))!) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .padding(.horizontal)
                .aspectRatio(contentMode: .fill)
                .frame(width: 75, height: 75)
                .clipShape(Circle())
                .shadow(color: .gray, radius: 4, x: -2, y: 1)
                .overlay(Circle().stroke(.black, lineWidth: 3))
            VStack {
                Text(wine.name).font(.headline)    .frame(maxWidth: .infinity, alignment: .leading)
                HStack{
                    Text(wine.varietalLabel)
                    Text(wine.varietalColor)
                }    .frame(maxWidth: .infinity, alignment: .leading)
                Text(wine.producerName).frame(maxWidth: .infinity, alignment: .leading)
                HStack{
                    Text(wine.region)
                    Text(wine.regionCountry)
                }.frame(maxWidth: .infinity, alignment: .leading)
            }.frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct SearchRowView_Previews: PreviewProvider {
    static var previews: some View {
        
        SearchRowView(wine: WineVM(wine: getData()[0]))
    }
    
    static func getData() -> [Wine] {
        return [
            Wine(id: 1, name: "Bello Megahertz Cabernet Sauvignon", varietal: Varietal(id: 1, label: "Cabernet Sauvignon", shortDescription: "Big, bold juicy and rich", fullDescription: "Cabernet Sauvignon is a thick skinned red grape variety native to Southern France but grown all over the world. Infact Cabernet Sauvignon is the most planted red grape variety in the world. Loved for it's big bold flavours and powerful structure. Cabernet Sauvignon also tends to be a very age worthy style of wine. \n\nPairs well with rich meats such as; Steak and Venison.\n\nIf you like Red Bordeaux, Shiraz or Malbec you will enjoy Cabernet Sauvignon.", bottleShape: "bordeaux", color: Color(slug: "red", name: "red"), style: Color(slug: "still", name: "Still")), region: Region(id: 3, name: "California", country: Country(id: "us", name: "USA")), images: [Image(id: "74e91d7c-f450-4414-b197-8815ece1f4c6", url: "https://directus.dev.bethesomm.com/assets/74e91d7c-f450-4414-b197-8815ece1f4c6")], producer: nil),
            Wine(id: 2, name: "Mission Hill Cabernet Merlot Five Vineyds", varietal: Varietal(id: 2, label: "Merlot", shortDescription: "Full round and plump. Floral and smooth", fullDescription: "Merlot is a red grape variety native to France but grown all over the world. Merlot is the most widely planted variety in France. Loved for being round, juicy, floral and extremely smooth. It is part of the famous Bordeaux blend, the Meritage blend and also very commonly bottled on it's own.\n\nPairs well with Lamb, Roast Pork and Beef Bourguignon.\n\nIf you like Bordeaux Red, Cabernet Sauvignon or Malbec you will enjoy Merlot.", bottleShape: "bordeaux", color: Color(slug: "red", name: "Red"), style: Color(slug: "still", name: "Still")), region: Region(id: 58, name: "Okanagan, BC", country: Country(id: "ca", name: "Canada")), images: [], producer: Producer(id: 250, name: "Mission Hill")),
            Wine(id: 3, name: "Excelsior Estate Cabernet Sauvignon Robertson", varietal: Varietal(id: 3, label: "Cabernet Sauvignon", shortDescription: "Big, bold juicy and rich", fullDescription: "Cabernet Sauvignon is a thick skinned red grape variety native to Southern France but grown all over the world. Infact Cabernet Sauvignon is the most planted red grape variety in the world. Loved for it's big bold flavours and powerful structure. Cabernet Sauvignon also tends to be a very age worthy style of wine. \n\nPairs well with rich meats such as; Steak and Venison.\n\nIf you like Red Bordeaux, Shiraz or Malbec you will enjoy Cabernet Sauvignon.", bottleShape: "bordeaux", color: Color(slug: "red", name: "Red"), style: Color(slug: "still", name: "Still")), region: Region(id: 246, name: "Western Cape, Breede River Valley", country: Country(id: "za", name: "South Africa")), images: [Image(id: "3e04a29c-30ac-4547-874e-8e3a7f4cdda1", url: "https://directus.dev.bethesomm.com/assets/3e04a29c-30ac-4547-874e-8e3a7f4cdda1")], producer: Producer(id: 3714, name: "Excelsior Estate"))
        ]
    }
}
