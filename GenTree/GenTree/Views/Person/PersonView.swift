//
//  PersonView.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 26.02.2023.
//

import SwiftUI

struct PersonView: View {
    @StateObject var viewModel = PersonViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            avatarView
            infoView
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color.background())
    }
    
    //MARK: - avatarView
    
    var avatarView: some View {
        VStack {
            GeometryReader { reader in
                Image("avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.width, height: reader.frame(in: .global).maxY + 480) // parallax
            }
            .frame(height: 400)
        }
    }
    
    //MARK: - infoView
    
    var infoView: some View {
        VStack(alignment: .leading, spacing: 30) {
            titleView
            placesView
            descriptionView
            voiceView
            galleryView
            biographyView
        }
        .padding(.top, 22)
        .padding(.horizontal, Constants.horizontalInset)
        .padding(.bottom, 180)
        .background(Color.background())
        .cornerRadius(25)
        .offset(y: 100)
    }
    
    //MARK: - titleView
    
    var titleView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Курилова Дарья Кирилловна")
                .font(.semiBold(23))
                .foregroundColor(.text())
                .padding(.trailing, 40)
            
            Text("2 Ноября 1999 - 23 Ноября 2087")
                .font(.semiBold(14))
                .foregroundColor(.accent())
        }
    }
    
    //MARK: - placesView
    
    var placesView: some View {
        HStack(alignment: .top, spacing: 25) {
            Place(title: .cityOfBirth, place: "д. Илькино, Владимирская область")
            Place(title: .cityOfResidence, place: "г. Москва")
        }
    }
    
    @ViewBuilder
    private func Place(title: String, place: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.regular(14))
                .foregroundColor(.text())
            
            Text(place)
                .font(.semiBold(15))
                .foregroundColor(.text())
                .lineLimit(2)
        }
        .frame(width: (UIScreen.width - Constants.horizontalInset*2 - 25)/2)
    }
    
    //MARK: - descriptionView
    
    var descriptionView: some View {
        VStack(alignment: .leading, spacing: 12) {
            TitleView(title: .descriptionTitle)
            
            BigTextBlock("Белорусский метатель молота, чемпион мира, призёр Олимпийских игр и чемпионата Европы. Заслуженный мастер спорта Республики Беларусь. Выступал за «Динамо».  Европы. Заслуженный мастер спорта Республики Беларусь. Выступал за «Динамо».")
        }
        .padding(.top, 10)
    }
    
    //MARK: - voiceView
    
    var voiceView: some View {
        VStack(alignment: .leading, spacing: 16) {
            TitleView(title: .voiceTitle,
                      buttonTitle: .allTitle,
                      action: viewModel.defols,
                      itemsCount: viewModel.voiceItems)
            
            HStack {
                Text("4:34")
                    .font(.regular(14))
                    .foregroundColor(.text())
                
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 1)
                    .foregroundColor(.text())
                
                Button {} label: {
                    Image.play()
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.accent())
                        .frame(width: 28)
                }
            }
        }
    }
    
    //MARK: - galleryView
    
    var galleryView: some View {
        VStack {
            TitleView(title: .galleryTitle,
                      buttonTitle: .allTitle,
                      action: viewModel.defols,
                      itemsCount: viewModel.galleryItems.count)
            
            HStack {
                Image(viewModel.galleryItems[viewModel.galleryItems.count - 1])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 139)
                    .frame(width: viewModel.galleryItems.count > 2 ? UIScreen.width/2 : .infinity)
                    .cornerRadius(7)
                
                if viewModel.galleryItems.count > 1 {
                    VStack(spacing: 9) {
                        Image(viewModel.galleryItems[viewModel.galleryItems.count - 2])
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: viewModel.galleryItems.count > 2 ? 65 : 139)
                            .cornerRadius(7)
                        
                        if viewModel.galleryItems.count > 2 {
                            Image(viewModel.galleryItems[viewModel.galleryItems.count - 3])
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 65)
                                .cornerRadius(7)
                        }
                    }
                }
            }
        }
        .padding(.top, 20)
    }

    //MARK: - galleryView

    var biographyView: some View {
        VStack(spacing: 22) {
            TitleView(title: .biographyView,
                      buttonTitle: .allTitle,
                      action: viewModel.defols,
                      itemsCount: viewModel.galleryItems.count)
            
            VStack(spacing: 26) {
                ForEach(viewModel.biographyItems, id: \.self) { biography in
                    InfoDropDown(
                        icon: .getImage(biography.icon),
                        title: biography.title,
                        subtitle: biography.date,
                        description: biography.description
                    )
                }
            }
        }
    }
}

//MARK: - Extensions

private extension String {
    static let allTitle = "Все"
    static let cityOfBirth = "город рождения"
    static let cityOfResidence = "город проживания"
    static let readMoreTitle = "читать дальше"
    static let descriptionTitle = "Описание"
    static let voiceTitle = "Голос предка"
    static let galleryTitle = "Галерея"
    static let biographyView = "Биография"
}

private extension CGFloat {
    
}

//MARK: - Previews

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
