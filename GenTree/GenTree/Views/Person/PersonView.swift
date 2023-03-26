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
            VStack {
                avatarView
                infoView
            }
        }
        .edgesIgnoringSafeArea(.top)
        .background(Color.background())
        .onAppear(perform: viewModel.animateViews)
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
        VStack(spacing: 30) {
            VStack(alignment: .leading, spacing: 30) {
                titleView
                placesView
                descriptionView
                voiceView
                galleryView
                biographyView
                lifeStoriesView
            }
            .padding(.top, 22)
            .padding(.horizontal, Constants.horizontalInset)
            .background(Color.background())
            .cornerRadius(25)
            
            nextOfKinView
        }
        .offset(y: 100)
        .padding(.bottom, 180)
    }
    
    //MARK: - titleView
    
    var titleView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Курилова Дарья Кирилловна")
                .semiBold(23)
                .foregroundColor(.text())
                .padding(.trailing, 40)
            
            Text("2 Ноября 1999 - 23 Ноября 2087")
                .semiBold(14)
                .foregroundColor(.accent())
        }
        .animatingElement(viewModel.showViews[1], value: .oddValue)
    }
    
    //MARK: - placesView
    
    var placesView: some View {
        HStack(alignment: .top, spacing: 25) {
            Place(title: .cityOfBirth, place: "д. Илькино, Владимирская область")
            Place(title: .cityOfResidence, place: "г. Москва")
        }
        .animatingElement(viewModel.showViews[2], value: .evenValue)
    }
    
    @ViewBuilder
    private func Place(title: String, place: String) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .regular(14)
                .foregroundColor(.text())
            
            Text(place)
                .semiBold(15)
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
        .animatingElement(viewModel.showViews[3], value: .oddValue)
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
                    .regular(14)
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
        .animatingElement(viewModel.showViews[4], value: .evenValue)
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
            TitleView(title: .biographyTitle,
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
    
    //MARK: - lifeStoriesView

    var lifeStoriesView: some View {
        VStack(spacing: 17) {
            TitleView(title: .lifeStoriesTitle,
                      buttonTitle: .allTitle,
                      action: viewModel.defols,
                      itemsCount: viewModel.galleryItems.count)
            
            VStack {
                if viewModel.biographyItems.count > 1 {
                    ForEach(viewModel.biographyItems[0...1], id: \.self) { story in
                        StoryView(
                            title: story.title,
                            image: .getImage("avatar")
                        )
                    }
                } else {
                    StoryView(
                        title: viewModel.biographyItems[0].title,
                        image: .getImage("avatar")
                    )
                }
            }
        }
    }
    
    @ViewBuilder
    func StoryView(title: String, image: Image) -> some View {
        ZStack(alignment: .bottomLeading) {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 86)
                .cornerRadius(7)
            
            Image.liner()
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 86)
                .cornerRadius(7)
            
            Text(title)
                .bold(14)
                .foregroundColor(.white)
                .frame(width: UIScreen.width / 3 * 2, alignment: .leading)
                .padding(12)
        }
    }
    
    //MARK: - nextOfKinView

    var nextOfKinView: some View {
        VStack(spacing: 11) {
            TitleView(title: .nextOfKinTitle)
                .padding(.horizontal, Constants.horizontalInset)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(viewModel.kinItems, id: \.self) { person in
                        KinView(
                            title: person.fullname,
                            image: .getImage(person.avatarUrl),
                            role: person.relationship
                        )
                    }

                }
                .padding(.horizontal, Constants.horizontalInset)
            }
        }
    }
    
    @ViewBuilder
    func KinView(title: String, image: Image, role: String) -> some View {
        VStack(spacing: 6) {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 50)
                .clipShape(Circle())
            
            VStack(spacing: 0) {
                Text(title)
                    .semiBold(14)
                    .foregroundColor(.text())
                
                Text(title)
                    .regular(12)
                    .foregroundColor(.text())
            }
            
        }
        .padding(13)
        .frame(width: 140, height: 106)
        .background(Color.element())
        .cornerRadius(5)
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
    static let biographyTitle = "Биография"
    static let lifeStoriesTitle = "Истории из жизни"
    static let nextOfKinTitle = "Ближайшие родственники"
}

private extension CGFloat {
    static let evenValue: CGFloat = 100
    static let oddValue: CGFloat = 150
}

//MARK: - Previews

struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
