//
//  EventDetailPage.swift
//  NikeClone
//
//  Created by Nabraj Khadka on 09/07/2024.
//

let bodyText: String = "Hip hop dancer Soyeon Jang shows us an epic dance challenge in the latest Playlist episode. Soyeon dances three parts of the routine - first fast, then slow. Then she combines all the moves for an awesome dance party with her buddy, Disco Dancer. Kids will get inspired to dance along and make up a dance routine of their own."

let hPadding: CGFloat = 20;
import SwiftUI

struct EventDetailPage: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment:.leading) {
                VStack(alignment:.leading){
                    Image("EventImg1").resizable()
                    VStack(alignment:.leading){
                        Text("Soyeon’s Dance Challenge 😎").font(.largeTitle.bold())
                        CustomSpace(height: 10)
                        Text(bodyText)
                        CustomSpace(height: 10)
                        HStack{
                            Image(systemName: "square.and.arrow.up")
                            CustomSpace(width: 20)
                            Image(systemName: "message")
                        }
                    }.padding(.horizontal,hPadding)
                }
                CustomSpace(height: 10)
                Image("EventImg2").resizable()
            
                Button(action: {}, label: {
                    Text("Explore")
                                        .fontWeight(.medium)
                                        .foregroundColor(.white)
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .background(Color.black)
                                        .cornerRadius(25)
                }).frame(height: 10).padding(.horizontal,hPadding).padding(.vertical,30)
                Text("Comments (19)").bold().padding(.horizontal,hPadding)
                CommentTextField()
                CustomSpace(height: 20)
                CommentSection()
                CustomSpace(height: 20)
                CommentSection()
                
                
            }
        }.scrollIndicators(.hidden).navigationTitle("").navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        EventDetailPage()
    }
}

struct CommentTextField: View {
    @State private var comment: String = "";
    var body: some View {
        TextField("Add a comment ...",text: $comment).padding().overlay(content: {
            RoundedRectangle(cornerRadius: 25)
                                   .stroke(Color(.systemGray4), lineWidth: 1)
        }).padding(.horizontal,hPadding)
    }
}

struct CommentSection: View {
    var body: some View {
        VStack(alignment:.leading) {
            HStack(alignment:.top){
                Image("EventImg2")
                    .resizable().frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                VStack(alignment:.leading){
                    Text("Bolor Bathkuyag").font(.body.bold())
                    CustomSpace(height: 10)
                    Text("7 hour ago")
                    CustomSpace(height: 10)
                    Text("53 minutes ago").font(.caption).foregroundStyle(.gray)
                }
                
            }
            Divider()
        }.padding(.horizontal,hPadding)
    }
}
