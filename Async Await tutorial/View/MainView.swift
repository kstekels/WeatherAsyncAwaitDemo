//
//  ContentView.swift
//  Async Await tutorial
//
//  Created by karlis.stekels on 31/01/2023.
//

import SwiftUI

struct MainView: View {
    
    @State private var location: String = ""
    @State private var temp: Double = 0.0
    @State private var asyncVM = AsyncViewModel()
    
    var body: some View {
        VStack {
            TextField("Forecast for where?", text: $location)
                .frame(alignment: .center)
                .padding(5)
                .onSubmit() {
                    Task {
                        temp = await asyncVM.executeSearch(for: location)
                    }
                }
                .background(.white)
                .border(.secondary)
                .foregroundColor(.blue)
            
            Text(location)
                .foregroundColor(.blue)
                .padding(.vertical)
            Text("The temperature is \(temp)")
            Spacer()
        }
        .frame(width: 250, height: 300, alignment: .center)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
