//
//  CategoryFilterPopupView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 29/04/2024.
//

import SwiftUI

struct CategoryFilterPopupView: View {
    
    @Binding var onClickCancelButton: (() -> Void)?
    
    @State var searchText = ""
    @State var selectedIndex = -1
    
    var categories = ["Tictures", "Smokeables", "Vapes", "Tropicals", "Day Dreams", "Balance", "Flowers", "Aligned"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Filters")
                    .font(.customFont(font: .sfPro, style: .bold, size: 22))
                    .foregroundColor(Color(hex: "#221F1F"))
                
                Spacer()
                
                Button(action: {
                    onClickCancelButton?()
                }) {
                    Image(systemName: "multiply")
                        .resizable()
                        .frame(width: 15 ,height: 15)
                        .tint(.black)
                }
                .frame(width: 40 ,height: 40)
//                .background(Color.app)
                .cornerRadius(2)
                
            }.padding(20)
            
            SearchBarView(onClickSearchButton: .constant({
                
            }),onClickFilterButton: .constant({
                
            }), onClicCartButton: .constant({
                
            }), onClickProfileButton: .constant({
                
            }), searchText: $searchText, placeholderText: .constant("Search Category"), isShowFilterButton: false, isShowCartButton: false, isShowProfileButton: false)
            
            List(categories.indices, id: \.self) { index in
                HStack() {
                    Text(categories[index])
                        .font(.customFont(font: .sfPro, style: .regular, size: 16))
                    Spacer()
                }
                .onTapGesture {
                    selectedIndex = index
                }
                .padding([.leading, .trailing], 10)
                .frame(width: (screenWidth - 80) ,height: 32)
                .background(selectedIndex == index ? Color(hex: "#EBF8DF") : .clear)
                .foregroundColor(Color(hex: "#221F1F"))
                .listRowSeparator(.hidden)
                .cornerRadius(2)
            }
            .listStyle(.plain)
            .background(.white)
            
            Button(action: {
                
            }, label: {
                HStack {
                    Spacer()
                    Text("APPLY FILTERS")
                        .foregroundColor(.white)
                        .font(.customFont(font: .sfPro, style: .medium, size: 16))
                    Spacer()
                }
            })
            .frame(width: screenWidth / 2, height: 50)
            .background(Color("buttonColor"))
            .cornerRadius(2)
            .padding([.bottom, .top], 20)
            
        }
        .frame(width: screenWidth - 40, height: screenHeight / 1.5)
        .background(.white)
        .cornerRadius(2)
        .padding(20)
        
    }
}

#Preview {
    CategoryFilterPopupView(onClickCancelButton: .constant(nil))
}


//struct TagViewItem: Hashable {
//    
//    var title: String
//    var isSelected: Bool
//    
//    static func == (lhs: TagViewItem, rhs: TagViewItem) -> Bool {
//        return lhs.isSelected == rhs.isSelected
//    }
//    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(title)
//        hasher.combine(isSelected)
//    }
//}
//
//struct TagView: View {
//    @State var tags: [TagViewItem]
//    @State private var totalHeight = CGFloat.zero       // << variant for ScrollView/List //    = CGFloat.infinity   // << variant for VStack
//    var body: some View {
//        VStack {
//            GeometryReader { geometry in
//                self.generateContent(in: geometry)
//            }
//        }
//        .frame(height: totalHeight)// << variant for ScrollView/List
//        //.frame(maxHeight: totalHeight) // << variant for VStack
//    }
//
//    private func generateContent(in g: GeometryProxy) -> some View {
//        var width = CGFloat.zero
//        var height = CGFloat.zero
//        return ZStack(alignment: .topLeading) {
//            ForEach(tags.indices) { index in
//                item(for: tags[index].title, isSelected: tags[index].isSelected)
//                    .padding([.horizontal, .vertical], 4)
//                    .alignmentGuide(.leading, computeValue: { d in
//                        if (abs(width - d.width) > g.size.width) {
//                            width = 0
//                            height -= d.height
//                        }
//                        let result = width
//                        if tags[index].title == self.tags.last!.title {
//                            width = 0 //last item
//                        } else {
//                            width -= d.width
//                        }
//                        return result
//                    })
//                    .alignmentGuide(.top, computeValue: {d in
//                        let result = height
//                        if tags[index].title == self.tags.last!.title {
//                            height = 0 // last item
//                        }
//                        return result
//                    }).onTapGesture {
//                        tags[index].isSelected.toggle()
//                    }
//            }
//        }.background(viewHeightReader($totalHeight))
//    }
//
//    private func item(for text: String, isSelected: Bool) -> some View {
//        Text(text)
//            .foregroundColor(isSelected ? .red : .blue)
//            .padding()
//            .lineLimit(1)
//            .background(isSelected ? .lightGrey : .gray)
//            .frame(height: 36)
//            .cornerRadius(18)
//            .overlay(Capsule().stroke(.blue, lineWidth: 1))
//    }
//
//    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
//        return GeometryReader { geometry -> Color in
//            let rect = geometry.frame(in: .local)
//            DispatchQueue.main.async {
//                binding.wrappedValue = rect.size.height
//            }
//            return .clear
//        }
//    }
//}
//
//#Preview {
//    TagView(tags: [TagViewItem(title: "aaaa", isSelected: false), TagViewItem(title: "aaaa", isSelected: false), TagViewItem(title: "aaaa", isSelected: false)])
//}
