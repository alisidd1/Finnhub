//
//  CustomErrors.swift
//  FinnHub
//
//  Created by Ali Siddiqui on 1/30/24.
//

import Foundation

enum CustomErrors: String, Error {
    case invalidUrl =  "Invalid URL to get prayer timing info"
    case unableToComplete =  "Unable to complete the request. Please check your network connection"
    case invalidResponse = "Invalid response from the server. Please try again later."
    case invalidData = "The data received from the server was invalid. Please try again later"
}
