//
// GeneCrucean.swift
//

import SwiftUI

struct ContentView: View {
    
    let gecko = CoinGecko(api: .main)
    
    @EnvironmentObject var output: Output
    @State var toggleModal = false
    
    var body: some View {
        Form {
            Section(header: Text("Network Calls")) {
                Group {
                    Button("Ping") {
                        ping()
                    }
                }
            }
        }
        .sheet(isPresented: $toggleModal,
               onDismiss: dismissSheet,
               content: {
                ResultView()
               }
        )
    }
    
    // MARK: - Result Sheet
    
    func dismissSheet() {
        toggleModal = false
    }
    
    // MARK: - Calls
    
    func ping() {
        gecko.ping() { (result) in
            switch result {
            case .failure(let error):
                print(error)
                if case let APIError.generic(message) = error {
                    DispatchQueue.main.async {
                        output.value = message
                    }
                    toggleModal.toggle()
                }
            case .success(let response):
                if let value = response.value.asDictionary {
                    print(value)
                    DispatchQueue.main.async {
                        output.value = value.convertDictToJsonString()
                    }
                    toggleModal.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
