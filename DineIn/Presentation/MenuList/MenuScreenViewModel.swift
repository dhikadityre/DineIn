//
//  MenuScreenViewModel.swift
//  DineIn
//
//  Created by DHIKA ADITYA ARE on 16/08/26.
//

import Observation
import Foundation

@Observable
class MenuScreenViewModel {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
}
