//
//  XcodeUpdatesListView.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 15/11/19.
//  Copyright © 2019 Fabrício Masiero. All rights reserved.
//

import SwiftUI

struct XcodeUpdatesListView: View {
    
    let ide: IDE
    
    var body: some View {
        HStack {
            Spacer()
            ImageXcodeView(imageName: "")

            InfoView(name: ide.name, releaseDate: "", version: ide.version.number!, build: ide.version.build!)
            
            Spacer()
        }
    }
}

struct ImageXcodeView: View {
    
    let imageName: String
    
    var body: some View {
        Image("xcode_icon")
    }
}

struct InfoView: View {
    
    let name: String
    let releaseDate: String
    let version: String
    let build: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Text(releaseDate)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            HStack {
                Text(version)
                Spacer()
                Text(build)
            }
        }
    }
}

//#if DEBUG
//struct XcodeUpdatesListView_Previews: PreviewProvider {
//    static var previews: some View {
//        XcodeUpdatesListView(ide: testData)
//    }
//}
//#endif
