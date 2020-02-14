//
//  XcodeUpdateRow.swift
//  XcodeUpdates
//
//  Created by Fabrício Masiero on 03/02/20.
//  Copyright © 2020 Fabrício Masiero. All rights reserved.
//

import SwiftUI
import Foundation

struct XcodeUpdateRow: View {
    
    let ide: IDE
    
    var body: some View {
        HStack {
            Spacer()
            ImageXcodeView(imageName: ide.image())
            Divider()
            InfoView(name: ide.standardName(), releaseDate: ide.releaseDate(), version: ide.version.number, build: ide.version.build)
            Spacer()
        }
    }
}
struct ImageXcodeView: View {
    
    let imageName: String
    
    var body: some View {
        Image(imageName).resizable().frame(width: 80.0, height: 80.0)
    }
}

struct InfoView: View {
    
    let name: String
    let releaseDate: String
    let version: String?
    let build: String?
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(name)
                .font(.system(size: 15.0))
                .fontWeight(.medium)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            Spacer()
                
            Text(releaseDate)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 14.0))
            HStack {
                version.map {
                    Text($0)
                        .font(.system(size: 15.0))
                        .fontWeight(.medium)
                }
                Spacer()
                build.map {
                    Text($0)
                        .font(.system(size: 13.0))
                }
            }
        }
    }
}


#if DEBUG
struct XcodeUpdateRow_Previews: PreviewProvider {
    static var previews: some View {
        XcodeUpdateRow(ide: IDE(compilers: nil, requires: "10.2", date: ReleaseDate(year: 2019, month: 12, day: 12), links: nil, version: Version(number: "10", build: "1", release: Release(gm: true, beta: 3, gmSeed: 2)), sdks: nil, name: "Xcode 11.4"))
    }
}
#endif

