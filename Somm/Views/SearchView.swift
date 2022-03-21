import SwiftUI

struct SearchView: View {
    @StateObject var oo = SearchObservableObject()
    var body: some View {
        NavigationView {
            VStack {
                Text("Find a wine").font(.title.weight(.bold))
                Text("Start searching for a wine. \n Try: chat, mont, hawk or louis").multilineTextAlignment(.center)
            }.padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.gray)
                .navigationTitle("Search")
        }
        .searchable(text: $oo.searchTerm) {
            ForEach(oo.searchResults) { wine in
                SearchRowView(wine: wine)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
