//
//  BlurView.swift
//  DesignCode
//
//  Created by Ehsan Rahimi on 10/8/23.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    typealias UIViewType = UIView

    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: CGRect.zero)
        view.backgroundColor = .clear

        let blurEffect = UIBlurEffect(style: style)
        let bluerView = UIVisualEffectView(effect: blurEffect)
        bluerView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(bluerView, at: 0)

        NSLayoutConstraint.activate([
            bluerView.widthAnchor.constraint(equalTo: view.widthAnchor),
            bluerView.heightAnchor.constraint(equalTo: view.heightAnchor),
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

