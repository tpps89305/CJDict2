//
//  CollectionsView.swift
//  iosCJDict
//
//  Created by 楊朝富 on 2023/5/31.
//  Copyright © 2023 Dispy. All rights reserved.
//

import SwiftUI

struct CollectionsView: View {
    private var number = 0
    var body: some View {
        NavigationView {
            List(content: {
                Text("Hello")
            })
            .navigationTitle("收藏簿")
        }
    }
}

struct CollectionsView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionsView()
    }
}
