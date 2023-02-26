//
//  TreeView.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 23.02.2023.
//

import SwiftUI

struct TreeView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.medium(40))
        }
        .background(Color.background())
    }
}

//MARK: - Previews

struct TreeView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

/*

import SwiftUI

struct Person: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let age: Int
    let gender: String
    var spouse: Person?
    var children: [Person] = []
}

struct FamilyTree: View {
    let root: Person
    
    init(_ root: Person) {
        self.root = root
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                drawPerson(root, geometry, 0, 0)
            }
        }
    }
    
    @ViewBuilder
    func drawPerson(_ person: Person, _ geometry: GeometryProxy, _ x: CGFloat, _ y: CGFloat) -> some View {
        VStack(spacing: 20) {
            if let spouse = person.spouse {
                let spouseX = x - 100
                let spouseY = y - 100
                
                drawPerson($0, geometry, spouseX, spouseY)
                
                Path { path in
                    path.move(to: CGPoint(x: x, y: y - 15))
                    path.addLine(to: CGPoint(x: spouseX + 30, y: spouseY + 15))
                }
                .stroke(lineWidth: 2)
            }
            
            Circle()
                .fill(Color.white)
                .frame(width: 60, height: 60)
                .overlay(
                    Text(person.name)
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)
                )
            
            HStack(spacing: 50) {
                ForEach(person.children) { child in
                    let childX = x - CGFloat(person.children.count - 1) * 50.0 + 100.0 * CGFloat(person.children.firstIndex(of: child)!)
                    let childY = y + 100.0
                    
                    drawPerson(child, geometry, childX, childY)
                    
                    Path { path in
                        path.move(to: CGPoint(x: x, y: y + 15))
                        path.addLine(to: CGPoint(x: childX - 30, y: childY - 15))
                    }
                    .stroke(lineWidth: 2)
                }
            }
        }
        .position(x: x, y: y)
    }
}

struct ContentView: View {
    var body: some View {
        var john = Person(name: "John", age: 50, gender: "male")
        var jane = Person(name: "Jane", age: 45, gender: "female")
        var tom = Person(name: "Tom", age: 25, gender: "male")
        var sarah = Person(name: "Sarah", age: 22, gender: "female")
        var harry = Person(name: "Harry", age: 20, gender: "male")
        
        john.spouse = jane
        john.children = [tom, sarah, harry]
        jane.children = [tom, sarah, harry]
        tom.spouse = sarah
        
        return FamilyTree(john)
    }
}
*/
