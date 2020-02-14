//
//  IDEView.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 04/02/20.
//  Copyright © 2020 Fabrício Masiero. All rights reserved.
//

import SwiftUI
import WebKit

struct IDEView: View {
    
    @ObservedObject var viewModel: IDEViewModel
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            IDEHeaderView(ide: viewModel.ide).background(Color.init(red: 240/255, green: 240/255, blue: 240/255))
            WebView(viewModel: WebViewViewModel(releaseNotesUrl: viewModel.ide.links?.notes?.url))
        }.navigationBarTitle("Release Notes").navigationBarItems(trailing: Button(action: {
            guard let stringUrl = self.viewModel.ide.links?.download?.url, let url = URL(string: stringUrl) else { return }
            UIApplication.shared.open(url)
        }, label: { Image("square.and.arrow.down")}))
    }
}

struct IDEHeaderView: View {
    let ide: IDE
    var body: some View {
        VStack {
            Text(ide.fullName())
                .font(.system(size: 15.0))
                .fontWeight(.bold)
            HStack {
                Spacer()
                Text("Build Number: " + (ide.version.build ?? ""))
                    .font(.system(size: 13.0))
                    .fontWeight(.light)
                Spacer()
                Text("Released on " + ide.releaseDate())
                    .font(.system(size: 13.0))
                    .fontWeight(.light)
                Spacer()
            }
            HStack {
                Text("Requires macOS " + ide.requires)
                    .font(.system(size: 13.0))
                    .fontWeight(.light)

            }
        }
        
    }
}

struct WebView: UIViewRepresentable {
    
    let viewModel: WebViewViewModel
    
    func makeUIView(context: Context) -> WKWebView {
        return viewModel.webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        viewModel.request()
    }
}

struct ActivityIndicator: UIViewRepresentable {
    
    @Binding var isAnimating: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
    
}

#if DEBUG
struct IDEView_Previews: PreviewProvider {
    static var previews: some View {
        IDEView(viewModel: IDEViewModel(ide: IDE(compilers: nil, requires: "10.2", date: ReleaseDate(year: 2019, month: 12, day: 12), links: nil, version: Version(number: "10", build: "1", release: Release(gm: true, beta: 3, gmSeed: 2)), sdks: nil, name: "Xcode 11.4")))
    }
}
#endif



