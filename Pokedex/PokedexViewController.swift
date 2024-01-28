//
//  ViewController.swift
//  Pokedex
//
//  Created by David Vargas on 26/01/24.
//

import UIKit
import Kingfisher

class PokedexViewController: UIViewController {
    private let backgroundImageView = UIImageView()
    private let namePokemonLabel = UILabel()
    private let containerIdView = UIView()
    private let idPokemonLabel = UILabel()
    private let abilityLabel = UILabel()
    private let firtsAbilityLabel = UILabel()
    private let secondAbilityLabel = UILabel()
    private let thirdAbilityLabel = UILabel()
    private let pokeImageView = UIImageView()
    private let typePokemonLabel = UILabel()
    private let containerfirstTypeView = UIView()
    private let firstTypeLabel = UILabel()
    private let containerSecondTypeView = UIView()
    private let secondTypeLabel = UILabel()
    private let statsPokemonLable = UILabel()
    private let hpStatLable = UILabel()
    private let attackStatLabel = UILabel()
    private let defenseStatLabel = UILabel()
    private let specialAttackLabel = UILabel()
    private let specialDefenceLabel = UILabel()
    private let speedStatLabel = UILabel()
    private let showPokemonButton = UIButton()
    
    
//    MARK: - Properties
    private let pokeManager = NetworkManagerService.shared
    private var idPokemon = 0
    private var time: Timer?
    private let pokemonsIDArray = [0...1025, 10001...10277]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getDetailPokemon()
        timerThirtySeconds()
    }
//    MARK: - SetView
    
    private func setupView() {
        view.registerSubview(backgroundImageView)
        
        let stackTypesOfPokemon: UIStackView = UIStackView(arrangedSubviews: [typePokemonLabel, containerfirstTypeView, containerSecondTypeView])
        stackTypesOfPokemon.axis = .horizontal
        stackTypesOfPokemon.distribution = .equalSpacing
        stackTypesOfPokemon.alignment = .center
        stackTypesOfPokemon.spacing = 5
        
        let stackAbilities: UIStackView = UIStackView(arrangedSubviews: [firtsAbilityLabel, secondAbilityLabel, thirdAbilityLabel])
        stackAbilities.axis = .horizontal
        stackAbilities.distribution = .fill
        stackAbilities.alignment = .center
        stackAbilities.spacing = 5
        
        let principalStackAbilities: UIStackView = UIStackView(arrangedSubviews: [abilityLabel, stackAbilities])
        principalStackAbilities.axis = .vertical
        principalStackAbilities.distribution = .fill
        principalStackAbilities.alignment = .center
        principalStackAbilities.spacing = 5
        
        let stackOfFirtsStats: UIStackView = UIStackView(arrangedSubviews: [hpStatLable, attackStatLabel, defenseStatLabel])
        stackOfFirtsStats.axis = .horizontal
        stackOfFirtsStats.distribution = .equalSpacing
        stackOfFirtsStats.alignment = .fill
        stackOfFirtsStats.spacing = 5
        
        let stackOfStatsPokemon: UIStackView = UIStackView(arrangedSubviews: [statsPokemonLable, stackOfFirtsStats, specialAttackLabel, specialDefenceLabel, speedStatLabel])
        stackOfStatsPokemon.axis = .vertical
        stackOfStatsPokemon.distribution = .fillEqually
        stackOfStatsPokemon.alignment = .center
        stackOfStatsPokemon.spacing = 5
        
        view.registerSubview(namePokemonLabel)
        view.registerSubview(containerIdView)
        containerIdView.registerSubview(idPokemonLabel)
        view.registerSubview(stackTypesOfPokemon)
        containerfirstTypeView.registerSubview(firstTypeLabel)
        containerSecondTypeView.registerSubview(secondTypeLabel)
        view.registerSubview(pokeImageView)
        view.registerSubview(principalStackAbilities)
        view.registerSubview(stackOfStatsPokemon)
        view.registerSubview(showPokemonButton)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            namePokemonLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            namePokemonLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            namePokemonLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            containerIdView.topAnchor.constraint(equalTo: namePokemonLabel.bottomAnchor, constant: 10),
            containerIdView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
            idPokemonLabel.topAnchor.constraint(equalTo: containerIdView.topAnchor, constant: 4),
            idPokemonLabel.leadingAnchor.constraint(equalTo: containerIdView.leadingAnchor, constant: 4),
            idPokemonLabel.trailingAnchor.constraint(equalTo: containerIdView.trailingAnchor, constant: -4),
            idPokemonLabel.bottomAnchor.constraint(equalTo: containerIdView.bottomAnchor, constant: -4),
            
            stackTypesOfPokemon.topAnchor.constraint(equalTo: containerIdView.topAnchor),
            stackTypesOfPokemon.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -60),
            stackTypesOfPokemon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            pokeImageView.topAnchor.constraint(equalTo: idPokemonLabel.bottomAnchor, constant: 30),
            pokeImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokeImageView.heightAnchor.constraint(equalToConstant: 230),
            pokeImageView.widthAnchor.constraint(equalToConstant: 230),
            
            principalStackAbilities.topAnchor.constraint(equalTo: pokeImageView.bottomAnchor, constant: 20),
            principalStackAbilities.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            principalStackAbilities.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            stackOfStatsPokemon.topAnchor.constraint(equalTo: principalStackAbilities.bottomAnchor, constant: 10),
            stackOfStatsPokemon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            stackOfStatsPokemon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stackOfStatsPokemon.bottomAnchor.constraint(equalTo: showPokemonButton.topAnchor, constant: -15),

            firstTypeLabel.topAnchor.constraint(equalTo: containerfirstTypeView.topAnchor, constant: 4),
            firstTypeLabel.leadingAnchor.constraint(equalTo: containerfirstTypeView.leadingAnchor, constant: 4),
            firstTypeLabel.trailingAnchor.constraint(equalTo: containerfirstTypeView.trailingAnchor, constant: -4),
            firstTypeLabel.bottomAnchor.constraint(equalTo: containerfirstTypeView.bottomAnchor, constant: -4),
            
            secondTypeLabel.topAnchor.constraint(equalTo: containerSecondTypeView.topAnchor, constant: 4),
            secondTypeLabel.leadingAnchor.constraint(equalTo: containerSecondTypeView.leadingAnchor, constant: 4),
            secondTypeLabel.trailingAnchor.constraint(equalTo: containerSecondTypeView.trailingAnchor, constant: -4),
            secondTypeLabel.bottomAnchor.constraint(equalTo: containerSecondTypeView.bottomAnchor, constant: -4),
            
            showPokemonButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            showPokemonButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            showPokemonButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            showPokemonButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        backgroundImageView.image = UIImage(named: "Background")
        backgroundImageView.contentMode = .scaleAspectFill
        
        containerIdView.setcontainerView(with: .blue)
        
        namePokemonLabel.setLabel(ofSize: 30, isTitle: true)
        idPokemonLabel.setLabel(ofSize: 20)
        
        containerfirstTypeView.setcontainerView(with: .yellow)
        containerSecondTypeView.setcontainerView(with: .purple)
       
        typePokemonLabel.setLabel(ofSize: 25, isTitle: true)
        firstTypeLabel.setLabel(ofSize: 20)
        secondTypeLabel.setLabel(ofSize: 20)

        abilityLabel.setLabel(ofSize: 25, isTitle: true)
        firtsAbilityLabel.setLabel(ofSize: 18)
        secondAbilityLabel.setLabel(ofSize: 18)
        thirdAbilityLabel.setLabel(ofSize: 18)
        
        statsPokemonLable.text = "Stats"
        statsPokemonLable.setLabel(ofSize: 25, isTitle: true)
        hpStatLable.setLabel(ofSize: 18, isTitle: false)
        attackStatLabel.setLabel(ofSize: 18, isTitle: false)
        defenseStatLabel.setLabel(ofSize: 18, isTitle: false)
        specialAttackLabel.setLabel(ofSize: 18, isTitle: false)
        specialDefenceLabel.setLabel(ofSize: 18, isTitle: false)
        speedStatLabel.setLabel(ofSize: 18, isTitle: false)
        
        pokeImageView.contentMode = .scaleAspectFit
        
        showPokemonButton.setButton()
        showPokemonButton.addTarget(self, action: #selector(showNewPokemon), for: .touchUpInside)
    }
    
    @objc func showNewPokemon() {
        time?.invalidate()
        time = nil
        timerThirtySeconds()
        self.getDetailPokemon()  
    }
    
    func timerThirtySeconds() {
        time = Timer.scheduledTimer(withTimeInterval: 30.0, repeats: true) { timer in
            self.getDetailPokemon()
        }
    }
    
//    MARK: - SetComponents with Model
    
    func setDetailPokemon(with model: PokemonInfoModel) {
        namePokemonLabel.text = model.name.capitalized
        idPokemonLabel.text = "Id: \(model.id)"
        pokeImageView.kf.setImage(with: URL(string: model.sprites.other.officialArtwork.frontDefault))
        hpStatLable.text = "\(model.stats[0].stat.name.capitalized): \(model.stats[0].baseStat)"
        attackStatLabel.text = "\(model.stats[1].stat.name.capitalized): \(model.stats[1].baseStat)"
        defenseStatLabel.text = "\(model.stats[2].stat.name.capitalized): \(model.stats[2].baseStat)"
        specialAttackLabel.text = "\(model.stats[3].stat.name.capitalized): \(model.stats[3].baseStat)"
        specialDefenceLabel.text = "\(model.stats[4].stat.name.capitalized): \(model.stats[4].baseStat)"
        speedStatLabel.text = "\(model.stats[5].stat.name.capitalized): \(model.stats[5].baseStat)"
        firstTypeLabel.text = model.types[0].type.name.capitalized
        typePokemonLabel.text = model.types.count > 1 ? "Types" : "Type"
        secondTypeLabel.text = model.types.count > 1 ? model.types[1].type.name.capitalized : ""
        secondTypeLabel.isHidden = model.types.count == 1
        containerSecondTypeView.isHidden = model.types.count == 1
        firtsAbilityLabel.text = model.abilities[0].ability.name.capitalized
        secondAbilityLabel.text = model.abilities.count > 1 ? model.abilities[1].ability.name.capitalized : ""
        secondAbilityLabel.isHidden = model.abilities.count == 1
        abilityLabel.text = model.abilities.count > 1 ? "Abilities" : "Ability"
        thirdAbilityLabel.text = model.abilities.count > 2 ? model.abilities[2].ability.name.capitalized : ""
        thirdAbilityLabel.isHidden = model.abilities.count < 3
    }
}

extension PokedexViewController {

    func getDetailPokemon() {
        let id = Int.random(in: pokemonsIDArray.randomElement() ?? 0...1025)
        idPokemon = id
        pokeManager.getDetailPokemon(with: idPokemon) { [weak self] results in
            guard let self else { return }
            switch results {
            case .success(let info):
                setDetailPokemon(with: info)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
