//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Develop on 25/07/2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    let homeLabel : String
    let homeImage : String
    
    let stackView = UIStackView()
    let image = UIImageView()
    let label = UILabel()
    
   // let customImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
   
    init(homeLabel:String , homeImage:String){
        self.homeLabel = homeLabel
        self.homeImage = homeImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnboardingViewController {
    func style() {
        view.backgroundColor = .systemBackground // ! dont forget
    
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        //Image
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: homeImage)
        
        //Label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = homeLabel
     
        
       
    }
    
    func layout() {
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(label)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
}


