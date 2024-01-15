/*
 
 // json listemiz
 "\(Constants.url)/main/chuck.json"
 
 //g üzelleştirici
 https://codebeautify.org/jsonviewer
 
 // otomatik medel oluşturucu
 //json to swift yada json 2 siwft ile
 //popülerleri https://quicktype.io
 //hocanın kullandığı https://www.json4swift.com
 
 
 
 */

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var jokesVM = JokesViewModel()
    
    var body: some View {
        NavigationView {
            List (jokesVM.jokes){ element in
                Text(element.joke)
            }
            .toolbar {
                Button(action: addJoke) {
                    Text("Get New Joke")
                }
            }
            .navigationTitle("Jokes App")
        }
    }
    
    func addJoke() {
        jokesVM.getJokes(count: 1)
    }
    
}

#Preview {
    ContentView()
}
