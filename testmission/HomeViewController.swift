//
//  HomeViewController.swift
//  testmission
//
//  Created by Bao on 17/01/2022.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    private var collectionView: UICollectionView?
    
    var cards: [String] = ["c01", "c02", "c03","c04", "c05", "c06","c07", "c08", "c09","c10", "c11", "c12","c13", "c14", "m00","m01", "m02", "m03","m04","m05", "m06", "m07","m08","m09", "m10", "m11","12","m13", "m14", "m15","m16","m17", "m18", "m19", "m20","m21", "p01", "p02", "p03","p04", "p05", "p06","p07", "p08", "p09","p10", "p11", "p12","p13", "p14","s01", "s02", "s03","s04", "s05", "s06","s07", "s08", "s09","s10", "s11", "s12","s13", "s14","w01", "w02", "w03","w04", "w05", "w06","w07", "w08", "w09","w10", "w11", "w12","w13", "w14"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width/3.2, height:  view.frame.size.width/3.2)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .white
        view.addSubview(collectionView!)
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(_:)))
        // Do any additional setup after loading the view.
        collectionView?.addGestureRecognizer(gesture)
    }
    
    @objc func handleLongPressGesture(_ gesture: UILongPressGestureRecognizer) {
        guard let collectionView = collectionView else { return  }
        switch gesture.state {
        case .began:
            guard let targetIndexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else { return }
            collectionView.beginInteractiveMovementForItem(at: targetIndexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: collectionView))
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let imageView: UIImageView = UIImageView(image: UIImage(named: cards[indexPath.row]))
            cell.contentView.addSubview(imageView)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/3.2, height:  view.frame.size.width/3.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = cards.remove(at: sourceIndexPath.row)
        cards.insert(item, at: destinationIndexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 8, left: 5, bottom: 8, right: 5)
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
