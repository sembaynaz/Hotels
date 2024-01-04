    //
    //  ContentView.swift
    //  hotels
    //
    //  Created by Nazerke Sembay on 03.01.2024.
    //

import SwiftUI

struct MainView: View {
    
    var body: some View {
        ScrollView {
            MainInfoAboutHotel().cornerRadius(12)
            DescriptionOfHotel().cornerRadius(12)
        }
        .background(Color(red: 246/255, green: 246/255, blue: 249/255))
    }
}

struct DescriptionOfHotel: View {
    var body: some View {
        VStack {
            Text("Об отеле")
                .font(.custom("SFProDisplay-Semibold", size: 22))
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Peculiarities()
            
            Description(description: "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!").padding(.top, 12)
        }
        .padding(16)
        .background(Color.white)
        .ignoresSafeArea(.all)
    }
}

struct Description: View {
    var description: String
    
    var body: some View {
        Text("\(description)")
            .font(.custom("SFProDisplay-Regular", size: 16))
            .foregroundColor(Color.black)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Peculiarities: View {
    let items: [String] = ["3-я линия", "Платный Wi-Fi в фойе", "30 км до аэропорта", "1 км до пляжа"]
    
    var body: some View {
        FlexibleView(
            availableWidth: UIScreen.main.bounds.width - 32, data: items,
            spacing: 8,
            alignment: .leading
        ) { item in
            CollectionViewCell(cell: item)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CollectionViewCell: View {
    let cell: String
    
    var body: some View {
        Text(cell)
            .lineLimit(0)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color(red: 251/255, green: 251/255, blue: 252/255))
            .cornerRadius(5)
            .foregroundColor(Color(red: 130/255, green: 135/255, blue: 150/255))
    }
}

struct MainInfoAboutHotel: View {
    var body: some View {
        VStack {
            Spacer().frame(height: 3)
            TitleOfPage()
            Spacer().frame(height: 16)
            ImagePager(totalPages: 3)
            Rating()
            NameOfHotel(name: "Steigenberger Makadi")
            Location(location: "Madinat Makadi, Safaga Road, Makadi Bay, Египет").frame(height: 8)
            Price(minimalPrice: "134 673", priceForIt: "за тур с перелётом")
        }
        .padding(16)
        .background(Color.white)
        .ignoresSafeArea(.all)
    }
}

struct Price: View {
    var minimalPrice: String
    var priceForIt: String
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            Text("от \(minimalPrice) ₽")
                .font(.custom("SFProDisplay-Semibold", size: 30))
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("\(priceForIt)")
                .font(.custom("SFProDisplay-Regular", size: 14))
                .foregroundColor(Color(red: 130/255, green: 135/255, blue: 150/255))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 3)
        }
    }
}

struct Location: View {
    var location: String
    
    var body: some View {
        Text("\(location)")
            .font(.custom("SFProDisplay-Medium", size: 14))
            .foregroundColor(Color(red: 13/255, green: 114/255, blue: 1))
            .frame(maxWidth: .infinity, alignment: .leading)
            .lineLimit(2)
    }
}

struct NameOfHotel: View {
    var name: String
    
    var body: some View {
        Text("\(name)")
            .font(.custom("SFProDisplay-Medium", size: 22))
            .foregroundColor(Color.black)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ImagePager: View {
    var totalPages: Int
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TabView(selection: $currentPage) {
                ForEach(0..<totalPages) { index in
                    Image("image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .tag(index)
                        .cornerRadius(15)
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .frame(width: UIScreen.main.bounds.width - 32, height: 257)
            .overlay(alignment: .bottom) {
                Pager(currentPage: $currentPage, totalPages: totalPages)
                    .padding(8)
            }
            .onAppear {
                UIPageControl.appearance().currentPageIndicatorTintColor = .clear
                UIPageControl.appearance().pageIndicatorTintColor = .clear
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TitleOfPage: View {
    var body: some View {
        Text("Отель")
            .font(.custom("SFProDisplay-Medium", size: 18))
            .foregroundColor(Color.black)
            .frame(maxWidth: .infinity, alignment: .center)
    }
}

struct Rating: View {
    var body: some View {
        HStack(spacing: 2) {
            Spacer().frame(width: 10)
            Image("star").resizable().aspectRatio(contentMode: .fit).frame(width: 15, height: 15)
            Text("5 Превосходно").font(.custom("SFProDisplay-Medium", size: 16)).foregroundColor(Color(red: 1, green: 168/255, blue: 0))
            Spacer().frame(width: 10)
        }
        .padding(.vertical, 5)
        .background(Color(red: 1, green: 199/255, blue: 0, opacity: 0.2))
        .cornerRadius(5)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Pager: View {
    @Binding var currentPage: Int
    var totalPages: Int
    
    var body: some View {
        
        VStack {
            Spacer().frame(height: 5)
            
            HStack(spacing: 5) {
                ForEach(0..<totalPages) { page in
                    Circle()
                        .fill(currentPage == page ? Color.black : Color.gray)
                        .frame(width: 7, height: 7)
                        .opacity(currentPage == page ? 1.0 : 0.5)
                }
            }
            .padding(.horizontal, 10)
            
            Spacer().frame(height: 5)
        }
        .background(Color.white)
        .cornerRadius(5)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Hashable {
    let availableWidth: CGFloat
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content
    @State var elementsSize: [Data.Element: CGSize] = [:]
    
    var body: some View {
        VStack(alignment: alignment, spacing: spacing) {
            ForEach(computeRows(), id: \.self) { rowElements in
                HStack(spacing: spacing) {
                    ForEach(rowElements, id: \.self) { element in
                        content(element)
                            .fixedSize()
                            .readSize { size in
                                elementsSize[element] = size
                            }
                    }
                }
            }
        }
    }
    
    func computeRows() -> [[Data.Element]] {
        var rows: [[Data.Element]] = [[]]
        var currentRow = 0
        var remainingWidth = availableWidth
        
        for element in data {
            let elementSize = elementsSize[element, default: CGSize(width: availableWidth, height: 1)]
            
            if remainingWidth - (elementSize.width + spacing) >= 0 {
                rows[currentRow].append(element)
            } else {
                currentRow = currentRow + 1
                rows.append([element])
                remainingWidth = availableWidth
            }
            
            remainingWidth = remainingWidth - (elementSize.width + spacing)
        }
        
        return rows
    }
}

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

private struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}
