//
//  ModalPresentation.swift
//  TechRvive
//
//  Created by Ezequiel Gomes on 02/07/2024.
//

import Foundation

class ModalPresentation :  Observable, ObservableObject {

    @Published var isPresented : Bool = false



    func toogleTrueFalse() {
        self.isPresented.toggle()
    }

}
