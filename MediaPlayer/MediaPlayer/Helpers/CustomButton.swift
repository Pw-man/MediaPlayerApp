//
//  Model.swift
//  MediaPlayer
//
//  Created by Роман on 09.05.2022.
//

import UIKit

final class CustomButton: UIButton {
    private var buttonExecution: () -> Void
    
    init(title: String, font: UIFont, titleColor: UIColor, buttonExecution: @escaping () -> Void) {
        self.buttonExecution = buttonExecution
        
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = font
        self.setTitleColor(titleColor, for: .normal)
        self.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
    }
    
    @objc func buttonTap() {
        buttonExecution()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
