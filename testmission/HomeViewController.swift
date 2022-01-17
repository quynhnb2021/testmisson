//
//  HomeViewController.swift
//  testmission
//
//  Created by Bao on 17/01/2022.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    private var collectionView: UICollectionView?
    private var imageView: UIImageView?
    private var isTap = false
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cards = [Card(nameCard: "c01", status: false),
                 Card(nameCard: "c02", status: false),
                 Card(nameCard: "c03", status: false),
                 Card(nameCard: "c04", status: false),
                 Card(nameCard: "c05", status: false),
                 Card(nameCard: "c06", status: false),
                 Card(nameCard: "c07", status: false),
                 Card(nameCard: "c08", status: false),
                 Card(nameCard: "c09", status: false),
                 Card(nameCard: "c10", status: false),
                 Card(nameCard: "c11", status: false),
                 Card(nameCard: "c12", status: false),
                 Card(nameCard: "c13", status: false),
                 Card(nameCard: "c14", status: false),
                 Card(nameCard: "m00", status: false),
                 Card(nameCard: "m01", status: false),
                 Card(nameCard: "m02", status: false),
                 Card(nameCard: "m03", status: false),
                 Card(nameCard: "m04", status: false),
                 Card(nameCard: "m05", status: false),
                 Card(nameCard: "m06", status: false),
                 Card(nameCard: "m07", status: false),
                 Card(nameCard: "m08", status: false),
                 Card(nameCard: "m09", status: false),
                 Card(nameCard: "m10", status: false),
                 Card(nameCard: "m11", status: false),
                 Card(nameCard: "m12", status: false),
                 Card(nameCard: "m13", status: false),
                 Card(nameCard: "m14", status: false),
                 Card(nameCard: "m15", status: false),
                 Card(nameCard: "m16", status: false),
                 Card(nameCard: "m17", status: false),
                 Card(nameCard: "m18", status: false),
                 Card(nameCard: "m19", status: false),
                 Card(nameCard: "m20", status: false),
                 Card(nameCard: "m21", status: false),
                 Card(nameCard: "p01", status: false),
                 Card(nameCard: "p02", status: false),
                 Card(nameCard: "p03", status: false),
                 Card(nameCard: "p04", status: false),
                 Card(nameCard: "p05", status: false),
                 Card(nameCard: "p06", status: false),
                 Card(nameCard: "p07", status: false),
                 Card(nameCard: "p08", status: false),
                 Card(nameCard: "p09", status: false),
                 Card(nameCard: "p10", status: false),
                 Card(nameCard: "p11", status: false),
                 Card(nameCard: "p12", status: false),
                 Card(nameCard: "p13", status: false),
                 Card(nameCard: "p14", status: false),
                 Card(nameCard: "s01", status: false),
                 Card(nameCard: "s02", status: false),
                 Card(nameCard: "s03", status: false),
                 Card(nameCard: "s04", status: false),
                 Card(nameCard: "s05", status: false),
                 Card(nameCard: "s06", status: false),
                 Card(nameCard: "s07", status: false),
                 Card(nameCard: "s08", status: false),
                 Card(nameCard: "s09", status: false),
                 Card(nameCard: "s10", status: false),
                 Card(nameCard: "s11", status: false),
                 Card(nameCard: "s12", status: false),
                 Card(nameCard: "s13", status: false),
                 Card(nameCard: "s14", status: false),
                 Card(nameCard: "w01", status: false),
                 Card(nameCard: "w02", status: false),
                 Card(nameCard: "w03", status: false),
                 Card(nameCard: "w04", status: false),
                 Card(nameCard: "w05", status: false),
                 Card(nameCard: "w06", status: false),
                 Card(nameCard: "w07", status: false),
                 Card(nameCard: "w08", status: false),
                 Card(nameCard: "w09", status: false),
                 Card(nameCard: "w10", status: false),
                 Card(nameCard: "w11", status: false),
                 Card(nameCard: "w12", status: false),
                 Card(nameCard: "w13", status: false),
                 Card(nameCard: "w14", status: false),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.itemSize = CGSize(width: view.frame.size.width/5, height:  view.frame.size.width/5)
//        layout.sectionInset = UIEdgeInsetsMake(100, 0, 100, 0)
    
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 200, right: 0)
//        layout.sectionInset = UIEdgeInsetsMake(0, 0, 120, 0)
//        collectionView = UICollectionView()
//        collectionView?.frame = .zero
//        collectionView?.collectionViewLayout = layout
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView?.delegate = self
        collectionView?.dataSource = self
//        collectionView?.flo
        collectionView?.backgroundColor = .white
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(_:)))
        // Do any additional setup after loading the view.
        collectionView?.addGestureRecognizer(gesture)
    }
    
    
    @objc func suffleAction() {
        
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
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        collectionView?.frame = view.bounds
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        isTap = !isTap
        cards[indexPath.row].status = true
//        data.status = true
//        cards.remove(at: indexPath.row)
//        cards.append(data)
        
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let data = cards[indexPath.row]
        if(data.status == false ) {
            imageView = UIImageView(image: UIImage(named: "back"))
        } else {
            imageView = UIImageView(image: UIImage(named: data.nameCard ?? "c01" ))
        }
       
        imageView?.frame.size = CGSize(width: view.frame.size.width/5, height:  view.frame.size.width/5)
            cell.contentView.addSubview(imageView!)

        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width/5, height:  view.frame.size.width/5)
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForItemAt indexPath: IndexPath) -> UIEdgeInsets {

                    return UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
                }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = cards.remove(at: sourceIndexPath.row)
        cards.insert(item, at: destinationIndexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
        }
    
    @IBAction func tapSuffleButton(_ sender: Any) {
        for _ in cards {
            if let i = cards.firstIndex(where: { $0.status == true }) {
                cards[i].status = false
            }

        }

        cards.shuffle()
        collectionView.reloadData()
        
    }
    
    @IBAction func tapbackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
