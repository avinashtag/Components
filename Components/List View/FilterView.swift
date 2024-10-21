//
//  FilterView.swift
//  Components
//
//  Created by Avinash on 21/10/2024.
//

import SwiftUI

struct Filter: Hashable{
    var category: Category
    var isSelected: Bool
}

struct FilterView: View {
    
    @State private var filtersDataSource: [Filter] = [
        Filter(category: .electronics, isSelected: false),
        Filter(category: .jewelery, isSelected: false),
        Filter(category: .menSClothing, isSelected: false),
        Filter(category: .womenSClothing, isSelected: false)]
    @Environment(\.dismiss) var dismiss

    var didSelectCategory: (([Category])->Void)
    var body: some View {
        NavigationStack {
            List {
                ForEach($filtersDataSource, id: \.self){ filter in
                    HStack{
                        Image(systemName: filter.wrappedValue.isSelected ? "checkmark.square" : "square")
                        Text(filter.wrappedValue.category.rawValue.capitalized)
                            .font(.body)
                    }
                    .onTapGesture {
                        filter.wrappedValue.isSelected.toggle()
                    }
                }
            }
            .navigationTitle("Filter")
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        let selectedCategories = filtersDataSource.filter({$0.isSelected}).compactMap({$0.category})
                        didSelectCategory(selectedCategories)
                        dismiss()
                    }, label: {
                        Text("Done")
                    })
                }

            })
        }

    }
}

#Preview {
    FilterView( didSelectCategory: { _ in
        
    })
}
