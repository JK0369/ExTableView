//
//  ViewController2.swift
//  ExTableView
//
//  Created by 김종권 on 2021/10/20.
//

import UIKit

class ViewController2: UIViewController {

    let scrollMoveButton: UIButton = {
        let button = UIButton()
        button.setTitle("77로 스크롤 이동", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(didTapMoveScrollButton), for: .touchUpInside)
        return button
    }()

    let collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return view
    }()

    var dataSource = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        for i in 0...100 {
            dataSource.append(String(i))
        }

        view.addSubview(scrollMoveButton)
        view.addSubview(collectionView)

        scrollMoveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollMoveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollMoveButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12)
        ])

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: scrollMoveButton.bottomAnchor, constant: 12)
        ])

        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    @objc func didTapMoveScrollButton() {
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.scrollToItem(at: IndexPath(row: 77, section: 0), at: .bottom, animated: true)
        }
    }
}

extension ViewController2: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        cell.myLabel.text = dataSource[indexPath.row]
        return cell
    }
}

extension ViewController2: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}
